Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91196E63FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 02:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:References:
	In-Reply-To:Cc:To:Message-ID:Date:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBNhgN2mqh266TqNiMeOcIbNFDRG18IfcIMU/sT2b2Q=; b=2B7YRJZAwc3ygadB+fmY9+S++f
	D4K/Sink5sklBVbhnSDPo4w8+p5eV33HxPSHgOdzunulpIgYmXfl7dPg85lKVtg1n/6YGOxWLDY7q
	4BWIiWJ8U97b6hB5wrsthleNSkgZXeIYU3KiNxMtV+P5IEnHx3kTN1NTDPoQNzxD738S9ha4St5H6
	4sQyClpNw8MIk+0e9SIZeNmXtUmge5wYRb19GIPdaeRK0zeDBFAKSSO1uoYIlUZt7CBwc/0lrV5yM
	VGk38Ot1DKJN526i7wqaQB8SZ1HYvT80qdz7HrLzlIKeTVeJD8QgtE347p0GCj5aDmAwrBGOAn4BK
	eGktiXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9D0z-00000003tnd-22EK;
	Sun, 05 Apr 2026 02:15:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9D0u-00000003tlq-2HWY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 02:15:04 +0000
Received: from 0005-arm-xen-v2.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowADnjGihxdFpUAU5DA--.3582S2;
	Sun, 05 Apr 2026 10:14:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sun, 5 Apr 2026 08:42:00 +0800
Message-ID: <20260405094005.5-arm-xen-v2-pengpeng@iscas.ac.cn>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403111502.2-dt-arm-xen-pengpeng@iscas.ac.cn>
References: <20260403111502.2-dt-arm-xen-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] ARM: xen: validate hypervisor compatible before parsing
 its version
X-CM-TRANSID: qwCowADnjGihxdFpUAU5DA--.3582S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rKFW7Jw13Zryxtry5urg_yoW8CFyDpF
	WFg3sIvFWfta4xW34IyFWDWFy5G3WkXrW7XFyku3W7Ars8t34rKrW2qr1SvF93Ary8G3ya
	vrW0yF18AF4UJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjiID7UUUU
	U==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_191500_972843_7D14986B 
X-CRM114-Status: GOOD (  11.58  )
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

fdt_find_hyper_node() reads the raw compatible property and then derives
hyper_node.version from a prefix match before later printing it with %s.
Flat DT properties are external boot input, and this path does not prove
that the first compatible entry is NUL-terminated within the returned
property length.

Keep the existing flat-DT lookup path, but verify that the first
compatible entry terminates within the returned property length before
deriving the version suffix from it.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1:
- keep `of_get_flat_dt_prop()` instead of switching to `fdt_stringlist_get()`
- validate the first compatible entry with bounded `strnlen()`

 arch/arm/xen/enlighten.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 4feed2c2..25a0ce3b 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -218,8 +218,9 @@ static __initdata struct {
 static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	const void *s = NULL;
+	const char *s = NULL;
 	int len;
+	size_t prefix_len = strlen(hyper_node.prefix);
 
 	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
 		return 0;
@@ -228,9 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 		hyper_node.found = true;
 
 	s = of_get_flat_dt_prop(node, "compatible", &len);
-	if (strlen(hyper_node.prefix) + 3  < len &&
-	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
-		hyper_node.version = s + strlen(hyper_node.prefix);
+	if (s && len > 0 && strnlen(s, len) < len &&
+	    len > prefix_len + 3 &&
+	    !strncmp(hyper_node.prefix, s, prefix_len))
+		hyper_node.version = s + prefix_len;
 
 	/*
 	 * Check if Xen supports EFI by checking whether there is the
-- 
2.50.1


