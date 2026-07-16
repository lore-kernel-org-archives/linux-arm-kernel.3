Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34356C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YVQkpg5e/7JWWgIB1w96BnIRJu2oA2de+EXDIp1Nik=; b=kFXoFKxWm/2VVJ4ii+rvQKsYaO
	WDxATQJxGg7X/t3g8TJ/x7ajoRFN7uTUfoJNBUu4JvLMfVCKDQIzfHoUyEtN7rrrIPgZGWmLjvrZr
	dZgK0tV1G131R8UMOwh21ECfGAl93h2l1bb1l1Ax0adhIDeunS8xFJJ5jXRMis2lc9d7ajna1Cc2x
	ICsGbg5lGKqB6efSFyHZuaTOUPu71tKzuIEXw/xvpn+9It2lN3wIacJ6sZqHfmEZuX/3afeo5ZUa6
	gAtMkX2ghu1aLO16bgBtMr5c2nOLig8ze0N2ajqZgNEVaDpdcBvYsXaK3kuVsQAH2LCVNMOuvmNWz
	fzerd82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPYr-00000000E6Q-3Orf;
	Thu, 16 Jul 2026 17:07:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPYq-00000000E3s-1dgm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:07:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFD6660A69;
	Thu, 16 Jul 2026 17:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E2C1F00A3D;
	Thu, 16 Jul 2026 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784221667;
	bh=1YVQkpg5e/7JWWgIB1w96BnIRJu2oA2de+EXDIp1Nik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mzgrUMJ+1V0HBsr2SrzMhUBWRvekCVpcar6dpBQGfdADuSHCfUdYYqtP1kMPS3fps
	 8h2WHjZbJnTXu0ZX5MgesIGePGIfv0DD7kmXNF4VhwdGT34kU9/4EzPVU+oeSu7pP9
	 uaL0gT+8mhlVuuTBIuEbyzGkCUUTrDSrhK8mozq7GkrVo284ez2rsI0eIHBdy5M/xI
	 kCy7TwpISfm9TS+kgl+HsczcxNvCIio1D7h1VzgJVFeeWlv5nwcQ7bWU2rXUfAP8Ao
	 CUG10WI7RNqPi9CfnBCeU62Gxuh8WR+F7mRD/ZYmT65GCo+W55Jb1uWKuHHs3I0JT7
	 hzpf6AvPrLEdA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Thu, 16 Jul 2026 19:07:17 +0200
Subject: [PATCH v8 6/6] arm64: tegra: Add PCIe root ports on Tegra264
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-tegra264-pcie-v8-6-23e51589229b@nvidia.com>
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
In-Reply-To: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
 Thierry Reding <thierry.reding@kernel.org>, Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4510; i=treding@nvidia.com;
 h=from:subject:message-id; bh=rmyUx6u3OZmVAXG46//PWujiPHCV2TJ7sHTZv11zOUc=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqWQ/RKZi+YZ6sfUHnc60Jc4EKA0uqTHbFQrDG7
 7eQ94rw0keJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCalkP0QAKCRDdI6zXfz6z
 oZCDEACDc9shAu8gXwsqaWkU9lJOMUH6H2Lwb+cIWkc1ZvYhWwDKOg9M/jNb5SK9ojZt1FyaHna
 6V11VIRCWPz10X9u+or4jBNwLX5uFFMGlUXk6tCio4svydHKKgvSFMm9ZTXu3NM1Tz+39OhCwFK
 uEJmoTrmkbfc8aiRKuFiynAXcv4LKatibUctE1jtEhQ9+v54NDxzZJ5WqJ60131SgIlagkXDEHo
 ppXSk98T2j6eOGSYe06YIvN50XAj00qKP4eNZrpb9J1nlD6lM5bggoz64t5HZnCNGcGi47ByCbB
 r4+vCQnw1o4APbPYsTOdoQjbZ/axGkFEwUuXThfn+mfLoouNhv2y+TMexD44wS6xhLaAXhraDxJ
 pQoN2tHiCq5W/OnHYrcBNidKPH/kqttuKUtICNwza4ygF4dWjASc/GLF71LVM1a92dMY6OJUHdC
 J79i/j4OCknRijCrBjMaEEGTVkj50aESiuE/X6Nd1oSCfG0f6PKlI6GnN4pFoalATajSMU1eGGw
 DvuRPVIkVWbh63TacYErC8XQ1Ljob2zaintxj7ZsdWasmQnWbjH/fOgJBoAZYoVYhcDn/SNiPEh
 Xinwb968teUFHSCkXyMS0E2rrx1q9iQ8FBJxR4fcjVh37BxCBsQbrjuEPjbC9IdCZO8KtPHnw7I
 iZIBcXNU2XO+LUA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
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

From: Thierry Reding <treding@nvidia.com>

The bindings have been updated to use the PCIe root port bindings, so
the nodes for the root ports must be added.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 66 +++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 5008bf05d268..1a1a741bfc79 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3537,10 +3537,19 @@ pci@c000000 {
 			ranges = <0x81000000 0x00 0x84000000 0xd0 0x84000000 0x00 0x00200000>, /* I/O */
 				 <0x82000000 0x00 0x20000000 0x00 0x20000000 0x00 0x08000000>, /* non-prefetchable memory (128 MiB) */
 				 <0xc3000000 0xd0 0xc0000000 0xd0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
-			bus-range = <0x0 0xff>;
 
 			nvidia,bpmp = <&bpmp 0>;
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		gpio_main: gpio@c300000 {
@@ -3917,10 +3926,19 @@ pci@8400000 {
 			ranges = <0x81000000 0x00 0x84000000 0xa8 0x84000000 0x00 0x00200000>, /* I/O */
 				 <0x82000000 0x00 0x28000000 0x00 0x28000000 0x00 0x08000000>, /* non-prefetchable memory */
 				 <0xc3000000 0xa8 0xc0000000 0xa8 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
-			bus-range = <0x00 0xff>;
 
 			nvidia,bpmp = <&bpmp 1>;
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pci@8420000 {
@@ -3949,10 +3967,19 @@ pci@8420000 {
 			ranges = <0x81000000 0x00 0x84000000 0xb0 0x84000000 0x00 0x00200000>, /* I/O */
 				 <0x82000000 0x00 0x30000000 0x00 0x30000000 0x00 0x08000000>, /* non-prefetchable memory */
 				 <0xc3000000 0xb0 0xc0000000 0xb0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
-			bus-range = <0x00 0xff>;
 
 			nvidia,bpmp = <&bpmp 2>;
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pci@8440000 {
@@ -3981,10 +4008,19 @@ pci@8440000 {
 			ranges = <0x81000000 0x00 0x84000000 0xb8 0x84000000 0x00 0x00200000>, /* I/O */
 				 <0x82000000 0x00 0x38000000 0x00 0x38000000 0x00 0x08000000>, /* non-prefetchable memory */
 				 <0xc3000000 0xb8 0xc0000000 0xb8 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
-			bus-range = <0x00 0xff>;
 
 			nvidia,bpmp = <&bpmp 3>;
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pci@8460000 {
@@ -4013,10 +4049,19 @@ pci@8460000 {
 			ranges = <0x81000000 0x00 0x84000000 0xc0 0x84000000 0x00 0x00200000>, /* I/O */
 				 <0x82000000 0x00 0x40000000 0x00 0x40000000 0x00 0x08000000>, /* non-prefetchable memory */
 				 <0xc3000000 0xc0 0xc0000000 0xc0 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
-			bus-range = <0x00 0xff>;
 
 			nvidia,bpmp = <&bpmp 4>;
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pci@8480000 {
@@ -4045,10 +4090,19 @@ pci@8480000 {
 			ranges = <0x81000000 0x00 0x84000000 0xc8 0x84000000 0x00 0x00200000>, /* I/O */
 				 <0x82000000 0x00 0x48000000 0x00 0x48000000 0x00 0x08000000>, /* non-prefetchable memory */
 				 <0xc3000000 0xc8 0xc0000000 0xc8 0xc0000000 0x07 0xc0000000>; /* prefetchable memory */
-			bus-range = <0x00 0xff>;
 
 			nvidia,bpmp = <&bpmp 5>;
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 	};
 

-- 
2.54.0


