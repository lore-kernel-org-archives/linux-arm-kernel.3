Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65079CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFjKE2ApU2SqNxtA22Y0SNIAWTSQ6SwQHjwGTZAmx6Y=; b=0+mcaacIq+ZROpfK+0PBtOcMPm
	oP5Pw3TNBnca66+52eCwG2DUbxuSCC9VpM03CvxFAOarlJwNA3xvaq3kk8ULpGPcWq8QSfQFP4jLg
	75B/AUK6ZIi6jw5X9O+jJU0LF81aLcZiMeB9sSihljuDkPBdEGo8PshQiNRbUQLw+UYn1vOYrlkwN
	kMJYEUMk06ZfmirKfVNHHFnBBdMZTTv4itSOuIGlfmWi2KeqOoDyRWRKybu0h8Hitor/3ceYQoVx1
	8M/lqvjaWgFvqJwKnT9xwmoLHDvCH0m7jHGvACaMtFXRI6EGIqzIKY3Fo5vsjij3+a9RqFo5S9Dkk
	VEbknKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyGt-00000003pPg-3itq;
	Thu, 07 May 2026 12:56:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyGr-00000003pM7-0WtI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39C0E60181;
	Thu,  7 May 2026 12:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADCFC2BCB8;
	Thu,  7 May 2026 12:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158563;
	bh=4/6vzm3F89tYIBWYAzm8ccRLU9saqSBjgruCZuRt+ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tp/QRs/qYq7nSuEnWwDda9Ki2sMj2S2LVLgqIIXEE8SeQM3JKjx5VzKd+em2jabL3
	 LoFuZ43KPM39X060vw3XgfcC8Zu9smDCJBXRklrgYkXusKciuqewBvXu3WOtQxd+fb
	 ifrNyc3oHmMNbwKIz7nVbiGetozY9wTmzpEYowi8eWn950TVLu5bVwZMsOIAmp+xmj
	 ZwjdVzS7w2iwPvewvBh+kFHrYol1TX/GOfVG8nBqxNdTClmRkpX7LduTczYuz8I0Zb
	 /vSjdm00gOR5KJ7Zbo3dVyVD9OaO0p0AUOB+hegYenmnorhY7tayYv+1vzLNTWtgnA
	 86C5qAID5HNqw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wKyGn-00000000d7d-1ilu;
	Thu, 07 May 2026 12:56:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH 12/16] arm64: dts: qcom: Add EL2 virtual timer interrupt
Date: Thu,  7 May 2026 13:55:40 +0100
Message-ID: <20260507125544.2903406-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507125544.2903406-1-maz@kernel.org>
References: <20260507125544.2903406-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kernel.org, afaerber@suse.de, 
 heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The ARMv8.1+ based CPUs used in a number of Qualcomm SoCs are missing
the EL2 virtual timer interrupt. Add it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi     | 3 ++-
 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 3 ++-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/milos.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi  | 3 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi   | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 3 ++-
 arch/arm64/boot/dts/qcom/sdm670.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sdx75.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 3 ++-
 arch/arm64/boot/dts/qcom/talos.dtsi     | 3 ++-
 25 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce62..7267e0ec44b2b 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1880,6 +1880,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee0764167..cc638b9162c25 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -8982,7 +8982,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	thermal_zones: thermal-zones {
diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1aa..149275828f1bc 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -6953,7 +6953,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	tpdm-cdsp-llm {
diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0e..8e0a1ca0125d1 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -7876,6 +7876,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e763518230..cd9c964e884f3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -8585,7 +8585,8 @@ arch_timer: timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	turing-llm-tpdm {
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b6..b991124b8ce9f 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -3235,6 +3235,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e6..38e54b91f0d81 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -8312,6 +8312,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df68652..11ea2330f3ac5 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -3165,7 +3165,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a4b17564469ee..25a9235f41b7a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -4861,6 +4861,7 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f45deb188c6c0..10344e682495c 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -4399,6 +4399,7 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f472..e5fc52e6f613e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -7043,6 +7043,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c195c79c1c85b..f6e6ac4d8abcc 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -604,7 +604,8 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	soc: soc@0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc3..9ad4cd36c8927 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -6041,6 +6041,7 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index d1b61530b562f..b6cdf71051026 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1583,6 +1583,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index 696e2e0841ad9..c7890f5ab8f13 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -681,6 +681,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 034545d2af2d1..a06c1f54e228d 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -3528,6 +3528,7 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549b..e89cf4829f10b 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -2472,6 +2472,7 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209ab..c77fea73eaeee 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4630,7 +4630,8 @@ timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab2..ad44ab7d89fdb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -6293,7 +6293,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec6..63081dcc94aac 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4542,6 +4542,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f289..e7a890dc2e57f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -6327,7 +6327,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		clock-frequency = <19200000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6f..4958b653678ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -6806,6 +6806,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff373..24714688b50af 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -8599,6 +8599,7 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd7..e9192b806f9f0 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6796,7 +6796,8 @@ timer {
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	tpdm-cdsp-llm {
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a47..9b3172e8c5545 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5153,7 +5153,8 @@ arch_timer: timer {
 		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW 0>,
 			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW 0>,
-			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW 0>;
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 4 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
 	thermal-zones {
-- 
2.47.3


