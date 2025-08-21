Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1957CA0FE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kd0bflpJIVbIWBrwdFe7REoj653wZXP68rl1FSKTtss=; b=ANlItpzSWXTdK5yl7IXaDXkBM0
	XEeH9pxxeqgqClTFjlJe8Bw3bRt1sLsHSNcoFJI9MvjB9ZHlphfJR6lRFX+90H1dLU1pA/xTkcVlq
	OHOwNFx72RwNlxU58kL2ATjwFKiIGDCJG5QgXM16fwAW15PZfm/KxjDmMMvN3fpOL5u30ubSSfKdU
	dDnojWj6+NPU93Vs5EStKCFQOtSQz7cZJ2ZCAz2r8Ran9fW1rnG174WUn4P6LVMGeyBMP5VYXVGxX
	gZGeCUEngJqRuVgjjSHcS8OalCyrG8zQ/BZi5icTnMZZgGG9RAMLAMRqRW7c6qkDT/ORuD8owqmS6
	nFQUW3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7j-0000000Fdkf-3xny;
	Thu, 21 Aug 2025 03:37:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotR3-0000000FKU9-3mR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282002437;
	Wed, 20 Aug 2025 17:45:37 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681993F63F;
	Wed, 20 Aug 2025 17:45:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 2/9] pinctrl: sunxi: pass down flags to pinctrl routines
Date: Thu, 21 Aug 2025 01:42:25 +0100
Message-ID: <20250821004232.8134-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174546_032538_C2022634 
X-CRM114-Status: GOOD (  20.60  )
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

Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
which the new SoCs (A523 family) need to use. We now have a comfortable
"flags" field on the per-SoC setup side, to tag those quirks we need, but
were translating those flag bits into specific fields for runtime use, in
the init routine.
Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
some of a boolean nature.
To avoid inventing various new boolean flags for the runtime struct
sunxi_pinctrl, let's just directly pass on the flags variable used by the
setup code, so runtime can check for those various quirk bits directly.

Rename the "variant" member to "flags", and directly copy the value from
the setup code into there. Move the variant masking from the init
routine to the functions which actually use the "variant" value.

This mostly paves the way for the new A733 IP generation, which needs
more quirks to be checked at runtime.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0a5acbd978da9..a5e390c7ba0ba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -157,6 +157,7 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 					 const char *pin_name,
 					 const char *func_name)
 {
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	int i;
 
 	for (i = 0; i < pctl->desc->npins; i++) {
@@ -168,7 +169,7 @@ sunxi_pinctrl_desc_find_function_by_name(struct sunxi_pinctrl *pctl,
 			while (func->name) {
 				if (!strcmp(func->name, func_name) &&
 					(!func->variant ||
-					func->variant & pctl->variant))
+					func->variant & variant))
 					return func;
 
 				func++;
@@ -1288,6 +1289,7 @@ static int sunxi_pinctrl_add_function(struct sunxi_pinctrl *pctl,
 static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct sunxi_pinctrl *pctl = platform_get_drvdata(pdev);
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	void *ptr;
 	int i;
 
@@ -1312,7 +1314,7 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_pinctrl_group *group = pctl->groups + pctl->ngroups;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		group->name = pin->pin.name;
@@ -1339,11 +1341,11 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		for (func = pin->functions; func->name; func++) {
-			if (func->variant && !(pctl->variant & func->variant))
+			if (func->variant && !(variant & func->variant))
 				continue;
 
 			/* Create interrupt mapping while we're at it */
@@ -1371,14 +1373,14 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		for (func = pin->functions; func->name; func++) {
 			struct sunxi_pinctrl_function *func_item;
 			const char **func_grp;
 
-			if (func->variant && !(pctl->variant & func->variant))
+			if (func->variant && !(variant & func->variant))
 				continue;
 
 			func_item = sunxi_pinctrl_find_function_by_name(pctl,
@@ -1520,7 +1522,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
-	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
+	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
@@ -1556,8 +1558,9 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	for (i = 0, pin_idx = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		pins[pin_idx++] = pin->pin;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index fb17fae2dab69..77a08ccde095a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -174,7 +174,7 @@ struct sunxi_pinctrl {
 	unsigned			*irq_array;
 	raw_spinlock_t			lock;
 	struct pinctrl_dev		*pctl_dev;
-	unsigned long			variant;
+	unsigned long			flags;
 	u32				bank_mem_size;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
-- 
2.46.3


