Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11544F94CDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FWDrNSlmweA1is0ZTp1hvTZbz2H+/SiJa8BbRUfipUM=; b=boRaidaxpVL11sOqSsaRJFfmcM
	N9LLUHjxBEG1X6R5Lx3fqYTtVTHi5nAKKa+nmEfEJyEE16RPfga7uuYscBx6M9zBX2HWfsPn44F7Q
	Jpm555z6Rku9Gu+1v6p9CSWkpO3Fk3hWVYTetjFjZtOMpeqN17sW7fI4yBKutSaGaXJD6Qlo85taR
	n5+42ZqHG4xH/Cp8XtudKp9DIbQkd/y7llw69HH1gpag0BIcWXIeb+TsC+I8Wjd48rbbKXFpCrRkb
	RHzm4XJyeaKwPgptdv1LYHVtVtNGFSbwFWvi2K2rRzmgF7Oko562PwJKUaCIwMu6EJXs4qStfTjAg
	bD2sraOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFW0K-0000000A0i9-2jKI;
	Wed, 22 Apr 2026 11:44:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFW0E-0000000A0gw-0q0o;
	Wed, 22 Apr 2026 11:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 188DB600AE;
	Wed, 22 Apr 2026 11:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCF58C19425;
	Wed, 22 Apr 2026 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776858259;
	bh=jhptRH9NwVJexkC7VbAUXdVKvsP7WnTfWca81DZoqAs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ktOEzpdUCP6JYApKumRzkyw9A55BDaNe2JPGU3uIYBglVVivVPROgbLfsXGzM2Xy+
	 Mxl3PnO5dFL9h6QevTzuBGa0CxQTXj4jrs4Y+JAJ3Pfj1X/agxRoPOBuUKs3x/RqXM
	 Hh4aI6kerDPAjte21w3No4CF6WbrMSKXgD45leMEdN2XMlBMYfa0vsDjcgKJ8whnho
	 shGzNpyIxet2vpdkF2rXmYfvPhy5LU5dFayMCuL4w4OWS2pIKmEezp1aiCeFxeUD/b
	 l6/4kpRyEfvse7z1UwnCv/lnPQbuKfmZLtZwmxl/Uf6fxisytXCQhlg2iqP3RyM3Xn
	 I/1HQvS82UaRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B70F94CBE;
	Wed, 22 Apr 2026 11:44:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 22 Apr 2026 11:44:13 +0000
Subject: [PATCH] pinctrl: meson: amlogic-a4: fix deadlock issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAIy06GkC/x3NQQqDQAyF4atI1gY02C68inQxkyY1m4xkigji3
 Tt2+fP4eCdUCZMKc3dCyG7VircY+w54Tf4RtHdroIGew0SEagdu5lxccaIsIzPpIyk0kVMVzJG
 c19toCXQ5vve0hTT5P1pe1/UD9QwM4XgAAAA=
X-Change-ID: 20260422-fix-pinconf-42be1cc2f5af
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776858256; l=2200;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Ss1NSqKaiC5N5QiCWkTV2uRyv5Uo42HRnPH2RlMwg5E=;
 b=fr7u9d+eLFEa7sccl3XsNIMQoaiZ7WblPDxAAp4bIzh/HrYB6ydQXMiU1Ec+47fQmUWfWWegx
 Yj1u23N8KyqBcB7KMBYSwEMnn8XKl/x0IRNVvlYw3sfzP8B5LsRUsqG
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Accessing the pinconf-pins sysfs node may deadlock.

pinconf_pins_show() holds pctldev->mutex, and the platform driver
calls pinctrl_find_gpio_range_from_pin(), which tries to acquire
the same mutex again, leading to a deadlock.

Use pinctrl_find_gpio_range_from_pin_nolock() to fix this issue.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix deadlock issue.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e2293a872dcb..35d27626a336 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -292,7 +292,7 @@ static int aml_calc_reg_and_bit(struct pinctrl_gpio_range *range,
 static int aml_pinconf_get_pull(struct aml_pinctrl *info, unsigned int pin)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, val;
 	int ret, conf;
@@ -326,7 +326,7 @@ static int aml_pinconf_get_drive_strength(struct aml_pinctrl *info,
 					  u16 *drive_strength_ua)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit;
 	unsigned int val;
@@ -365,7 +365,7 @@ static int aml_pinconf_get_gpio_bit(struct aml_pinctrl *info,
 				    unsigned int reg_type)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, val;
 	int ret;

---
base-commit: bd7fd288490c64835a74c05e631c102ce056d5e1
change-id: 20260422-fix-pinconf-42be1cc2f5af

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



