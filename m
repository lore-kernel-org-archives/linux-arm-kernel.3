Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCEECD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvVyCTVCmKgM2U8hNDo3DCK0kIRnGCCDl9PDQkZsbUI=; b=o6IRpVRCdDWGtAITPbyNzuxlaI
	0qtAVEPa1QJKRwEWixk+uqyOYuy7x3mJcyIym2cVDvVdtapTl3tinLjxkJZr9qKr2JlHoV+1EG37v
	A9d53d/zo8QMe5m30USudNjZGtE+3u+pnhB4Hi4dHFYrUPKgf/SNlCbUrBLW+1ZaFAFvHCF7tT/7e
	u4rwgI80+LaGAZHCXjdaTYDNlvCrLuFk7Rfzsz58sUb6p+qZG0L8Y1TBHa2XG3W5VDtBdqvckTq3y
	7vC+nyjdGgfW2OzxFk6fc51+4hg64fWWAa9UN79kttLDNDgoqGVLJZEelFrhr6wTovk3tr377EI+d
	TsS7T8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZZ2-00000008rEz-1OXG;
	Thu, 11 Jun 2026 07:10:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZZ0-00000008rEg-2JNB;
	Thu, 11 Jun 2026 07:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B2C143B29;
	Thu, 11 Jun 2026 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2B5C2BCB8;
	Thu, 11 Jun 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781161853;
	bh=qhBBZEAVCALyM4DCU8LxY543S6inm7rJfcchpZ1VWHI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Jtn4txwtcTCSSxH79Xj6iSRuqTYlC7MsakJrEbFokmjlRAH72MV/SFdEm+WfMecJL
	 vTJnmtHSsfXYtaYVJWh8ZXBQRKzFHAbSN3THqIqPLihbpaQXgv9fyZqiFVugYURHWT
	 HNqiweGh3NwL3Zkdmr8PSXA/SHkFPzvsK4OOXpu0G1kyX/lo/TjkUlbmMlIXbuAYBG
	 lVu943YjfLOVceIlxscZWbVdfkMKlAbQ2CtzJ6/ChcTasUfCUh4owMsLmycy+31HxI
	 7NIAeY2wHu02kdj2G7YwLhkngeuHBZtGmjIh+wCRE36EndB4gMUvioFh1Pk+jC252Y
	 A3GGzl133pRRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A6ECD98CC;
	Thu, 11 Jun 2026 07:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 11 Jun 2026 07:10:49 +0000
Subject: [PATCH] pinctrl: meson: amlogic-a4: use nolock get range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-pinctrl-nolock-v1-1-aca022d4d60f@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAHhfKmoC/x3MQQqAIBBA0avIrBPUQKirRIvSsYZERSMC8e5Jy
 7f4v0LBTFhgZhUyPlQohg45MDDnFg7kZLtBCaWFlpInCubOnofoo7m4ctPonLJa4g49Shkdvf9
 wWVv7AMrLla1gAAAA
X-Change-ID: 20260611-pinctrl-nolock-2f93ff2d61eb
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781161852; l=2821;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=B12LCoxnKM4gE7bwAOpmRpB++boUOYzfC9tMY9iEY5k=;
 b=t04XysCtViNWE5rPnKdyRJ3YXjWnNiJOZGgub8aD7nHySJEuqplb+2E7cgiSO32Wx3UT4xMMm
 oWlwbKocpv+Cvz2IjZJxXbWHOX9T1G9tLO0PyK55FoVcIKmR3+Ka76b
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

Use pinctrl_find_gpio_range_from_pin_nolock() instead of
pinctrl_find_gpio_range_from_pin() when configuring a pin or
setting a GPIO value.

This avoids taking the lock and allows the code to be safely
called from interrupt context.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Use pinctrl_find_gpio_range_from_pin_nolock 
when configuring a pin or setting a GPIO value.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 5ae0c19d007d..420f7915c010 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -300,7 +300,7 @@ static int aml_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned int fselector,
 	int i;
 
 	for (i = 0; i < group->npins; i++) {
-		range =  pinctrl_find_gpio_range_from_pin(pctldev, group->pins[i]);
+		range =  pinctrl_find_gpio_range_from_pin_nolock(pctldev, group->pins[i]);
 		aml_pctl_set_function(info, range, group->pins[i], group->func[i]);
 	}
 
@@ -499,7 +499,7 @@ static int aml_pinconf_disable_bias(struct aml_pinctrl *info,
 				    unsigned int pin)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit = 0;
 
@@ -512,7 +512,7 @@ static int aml_pinconf_enable_bias(struct aml_pinctrl *info, unsigned int pin,
 				   bool pull_up)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, val = 0;
 	int ret;
@@ -534,7 +534,7 @@ static int aml_pinconf_set_drive_strength(struct aml_pinctrl *info,
 					  u16 drive_strength_ua)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, ds_val;
 
@@ -569,7 +569,7 @@ static int aml_pinconf_set_gpio_bit(struct aml_pinctrl *info,
 				    bool arg)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit;
 

---
base-commit: aca7f93a3eba55962d3448ed005f84daabe37c5f
change-id: 20260611-pinctrl-nolock-2f93ff2d61eb

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



