Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C847E784A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 08:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+79DpePxjeBLc83hqKTcBlIOqjY3+iSsrk4yTe1DscA=; b=u/Ma8YVr5or3Z3wN6XNOIlJoJ5
	zVmW8NWzXWEC0kxw0pV7LzkpAigucnQOoCnJjR6DlRDHyIc0Kp4iK1Sz9Bp4EZPNdq1KiUeSvD+BC
	/AaXC7nEzerPbQkWySrjrdN1ngqokehHsVuBzDDHAEUuBZq/I2d68vVJSbRmniTauL40hcrlyKd0l
	M62Fn1G2mhIET9EtM/aEh07+OvkvPMUl24u5wRbetsTs5EWYpEE4z6HhXCxE4dkZyrTp3RaG4L1Az
	iTt+zGyEHmBcWw49PfKFgXOQTk+BnqqnCX1Xy7O5goDQTWHWRYxxUCI2jFE8Qzs7KZxLZ92uy3BiU
	12Gl/2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYgJA-00000000Cl6-2foL;
	Thu, 25 Dec 2025 08:02:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYgJ7-00000000CkQ-3dDG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 08:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93D58405C1;
	Thu, 25 Dec 2025 08:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBA3C4CEF1;
	Thu, 25 Dec 2025 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766649765;
	bh=uj9yrSuuf2gOll06W83ryExufB13oHVtebJ1kpodW0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=R4fTazB6fEz4Ad8wfHWQvFOSk8Sp1j/zffO5BJeu6s3zAdRFTkW9ljkRrKz3GVnGI
	 vqQZ2XUnxsIARk7yVDdw7utrS+kZSID+4/VCMHz6eSEyYoPCa3TzQ/2MBMUV0SjsCr
	 vZboYtZ2PFx8EiNjAtuhEiKrs+qNzpuUS7KA3UgfphFnGfPUUuJzHzoYDxahL0M1L1
	 m6SrIlfLIMtaX31eJYe0bUE79Tb92HX8kPMUZdb/Fg7+VfiyzSL1tOtdi7lnBVhq2T
	 xp4uU4wBTfMQX9DozpjQpXjJ7xEt3QCMYzGPoDngmxRJZ9UPXhLUiCXrJEahYz0MPH
	 ui02VjtpHS6sw==
Received: by wens.tw (Postfix, from userid 1000)
	id 963775FC5C; Thu, 25 Dec 2025 16:02:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: axp20x: AXP717: Add type-C CC registers
Date: Thu, 25 Dec 2025 16:02:40 +0800
Message-ID: <20251225080241.3153453-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_000249_943924_D2E43494 
X-CRM114-Status: GOOD (  11.65  )
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

The AXP717 has some extra registers related to type-C CC pin
negotiation. They were missing from the original submission.

Add them for completeness.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/mfd/axp20x.c       | 5 ++++-
 include/linux/mfd/axp20x.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index c5f0ebae327f..679364189ea5 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -229,6 +229,8 @@ static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
 	regmap_reg_range(AXP717_ADC_CH_EN_CONTROL, AXP717_ADC_CH_EN_CONTROL),
 	regmap_reg_range(AXP717_ADC_DATA_SEL, AXP717_ADC_DATA_SEL),
+	regmap_reg_range(AXP717_TYPEC_CC_AA_EN, AXP717_TYPEC_CC_AA_EN),
+	regmap_reg_range(AXP717_TYPEC_CC_MODE_CONTROL, AXP717_TYPEC_CC_MODE_CONTROL),
 };
 
 static const struct regmap_range axp717_volatile_ranges[] = {
@@ -237,6 +239,7 @@ static const struct regmap_range axp717_volatile_ranges[] = {
 	regmap_reg_range(AXP717_BATT_PERCENT_DATA, AXP717_BATT_PERCENT_DATA),
 	regmap_reg_range(AXP717_BATT_V_H, AXP717_BATT_CHRG_I_L),
 	regmap_reg_range(AXP717_ADC_DATA_H, AXP717_ADC_DATA_L),
+	regmap_reg_range(AXP717_TYPEC_CC_STATUS, AXP717_TYPEC_CC_STATUS),
 };
 
 static const struct regmap_access_table axp717_writeable_table = {
@@ -458,7 +461,7 @@ static const struct regmap_config axp717_regmap_config = {
 	.val_bits = 8,
 	.wr_table = &axp717_writeable_table,
 	.volatile_table = &axp717_volatile_table,
-	.max_register = AXP717_ADC_DATA_L,
+	.max_register = AXP717_TYPEC_CC_STATUS,
 	.cache_type = REGCACHE_MAPLE,
 };
 
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 3c5aecf1d4b5..b352661d99a1 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -174,6 +174,9 @@ enum axp20x_variants {
 #define AXP717_ADC_DATA_SEL		0xcd
 #define AXP717_ADC_DATA_H		0xce
 #define AXP717_ADC_DATA_L		0xcf
+#define AXP717_TYPEC_CC_AA_EN		0xe1
+#define AXP717_TYPEC_CC_MODE_CONTROL	0xe3
+#define AXP717_TYPEC_CC_STATUS		0xe7
 
 #define AXP806_STARTUP_SRC		0x00
 #define AXP806_CHIP_ID			0x03
-- 
2.47.3


