Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE13D41C1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyNqt8aPo2Io7Ip5TdGcstns/qt+WdL0+YE07BawOc4=; b=mdrxQy+mOhV3DWyzhEOItasfKY
	0OFGdV16cpTMuIdGIcFuJCtLSWBCBaSBGRxxeCTzC7uFpK8qPR3QL1i1f6OAZ3mtAVHF+OLOMFuoA
	vjIJ1qtQAtwb/bLIcnIdhe2HLRhEt4wdqgd2nxlrSAJmvNF9yJKM8TA/vvxXViiEEWMJsKEClPqdn
	4xOICvShuI6Br+ntZnC+VPm6mlFM2nGf0Zd+liLrrBI2GS25rjXUd81Qgcul/b3xVpGJuC9qzp/ON
	gDpLoJqUZLvNoq/9PGn58D5vM5Vr44uuw294BJsh3hsVWjiP66mSufzxmBOi9l/oLGq/l7ivfug3/
	Q/fNdG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9XC-00000006Djj-1UNr;
	Wed, 13 Nov 2024 09:19:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Tf-00000006DGy-2gCV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 09:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731489354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyNqt8aPo2Io7Ip5TdGcstns/qt+WdL0+YE07BawOc4=;
	b=Mb4v2H+GLDeONOS9bgAx6WbdP4WKZLvYZWrZi3ckm4ZD/yvtHYbrWwrTvbEQrPYH5wIBqd
	p4Idr0WOXPtUKOEc1hjI8QRcSj411NSTd4pCf83Y0R5IIXQmS3dJslLywjNWkL00z9ZU/z
	cAqDNPlvVt+ZWsTqdWKYFoL+4Md7YM0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-K1fI580MNEKagzUA5R1Lbg-1; Wed, 13 Nov 2024 04:15:53 -0500
X-MC-Unique: K1fI580MNEKagzUA5R1Lbg-1
X-Mimecast-MFC-AGG-ID: K1fI580MNEKagzUA5R1Lbg
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso12326856d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 01:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731489353; x=1732094153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyNqt8aPo2Io7Ip5TdGcstns/qt+WdL0+YE07BawOc4=;
        b=lfQy1dlOaOKYp9uSfL7NG4ybaFBq4hbFdiAwuiKlbuC9kPrkb13i9LMaDBhK3Y+k3H
         wJktmDYUiiwqZlpG1YXUchPNnmwjAEn6xpE2TpUZmulQVPw/x+9TlLHrnt31M4XyiiHN
         csYVPwMMaO7P4fqcic1N2vT+Q3IdlA0caESRjwz+p6xB1v4ULnqChL8/ZOLhdH8W4z+3
         +O2G0lNVOemsnaDbE75HP+IR32DtuCPjisfhpn3P6htiQ0i3X8GchY1BcBgLTXl4rxUx
         f+VE/NkaENUtv6UOQt6xF/gtfoUXkhADOeFM0MPJMtMxW0PgYvW+8kJJgeyqHtycXZLX
         IgmA==
X-Gm-Message-State: AOJu0YyK7sAFEAeEFAzd1OnbV+LH0gLMODsvmiqIpBJXj0dtn0zNzqaE
	TRiRI2NlrtuoM2cYacRtCPBV7vUqM+yRDS+Eppdkrr9Cr2aDeynuoopFkS6FV2CflzG+W/sRM67
	SMNq/Zx3ZzKpxYfnNMo/l7ckTkK8MvBQo9PVfmbtOeWQSDsBaYlcyCq0s4WyhdMQnVtv382UU
X-Received: by 2002:a05:620a:404f:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7b331df0cd1mr1219904985a.9.1731489352951;
        Wed, 13 Nov 2024 01:15:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkuPuScKyX1T0vb8WeWnUb4ONV21XD7R/UenhQXM1utQhCNEWNP/QDFPKxTWLzfl34ulnQhw==
X-Received: by 2002:a05:620a:404f:b0:7a9:b8d1:a26 with SMTP id af79cd13be357-7b331df0cd1mr1219903485a.9.1731489352654;
        Wed, 13 Nov 2024 01:15:52 -0800 (PST)
Received: from [192.168.1.51] (207.red-83-46-1.dynamicip.rima-tde.net. [83.46.1.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396630ec5sm81599036d6.101.2024.11.13.01.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 01:15:52 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 13 Nov 2024 10:15:16 +0100
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-j784s4-evm: Mark tps659413
 regulators as bootph-all
MIME-Version: 1.0
Message-Id: <20241113-b4-j784s4-tps6594-bootph-v4-1-102ddaa1bdc6@redhat.com>
References: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
In-Reply-To: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andrew Halaney <ajhalaney@gmail.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>, Udit Kumar <u-kumar1@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731489348; l=2439;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=Dvhi3Gt7Odo9dVXHx7VXzmWoekxBbFFnYwVuOOdgAag=;
 b=u69OhYHAzlTos20kPrIxKDwCWikOwk4pgl65Cud8E94VrWsbqzR4VbDSPWk9lhAczuiK2m35e
 j5ds+lco+bZA+H07LMDdKMIYzyBmJVuL2VQYmguFPBJbUlZBRKU/ImR
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NNZrSj2zCOk43MXb8IlyMnXR1Xtf-w3aE6Arq3afj1Y_1731489353
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011555_792076_5CA0D8C8 
X-CRM114-Status: GOOD (  11.66  )
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

From: Andrew Halaney <ahalaney@redhat.com>

In order for the MCU domain to access this PMIC, a regulator
needs to be marked appropriately otherwise it is not seen by SPL and
therefore not configured.

This is necessary if the MCU domain is to program the TPS6594 MCU ESM
state machine, which is required to wire up the watchdog in a manner
that will reset the board.

Tested-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index b2e2b9f507a9828d49b1eb94d098b2c6682cef0e..2664f74a9c7a4dbf6625f12fe52ba4b57d5636c0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -635,6 +635,7 @@ bucka12: buck12 {
 				regulator-max-microvolt = <1100000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka3: buck3 {
@@ -643,6 +644,7 @@ bucka3: buck3 {
 				regulator-max-microvolt = <850000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka4: buck4 {
@@ -651,6 +653,7 @@ bucka4: buck4 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			bucka5: buck5 {
@@ -659,6 +662,7 @@ bucka5: buck5 {
 				regulator-max-microvolt = <850000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa1: ldo1 {
@@ -667,6 +671,7 @@ ldoa1: ldo1 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa2: ldo2 {
@@ -675,6 +680,7 @@ ldoa2: ldo2 {
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa3: ldo3 {
@@ -683,6 +689,7 @@ ldoa3: ldo3 {
 				regulator-max-microvolt = <800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldoa4: ldo4 {
@@ -691,6 +698,7 @@ ldoa4: ldo4 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 		};
 	};

-- 
2.47.0


