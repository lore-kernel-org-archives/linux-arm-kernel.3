Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0695D730A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bOPv8VNXDRpmSMPTTDXh/W4lndshgQEyDxPQjxTNZtE=; b=lDIghwjmzoXM7yQKL21r1WE0cM
	b/jS7Z7iEPHih+6kym6iq7pcZk7GNErOYYLIczsP0NxqY5e7CoXrwealnI8eLA/Jey6yiIPxyVry9
	0+5I3JC7Lxr+erWZ79QfnsZvK8eGA/tuczLsp1om2skkrM7c2zUv91RQVcu2PUD92Y5yRwX2eVWv0
	BbuIdWdmf87PLlSncEI+vS0RlWcXen6dWWqFaon9Il3cS6afeZsRQCF5THVLCL5Vr82XvoPAVFjCO
	mgotjfmfE626EE8pFrefxXFaEvWvMPqqX876A1Y8Lr+O3XjmQJ4qWCXcdRNWaDVuPVFXCBvIkh4l+
	yFR39Csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XAL-00000001JJ9-226v;
	Fri, 03 Apr 2026 05:33:57 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XAG-00000001JH6-3GOo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 05:33:55 +0000
Received: from 0002-arm-xen.resend.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowACHqeA9Uc9pjEK7DA--.32598S2;
	Fri, 03 Apr 2026 13:33:49 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 10:42:09 +0800
Message-ID: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: xen: validate hypervisor compatible before parsing its
 version
X-CM-TRANSID: rQCowACHqeA9Uc9pjEK7DA--.32598S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rtFWkCF4rJr1kZF1UKFg_yoW8Zw4fpF
	Zakr9avFWrt3WxWa4IyFyv9Fy5GF4kXrW2qFykZ3Wjyrnrtw1rXrWIvF1SvFn3ArW8W343
	ZrWjyFn5AF47X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjG-e7UUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_223353_185480_F9D0C276 
X-CRM114-Status: GOOD (  10.70  )
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

fdt_find_hyper_node() reads the raw compatible property and then
derives hyper_node.version from a prefix match before later printing it
with %s. Flat DT properties are external boot input, and this path does
not prove that the compatible string is NUL-terminated within its
declared bounds.

Fetch the first compatible entry with fdt_stringlist_get() so malformed
unterminated properties are rejected before the version suffix is
parsed.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/xen/enlighten.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 4feed2c2498d..f69290a4c639 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -19,6 +19,7 @@
 #include <asm/efi.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/libfdt.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -218,8 +219,9 @@ static __initdata struct {
 static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	const void *s = NULL;
+	const char *s = NULL;
 	int len;
+	size_t prefix_len = strlen(hyper_node.prefix);
 
 	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
 		return 0;
@@ -227,10 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 	if (of_flat_dt_is_compatible(node, hyper_node.compat))
 		hyper_node.found = true;
 
-	s = of_get_flat_dt_prop(node, "compatible", &len);
-	if (strlen(hyper_node.prefix) + 3  < len &&
-	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
-		hyper_node.version = s + strlen(hyper_node.prefix);
+	s = fdt_stringlist_get(initial_boot_params, node, "compatible", 0, &len);
+	if (s && len > prefix_len + 2 &&
+	    !strncmp(hyper_node.prefix, s, prefix_len))
+		hyper_node.version = s + prefix_len;
 
 	/*
 	 * Check if Xen supports EFI by checking whether there is the
-- 
2.50.1 (Apple Git-155)


