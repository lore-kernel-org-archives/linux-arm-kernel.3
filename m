Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56339EEE25C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtilydaFBRdK6QbVHukBiWXRQofI1NBv+g3trQghN2Y=; b=PwgXRC3NTU19PIvfk3XkyQGpsA
	pvDqCZOVJIrTF7M2/UPu4E1RoR7Tyd/Wvb58xa3UxKjrzvvkHfeUK2tYmM503O0hAlpUHxF7gRp4b
	/Y9wpoixtluUQpyd3aoyNW7vU+v177ELF5pF11GFu5WnPNmthnFOdV9WzpkwbjMc3ds1koUG4/Ase
	eGy/HsfwjKTEMzUAc+Z2zF0t8wqxQrmoRRsFBGqZCSVPD7+Rr1nUJnMfXz5sLjDqVNshUnzrChZFl
	fGo9Hbe4zOS2/tHt/bfOvDHT2OAIjfkFeZFSEwXIg0nfc49Da8/p+paBjJbK+9RIV1Jm2pt0Ai632
	pZwJrDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPT6-00000007UIk-3tSf;
	Thu, 01 Jan 2026 20:40:24 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPT4-00000007UFo-2dbX;
	Thu, 01 Jan 2026 20:40:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dhzGr6hScz9syY;
	Thu,  1 Jan 2026 21:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtilydaFBRdK6QbVHukBiWXRQofI1NBv+g3trQghN2Y=;
	b=qONnL3la3BgKPom7XE0m5ey/uWPleSuXxDK8ffOzJCHOqKDkfitSaAvbrgvTWi8NNj1hmb
	eZ+HK1tpUbB9unYc8aYDMJq80+wkIRD+GqERtm00G9BhaPG+JTDzX6ImD5qT/EyI5WbfSl
	8bjuts3Xr2e2mZ7Wyfmm8Cf2CG6oZtRJXMibzoF7xQDSCNVKgaZQt6D2fqMoG1YXloerN4
	/47HElCE+3egDrRi4RYdNauzKNVCAwZ86lb4IYRZLzBeesk7CZOafPnRLeRY6czIy0GlQB
	zDAVtwjFxEQYqrsSJmcj5WKLbA/dcLiJf4ZIIm+eCN4BQcE8qVFzmtiv5x9Jmg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L4XYf3Xq;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtilydaFBRdK6QbVHukBiWXRQofI1NBv+g3trQghN2Y=;
	b=L4XYf3XqjyMxDiV2NZiKc1a0Uwjwk96J+VQKv3/3Bo6VjQMDK9lUphRfNs04fDXz8Qyg0r
	OJ8KmhQGovV6iiGUjbEd026gzSKforXuVxERtH0jvMFbxm913cZHHEIA9QC4vfU9vRX3+6
	unyCbaFq/VNrLOn0Y7Cz2+KrmkW/CStU6ResIvj0WbpkNEFKhT5V6oSj8JLLs2tVh5P+F7
	EqtxZQbzxIzWPQgK7XRkvI/tJwK2VQC1lglKa9r0lcc/aM49xAQ7S54L4nzVeUckEXdl7Q
	KzSZaN9Hg3ZgkxR319QJ8KoHvRh/vTLxivZ7s2YCkbrEHslGnQQ8AzUFAZVluQ==
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
Subject: [PATCH 06/11] arm64: dts: renesas: r8a77961: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:53 +0100
Message-ID: <20260101203938.159161-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7qmc1g9jswcpbrn3b44w5fb31ra3exff
X-MBO-RS-ID: f372713c550d010451f
X-Rspamd-Queue-Id: 4dhzGr6hScz9syY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124022_808317_BF5895FA 
X-CRM114-Status: GOOD (  10.59  )
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
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 31b11bdab69b9..7f87f248dff60 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2499,6 +2499,16 @@ pciec0: pcie@fe000000 {
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
@@ -2528,6 +2538,16 @@ pciec1: pcie@ee800000 {
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
 
 		fcpf0: fcp@fe950000 {
-- 
2.51.0


