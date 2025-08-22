Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E4CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+9n/fNoI1OQHD/K82RkaijhTlpLwSUdKN96WR85o0s=; b=StJpHujud4XCxCWSFG9O406Aum
	KkYCR2rG8qun7sWbImSLa82GGxYkBfmob5nomdGJzPEndPcoUEh7c8k8hO/l05P0b02JyqMXz2gxt
	n8jqNfoQBJ8Kbqv2yQ0L6y/zWZFz1s8Mjk7zuxTXu3FWOON9aDPJlCBvh8W9CsUHofQRgDSIhV/V/
	xqG/Sq7ajSVYVtVu1iGcPv20MwNusBbU1DupuSR6sC/vGpqz/IQl6XXg0ufivfXJ5/MJ8jMblN8dm
	ov0rcc6IBKfcH0DAjD7bNmx7YNGYhwDD8mj8FUaoJ2lNrHRNbJ52lfWqeqXEaYePenDSHhZdJ/r+x
	hlJ/Uhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSad-00000002jyT-2PSs;
	Fri, 22 Aug 2025 14:17:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWo-00000001bnQ-2MgL;
	Fri, 22 Aug 2025 05:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78EA460256;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12898C116B1;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755841289;
	bh=MQ9NuAWPDpPyLjcRYr12dzgmrw8Z7IvytBTk8yXQ46c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dty9wqERTz8vOs3UY0ho/3Q4MGtTRVuuy2iHbUKQiqalYrpnhSZHOP1xJB48b/Xbt
	 gH/jDqKwi47QrvPCt0qF02zlWWL2L0PF+iIkG/7Gy8dEsRp22LcHqRODiKgq9BAg1F
	 dBChAPqDNG3z+f9J3MA05C981C4N+P6nEXt4JZIOA6s+Jwjkb9mAbHbNJsNH0DkLhB
	 /q32TYECsMOtrlLCd0JLY9OlugYwpASGn9BiTbZsu5YfNe5D0I6kmtu4A4Qi3lUgrS
	 ti/iqNcftmftxYNUriYYkEAjMDJ5MK3COi20xLGMLwLLVMH1Xc1iwN9vTuSzcP1iRG
	 VLJzfPKsmk8ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AC6CA0FE4;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 22 Aug 2025 13:39:56 +0800
Subject: [PATCH 2/5] pmdomain: amlogic: Add support for S6 S7 S7D power
 domains controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-pm-s6-s7-s7d-v1-2-82e3f3aff327@amlogic.com>
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755841286; l=4719;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=f2m0nsIUf/owC+/pGLzsEn5pyQIYJ6wrUlxsJFTx2lE=;
 b=pwitmZC4ygGsQN/beTX1T2nbDqayrzpNTwBhuxE50uUBEkMZv8EqkL5nsYtHy9Vdkv1dgMiy9
 RdOGT7HWMBPDcBeSx54/4CPNhf8ng0FiM8VoH5ixsmzJLEe5bvfICsR
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
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

From: "hongyu.chen1" <hongyu.chen1@amlogic.com>

Add support for the S6 S7 S7D power controller, whose registers are
in the secure domain and should be accessed via SMC.

Signed-off-by: hongyu.chen1 <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 95 ++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index e8bda60078c4..1d2f371d2d7f 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -16,6 +16,9 @@
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
+#include <dt-bindings/power/amlogic,s6-pwrc.h>
+#include <dt-bindings/power/amlogic,s7-pwrc.h>
+#include <dt-bindings/power/amlogic,s7d-pwrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/meson/meson_sm.h>
 #include <linux/module.h>
@@ -201,6 +204,71 @@ static const struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
 	SEC_PD(S4_AUDIO,	0),
 };
 
+static const struct meson_secure_pwrc_domain_desc s6_pwrc_domains[] = {
+	SEC_PD(S6_DSPA,		0),
+	SEC_PD(S6_DOS_HEVC,	0),
+	SEC_PD(S6_DOS_VDEC,	0),
+	SEC_PD(S6_VPU_HDMI,	0),
+	SEC_PD(S6_U2DRD,	0),
+	SEC_PD(S6_U3DRD,	0),
+	SEC_PD(S6_SD_EMMC_C,	0),
+	SEC_PD(S6_GE2D,		0),
+	SEC_PD(S6_AMFC,		0),
+	SEC_PD(S6_VC9000E,	0),
+	SEC_PD(S6_DEWARP,	0),
+	SEC_PD(S6_VICP,		0),
+	SEC_PD(S6_SD_EMMC_A,	0),
+	SEC_PD(S6_SD_EMMC_B,	0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(S6_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S6_PCIE,		0),
+	SEC_PD(S6_NNA_4T,	0),
+	SEC_PD(S6_AUDIO,	0),
+	SEC_PD(S6_AUCPU,	0),
+	SEC_PD(S6_ADAPT,	0),
+};
+
+static const struct meson_secure_pwrc_domain_desc s7_pwrc_domains[] = {
+	SEC_PD(S7_DOS_HEVC,	0),
+	SEC_PD(S7_DOS_VDEC,	0),
+	SEC_PD(S7_VPU_HDMI,	0),
+	SEC_PD(S7_USB_COMB,	0),
+	SEC_PD(S7_SD_EMMC_C,	0),
+	SEC_PD(S7_GE2D,		0),
+	SEC_PD(S7_SD_EMMC_A,	0),
+	SEC_PD(S7_SD_EMMC_B,	0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(S7_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S7_AUCPU,	0),
+	SEC_PD(S7_AUDIO,	0),
+};
+
+static const struct meson_secure_pwrc_domain_desc s7d_pwrc_domains[] = {
+	SEC_PD(S7D_DOS_HCODEC,	0),
+	SEC_PD(S7D_DOS_HEVC,	0),
+	SEC_PD(S7D_DOS_VDEC,	0),
+	SEC_PD(S7D_VPU_HDMI,	0),
+	SEC_PD(S7D_USB_U2DRD,	0),
+	SEC_PD(S7D_USB_U2H,	0),
+	SEC_PD(S7D_SSD_EMMC_C,	0),
+	SEC_PD(S7D_GE2D,	0),
+	SEC_PD(S7D_AMFC,	0),
+	SEC_PD(S7D_EMMC_A,	0),
+	SEC_PD(S7D_EMMC_B,	0),
+	/* ETH is for ethernet online wakeup, and should be always on */
+	SEC_PD(S7D_ETH,		GENPD_FLAG_ALWAYS_ON),
+	SEC_PD(S7D_AUCPU,	0),
+	SEC_PD(S7D_AUDIO,	0),
+	/* SRAMA is used as ATF runtime memory, and should be always on */
+	SEC_PD(S7D_SRAMA,	GENPD_FLAG_ALWAYS_ON),
+	/* DMC0 is for DDR PHY ana/dig and DMC, and should be always on */
+	SEC_PD(S7D_DMC0,	GENPD_FLAG_ALWAYS_ON),
+	/* DMC1 is for DDR PHY ana/dig and DMC, and should be always on */
+	SEC_PD(S7D_DMC1,	GENPD_FLAG_ALWAYS_ON),
+	/* DDR should be always on */
+	SEC_PD(S7D_DDR,		GENPD_FLAG_ALWAYS_ON),
+};
+
 static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
 	SEC_PD(T7_DSPA,		0),
 	SEC_PD(T7_DSPB,		0),
@@ -367,6 +435,21 @@ static const struct meson_secure_pwrc_domain_data meson_secure_s4_pwrc_data = {
 	.count = ARRAY_SIZE(s4_pwrc_domains),
 };
 
+static const struct meson_secure_pwrc_domain_data amlogic_secure_s6_pwrc_data = {
+	.domains = s6_pwrc_domains,
+	.count = ARRAY_SIZE(s6_pwrc_domains),
+};
+
+static const struct meson_secure_pwrc_domain_data amlogic_secure_s7_pwrc_data = {
+	.domains = s7_pwrc_domains,
+	.count = ARRAY_SIZE(s7_pwrc_domains),
+};
+
+static const struct meson_secure_pwrc_domain_data amlogic_secure_s7d_pwrc_data = {
+	.domains = s7d_pwrc_domains,
+	.count = ARRAY_SIZE(s7d_pwrc_domains),
+};
+
 static const struct meson_secure_pwrc_domain_data amlogic_secure_t7_pwrc_data = {
 	.domains = t7_pwrc_domains,
 	.count = ARRAY_SIZE(t7_pwrc_domains),
@@ -393,6 +476,18 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
 		.compatible = "amlogic,meson-s4-pwrc",
 		.data = &meson_secure_s4_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,s6-pwrc",
+		.data = &amlogic_secure_s6_pwrc_data,
+	},
+	{
+		.compatible = "amlogic,s7-pwrc",
+		.data = &amlogic_secure_s7_pwrc_data,
+	},
+	{
+		.compatible = "amlogic,s7d-pwrc",
+		.data = &amlogic_secure_s7d_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,t7-pwrc",
 		.data = &amlogic_secure_t7_pwrc_data,

-- 
2.37.1



