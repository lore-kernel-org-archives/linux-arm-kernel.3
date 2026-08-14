Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF566C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VGq6rdCNxgCfxXDEz0J90bfJLSsfsFdCtf54uc9TfM=; b=S0kJSTa/mJyM08D6ozBTOj80Yq
	w45cVFkT65Y3gf9xxUVnC6QEXAaOO0tzDM9qNp5nM1MXrW+Aiw6cha7XQOJOi8y7fitTyTP4+koO7
	YNXS9JD5e74k6n2+LLdcorC3ezoxgtB19w+Ox0d2iUOKyYDW8KzCcky1hvsCzNxRA28oZllTxX3cd
	PkVrX5SHXhZDHY+ZmmV4hCmj4m889NTus1iyafkRwfLElNZQEJoKne0f8uA4GqLEbHy6q/lhHAPqc
	SVOlvWDd05CAW4EknSStu0Fe49+cIFn6xesbhH7ZBhpg1pEWEdUGEAKgfptEFok4sfrLzNK7URzTC
	KlB5XRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuu0A-00000002sE7-1kEk;
	Fri, 14 Aug 2026 15:39:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuu05-00000002sBO-1vm4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 15:39:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C6760A69;
	Fri, 14 Aug 2026 15:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEE21F00A3D;
	Fri, 14 Aug 2026 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786721956;
	bh=9VGq6rdCNxgCfxXDEz0J90bfJLSsfsFdCtf54uc9TfM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D0St+jbfHvysXJBZXp713sWK0S6DSlYeqLS/tbl4AsHFxNNMsgodGaZDMQYV1kggi
	 hgbAUmTQIknKBJjEZNT2JSjejbf+eObhkRtA3rKf0B4xFhXi8bkTumJiiVHyeQoDPo
	 VlQI+JApk0rO59+BEbnsr5hoN6bia2WZdURExe6YZyfYf1fb91biMfB/r6ezW+jhpX
	 bOmlLPtXsPPPimC8Ex8cndKmkD0yqGFYK1/7ADnNj9xPzsmB9UJt5FJDwWBC51BF9Y
	 SHyRv/9MWkExnhJR2qWuTC/PHsR68cunyZgBKUCQQXGjPiEjzNiTgVY4XVkM0hxc7X
	 PEpGdXRP6WGxQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 14 Aug 2026 17:38:58 +0200
Subject: [PATCH v10 4/5] arm64: tegra: Reorder reg and reg-names to match
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-tegra264-pcie-v10-4-05d08c592b05@nvidia.com>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
In-Reply-To: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4866; i=treding@nvidia.com;
 h=from:subject:message-id; bh=7CI81HCMNfvKezvmtxPTjIu4kaNogcb6dnP3NUgeanQ=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqfzaWzPES9W6Y+7NkdqVB54sIeERlXj5u8eChk
 5LE7wN8kbyJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCan82lgAKCRDdI6zXfz6z
 odU3EAC8qdbSeUoS1pWRDbpK6XUMeqoyajUT+8f9uG5Cc9bL9u5zodozuAVUFdBDmc0ZNmeGIxj
 gYnzBGRbNKQMylEFi2byjgzno4MO8PDhXAn1Yw+ncdf9U3rXgm0B1dN9loAa3r+uCB3qORc6kH7
 pktSIu4kHtkQSbBcw75aLLjNj3+5lSnDYY0zY7+9bD+Z1yujoR+oWP6U2TDe0Elu4yPTA5e1oel
 Bu1sc8PuueVg1dyxb6/NoT1IJE2EAmYz8oqwXds0c5F+xfzmCXdA79ULFsnSem0jtk2yfMUgiWo
 5HdM85wCl3w5GoxYkwyihmIfmDSeqJ6E5/WQVfTSsvyAkpFZuuqIRFXkM9ARM9eS4fcpWt4DEGN
 1DR7KZUKsvifsNWn3j9NKMoutHATsBaufu4ZM3gDqRWRoqhReVWrW5O83qv+bVsfkRGkFQyTHOf
 9K/VWooqpSs8TwwQHdShOnaHGINdTn3POgYCUad6rF0RlxaPoJ6LYyumLLLoEUfjPR6iIbi8s59
 jzU4s3LmSfXcWnr4n2FZ65EuVAQXANL2/wtp/P3MsCqZSaTS44JkNhG62o0ZISHBgpClMQeMBw+
 NDsORpX1oQMM1bzvgaltnuvOMPxgyvjd+Md8/aU7WaBACx/YB4ba46Z8UIt6CiVSZRkjm7YcNrT
 j2E/PEFxc4UP7Lw==
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

The ECAM region cannot be the first entry in the "reg" property, because
in that case the unit-address wouldn't match the first entry. The order
of the nodes can also not be changed to match the ECAM entry because the
ECAM region is global and outside of any of the control busses.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v8:
- add Acked-by from Manivannan

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
index a1a86022d638..cf9760c681b1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3538,11 +3538,11 @@ cmdqv4: cmdqv@b200000 {
 
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
@@ -3991,12 +3991,12 @@ gpio_uphy: gpio@8300000 {
 
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
@@ -4023,12 +4023,12 @@ pci@8400000 {
 
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
@@ -4055,12 +4055,12 @@ pci@8420000 {
 
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
@@ -4087,12 +4087,12 @@ pci@8440000 {
 
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
@@ -4119,12 +4119,12 @@ pci@8460000 {
 
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
2.55.0


