Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180B7CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QF0m6i6TEScmr3Rp68EIucTo181wyaEcegmBAGCBHY4=; b=pTsu0lFCmVJlsogCjYWoxgD81m
	hqglv8DUKRnhyBdDgoqrRMIz7gUT6xTHWSl87eHdBGmKezjfgn8CYyDbGr9ynUkFg5Xemer1ZxDJh
	u9TJAynVHm0gmpv8KGyqNerDg6ZhSKAwapTlcqTCJVkmXtkZUDPu6bzfC7K0ygZ0QPbL8JF9EOC1m
	kf6Z1usKuonOr/EZDB91WJVuP6FP3UKvy+mh/LA18zo1mtQn6q8fUV6rZEBAjDydfpVrr0c9nUgKj
	fZxbF7H8MZQgfvY3xJfJRZdTuPI55TjRN5IOkGSa6QvO5XpeliKKNSVyFxj9524dAIVzxgSQugs4q
	Od02BZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnXh-00000001QWh-0ElT;
	Tue, 26 May 2026 08:53:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnXe-00000001QUu-0BMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:53:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A66D42AC7;
	Tue, 26 May 2026 08:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3901F00A3C;
	Tue, 26 May 2026 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779785617;
	bh=QF0m6i6TEScmr3Rp68EIucTo181wyaEcegmBAGCBHY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n0P75vY2pZ+jWF+5WtcsDYjcIZsaU23za4nmbLQlqv5VMesBrhd9F6L2KwVgF0AfD
	 fHmr0Zq1kcm9YGkA5lL0odrT+mB0bAWJ0QqTO1nioqeQ8RX6Ro5fqWQv6/17IHykfe
	 P4CqkoAOHzQL+tHyDMnF/S7s0HFhnVDT9k6wEyam4P0XCSqd4nun7EIjoflId5epS5
	 6yXxi6GnxQMfwgPq863Pp1u7Z9BVpAWgtkwb7RP3prpLPCePjdf6c7YkEwRiCOrXoN
	 yX5a6Mb7ORhMSVOWqgeKYVENtWIMikX9jxxe2NHmiouBHRQID8GLfRFN4nIGEleYev
	 L8kchGPK/ypJw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Tue, 26 May 2026 10:53:13 +0200
Subject: [PATCH v5 4/4] arm64: tegra: Reorder reg and reg-names to match
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-tegra264-pcie-v5-4-84a813b979d7@nvidia.com>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
In-Reply-To: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4765; i=treding@nvidia.com;
 h=from:subject:message-id; bh=h90BndrWpq4qXCMY7fWTkO53DzrTIC/ERZi6GGH8B00=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqFV+E/+AuIjQyE/C8z1dp9MaJtwnKK62MzpSqi
 eeYLchCLv6JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCahVfhAAKCRDdI6zXfz6z
 oeuyEAC4y6h/UJPfX4V8LBDL/fZTAvZqJwqTdSSpWF3a9eoSu8x4Bcrlb8NteWPGnAZSsP0OyVb
 FQxr8PuqdB1AXatt6E2smHcBxmqc8R4k//o8p46luUQ4crybYMGBeiCfjBonQdLmtm1O+eOxDRe
 UaUbfzHXYAxa5MlyBc25qJ0T/ojzu9DM2ssQxiw/mnj+kEuALW0cOVWWnZH7oAepW594NOYAn3O
 LhrAqbVtyEGp09gg+C3wzjk/hVQaAQxrq+bSrEvh1FZHPK/77zKNYnssQGckzIo5tVqAaGSZeOB
 A/BtzWLnRvKycM9nyxaGkLes67Ww1t430iVbhFsDo4EZLeBwqWS6Yw/gSe6Z2I371otGOSG3Ndl
 j7XxOehUfYi9zWmsfmlmPEccDl8e79F9GODuFSYPBRA1VvyT/YYZXxRngFIXnSKeY2FoGVP/cLN
 7AAIAuKi8Sybn51G9Wwj4iLINWB9H9g0lKyrGXRad/VIWd6/oavpSzyEvbeF3+AVRmHupb1jacO
 Wq11xOxGUOdRnuRy0QHimILnA4DPOpM/pTJ7De3w/c27EVw0iRLehjOMX8fVxZjTt58BiIDha2d
 zExfbS+IwfqjEbU4xUFk8Qk4EV978P+fOwjHTMOgOIuHuXinyGI1og1/62KhiEXc3Qa0CDHA+PX
 slExzMRjoEuvnUQ==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_015338_154721_6404EA65 
X-CRM114-Status: GOOD (  11.29  )
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

The ECAM region cannot be the first entry in the "reg" property, because
in that case the unit-address wouldn't match the first entry. The order
of the nodes can also not be changed to match the ECAM entry because the
ECAM region is global and outside of any of the control busses.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- rebase onto v7.1-rc1

Changes in v4:
- revert ECAM "reg" entry order

Changes in v2:
- order ECAM "reg" entry before others
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 48 ++++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 06d8357bdf52..d4f2a4ab03c3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3556,11 +3556,11 @@ cmdqv4: cmdqv@b200000 {
 
 		pci@c000000 {
 			compatible = "nvidia,tegra264-pcie";
-			reg = <0xd0 0xb0000000 0x0 0x10000000>,
-			      <0x00 0x0c000000 0x0 0x00004000>,
+			reg = <0x00 0x0c000000 0x0 0x00004000>,
 			      <0x00 0x0c004000 0x0 0x00001000>,
-			      <0x00 0x0c005000 0x0 0x00001000>;
-			reg-names = "ecam", "xal", "xtl", "xtl-pri";
+			      <0x00 0x0c005000 0x0 0x00001000>,
+			      <0xd0 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "ecam";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -3892,12 +3892,12 @@ gpio_uphy: gpio@8300000 {
 
 		pci@8400000 {
 			compatible = "nvidia,tegra264-pcie";
-			reg = <0xa8 0xb0000000 0x0 0x10000000>,
-			      <0x00 0x08400000 0x0 0x00004000>,
+			reg = <0x00 0x08400000 0x0 0x00004000>,
 			      <0x00 0x08404000 0x0 0x00001000>,
 			      <0x00 0x08405000 0x0 0x00001000>,
-			      <0x00 0x08410000 0x0 0x00010000>;
-			reg-names = "ecam", "xal", "xtl", "xtl-pri", "xpl";
+			      <0x00 0x08410000 0x0 0x00010000>,
+			      <0xa8 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -3924,12 +3924,12 @@ pci@8400000 {
 
 		pci@8420000 {
 			compatible = "nvidia,tegra264-pcie";
-			reg = <0xb0 0xb0000000 0x0 0x10000000>,
-			      <0x00 0x08420000 0x0 0x00004000>,
+			reg = <0x00 0x08420000 0x0 0x00004000>,
 			      <0x00 0x08424000 0x0 0x00001000>,
 			      <0x00 0x08425000 0x0 0x00001000>,
-			      <0x00 0x08430000 0x0 0x00010000>;
-			reg-names = "ecam", "xal", "xtl", "xtl-pri", "xpl";
+			      <0x00 0x08430000 0x0 0x00010000>,
+			      <0xb0 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -3956,12 +3956,12 @@ pci@8420000 {
 
 		pci@8440000 {
 			compatible = "nvidia,tegra264-pcie";
-			reg = <0xb8 0xb0000000 0x0 0x10000000>,
-			      <0x00 0x08440000 0x0 0x00004000>,
+			reg = <0x00 0x08440000 0x0 0x00004000>,
 			      <0x00 0x08444000 0x0 0x00001000>,
 			      <0x00 0x08445000 0x0 0x00001000>,
-			      <0x00 0x08450000 0x0 0x00010000>;
-			reg-names = "ecam", "xal", "xtl", "xtl-pri", "xpl";
+			      <0x00 0x08450000 0x0 0x00010000>,
+			      <0xb8 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -3988,12 +3988,12 @@ pci@8440000 {
 
 		pci@8460000 {
 			compatible = "nvidia,tegra264-pcie";
-			reg = <0xc0 0xb0000000 0x0 0x10000000>,
-			      <0x00 0x08460000 0x0 0x00004000>,
+			reg = <0x00 0x08460000 0x0 0x00004000>,
 			      <0x00 0x08464000 0x0 0x00001000>,
 			      <0x00 0x08465000 0x0 0x00001000>,
-			      <0x00 0x08470000 0x0 0x00010000>;
-			reg-names = "ecam", "xal", "xtl", "xtl-pri", "xpl";
+			      <0x00 0x08470000 0x0 0x00010000>,
+			      <0xc0 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -4020,12 +4020,12 @@ pci@8460000 {
 
 		pci@8480000 {
 			compatible = "nvidia,tegra264-pcie";
-			reg = <0xc8 0xb0000000 0x0 0x10000000>,
-			      <0x00 0x08480000 0x0 0x00004000>,
+			reg = <0x00 0x08480000 0x0 0x00004000>,
 			      <0x00 0x08484000 0x0 0x00001000>,
 			      <0x00 0x08485000 0x0 0x00001000>,
-			      <0x00 0x08490000 0x0 0x00010000>;
-			reg-names = "ecam", "xal", "xtl", "xtl-pri", "xpl";
+			      <0x00 0x08490000 0x0 0x00010000>,
+			      <0xc8 0xb0000000 0x0 0x10000000>;
+			reg-names = "xal", "xtl", "xtl-pri", "xpl", "ecam";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";

-- 
2.52.0


