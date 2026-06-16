Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FFBCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6p+RlG1yJ9LChAtcgysiZFznKaiWMZkWJEOXAVXMk38=; b=kgpZw5PYZcTd5VQ+awPIIcXp/h
	RXN0PSq/GA01DmMSwSQbRP729sasF9Fw0Jo+k77/kHdmXAGnQyz3QjWctAue11a6crivkRoP1GIp6
	Wpp5mI8yzgrFXz1iAlPIP7RKk20Z5hqD/cV26Lg5r+vjvvb/qilcqzW0aVp6kMw9R0tzNG9NfnwZ3
	WrSUcdFd2zccy4KMT2sSsEvd5nUJLhGdJWOjpPSw03zcn7+vPMEIrzsG8wC8V1SMP2VkrXRKhqaKa
	QP1bu85zw3JIhYgoIIDq+ylqvLAK140+eX8bZZKuMQvcjuDUCtuzFkdCSrX5Co9l+qXYva15aLYxc
	SQ+OF7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVWS-0000000FzY1-3lCF;
	Tue, 16 Jun 2026 15:16:16 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVWQ-0000000FzXW-0H5I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:16:15 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAH7OK7aDFqCiDxFA--.41914S2;
	Tue, 16 Jun 2026 23:16:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] bus: stm32_rifsc: clean up debugfs file with device state
Date: Tue, 16 Jun 2026 23:16:04 +0800
Message-ID: <20260616151604.10548-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAH7OK7aDFqCiDxFA--.41914S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr15JryxZr4xur1rtw17trb_yoW8CF47pa
	n5Cr9xGr40yw43AFZxAF10qr9aqrZ7XrnxWryxu348uF4Syr10k3y5XrWY9FWUJa48Kayk
	XF45t34UZr1DCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeTmhDU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_081614_574044_456BF6C9 
X-CRM114-Status: GOOD (  11.61  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

stm32_rifsc_register_debugfs() creates a debugfs file whose private data
is devm-allocated RIFSC debug state. If a later probe step fails, or if
the device is removed, that debugfs file can outlive the private data it
dereferences.

Keep the created dentry and register a devm cleanup action so the file is
removed before the RIFSC state is released.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/bus/stm32_rifsc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index 19d10379dcef..3877198e6eb9 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -602,11 +602,17 @@ static int stm32_rifsc_conf_dump_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(stm32_rifsc_conf_dump);
 
+static void stm32_rifsc_remove_debugfs(void *data)
+{
+	debugfs_remove(data);
+}
+
 static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_controller,
 					u32 nb_risup, u32 nb_rimu, u32 nb_risal)
 {
 	struct rifsc_dbg_private *rifsc_priv;
 	struct dentry *root = NULL;
+	struct dentry *file;
 
 	rifsc_priv = devm_kzalloc(rifsc_controller->dev, sizeof(*rifsc_priv), GFP_KERNEL);
 	if (!rifsc_priv)
@@ -625,9 +631,13 @@ static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_
 	if (IS_ERR(root))
 		return PTR_ERR(root);
 
-	debugfs_create_file("rifsc", 0444, root, rifsc_priv, &stm32_rifsc_conf_dump_fops);
+	file = debugfs_create_file("rifsc", 0444, root, rifsc_priv,
+				   &stm32_rifsc_conf_dump_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
 
-	return 0;
+	return devm_add_action_or_reset(rifsc_controller->dev,
+					stm32_rifsc_remove_debugfs, file);
 }
 #endif /* defined(CONFIG_DEBUG_FS) */
 
-- 
2.43.0


