Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ADDC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNMEsuzVoX5atq89fZdca0YcPSTyWQvV79ZvkhYBa9M=; b=Em2mHZTiEbA4VnGavuHphDKM0j
	t6lnf5UOZC3/K8OKAYXFm/7ZrtYGOPrcc4n27V6pOa5gHG4jTEFQ0l30jrAzo8sfEMw+4xdF4sAT6
	i74GB1S0fCsHv/iknP7OciQiWaNA+1pbVSo2c584FJc/pxoqn+kq9/UFCI1tP5k67CVL3UqnVbxKF
	CDUsXUlgnhDi1iFr1GsQSjmCamgNpRsnus2peIvRfH/fg9CPB8Av/TXrCmUqMXvg+F315kVCEmbsb
	zFkOfwubCZHvxBx3BqzerQptschDmt6l2IDQtgkENpI894qsKZokPxXXA3a5MGdBtCFPq7+cG2w0G
	9Ko9TQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XpJ-0000000AhjJ-0iQi;
	Fri, 04 Apr 2025 03:34:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XHp-0000000Ad4Y-2ipU;
	Fri, 04 Apr 2025 03:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D139944F26;
	Fri,  4 Apr 2025 03:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1030DC4CEE9;
	Fri,  4 Apr 2025 03:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743735605;
	bh=VTRjZwZIi8q294b4YyTHrd0BG++P7ph5Qta/NAw+IT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BIydFOU9aJ9WhFAro8qghVTYQjHFs1Y2yZH4wibAW+ULHXKPCLPkRsy8d5oEx+P1/
	 7Hf6x9eRUkjhWNVFDw8HAyxVL60tteeZLa+l0vLO0aXmI7gnLie+EpmL2PS11qVJYp
	 xtIncqHBwXONuQspx+OM+dasoKJT4dzSHFN57/cN4VWkCms54jj2egjQDdMFmuhRKE
	 mLjNtcfcBBslTMrt3O/4G+vg3XGVeaNpnOm2YoZvIupH38/6PxnwbZhh+59CyPHO7k
	 rN6g4n76GbbVf3pd7BHkiVfkXnCHHO23yIhvWKPkp9pE4zZ+IRqV+P5Mdn30fiwwoM
	 XayRRMFqSmyww==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 03 Apr 2025 21:59:39 -0500
Subject: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_200005_738939_FBA6F9B0 
X-CRM114-Status: UNSURE (   9.62  )
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

The "power-domains" and "power-domains-names" properties are missing any
constraints. Add the constraints and drop the generic descriptions.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 6f74ebfd38df..5bd5822db8af 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -313,19 +313,15 @@ properties:
     maxItems: 1
 
   power-domains:
-    description:
-      List of phandles and PM domain specifiers, as defined by bindings of the
-      PM domain provider (see also ../power_domain.txt).
+    maxItems: 1
 
   power-domain-names:
     description:
-      A list of power domain name strings sorted in the same order as the
-      power-domains property.
-
       For PSCI based platforms, the name corresponding to the index of the PSCI
       PM domain provider, must be "psci". For SCMI based platforms, the name
       corresponding to the index of an SCMI performance domain provider, must be
       "perf".
+    enum: [ psci, perf, cpr ]
 
   resets:
     maxItems: 1

-- 
2.47.2


