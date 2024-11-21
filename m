Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34246D75BCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFNrZw48YC7Nd4NK6Qt7/KlvAITIs4SoN8m0X5EQI9c=; b=sBD+pAexk+BZAkJT7FQME3WqAn
	xOh02+OEdbWmXvBl3SuzXtHiBpezRGAyGbx2GMk3fwNZPkXYqAvvDH4C8yRUTSWZUrJfh4OA5Agb/
	iwC7z9hraqTpz2NhcwXQwQSZfyeUpEYxwPt8OU3kzymwA86K3s4tTW5A2KzU3+rrxTM3v01dTTRZN
	OGuwqR7f+Z7hKpmWsxA8Cv7Pm3xpeo7RIS/4yp4Cp0I+W+5M6JfhOVtKy1plu80/X7gNIRINl61nk
	CKQHl2dldKam/zwKJ5x3EG2tqAKsH0NuV2cFegIrLEjzam7xTF7HFG+NTbkDG1+49gLzBIrZbat/8
	OoK6S0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1Oa-0000000GzB8-05wi;
	Thu, 21 Nov 2024 07:14:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1Na-0000000Gz41-2qCh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 07:13:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-212583bd467so4998555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1732173209; x=1732778009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFNrZw48YC7Nd4NK6Qt7/KlvAITIs4SoN8m0X5EQI9c=;
        b=wMJvVYr08KwY24lEUIYYU99eQHkB3hJmPbijm1oRfMZD7IlBIfER8/P8SYz0OSMgbN
         vtmxtdd54NPb8WhFlQjpTtumyQt8b0fDn9X47HudINxc8vipQ7ANXLSkxBvVA3UzfQ/U
         JcHegriJ5G+F2+vDYUq0aMRPqJUgDX76I7CXeFjZpyN6oYp9855sTFOxkDxIU3x/d4Vv
         8toWxABVi2VLYvcSe6dGq7wkUh0Oy7U37Y7A1e+bNjGx66J7Az3TvzYaYvpOuvTV05eJ
         dCGIFXhjuMgCixxBv07jAfm0xELvMipM7l/vi0Vbe1Kj9gOBVMo8TyA+cxQIaAZTfvNi
         6QLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732173209; x=1732778009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFNrZw48YC7Nd4NK6Qt7/KlvAITIs4SoN8m0X5EQI9c=;
        b=bYex+4GsA0ljI58404cemrnd0Ygld12So+Bs3UabadHvlilEwMl2tLQlCOrqlNgxO0
         BbrcQngVuuJc4YSBY4s8AEldvbkihVF0bLi1WREXz3P5/xtcgNfTZl9eNf8MIUdy5IES
         c19kScbMbSElJWrVyAhdRnhRvFnBDcbxYa9jYxBTgNPnnuMyg9cBKlRbSTRl7XjehpkO
         jefPIs76L1+SiH7eUdt7HaDIIunk0+ZjrQ8r+B57h7Mu78PtFAmbCXhF6khOc4blWD2G
         y47U8x+TtJ5cyqW1v83eqx3/DTfeTOJhqBEOaQH27gn7yKLxwicIM9p5yko8NJqYV8Xj
         q1KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqNM82dWj/PqiJPXFWaWznb7LEvlv2KULyZ4BG6zLeqSYn21ME9KCNQg4MWM4tIgcyl47XM+ect+Vklq+ko4hd@lists.infradead.org
X-Gm-Message-State: AOJu0YzzMik7a5580l2uyGlrS61u5DRvPrWwqGJX/gSt1fYbtyWwRsE8
	eJrcK+y8wewZfiTm/ZmEVbR2Kz2jMK2VoZvxqYU3PTxriWIOhuhvHxlCZ7QA
X-Gm-Gg: ASbGncv4E9WpCpd+6oxBK4ZTjpKyB8boC19iYvRWQtFc/SqqnCnfibYkRrsmOPh4NN7
	HSZ3J3mm2s11DaUKBt/T2lbey6NsN4NA6/WFxPcOinzy+mxAyYekQtBLD/K9kGtuPFC6uj6S2iK
	H6kBGmMIW1oNRZ+1FimCxohL9bXkdbvONyTGy9be1sVf1jzkMRBJVIE+CP5MFvYwyHooj+VcUL9
	rZ1vK7AYu0aFv25V1fYuUsSThEeJl/+hTytGCU0ip8xds4YdUw=
X-Google-Smtp-Source: AGHT+IGLelbtxaQE3NcbOHx4mUq3l9XVdB1+aGkET78P0R+07B/6hdLZ5zog+84Wtv0TlE5OHYP81g==
X-Received: by 2002:a17:902:f707:b0:20c:5b80:930f with SMTP id d9443c01a7336-2126c0b946bmr72891265ad.12.1732173209619;
        Wed, 20 Nov 2024 23:13:29 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:b535:6545:798f:8db5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883fee10sm6709725ad.264.2024.11.20.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 23:13:29 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: dinguyen@kernel.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v2] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address
Date: Thu, 21 Nov 2024 16:13:25 +0900
Message-ID: <20241121071325.2148854-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_231330_986322_6C636224 
X-CRM114-Status: GOOD (  12.31  )
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

On SoCFPGA/Sodia board, mdio bus cannot be probed, so the PHY cannot be
found and the network device does not work.

```
stmmaceth ff702000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
```

To probe the mdio bus, add "snps,dwmac-mdio" as compatible string of the
mdio bus. Also the PHY address connected to this board is 4. Therefore,
change to 4.

Cc: stable@vger.kernel.org # 6.3+
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 v2: Update commit message from 'ID' to 'address'.
     Drop Fixes tag, because that commit is not the cause.

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
index ce0d6514eeb571..e4794ccb8e413f 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
@@ -66,8 +66,10 @@ &gmac1 {
 	mdio0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		phy0: ethernet-phy@0 {
-			reg = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@4 {
+			reg = <4>;
 			rxd0-skew-ps = <0>;
 			rxd1-skew-ps = <0>;
 			rxd2-skew-ps = <0>;
-- 
2.45.2


