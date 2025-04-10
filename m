Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pckvcCFjtHH+0FTGEZc85k9/Vccl7ohOO6z2horj9o=; b=Xf6uXoEfn29xmQ89XWHzwW7Dht
	T3Pe4BdLG+hqBcGs/clj7AJ+aTfefW0Z5nIf+Rl0v7bDrSLk2RmgVunmWbK6N6e/2HTXECRzrCO0j
	NwHZEQhmt8GOqR9cBQ0LB+/3hJ3RKiCBZuCHXEldJg9AVXQWHntTDDuU5wKd6rbjpCNMDGI2rpAqP
	iiJFM6/8WQA0vNsCOYxAUq6iQLnuLfL7XKTlZRH9VsAl8lEZyNNkPVtEHLPPwRMDwFTPxg33Fqpkj
	llVFKLKhs6qV+ALfYYf1veOE7o+khEWGuk46wDEAWbZUHvOxgot21eng4/l2Yx7BXo/3HuqSf1DOH
	HdE/Z7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vEY-0000000BI56-1pC1;
	Thu, 10 Apr 2025 16:58:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8B-0000000B50x-2sBO;
	Thu, 10 Apr 2025 15:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58162A4A90F;
	Thu, 10 Apr 2025 15:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A8CC4CEE9;
	Thu, 10 Apr 2025 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300074;
	bh=nVo5X/MosXjoMIZOdVn7ETl8AN7NiwovxfdEw8OmSOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uGYzjYYnTyApltpYtEA9/9oZnG7/797Cn8q6jqLk/EiRZu5XNF9EqiZug9/5/DkhX
	 FRosU37qIN5bQ1dUS0YVTjxFaqmabQ38JtCNt1L0lFwpmaWS5mnlYPBXQY6s0rIHQc
	 Nsu2qcZnsHflTkFFwv8LjQyI1/3LA0m8kUxUChx9BT0j/UhiUPJCikDLhEclCZHBIC
	 si6a0LUoUuapa5Y9l8wAc5gqlVpgGczwcdrrgDhN4YbSPiV+50DSgLPVlpyH2bpcbC
	 2MRLG1p4C84SGSxRS3OFcHEyOHInbBplC/dIIFurvHHjPYY9PShPHMVmWUO9mmFbmq
	 8QArAGCBXYMSQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:27 -0500
Subject: [PATCH v2 06/17] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-6-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_084755_856480_6BAB58FD 
X-CRM114-Status: UNSURE (   7.60  )
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

The "spin-table" enable-method requires "cpu-release-addr" property,
so add a dummy entry. It is assumed the bootloader will fill in the
correct values.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
index 4520d5d51a29..6a231afad85d 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
@@ -93,26 +93,32 @@ key-vol-up {
 
 &cpu0 {
 	enable-method = "spin-table";
+	cpu-release-addr = /bits/ 64 <0>;
 };
 
 &cpu1 {
 	enable-method = "spin-table";
+	cpu-release-addr = /bits/ 64 <0>;
 };
 
 &cpu2 {
 	enable-method = "spin-table";
+	cpu-release-addr = /bits/ 64 <0>;
 };
 
 &cpu3 {
 	enable-method = "spin-table";
+	cpu-release-addr = /bits/ 64 <0>;
 };
 
 &cpu4 {
 	enable-method = "spin-table";
+	cpu-release-addr = /bits/ 64 <0>;
 };
 
 &cpu5 {
 	enable-method = "spin-table";
+	cpu-release-addr = /bits/ 64 <0>;
 };
 
 &pm8994_resin {

-- 
2.47.2


