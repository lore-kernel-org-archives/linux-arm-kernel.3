Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E8BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LsIoc1Daqv/yL2zRpVwdxYNaTtHFo+SiuJNg7Y8bgo=; b=tAlst/z0OKZXc2t1UpiflcRlao
	D/21par3bFLBZ72vKFrXGcgUNG+UBq6475LNwiGZAXjBAGHwshmYVn+cgXkyDN/kUtkKZa6BN1TEy
	UQ/sDV1k0ZKLBJqkOpztiN+dFjugeVaYSLtJYO0V2oRNf1GdzGrMM84Oa9YJEHg5g3qwT5yNnJpVd
	W/bZnklqLNsaF0It4fT9iPiHH/GQCcz1iFivadjw0INVPycj3LXG5sU+G0U1Q0CLWwJ5rfLZ8lVje
	SH+v62Tvd7UbI0p1yq5hm4n4ofVFBnbasOM8GGJQ2GKhNu0tf00TclcKTdH87lBpopNZYziRSN+/N
	ggnBORIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceqc-0000000BntD-2QVa;
	Fri, 18 Jul 2025 06:45:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucej1-0000000Bmm4-3VyF;
	Fri, 18 Jul 2025 06:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 289BB459FD;
	Fri, 18 Jul 2025 06:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF231C4CEF0;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752820662;
	bh=Al0PQ4WgTgiRp6IBkH7sto0mB5deBFgoepFFoWiIyo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FM2D4w8cBmcZME1z58dLOhLCT4fOJO7wkwmVKRJSyvuCYIAU+LmJFYlTQU3iV+jRg
	 BQuRAMmtybPTRjV3jn3y/MffHIwrGGUNzJdv+Vi7ivKT42/NsMlWcnJnlSDkI8U577
	 wOTwD85jK+0b9K14zenjJCOT5wS51aKda/ksng4xOCiiWKZivQAHH9mTdtXbBPmnhK
	 eBBlMpci2S3pcbX+zRzMujMI6f0fAxyf5YdkqgayAQ/b54/54mgpUQmEsSqcX9Y6PG
	 ddxaQyt2lX6dZrXLFDleQbBad1rVhtFmWx3MxskPxsR16cxY/I7ysRszmayH5nRroL
	 WBF18Or8/UUlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2CBC83F3B;
	Fri, 18 Jul 2025 06:37:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Jul 2025 14:37:42 +0800
Subject: [PATCH 2/3] thermal: amlogic: Support C3 thermal controller driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-c3-thermal-v1-2-674f9a991690@amlogic.com>
References: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
In-Reply-To: <20250718-c3-thermal-v1-0-674f9a991690@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752820661; l=1528;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=EsEZYshflk3g07X2o9lFN7MMXDrdVa6llyBRleDL6iE=;
 b=/WJc7hFo5hGlnBG5sOuV9xXaq9rc39za+LE5BXslsQe764jgsKJcE/hgckai+SJimk1E6wbLq
 ucy7yt1rCD8CAtyajT6DfX1+ZGTWOzE0SuDw9purCTxIw38g3vkU0Tq
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_233743_924824_F6260EC4 
X-CRM114-Status: GOOD (  10.44  )
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



