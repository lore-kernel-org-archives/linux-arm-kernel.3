Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA95ED730A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:
	Date:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Re2Ie6mHUKZzAiGhiNDIbjPk4r+ZyAUXROCqSBZvTY=; b=fkvDFBU6+j1nDOLs2IyaZJSIQx
	TAK2WzuUUhLbykdkem4Qprk5Bm2OIAMh+n7M32VSjq4N/tZNdPmEL+eRbcLdsVk5MHIqebZ8nXyGn
	DsR3rYEjti59HPVJps/yvzbYxcNO7G5k0/zukM9Fcn/xj9jQDc4D45dqC6/qSZu1WUe3BBRD8mAun
	MM7ckgvdRik7R82qrk32KiMOupJvtcyjxXUZpTy7w2qWnvXJasZwcyoMLc8U5ps0Ctfh9mcTMhu6f
	2GJsAtZ5m8jXt0+WHPuxrSYcDBX6zV/LyNgO7vDmrG2L2vqt76kN2IfUVCUB/LK92Y2kBegC03RBe
	BjjM7S2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XAN-00000001JKQ-1DPl;
	Fri, 03 Apr 2026 05:33:59 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XAG-00000001JHA-41oI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 05:33:55 +0000
Received: from 0005-arm-at91.resend.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAB3ldw+Uc9pm0K7DA--.32785S2;
	Fri, 03 Apr 2026 13:33:50 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 10:42:55 +0800
Message-ID: <20260403151505.5-dt-arm-at91-resend-pengpeng@iscas.ac.cn>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: at91: validate memory node device_type strings
X-CM-TRANSID: rQCowAB3ldw+Uc9pm0K7DA--.32785S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gr47Xr4UWF4UGw15XFy8uFg_yoW8JF45pF
	ZxCF1DtFW5ur17Ca9Fvr9ayw409a1DAr4Utry2vryjvw4aqryqv39akw1vy3W8CrWUuayr
	uFW5WrykZwsIkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIfO7UUUUU=
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_223353_366733_93FD2E07 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

at91_pm_backup_scan_memcs() fetches the raw device_type property and
immediately compares it with strcmp(). Flat DT properties are external
boot input, and this path does not prove that the property is
NUL-terminated within its declared bounds.

Use fdt_stringlist_get() so malformed unterminated device_type
properties are rejected before they are used as C strings.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/mach-at91/pm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 68bb4a86cd94..0767fc9f30ab 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -8,6 +8,7 @@
 
 #include <linux/genalloc.h>
 #include <linux/io.h>
+#include <linux/libfdt.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -1044,7 +1045,8 @@ static int __init at91_pm_backup_scan_memcs(unsigned long node,
 	if (*located)
 		return 0;
 
-	type = of_get_flat_dt_prop(node, "device_type", NULL);
+	type = fdt_stringlist_get(initial_boot_params, node, "device_type",
+				  0, NULL);
 
 	/* We are scanning "memory" nodes only. */
 	if (!type || strcmp(type, "memory"))
-- 
2.50.1 (Apple Git-155)


