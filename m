Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD3C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RxJ7bJC9fshEg18tC8CqCMJJPORI/U6b98X15Dyh4Vc=; b=KvHxhjjamQufIF3+8sX8dhbZSp
	BHfKv+JRwSBgMzkZ1ILsn0oexrptwx5UEtUEyehd2cR7V1yRasjsGoxZkZKwltViduAyZsYBya38B
	mgymdA8TJDn6p1I9p6jEjETMp0IBth9+NADP2F09QTPXc58C5vmWMZN1e1Ak4PC0xpAbhrivrA4Jq
	zXkIryWsqr4WzDvqyRkNqWffduom312PI+juwlvzzahHuKovElTWGtwuybWUiGQReLy9TwhTwUQsW
	Y7mUZzpsE7Uk+ejes+y+1z1o6kpOdgvPmTEXrdXGWySe94DiBLrPytXGMprMiBOxoMfXDtP0gqCXN
	CiBScfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyHuS-0000000FgtA-3RoI;
	Sun, 23 Aug 2026 23:47:28 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyHuQ-0000000Fgsp-2ijj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 23:47:27 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51c2a818fc4so18954281cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787528845; x=1788133645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxJ7bJC9fshEg18tC8CqCMJJPORI/U6b98X15Dyh4Vc=;
        b=AYG3UL+woWdmvgbjxObhqcptD6b3smnhxeWKHcr8ljjR/6Oa/h8zwwBd220EQbZxhn
         59HuknviImPKM9aMt9kpgJs8EqvPLYOukU5uesw16AKSjucdihHCCrSZdnomdU539o/a
         w5W3Chedxoa/Mo9PkbxaOzx/AMHZ4Qlb8IlT/QOVozLsj5h5yZvv1bG3t1C+WvK44Et4
         U6Eulq09xpFO9USss5GqbadZEl3jh3W11mzt2PBIclaX71sOL3WoNznLBw2k5UPNwQIG
         bDoyMTPWnukyKHQo6JJPpvLHSxQhVErfV3OgqVbI9Y85xO/fWrykxjzb/tepOL8HlBoH
         mfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787528845; x=1788133645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxJ7bJC9fshEg18tC8CqCMJJPORI/U6b98X15Dyh4Vc=;
        b=StD0pFVipmKEq8AguXqd8kDVGObaP8WaUY8w5CEHGqR0vb+XE3Wx6nTMjqp1vC3TqE
         PiDZEz0L5DMvlpdygI0ilYkIk1f0jwgSmuKFLoNdMrLcMEqGQCCW9qcdqMVfBesAXNWb
         mGToyk77m1nMjZI7I3uzUeB009nw5PmoRbiQLA5d2iqveIKiXWXNd00voDaUW+5W+xsJ
         +fcWC16Ano9CWyR7Z3T/XDKheqLnmAQOUMV6hhVGBbzDW4v7Xg2tcLcVffivZCe1LoHM
         mcRKPL4zoIyWkJdr42cUszuP0nSfBmbu16DLTn4WBJVBzYrqTOab+FH+xSopoKh9FZYZ
         yBBg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7L/YzRRtjzmkWvA8q4s32d2klfVz6N6gpCErDCQrKN4UB7/yi2qudl+ZUSxPbrq8Pkny/C5mVglu4oqc7k71v@lists.infradead.org
X-Gm-Message-State: AFuF++nlsr6YJeOZL1lSpkrnVjm0zFFby3Gt21hb2IP17vNlWAtT3pjJ
	rs2HZL3rG0q+WfuDkPE9KZHX5WruZ83GzAlbyyiu1LLXZse1plTKnrGB
X-Gm-Gg: AR+sD12QfGinWBX8kN9GY++u7A61N7f61KXtvmuql/fOcMnSTM9Z56F5nQUfp+3OhkP
	UO1hrr62u0uI4rDKMdx//4KFnhhN/c7nLhw+GnDkl3j6/hte7bw/FmcXAXEJiUudaI6Gb0t4cTY
	nTkXlAalzVHKFtiY9yCvOr0IQUuSkjl+92IkPIKr+lgTU/BY6TGHfaKw4UtSpauH8NqRa5FaAKO
	DGJFOuhK+PpqR3PtTIglgDPyur/+BKI/w73x6LLCq/+5ta1oulSQ4/kwOg32dVboIMbpnw6IkQB
	cgYTu5MkODyi36ze6oIMqSLPJyaeZ3lpY3EABcnCZTBlkPC7+pzkNzNE01tHih6kSaHFA3g2qSA
	XBC9J3oKvAUFZHoJHc/5IY5Zmk+OGd+D1Td0PXcdtB6GyDkysAluAUssymdk3tZR9FwyPQEezaO
	O/lKkEB1p7XnvM1o9ChKAbkRYZKBZrrzf4pOB2H9W07W73zwZZy+iuCDfA2uM25adPJsM/NJRB0
	0cpTV+7ZQU5TicwIIf4/1elVbElwAHKuR/at5jKoVRbhL8OtZ4g5fUwKHUGB0NyuDaGj4topvVK
	CLI+9gzbT+uoC1hJzv+jxGEp5s4e1mWzOXiRKg==
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr153613501cf.1.1787528845452;
        Sun, 23 Aug 2026 16:47:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aad030sm36778851cf.15.2026.08.23.16.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:47:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: add missing SDHCI clock-names
Date: Sun, 23 Aug 2026 16:47:21 -0700
Message-ID: <20260823234721.72903-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_164726_719426_A2CBDE04 
X-CRM114-Status: GOOD (  10.77  )
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

The marvell,armada-380-sdhci binding requires "clock-names", and
the sdhci-pxav3 driver requests its io clock by name before falling
back to an unnamed lookup. Both Armada 38x and 39x nodes only carry
an unnamed clocks reference, so dtbs_check reports "'clock-names'
is a required property" on every board.

Add clock-names = "io" to both nodes. No functional change: the
driver already obtains the clock through its fallback.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
 arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dts/marvell/armada-38x.dtsi
index 1155bee20523..598022645dd2 100644
--- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
@@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dts/marvell/armada-39x.dtsi
index 218fcf99ae07..81dd4ca5fbc9 100644
--- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
@@ -381,6 +381,7 @@ mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
-- 
2.55.0


