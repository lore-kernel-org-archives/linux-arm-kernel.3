Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C057BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUO9ABR+NGYqJnTzfap2HHmZUOVbFH7npFYH8WwWHAo=; b=23TvTiEyHar56rNW4vKMCOhOst
	D+yaQ0jgduFfkLa7gvvcaufPLmn0jQqp+sepi/VV8A+V36f3jsYRhU4z1SudH25rIMbtk+MNCB27N
	MrHx2ROiZBsO+axt3/m1N3DKplkHVJfv8YUHwS4ihGgdx/NR4Vb0y4Vzd9WosdB6R33hm/5TxDLgQ
	2ToJF54/Dz/wD7NtKdOsY8HCMfBhULQZ/ve+hkyHBt2dca6c08FbyVvSUlETubMedtnyXooEmU3l4
	8eiyEPTWDMibgPYhWWrUWhE5VnBQxBU++OxoSfsEDZET+YbhT9lKrgpSEjoRskTkji92wXs4QufaN
	vjc81DVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBHJ-00000002IYk-2oY8;
	Tue, 22 Jul 2025 11:35:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB8g-00000002HNn-3MaC;
	Tue, 22 Jul 2025 11:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5F5745D16;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6B38C4CEF6;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753183589;
	bh=VIow2Oh79+ksdUzwuxUSWaFAQ/Cb/re8rFKTI6k85j0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tCrJ071EseGnJPK5qXEaZJ3TkfZ9KKJugPXtXESn499s0IH/TV3RmMfhlzTllnhep
	 eq1ESGsI1PfEDInAfqM/ZU0d0U4vvQzcdge0IbdNaAQtwkWEc+KZJfdjxeMD+aRxnp
	 1IJG5XOf3fsxrLBTC0NTp523BfHKdH3uD0ml9LlDLCew0OYPXtMKs8waGIvP9A1h/t
	 RdV5+p2Td3s/CuG5HY9bv9BaJ9I5dyw811L3BWnopj97RxMyKeiPMUGBbB2SiMPIzk
	 sZiSIV3va0mNdFIJM4ASl4iVKHDb+H9nx64SzURs0NalT7wwJL7JfAxLEx4lYIGdcT
	 2b/uKQ3ZwjPrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E80C83F25;
	Tue, 22 Jul 2025 11:26:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 22 Jul 2025 19:26:28 +0800
Subject: [PATCH v2 2/3] thermal: amlogic: Support C3 thermal controller
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-c3-thermal-v2-2-b2231b4be79e@amlogic.com>
References: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
In-Reply-To: <20250722-c3-thermal-v2-0-b2231b4be79e@amlogic.com>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Liming Xue <liming.xue@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183587; l=1585;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8XB3aK58Pggx5wnTbdR3sz0nyiYdXkHkRUiHqo4F+k8=;
 b=EaPPDTlRO84fqaozVJ58Tw29Pt8gBKnOdXcHobVHZLPyZAIRrgWWbmmHMqjy+WX0wWQ7rMa17
 dDWRgvoforgAt6VocVBtVccPUis5r/OMN/AiefFc/OHk1HkFezSSg00
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042630_892235_8C1A9FB5 
X-CRM114-Status: GOOD (  10.73  )
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

Add the thermal controller driver for the C3 SoC family.

The main difference compared to other Amlogic chips lies in the
offset of the sec_ao base (referred to as u_efuse_off), which is
handled differently. Everything else remains consistent.

Signed-off-by: Liming Xue <liming.xue@amlogic.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/thermal/amlogic_thermal.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 5448d772db12..d1b08119c818 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -226,6 +226,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
 	.regmap_config = &amlogic_thermal_regmap_config_g12a,
 };
 
+static const struct amlogic_thermal_data amlogic_thermal_c3_cpu_param = {
+	.u_efuse_off = 0x108,
+	.calibration_parameters = &amlogic_thermal_g12a,
+	.regmap_config = &amlogic_thermal_regmap_config_g12a,
+};
+
 static const struct of_device_id of_amlogic_thermal_match[] = {
 	{
 		.compatible = "amlogic,g12a-ddr-thermal",
@@ -239,6 +245,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
 		.compatible = "amlogic,a1-cpu-thermal",
 		.data = &amlogic_thermal_a1_cpu_param,
 	},
+	{
+		.compatible = "amlogic,c3-cpu-thermal",
+		.data = &amlogic_thermal_c3_cpu_param,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);

-- 
2.37.1



