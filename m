Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7DFEEE25E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LT8cLq/mHX6yQ3WHHtPZLwnph/YQHgiYvcdPLd4Qvug=; b=ZdkWxmfbKAeXW370gKv4T4iOzU
	Tnjhq85iUCqXRxLBFjOxCEUgsSQMKgHbARWdv20+22snnCHZTMEFWaDFt3gWRyfatAVO/7WgoWni0
	T5kUYGv3zfs0Y6q1ZvIdbw7cw56qQG2lT4yuhazWbXMkxvYMPcR4htLpx+QpMlLIL7Y2fSP8RMdcE
	Ap+C9OC5kz2aSBGl6uSORJqNLXvNz+NTly7C+FPlwX1TTGH3rP2co7HEEUDrJFP4v2JKLMp5RtV2d
	G2aa5ZyTuuAvoTuPoiL8hv55Gp5i9NDv/iIKsep+XQ6vipXsNTLRV1ylZ7BB3PLatCWaJw1L5a5Wy
	TCqOyNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPT4-00000007UGC-1GMB;
	Thu, 01 Jan 2026 20:40:22 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPT1-00000007UDr-2aCk;
	Thu, 01 Jan 2026 20:40:21 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dhzGn3tXcz9t9F;
	Thu,  1 Jan 2026 21:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT8cLq/mHX6yQ3WHHtPZLwnph/YQHgiYvcdPLd4Qvug=;
	b=YwYAI8blj6n3EI3qieRaBBLBRH/ilJ2rzvGeizJ+HLIHgua475GVW88TD7VQgM9xFVuTXF
	Yv8Mmfo3TMfSfVs3Ac/fuIwTQZvXecO2nEsA/+cUBcx1NiuFjbOrgOJZadtzixvIA23IGH
	1KdpbPCmASPV24tQ64xYi0jCAcnvcchwsWjNcse6Q5IGFM92fs4dV/MBJCK7Cat7iE4z9s
	58ERt/QVK9BH2QPhVL1DoSlSTeKR+ShYT9qLUCjeGMZk2hzekMBjySwYTTOfxbQlbqUxBY
	Ag7X61ge2yDokz+rGXiDL6oP/2ulCEz9gzHWGllNAUJqqu/+noE5qDwmu3ji0Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="WA/xoVGd";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT8cLq/mHX6yQ3WHHtPZLwnph/YQHgiYvcdPLd4Qvug=;
	b=WA/xoVGdgrFPOnCFldjdV4H8sJfJ4LrqtCyaJXZExUXn1zKopHYRd4sc+aSWCs8Wdp/v2L
	ZmOOknr20O2EkqQV1JX61S1VNNGD2wo1aTot+P4XzLhdSoEdN6oUbDW/x65HBNA0jrMRh4
	T+cHA0jNAMfq2N1b27iPJulB4hx0oYSJ1kSnH26ItBGa/pMZyQfeIZwhF2LixteUEPLQz+
	kf6/Ne9mGW4ZSA6DHopjiC5YmVljKKOc8zP+4TGKF15RXLKwgmyCH0BhK5gdKgWaErKuLC
	oHZ2OcLYQPVQnfvtTE5CUODt9ipo539zNMzqYxPKsE7dDO36J9EcXt+jE8yeFA==
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
Subject: [PATCH 05/11] arm64: dts: renesas: r8a77960: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:52 +0100
Message-ID: <20260101203938.159161-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 52907308e78b1b226fa
X-MBO-RS-META: fd38qjdx1j7m4j3aqc7uh3qrguhqcb1u
X-Rspamd-Queue-Id: 4dhzGn3tXcz9t9F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124019_791221_2313C691 
X-CRM114-Status: GOOD (  10.54  )
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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e03b1f7cbfd6f..e2cdaec4dc2df 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2619,6 +2619,16 @@ pciec0: pcie@fe000000 {
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
@@ -2648,6 +2658,16 @@ pciec1: pcie@ee800000 {
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
 
 		imr-lx4@fe860000 {
-- 
2.51.0


