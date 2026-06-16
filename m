Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C506CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/cie8frKHqfcTM7sgJ1htmIcEqqpJwpS1HT+HB5Cq6c=; b=Van9CoIv2BGs82FDFnKOXaEJ7p
	+TRaQm9jPbZ6Ae1Kk3LEXMGNQsNrKXnNmIUvhu9u/bstrqAouruNYen+Y4P6oHQPO4q1e8+KuJnuL
	Klip9MuOZrqBXfmOUMttQWLwVRdNbfSkoV4q6wgkf0J+Ss5WhGw40QoDVsYI6P16uRwmD075xUMxr
	cheiXvIMGqxnxfzLRbLFt7YLrOf75nj0tr9L0axS70ChPN9f/yTUF4YMWRiE3NZz57Qk+5Byqa3m1
	CzwK0h/RNeRNhVPHNVZnSjy9LNciaBRHF4NRYQvgz3iqnziQIF5sYSphONCYSpRVlSbjq8L4x4cuW
	eDfdiqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI8z-0000000F2f2-0Vmp;
	Tue, 16 Jun 2026 00:59:09 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI8w-0000000F2ef-3nID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:59:08 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADX5s3XnzBqW8veFA--.7265S2;
	Tue, 16 Jun 2026 08:59:04 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] firmware: imx: scu: manage mailbox channels and global handle
Date: Tue, 16 Jun 2026 08:59:01 +0800
Message-ID: <20260616005902.11634-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX5s3XnzBqW8veFA--.7265S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWxur1xAw1fAF13WryDWrg_yoW8KrWUpF
	WUZFWagFW7GanagrWfJF4UZ3Wavw1fK3srWrWUG3W0k3yrA3Z2yF1Dta4jqrn8JFy8ta15
	GF4Utr1UCayYqF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnG
	QDUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_175907_333752_1266A1E8 
X-CRM114-Status: GOOD (  11.91  )
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

imx_scu_probe() requests mailbox channels with the non-managed
mbox_request_channel_byname() helper and then publishes sc_ipc through
the global imx_sc_ipc_handle.  Later probe failures, including child
population failure, can leave the channels and global handle live after
the probe has failed.

Register devres actions to free each mailbox channel and clear the global
handle.  Also depopulate partially created child devices when
devm_of_platform_populate() reports an error.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/firmware/imx/imx-scu.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.c
index 67b267a7408a..203aac421252 100644
--- a/drivers/firmware/imx/imx-scu.c
+++ b/drivers/firmware/imx/imx-scu.c
@@ -82,6 +82,17 @@ static int imx_sc_linux_errmap[IMX_SC_ERR_LAST] = {
 
 static struct imx_sc_ipc *imx_sc_ipc_handle;
 
+static void imx_scu_free_mbox_chan(void *data)
+{
+	mbox_free_channel(data);
+}
+
+static void imx_scu_clear_handle(void *data)
+{
+	if (imx_sc_ipc_handle == data)
+		imx_sc_ipc_handle = NULL;
+}
+
 static inline int imx_sc_to_linux_errno(int errno)
 {
 	if (errno >= IMX_SC_ERR_NONE && errno < IMX_SC_ERR_LAST)
@@ -321,6 +332,11 @@ static int imx_scu_probe(struct platform_device *pdev)
 		dev_dbg(dev, "request mbox chan %s\n", chan_name);
 		/* chan_name is not used anymore by framework */
 		kfree(chan_name);
+
+		ret = devm_add_action_or_reset(dev, imx_scu_free_mbox_chan,
+					       sc_chan->ch);
+		if (ret)
+			return ret;
 	}
 
 	sc_ipc->dev = dev;
@@ -330,6 +346,9 @@ static int imx_scu_probe(struct platform_device *pdev)
 	init_completion(&sc_ipc->done);
 
 	imx_sc_ipc_handle = sc_ipc;
+	ret = devm_add_action_or_reset(dev, imx_scu_clear_handle, sc_ipc);
+	if (ret)
+		return ret;
 
 	ret = imx_scu_soc_init(dev);
 	if (ret)
@@ -342,7 +361,11 @@ static int imx_scu_probe(struct platform_device *pdev)
 
 	dev_info(dev, "NXP i.MX SCU Initialized\n");
 
-	return devm_of_platform_populate(dev);
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		of_platform_depopulate(dev);
+
+	return ret;
 }
 
 static const struct of_device_id imx_scu_match[] = {
-- 
2.50.1 (Apple Git-155)


