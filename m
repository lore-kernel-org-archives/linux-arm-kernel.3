Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D30109024C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg/mnu7I7IJvWW0qhOQme8iuRstD8Ii4BPgAuyaVWJg=; b=BkC81Po+EhD8E9dLKjkRR8orsk
	6+ozprCtk2Gff3kzr/IQgDMU6AXeupCKDMEdbw7L3upIU9PcIK8Erne6h2dq6StnIDEGP6vsHifw0
	2qeI+6iQynqOVft5921HRc9R3cdtCjd7PD51V8vvW33g6LkYsSi5XuUVLzH1mzeADOFD9LV9ODsss
	MstwHv8l3EfRHfWHF0IMc0QOqO059guO2t/447JT7kMznotSYXib5ZXgrvFLgHXof8oNxpZo40VQ1
	tuCqYeWGaZiZJD0rcBjhIEzwX7MPIz7Kuvx1WIHuu/GQ9wS0YMqrwO5tdaQwwFrfs24POVni1jz3u
	ge3ceEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fwv-0000000B2GN-3pIM;
	Thu, 19 Mar 2026 16:10:17 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fwq-0000000B2Dr-2qSl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xg/mnu7I7IJvWW0qhOQme8iuRstD8Ii4BPgAuyaVWJg=; b=LfVmNQTlZ//0v6TWomcckipfrZ
	lg9mqyRIlisVWgUl9pDOBr0NwSfyu2uxw3m7XL1v/5v5ZasC8H+tE463EOfKnQdQ1xErNr5167QY7
	wWb7v7oQgY21BCavRbtegQcEDK+X25LFtRvTisyzETuUCnR5alLFJlfo+4+NNtTfkh6oSIsUJ/fQU
	K8Laa6G+kbrnycpg87yX0zOwu+/nsopEANJZttbvb4TA9qHfljh2VFC7WO8iLNkN+wox4zrGdgL7s
	R1VdOncvUlJTVqwFUhr1CFgibtdt/ZVLusi6sW6WzlPKQVpPNpIFT5IGe/HUSTIIExTmA7wQmN8RB
	SJVloy2g==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Fwm-0000000FeSd-2wEt;
	Thu, 19 Mar 2026 17:10:08 +0100
From: michal.piekos@mmpsystems.pl
Date: Thu, 19 Mar 2026 17:09:54 +0100
Subject: [PATCH v4 1/2] pinctrl: sunxi: pass down flags to pinctrl routines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rc2-boot-hang-v4-1-4372f47cb6b8@mmpsystems.pl>
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773936605; l=5959;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=KC5kq2NE81d17FdIOaVBMl+fCAZk5Nuo1PIQ2aSr9rI=;
 b=eMB1OW5XjCRPGVXCTTJpXkomvpxcffRKQtEM3Ut3V7ricR4FqkA7BjLdvZnOocXAVojVeObDl
 YXH+F1GCNKFDYJUHquP/CP0WJaMAfAbhKFUecNPGPHBAmjrzqdamyFy
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_091013_107129_1FA26ADD 
X-CRM114-Status: GOOD (  20.20  )
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

From: Andre Przywara <andre.przywara@arm.com>

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
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 23 ++++++++++++++---------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 +-
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c990b6118172..685b79fc0bf8 100644
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
@@ -209,6 +210,8 @@ sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
 						const u16 pin_num,
 						const u8 muxval)
 {
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
+
 	for (unsigned int i = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_desc_function *func = pin->functions;
@@ -216,7 +219,7 @@ sunxi_pinctrl_desc_find_function_by_pin_and_mux(struct sunxi_pinctrl *pctl,
 		if (pin->pin.number != pin_num)
 			continue;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		while (func->name) {
@@ -1338,6 +1341,7 @@ static int sunxi_pinctrl_add_function(struct sunxi_pinctrl *pctl,
 static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 {
 	struct sunxi_pinctrl *pctl = platform_get_drvdata(pdev);
+	unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 	void *ptr;
 	int i;
 
@@ -1362,7 +1366,7 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
 		struct sunxi_pinctrl_group *group = pctl->groups + pctl->ngroups;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		group->name = pin->pin.name;
@@ -1387,11 +1391,11 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
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
@@ -1419,14 +1423,14 @@ static int sunxi_pinctrl_build_state(struct platform_device *pdev)
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
@@ -1568,7 +1572,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
-	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
+	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
@@ -1604,8 +1608,9 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 
 	for (i = 0, pin_idx = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		unsigned long variant = pctl->flags & SUNXI_PINCTRL_VARIANT_MASK;
 
-		if (pin->variant && !(pctl->variant & pin->variant))
+		if (pin->variant && !(variant & pin->variant))
 			continue;
 
 		pins[pin_idx++] = pin->pin;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a8..22bffac1c3f0 100644
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
2.43.0


