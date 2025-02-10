Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE137C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wcfm2torRnSHmFqV9a+s+XnFIKlfVs7U50YSgpk9mKY=; b=gU+05bVbC2upv4zEl0kENtmaZb
	lhwGI2Op1Xbhsm2WNM+HOTZvpqRsVDHTpz222pL8Ye8werd3ipV1evyeP7NyUmPrFtVhtdCtlmety
	SblvIJ28/4oWcHdSRQJoLXu32tdkOMDAXuHeDpLWlp+tKQ8PXx5gnRVVQYl58Bk3pI3KeHGdw8wJx
	MEzsNxZh5mbGyZxJfnpW/lcZ6rdpZIe1eRaCQkuuJ1cPtFwYj0QvaDnydXvdNp+J5aiuFP6ZVsafa
	xzWpzGo5IDP699t+ZltLxWI5+cJAi2rgugMdZN2lxU+xluHsSU2ox2Sb95L0D2McM2q7racPXoxkb
	VSBwjYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcgz-00000001kjc-38Ic;
	Mon, 10 Feb 2025 22:55:53 +0000
Received: from mail-lj1-x262.google.com ([2a00:1450:4864:20::262])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbTH-00000001Vsf-47rd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:37:41 +0000
Received: by mail-lj1-x262.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so46026081fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 13:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1739223457; x=1739828257; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wcfm2torRnSHmFqV9a+s+XnFIKlfVs7U50YSgpk9mKY=;
        b=ZstyyZbFnjWgJLwW8x7i4JhICuzVEodKfqKb9VVJZ7ZXgh2A58euqwn9af8WrROW77
         qWppNoR/Dxb/Ob2f5/n/Oq8Jie522nTqVoWr/sviM9gMhgfx1Tyt7/FbeMGf+63Fs3Fm
         8RYNVL6EJEX0ej+F3JPcEzjd6lbWLetJk+s7eWHUPsl+yXWBZZtaJYlmVJNjwd3dOHNr
         QRcBLWsih1eS7V4kHeXRoZhym7lcm3a2D1Lidh5/DLU60TX1qYXkIVFrSVi2TsZowg+U
         e8qq6zWGkLY9fGAVIMmWsswFH3OQomeBJUHe7K+3Gqb8B59dJEq5ZGvw5rnsfJacsOBY
         ac8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223457; x=1739828257;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wcfm2torRnSHmFqV9a+s+XnFIKlfVs7U50YSgpk9mKY=;
        b=FpVBqyRmXLXlgeFwShKYTsNf2Ij9au6J06l7q0y8tTm/QdmmnaAyaOOsoO7UMQtNY0
         U9yun57gLaLvWxkg6Vgk0lzTsCKdf3+1W4XDzqzFYmdwgfGhlJGrxS+OIkoWS2Be00re
         920aRrkW9G/5IsDwGVo9EnGV+1kmAbrdNjgyqGasYKzpjE9I/0W7TpBMigSIDC7n+BV8
         l87S0Cc84FoAUdP21K9naUgbspjfRpFszS/JEpb1XSsrnWkl6463sqHZB9X/I2QJVrfo
         XZG3ckdCpB+cOM+uiZ3wTiX+0m+vEs59ez1jmrn/hNpzeHnPUqAuREX83Na3f6IYHJiA
         3s8A==
X-Gm-Message-State: AOJu0YzuHp1eMB7zlHHjAlBHbH5Gyor5bG69olWZkmFSMlTCRsxGIEUC
	3Mq7RNfM+IQA3+IbIpmClnffzjtn6btsGGShxSTM4tWcoqRVivWhxKo83QzwI745E6LoXhHRXDk
	rTpOwyWxcmGbwJbO1diu/JuqptOsLjRvM
X-Gm-Gg: ASbGncspHHRtt4SsKRSd2ntVPx6adzABild0Sw3zA3YY9zCiFeYruY9CKNGs4ulAYis
	5ZCGKeZ+FQ3DCT1KeCMQhDsDl0fWdl/rr79blwiHW9qn5PyV8vQsi30Syqu4PcpVeLf0NlO5VXt
	kT8YQG1M0irH4DzuEq6PBbcvE8qzE8b22yv5CT4rsMOvh+Wxa4dun0F+jtYc+f/jnxVouQfhkY4
	7ADvcKYpmAHh4hC6MkkPXV/Hgwu2Rqr08vJNFKaIQ1ja/a5PBnW+P6iCIhq6X1rTaCC08DHo4J7
	jamrwpsxWN2v5CkbggrznvJFDVgAyPaP
X-Google-Smtp-Source: AGHT+IGn7YjOVgn9JSAaDfX3ZnHdARe93nyXys+vCCF1LaucNZ/41I9JmCGvPgOvWMcZ0mZSnMfQ25GhTucI
X-Received: by 2002:a2e:9e07:0:b0:308:df1e:24c5 with SMTP id 38308e7fff4ca-308df1e2fb0mr32112041fa.9.1739223454517;
        Mon, 10 Feb 2025 13:37:34 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id 38308e7fff4ca-307de2bb0adsm2715111fa.49.2025.02.10.13.37.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Feb 2025 13:37:34 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Mon, 10 Feb 2025 22:37:29 +0100
From: Patrick Wildt <patrick@blueri.se>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] arm64: dts: rockchip: adjust SMMU interrupt type
Message-ID: <Z6pxme2Chmf3d3uK@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133740_167484_B6F6F1C4 
X-CRM114-Status: GOOD (  11.28  )
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

The SMMU architecture requires wired interrupts to be edge triggered,
which does not align with the DT description for the RK3588.  This leads
to interrupt storms, as the SMMU continues to hold the pin high and only
pulls it down for a short amount when issuing an IRQ.  Update the DT
description to be in line with the spec and perceived reality.

Signed-off-by: Patrick Wildt <patrick@blueri.se>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce7..520d0814a4de 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -549,10 +549,10 @@ usb_host2_xhci: usb@fcd00000 {
 	mmu600_pcie: iommu@fc900000 {
 		compatible = "arm,smmu-v3";
 		reg = <0x0 0xfc900000 0x0 0x200000>;
-		interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_SPI 369 IRQ_TYPE_EDGE_RISING 0>,
+			     <GIC_SPI 371 IRQ_TYPE_EDGE_RISING 0>,
+			     <GIC_SPI 374 IRQ_TYPE_EDGE_RISING 0>,
+			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 		#iommu-cells = <1>;
 	};
@@ -560,10 +560,10 @@ mmu600_pcie: iommu@fc900000 {
 	mmu600_php: iommu@fcb00000 {
 		compatible = "arm,smmu-v3";
 		reg = <0x0 0xfcb00000 0x0 0x200000>;
-		interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH 0>,
-			     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupts = <GIC_SPI 381 IRQ_TYPE_EDGE_RISING 0>,
+			     <GIC_SPI 383 IRQ_TYPE_EDGE_RISING 0>,
+			     <GIC_SPI 386 IRQ_TYPE_EDGE_RISING 0>,
+			     <GIC_SPI 379 IRQ_TYPE_EDGE_RISING 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 		#iommu-cells = <1>;
 		status = "disabled";
-- 
2.48.1


