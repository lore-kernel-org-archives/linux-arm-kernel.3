Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BB2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMSY6dG/6BzfHIX/azlkSk4yjSAWJxyQKbMeQY5ofVg=; b=y6oCIZkUvZtl48kgGXA+CM9X+v
	Ke8f09FSKz+QG984V1HYEyIGjsV4PtFKunU0q+XDNgumT8zYxPWS6p3Pbm17ieCHjSl32J3dFCRuv
	iqQy8RD/ncg8qozR44aVpx5D0W+e/nnBhB7ZMmmDhZnm04MWrlQF0Gu8/H68lfSRbnCxuIS7cTPD3
	3CBAtNRUi+R4ryUOqsEtpF3E+SVP6AWuWsUy9Ufhas2oN94nw72Lm2klsyLTrx0jehgMlDWXPHjvf
	o44WwJS9mMoBQfyP8QfFdxdmzbVMELYspBkbv7dC2zLq/C3kNzKiixHkyQS+t+59LuQBcDH4Iof74
	Axvkd8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUl-0000000DTX8-00me;
	Sun, 28 Jun 2026 23:00:59 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUc-0000000DTUP-0MLx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:00:51 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-139b914bab6so3656476c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687649; x=1783292449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMSY6dG/6BzfHIX/azlkSk4yjSAWJxyQKbMeQY5ofVg=;
        b=bvtFLKjZRYTdakGjheP9L+m3OVWB+fwNm4F231ghp6USOJJWmM4bwmDjq9UUrwYm8v
         X4k4p4ofryVssmNw4cNjYEVdBJLuQrpu5whbY17++j1iE7iy74rnOJaVIsI7Sb6NzkPC
         6sfCVbHj3PFqSqGAzZPEbRh1n2xYbjWEQiBCWFoS3sI8IzS/ubINMZMugZdbGX6ocmBZ
         lTJUdT8ak3SWSnFucOdDfXoedZmHfC463Vj1+IGESzAyK9hlwL73u5Ls/B48iexPtl8p
         BisM9bLH/LzSUNHc26qKH4XCCXPI3oaDSm7bR06nu0byENZ4aEFs9z2phiTfz4F/vUox
         VqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687649; x=1783292449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DMSY6dG/6BzfHIX/azlkSk4yjSAWJxyQKbMeQY5ofVg=;
        b=PTAV17BWFPS3kM537b92n+Y3iGAqt3WyJYgXKFJQi5NdHYBeZwWPRtw4WJsVCR7WWr
         I78Cntz9vP81+z6QpEuOXLVdlBFs7sObfkEo4dvW91lwmUT7+UFVznR5W0P+FSJTkh/l
         +E58u4G0Aebgrh8wCBLzF6UJu7G7cYfHt7uZ0I5WwdPPNRSj2S/Of5W3MPoTO1wVmGT4
         u4A2T0dMDRIRKvyGL0O/9hqfgxghW27PywjLvLMeGpiG8WnekdW4upB0FaibBQtmUJK5
         okNmg8rfRSMUCXZRFSn9oWomKEln32PL/GidHnPKntHQ6SjUs+iA7NNAa4iRSZuyAqgq
         L75g==
X-Forwarded-Encrypted: i=1; AFNElJ+HlzYeZoTYeUAt2mbrVcaFRs4Hd8O4sYRUrFPJY1VOxNOYDGA+LWJ81k0duLZhVoLGhOYZM8kvJ/GHNXg8DB1h@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuaw0kL/4VF5qcKw3JXRXp8dbZJeILIuUYfjZ4gXmN4VB5qFrW
	CJ4r0SpyP34+SSeILzyR3l4/ryhdkVjyxqYbNfaU59+XqfvUqVxzNl3CyIayxg==
X-Gm-Gg: AfdE7ck3Yl2cFgh2efEoWsuDOM8UwuC1K9J/Rsc8tA4NMhubOVSqxIzUmtGoPTWsDbe
	IUg/+hp2JGJ6VKlKlwGcTiaR/9uQbso6BXlegLCvwGDdLXc3pPG8SuyFySpft5OZbMg2Blmnb4v
	HiTcy8xN/3ySANUiaGrrSG6eHIam+moocWlxGZrLqeTXG1Hs5xVRM6+wUPiGuHjj9uQCqTTjL4a
	dhVRmLLa674cu9bMbyLw3d4BZ3HIYRRdUOR77sY6hKpYDx8z6NDJcfd2WNvjapgBQK88uRwXmLd
	ie1KqvjA0XH7RtIDrIC7RgkP6YCYVf0QMDoiSTt2XIKi19A9yktBLIreD2zhX7Vy9rVG4S8+2fB
	UIbEeloOX+ChiB8FasR/QnZIkHDmAcdsrYoZ7mNEasfozMFmLruJ0PaEQFJU/Oyx/JUuOX6FLuq
	C+OTtVJdQ9gqP/sxDVspel1qP2qHxYrMYPjmQfwNrtZ0cZ6Ch4mb4FeYkH2szO9Yy39ozPpoRfP
	seGilQtVA==
X-Received: by 2002:a05:7022:e98e:b0:138:1569:6f1 with SMTP id a92af1059eb24-139dbb2ab73mr12512388c88.11.1782687649350;
        Sun, 28 Jun 2026 16:00:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] ARM: dts: helios4: add SATA regulator supplies
Date: Sun, 28 Jun 2026 16:00:41 -0700
Message-ID: <20260628230042.1204293-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628230042.1204293-1-rosenp@gmail.com>
References: <20260628230042.1204293-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160050_128267_F868BB10 
X-CRM114-Status: GOOD (  10.89  )
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

The ahci-mvebu driver and libahci_platform request three supplies
on SATA controller and port nodes:
  - ahci-supply  (controller power)
  - phy-supply   (PHY power)
  - target-supply (disk power per port)

Without them the regulator core prints notices at boot, e.g.:
  supply ahci not found, using dummy regulator
  supply phy not found, using dummy regulator
  supply target not found, using dummy regulator

The SATA controller and PHY inside the Armada 388 SoC are powered
by the 3.3V I/O rail; the four disk bays are powered by the 5V HDD
rail.  Wire the existing fixed regulators accordingly.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index cf0432a0e71a..626a7339a5d0 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -222,13 +222,17 @@ sata@a8000 {
 				status = "okay";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				ahci-supply = <&reg_3p3v>;
+				phy-supply = <&reg_3p3v>;
 
 				sata0: sata-port@0 {
 					reg = <0>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 
 				sata1: sata-port@1 {
 					reg = <1>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 			};
 
@@ -236,13 +240,17 @@ sata@e0000 {
 				status = "okay";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				ahci-supply = <&reg_3p3v>;
+				phy-supply = <&reg_3p3v>;
 
 				sata2: sata-port@0 {
 					reg = <0>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 
 				sata3: sata-port@1 {
 					reg = <1>;
+					target-supply = <&reg_5p0v_hdd>;
 				};
 			};
 
-- 
2.54.0


