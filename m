Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82C4D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf+2LW/K7uHWYSeL+4oc/nXbmfZwSn0ljbgPq5lr9nc=; b=y8wClDzRXcQdzd67FPI+Z/ecXW
	cYAFQ1Cy6RP/SgVKKu/32UQdkbBk9fVDUZmnufi/jPujHAHlTLwwLXGl9prjeChHqCl95TPOe/Wgf
	PjNB60l7Voj7VEH2ly2bKM3V5NpaW9PHsjApD22lHxHlqmi3i0h25UFNRvvNHAPElAY3qzteELz+P
	DPOvxB04tzVOR7GuYlX23UfK6i6lMKX8TtrpgZqv8FM0CqatcpCzLQnC6psPIu/7a86QoBRiju+Ql
	r/FHzD5mO8ncLe5kXTFfjp/pBHEU3+7OTnDQEosBXy2kJTeedEvWvIr4YkkELcsXUppEoA87in5HB
	hwBg45UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTC1-000000009cU-47N8;
	Sun, 18 Jan 2026 13:51:50 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTBg-000000009NA-276U;
	Sun, 18 Jan 2026 13:51:31 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dvFP96dfhz9sTb;
	Sun, 18 Jan 2026 14:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tf+2LW/K7uHWYSeL+4oc/nXbmfZwSn0ljbgPq5lr9nc=;
	b=KltbS8z2UEUWyS/OrIFlivEeczmhECPTvUBYry8ue/epTrtftY1DN252uOO7oP3o4WDkJu
	L/HPXzoCU+cOm4kbYYsQqMPw4tRcrKfxzr7toCO/cCihxRcUvq5JKVcAe3CsNoPsxI9HWa
	xXg53iRVvdcyUNv217BMnxiuFll/kcUTXZd4gWNIw8Oppmc4yb32ncxTHFLSV+0tcFMyuD
	2cbNAOowSZ30L+G19qSmYoENy/mVA0QpXX83CD5AfArm05/LYEdLSgD+DYcFmoRY/R+BCs
	6nYEa6SmEr75qPysRbHgNIAOgGLUygQpmb0MO5mhiojaeOMbsf90xLmQ5ek9Kg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tf+2LW/K7uHWYSeL+4oc/nXbmfZwSn0ljbgPq5lr9nc=;
	b=t7YPvZtya0/YEvtYi/dcX+XBA3rIOt2EjZAplBZYkrqmaV4ODBxpY3JR8xtvGD15zC4T/i
	gwOYDFUsn2xJ46/p0RL6CAtZENo3xKYr8QjWBvKbit1uVWBzib03lJmS8uDym3tUAn9qzx
	Ha6ynlhIBF6fE7W4HXyV2jIhPr9M2G2kXoAt9fHE20POChs1X39T8uppc4cD9uf45lrljr
	c0ObZe166kiXJtKe+/qg6RY9688lYMXfP+kC5DVTCtqJVOrE71SO+OVIYvCEg6i3EM+8Hp
	8GMeA6otwHvsGiPBPuL/HIAyxeGV22LQeruhha5uoqEpmv/rHFLiu9zBcegLow==
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
Subject: [PATCH v2 5/9] arm64: dts: renesas: r8a77990: Describe PCIe root port
Date: Sun, 18 Jan 2026 14:49:53 +0100
Message-ID: <20260118135038.8033-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 68jt9cumd8exuazkag4goauxrgq5qoa1
X-MBO-RS-ID: 31b220a7fad67fb80eb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_055128_862461_8AAC0E84 
X-CRM114-Status: GOOD (  10.24  )
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

Add node which describes the root port in the PCIe controller DT node.
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
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 97a7cf675efa7..82e9ab458b05b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1929,6 +1929,16 @@ pciec0: pcie@fe000000 {
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
 
 		vspb0: vsp@fe960000 {
-- 
2.51.0


