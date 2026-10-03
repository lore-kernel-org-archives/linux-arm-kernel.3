Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07864CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luvk4RSDKwxoXOLtb/naS+7NpP4AkbeMINi5BwnyOQg=; b=rU2vkGz6yni7rMST/c13ZRMc5i
	KBHPTcVsPJ2A+684jqXX9QJdpRfs2iAJYczOksYh/TY1rHpRwn1BZU/D6paoxV3/xrg+Tb6w1quPR
	mqG1zwvuvoEuYFqBCo33beaqG1YGhx4tnEhFbCNI4WtRLr869NDFe8wZQrN8OAX0HGEGzVjlbDZOc
	Tp5D22rnfh4Oy7hQfMAfd6jMBU6Q1WNXHM81enH5YPoVC7/Lx/vgPJVqELY47qCLd8qtYH84hPRcm
	xwvNFibbo0ISZzSxluTTi0PuvDf5pSLji70Mm3ac88OLinTKuElGOPadG4UWuY5JpOyOS1b/Nv/XD
	33zHHGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoX7-0000000Csmi-3Y5E;
	Sat, 03 Oct 2026 01:27:25 +0000
Received: from mail-dy2-f43.google.com ([74.125.229.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCoX6-0000000CslQ-1Mgm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 01:27:25 +0000
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso134084eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 18:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990843; x=1791595643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luvk4RSDKwxoXOLtb/naS+7NpP4AkbeMINi5BwnyOQg=;
        b=1E8u6mfuKDvTPPiZ5NEDPfWS0r+n47WEjrrEZo5wMjs+Bnu34wdAZ+mpWb+bCwrQkJ
         ES7y6c8nbvAYee/T9X9LC+DMkj5Nn5lf2R27fQAGtYMcW0+bdjiF9m6URIOMUJHgea6G
         SMsMlJ5sTs5EeTBdj19FXIvNUwtPvtR8WsWndCrv26jYALtf9z2/60Omq/7tTPKCEjOv
         IBjJFfrhdTL4ED1QQ0iTkofDM4ophFvnLv9GPznFcVWxI4Sa62iJJbc6m+QYb4Mivdtg
         +K3mO/iAC7WLfFqXZiCyYONLudS5IgxeeJXH8SR++8i1R858sycjb3/xeBckw0SOolPg
         h5Sw==
X-Forwarded-Encrypted: i=1; AKwUvBzHTzjFWcyTooQCrRm8nrcjmYr5utH9BPbaGeb3ZYVWR8GDuabNaQcLJRfgP9uN60FChAnp2P5N+W/0jattFAHa@lists.infradead.org
X-Gm-Message-State: AFuF++nP3WAmoxGyPoKejQxR5AgtDvuLda1PPLsujmuw97dFx0yvWrUp
	Rt5atNgus5pGK6/EbEQ3Ba2H3IUTEIrzr9ZNVN8iflyKWxkuYhB9NGmj
X-Gm-Gg: AYBFou0bw0H+Mtx6wtAm6nEUtpWj/gyC/63H6RP9vPqQ8eFLLCirQql4CzoQx4bCTLr
	rAUFJLRD9KDkOi845xr85AvdVErLo5yZC3kloJF1SryRsvsFrZ158k+oon5IT6+gkrshB86tZJl
	5h1iHmDOv3ZKeGTKDDDNaUk9wCFkQir3cfbqYoqtTHgwr05V5dp8pT3p5nOCxuqWykeXimHbYQz
	+cul555iB35ZmkN3Rhmx1XxC6e6q9wncsBkzbPhn6QHzTdhMZMClK1EgMMbcyZXG2mtSWta1gkx
	HrZur/mN9bD3E3+k4aMsNVs/FvIphci2puP0rmc1yufUdUPeP22ps0F+R9ybsK2X26RIrEhtj3P
	6jZxR7IUpZJrDyvsfHEPfhBpT4ZEFcWXaMmyMgIfxKn8Z/M3yXyCAO/QU5xa7NDZs4GIOqnpd+i
	rV/sJAS6LumrfG6uibSeJ2VyKe/2rxLzu5ltI/lydrHG1O17kxAwin62Qf91nU6kSBd4zMcOE2r
	W5kuBB+n/fISBnPprncQTBnlEUKZyQXOeZTlE2zCJWcj1ayEsGExlEkSRBRHkZtYuXlKakYuDVx
	kRjaOGW1Kom32Y/FfeJFuMvP0eogpg0Hl1eVBWhq/xuR
X-Received: by 2002:a05:7022:f51a:b0:151:cba2:effc with SMTP id a92af1059eb24-151cba2f2ffmr1217637c88.30.1790990843319;
        Fri, 02 Oct 2026 18:27:23 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm1116843c88.15.2026.10.02.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:22 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
Date: Fri,  2 Oct 2026 22:25:36 -0300
Message-ID: <20261003012534.418820-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_182724_367933_85B99108 
X-CRM114-Status: GOOD (  14.21  )
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

Without the calibration cell, the THS driver leaves the sensor
calibration registers at their reset value (0x800) and the reported
temperatures drift from the real die temperature by a chip-dependent
offset.

Add the SID node at 0x01c1b000 and wire the thermal sensor to its
factory calibration at eFuse offset 0x40, one 16-bit word for each of
the two sensors.

The R40 user manual gives the size of the thermal sensor key (32 bits)
but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
but that word is zero on all the boards checked. On an A40i running the
Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
eFuse word at 0x40 (0x08780875), which confirms the location.

Tested on two Boardcon EMA40i (A40i) boards: THS_0_1_CDATA now holds
the eFuse word at 0x40 of each chip (0x082d0822 and 0x083d0838) instead
of the reset value 0x08000800.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index f0ed802a9d08e..c7c9cad695ca4 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -485,6 +485,18 @@ ohci1: usb@1c19400 {
 			status = "disabled";
 		};
 
+		sid: efuse@1c1b000 {
+			compatible = "allwinner,sun8i-r40-sid",
+				     "allwinner,sun50i-a64-sid";
+			reg = <0x01c1b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@40 {
+				reg = <0x40 0x4>;
+			};
+		};
+
 		ehci2: usb@1c1c000 {
 			compatible = "allwinner,sun8i-r40-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
@@ -832,7 +844,8 @@ ths: thermal-sensor@1c24c00 {
 			clock-names = "bus", "mod";
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_BUS_THS>;
-			/* TODO: add nvmem-cells for calibration */
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.55.0


