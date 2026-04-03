Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16917D730A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 05:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bq3X4WaN6hTRwg9qSfO3d4y6RxOJ0ye0KQpqJU0R4hc=; b=Ct06O4DSjP8BWG2BFCaYbu2nj8
	A5N9soZgI+I/whVX4rN1VZjIGVzMx48dgSDOvFM6AKf9WfuMTk5acl/lIPhLGBWYulTqoeQOpmdlT
	zTiBkD8cnzm08dKeGlAFCUy+SIFDf6J/y705NWSHKrGUXseDORPrC4Z8TjP09dxv6Xt4es/xDjI78
	AiLKpatGK0YRsxb17Oe0Z+LdtTOaRUj21PwkJSgsxFjApJVxwBq3VqfQXR8/96ZoDaDnl4vS/B+HS
	vZmuh1co1tFbRyJR2CfPI+lMfl/M325tE5NIbBZS1gZPTE/atdOSo0NGsfiM7XmNhhRddsFzfy2cP
	0Sj6toxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XAK-00000001JIx-3lRf;
	Fri, 03 Apr 2026 05:33:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XAG-00000001JH1-3GON
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 05:33:54 +0000
Received: from 0001-arm-devtree.resend.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABnhdw9Uc9ph0K7DA--.11493S2;
	Fri, 03 Apr 2026 13:33:49 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 10:41:58 +0800
Message-ID: <20260403151501.1-dt-arm-devtree-resend-pengpeng@iscas.ac.cn>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: devtree: validate compatible strings before dumping them
X-CM-TRANSID: rQCowABnhdw9Uc9ph0K7DA--.11493S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rCFW7JrWUuFWkXr1UJrb_yoW8Ww4xpF
	sxCFWDtrs8u3Wrt34UZF1F9r17Kw4kArnrKFyDK3yxZF9rtFy8Xr4vka1a9wn7CrWS9w1Y
	gFs0vayfAw45XrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUya14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj6pB7UUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_223353_189312_60C21C5C 
X-CRM114-Status: GOOD (  10.75  )
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

setup_machine_fdt() dumps the root compatible list on the
unsupported-machine path by walking raw property bytes with strlen() and
early_print("%s"). Flat DT properties are external boot input, and this
path does not prove that the compatible string list is NUL-terminated
within its declared bounds.

Switch the local walk to fdt_stringlist_get() so malformed
unterminated entries are rejected before they are used as C strings.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/kernel/devtree.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 3b78966e750a..a9593479305e 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
+#include <linux/libfdt.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_irq.h>
@@ -207,19 +208,16 @@ const struct machine_desc * __init setup_machine_fdt(void *dt_virt)
 
 	if (!mdesc) {
 		const char *prop;
-		int size;
+		int idx = 0;
 		unsigned long dt_root;
 
 		early_print("\nError: unrecognized/unsupported "
 			    "device tree compatible list:\n[ ");
 
 		dt_root = of_get_flat_dt_root();
-		prop = of_get_flat_dt_prop(dt_root, "compatible", &size);
-		while (size > 0) {
+		while ((prop = fdt_stringlist_get(initial_boot_params, dt_root,
+						  "compatible", idx++, NULL)))
 			early_print("'%s' ", prop);
-			size -= strlen(prop) + 1;
-			prop += strlen(prop) + 1;
-		}
 		early_print("]\n\n");
 
 		dump_machine_table(); /* does not return */
-- 
2.50.1 (Apple Git-155)


