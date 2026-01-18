Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BE1CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a03pvBjJEeWxBQlizzxXeqoHf+pxHr2XWF4oncp5Sw=; b=mSqai6Z6bYjUkfj3xRvSgwx1Gp
	ig9d2b/LXJaqszjzkcqOz3C2iJwoRh5R/oZP66C6aoWA7LSKOnEz2YVC5Q9PMmbvFbksK0qSUjy24
	YnchSH7e5lzYweYXC5oXRLwcd59uGJNbLMFWdEqlidvtGBueYjZ80uV2SJeNz/zyzzYRCjBJjPm8B
	TODE64x7JNwHqY5VSYOxnsjpQtzz8/2oTS2+l12VYApxC6/0UuUXbD0FuJK1WRP0Ej8KVdMErGf4n
	mISfHaUNLhiLaq3xJAUQMnUhnH5vmVK7z/rgtEKVFk5MSbOI8wCBohaXUJ8FGtdz2wBLR00+qSNvI
	61IWpp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBu-000000009ZF-2pgm;
	Sun, 18 Jan 2026 13:51:42 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBe-000000009Ml-2jfd;
	Sun, 18 Jan 2026 13:51:28 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dvFP81ssrz9tpM;
	Sun, 18 Jan 2026 14:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1a03pvBjJEeWxBQlizzxXeqoHf+pxHr2XWF4oncp5Sw=;
	b=DotJFJo/KbrlNJYdoxVVMC7Ktrg9AW2cFBjKnib/mpeEFEc54tKon5Tq3waxLZ2+nUQZOZ
	G60P6NLukB1/aQMdzhH5X1teuUyUTf2LwKp2WqClH7NVZyGVo0NcXJm2w6WuAX5BptL4Sd
	5i5b9U1ECDyLCdKf8iHunc+VLLb21Ax2EGaMhTjbPK7hfNe2untgb6C8KI195dQGT8VsBe
	wCuG16AvsZP8rk9AAo95VLYlfwryfpvu5cN0YI3GKpDs/zKnXHhag82OCNMOWQJzQPJPWy
	AdUh+SEG5KwIEr9ZgNV9qksPcLKWtcQBfYvNUqVp+lQPjsFO988AjbZ8PHYAYw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1a03pvBjJEeWxBQlizzxXeqoHf+pxHr2XWF4oncp5Sw=;
	b=xgEPgKDTNmuH5WqrcSL1wjg0d18a5iGL79nG85I39HeOn3UDwPBwEMjnSpW59WlREGznn8
	vhOySi06RAm0EONBckqIH9pSh+/tRwTtP4CrfzAU/rZa1I/05pHEYzsqqmyu0uxZFzsgAL
	KrZAG0e8zW8XmtmAeVXp9d7TyAKzuAyGJycblM4aa7DOX0rUHLY2IRyz7676K3jvw4bgUV
	Ekl/6CMKRZtkXr70tfBtGOclXiJmA44jf7HTBQtlDsCZ9bHYtlQYNydK/bM59DdVKd7bSX
	MBs2P5VFpTa9/I2XJFx5A2qnhCW2kRGFB+0msGknfSUmaP+CcpltXdYRk8xJoA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/9] arm64: dts: renesas: r8a77965: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:52 +0100
Message-ID: <20260118135038.8033-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7d0a2511c75a681a189
X-MBO-RS-META: ywoxfzgkfj9bo356hrte58ran1aecdmw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_055126_832749_CDCF319C 
X-CRM114-Status: UNSURE (   9.72  )
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

Add nodes which describe the root ports in the PCIe controller DT nodes.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 425561e658caf..611a9335c63ad 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2494,6 +2494,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec1: pcie@ee800000 {
@@ -2523,6 +2533,16 @@ pciec1: pcie@ee800000 {
 			iommu-map = <0 &ipmmu_hc 1 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec1_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		fdp1@fe940000 {
-- 
2.51.0


