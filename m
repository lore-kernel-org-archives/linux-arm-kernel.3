Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=; b=zzzVWrziKDSlWv7S/RFJs8cOfv
	RmkEQTeDj1ifam3ozumQpWOSC8Bsaaaxfpsm134xIDQF0w63pR7mCVcKX0Pj+xIpo95hizLBZgDLd
	zPLXeOt1K5WVb6vAYKNH/M0TDLTBME0qMhew0VGYtNl0d5yuc5Lcy/WiTui1t9zw6oNZOBj6Qh1y2
	BO+c1zXG372zbyOsnMMiHsRor6CEA7Nlyg3iy5Ayp/3Pc5T1pkBofvcvYWKsg81QLicLUaGc7ohcY
	tZp2TVsrmHvWxTbMEW8iqQ/DnNz9g3XEQ1888H6jSYC592l8Anr1RAmGm5fMGFdZ8WqE8O98UFhrr
	iG/d7F6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdt-0000000B2tM-0THs;
	Tue, 14 Jul 2026 06:29:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdl-0000000B2k5-2pGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:29:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c7c61b5292so8516815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010553; x=1784615353; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=;
        b=h9NzPzNk7Bd+y0cu3KwOEI3dquPFYEgzqqHFQC1qiwxHKWGSsed0fZ1g6geSbsLsCr
         rZnFdgrM/3RChL8byOaOQmIquJQH9abSiIfG7MyoXrv+SKbUhITy8rkgHvVKz/A951wZ
         4Up9RsRHN4Bu7HXapxZETheipaZrljtxjo/c9oE+Z63GRhW0rZUS2SWX2PtKxDcS63c4
         CTQldrYqhH9R7/BTd5Ngz3oX872YjlMekMJFWYC+EBdMgFUohVGvA1FVqfGfX/ymE5C+
         C4rz91ayloDngNS0l0vnQx0jtM8CaXfoQQF2PCEPR7kj6BRPshZocTg+TAZNXLBuBzxU
         Eb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010553; x=1784615353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=;
        b=N1f93QE2cxwqn24JE2j6CZKrCoCnCAP6HjMwkCBp/j9995WD02jQtJ/NRIpgRuAQxI
         2+DVZkLj8NePlgCanCIQayn5bnMBHpegsVvbZKzRSVZZRISgclQQkBhyJRK4GHVnxyL1
         LY0IRkAW91hX28Yu0XG0Wdxl4j/ukzCHx0BlA1bnV0pZojrxizWuK8GZRh1FXTnlBC7E
         jWLb8wKgxuigKCReJpivRlLpoOuGKhWknp9+3UTV3akqikH8kCzR9IV0obEJuztEqrx0
         /Xc4aRqrACtTpxjfJhEUjmMMDMpLkRNqAoUEvBMF0nHM4D24GJxRbfdY0lDxa30Al7ab
         z51w==
X-Forwarded-Encrypted: i=1; AHgh+RqOxrplEFhIpiIMtPlT6flR/OccScHwf9jjL4lzO0vaUWZI6gfkB7genn95+jvf3rcnVFYghAtoO4KZCjiafHZs@lists.infradead.org
X-Gm-Message-State: AOJu0YyKj+C8SnXTehATG3CqkPgsEN1QkXnL7upfkbboXT/8l01m9+Pq
	5nutu3/wL5AbTUP8B+nPWUBNpJQmJatYr2Tw6OH2Q38WmrtHjRqmWzTW
X-Gm-Gg: AfdE7cmZUwynhrLDj5Ngx2YrOO1Lhw+CjbVMr11bg71E/2ec3FONVn1zYTGgn9kGWe+
	ltkxgigkS4+otR1fE/cGNmoR7ONN/i8VmXdL9CoNr+gX1FDLJkmr6ICB/UDy8/aJVzjh59KK2rc
	zXBIepUiPhRgdYjz3P8nP2G/Dx9njoxsvVACTRVJubWZRYF6Bscdhm9KA7WewVSK6NJ8QBd006z
	tRDoMdRN6w7cwgXIOG0JAQwSrJfB4sS8zjBVX43lpH6Lo025uAkCOwfYEv11+1EL95TTf3tM+Sj
	Fe89qKrWS2Xtg1wBFjq20BVp4hmEp71tR10JYb+JaqLnHapigHmEjoAZ1qYo7nxxRg8L+3djp2O
	G8xP5YF0yjup9HvRFH4Uf+9v1p0wCwTgx5BlojHkLVImcAvCbt3W86LyA13X8iSbgptkgIu6YTK
	9f2x4gxnDVeMAfIcdNddkOmx8lynnXAvI0vT27XpbHmwLvicxojQEjPiOLvkDpB2LRG1QtIIoBR
	N/yKGBZEduQ7frCW44fknpFG1BxzGfXno0ybgYCmjW0HpSqRl4FDSc9UCcnqELj
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr125013935ad.1.1784010552958;
        Mon, 13 Jul 2026 23:29:12 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:19 +1000
Subject: [PATCH v2 12/12] arm64: dts: apple: t60xx: jxxx: Add
 device-specific SMC hwmon sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-12-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cPhUEwaWC4vFg+vWUv3YAUV9bYjnh8Y5E9GoO7RBxkE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnnR1SwsOTv9eNQ3bE66PE5DjtG/yOLj7VfcsmLO
 cbxv3xHx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrldjH80yzWPOwV2XW/ap3i9sV/e+798Dn1aptA26qa2r/cEh7ZXAz/jINkVvd
 eP3tJW8Us3FL5ktTfJ9lz/lhN9pKTXen746g6GwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232913_726101_F17B350F 
X-CRM114-Status: UNSURE (   9.41  )
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

Add the device-specific hwmon sensors for select T60xx-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index a2a24d028cbb..e6eb6b6c386d 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,8 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 
 /delete-node/ &dwc3_2_dart_0_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..caded1636f3d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -367,3 +367,5 @@ &atcphy3 {
 };
 
 #include "spi1-nvram.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index 7c7ad5b8ad18..e3c2635d84fa 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -45,3 +45,5 @@ &pcie0 {
 			<0x200 &pcie0_dart_2 1 1>,
 			<0x300 &pcie0_dart_3 1 1>;
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 533e35774874..9fe17f1f7f59 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -35,3 +35,5 @@ &port01 {
 &pcie0_dart_1 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 31f24bbda968..32938a3bf96a 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -44,6 +44,8 @@ &typec5 {
 	label = "USB-C Front Left";
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 /delete-node/ &dwc3_2_dart_0_die1;
 /delete-node/ &dwc3_2_dart_1_die1;

-- 
2.55.0


