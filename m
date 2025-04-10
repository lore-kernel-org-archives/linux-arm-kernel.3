Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ABBC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b0mvox9Z1Jc+h48xqJPx/M1spmwCfMAcYp/Rzrg1pY=; b=qTSBome0oSK4oKQvEyeMOOYUYU
	5kk5troekMelXGOTUplxkaghCo/kci0oJQ4O5ydozYaBUOfzKmEaNysk8doF2MIXqjn58euXS2xjb
	u7f2FJGrbpo154ZvIYCg8kLUbIOmPmDzvm9/sf4mVfUPnBDvScH0s1akdXE3tPEksPmKqW1oSiRsM
	M2z9g/BUmz8tS6RZ72iUoHbXFvbs2nNivWxSwwZtScEn3/0THII7Jdb9QC9wovttHdZLEH7uz8rrV
	9xY6YdHVquJj/N5PvHL/LuZIT1uAP1od9nQs1VxJWEmqUrjxygNtqMaVO+Gfq4aZKEBvFsanHIO3f
	4XLw8MRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vGK-0000000BIT0-1pTR;
	Thu, 10 Apr 2025 17:00:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u8C-0000000B51N-1jKZ;
	Thu, 10 Apr 2025 15:47:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46DCB44362;
	Thu, 10 Apr 2025 15:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3ADC4CEE8;
	Thu, 10 Apr 2025 15:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744300076;
	bh=w8D/oQlbjYFMA654Kfwwvab2rVq8372zGCPcqKW1Iu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fG2TpuqMMHHyYZtykHxBYOOreDpwV+ldhF4Z5Qy+/+1VXWQ49leBhORYlyDtMvG/U
	 s0WqonhwLJRWz0RL+p1Pn0QquD9o35gsf+po8VW6kll00ijBpV0kRkUFtAN8tW/UPD
	 qYfRXrcQ1KCnPHN8qNAPaYn7F+b8tWIiL4aR0n5C3a6Fq7S12sz5nXEnBcuZFyvaGn
	 cSuVuT01eLQbeYBv51ckvqUHv3N9rjCw/uF9DlZTS4EKdamYhxQ4/Zh/EJtAFERtPU
	 FFNHgAu3/FaAT+jqRU1sI5ZiGte/aL2KnKPX5eJUdd2+unfwIwf6LeZPkclUmONFY7
	 wOKwYMsAvfkSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 10 Apr 2025 10:47:28 -0500
Subject: [PATCH v2 07/17] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-dt-cpu-schema-v2-7-63d7dc9ddd0a@kernel.org>
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
X-CRM114-CacheID: sfid-20250410_084756_500650_FF80DBB6 
X-CRM114-Status: GOOD (  12.10  )
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

"rpmhpd" is not documented nor used anywhere. The power-domain is used
for performance scaling (cpufreq), so "perf" is the correct name to use.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Use "perf" instead of "psci"
---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 39530eb580ea..20fdae9825e0 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -57,7 +57,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			clocks = <&apcs>;
 			power-domains = <&rpmhpd SDX55_CX>;
-			power-domain-names = "rpmhpd";
+			power-domain-names = "perf";
 			operating-points-v2 = <&cpu_opp_table>;
 		};
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index 6b23ee676c9e..c8e312dcd26b 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -58,7 +58,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			clocks = <&apcs>;
 			power-domains = <&rpmhpd SDX65_CX_AO>;
-			power-domain-names = "rpmhpd";
+			power-domain-names = "perf";
 			operating-points-v2 = <&cpu_opp_table>;
 		};
 	};

-- 
2.47.2


