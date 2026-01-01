Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F707EEB57C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R7Le6o7LyefQQtq81DgJOKcydK8/GDjnFJ/VQXismo=; b=O7I5v/OeR66T02LHXQ2iKPwiqA
	7pg3kq9W9De1yeA8OuKswN8eqoYtOwzeSUCE5EdzKPvXxksAdNPuociRxvc47v33fXnvCyp7c35Yd
	ck3Uw4HXMGCEdCh/W1xat3vAqyP+0nDKRmxEQuzSR2My036CimxpzKfgsbGo3XzV7BY+Rvf9ZY4Pe
	o8wnVPxGrORgrkgLeVccCbzmL1o65DaCvgjzIn71uV6mkA3Qo5O0IGZWRjOMAsMIOMq41FINV2Psq
	O9AnNrq1K9z07z372O/9LtMdujT///UKtScZEeWma5H7+vAsotPeJMraiG4AqwfHcZV6r2Ru5kkSv
	fdE0+mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bC-00000006Ypz-2cNc;
	Thu, 01 Jan 2026 03:43:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9b3-00000006YnS-01oo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a09757004cso143686125ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239012; x=1767843812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R7Le6o7LyefQQtq81DgJOKcydK8/GDjnFJ/VQXismo=;
        b=Limq1+6429OJYTQF1bQLka+BFa+tedfXSw+tFeH72UHB3kBygYNok0ND7vOhWy/F6j
         NTOfswoHlX+U5X9U1zo07y9S1LLFFkllR5IzPU5UqOcDTRbKoFOW8uq9qsdH135JdNfV
         272HbI6DMAsv4KbLR67fWzW/DwVE83C8AYSTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239012; x=1767843812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3R7Le6o7LyefQQtq81DgJOKcydK8/GDjnFJ/VQXismo=;
        b=oM5Hk6TqBdfxJshzuXwNLvPhxYZMIB+10YoN11bNeVxeJ4eVsYzXjaGjRvGZKgL5ky
         9c6x0AltXsmhSaFjte/nG64pIHGNdOEe1wRc/dYSPuSMEyRQ1SKMjbsFWRoPH/R3CXht
         YD5pL9eXAc0C/yLbO73abMiLmM6OU0EpheEIxjbwoZL/QFqTqknIXX5zBGbwKXDeSiIR
         ywUrl4k+6gb8eeLroJT9HYzds5w08dGt1LLYIUXT8d6FSEWYC6K2o3Is5u76xZJupUHP
         HmJSP+cdeyG7vePczXCRIQjaEFeUa1o7Wn+ALu+RfpzJpLHDxpFQsGCuUppv+LtDdsTa
         X1yA==
X-Forwarded-Encrypted: i=1; AJvYcCWTxF6FE/LXakWND6DghPoER52k6ql7JHIczZ50CTN0VsnZahPbPAaq4QRuGq3azXNQUMxYvSYwkgt/hClhBiV9@lists.infradead.org
X-Gm-Message-State: AOJu0YxewqPXhT5YI3E+6/oqJkz0fPdfvs2AN4ctWN9DyRIGCs1oiDCg
	uH0SUfwYYn2DQt/eLnkpNsn3KPVjNIWQTyy2/LFx62kcU5UlzglTX6EJqBx6Pg5qxfc=
X-Gm-Gg: AY/fxX6fSIND1dyO93xA4OZ/LhkfnbFOOwNcmuIsjBkTo7OIy/0HfD+8Fd2I0cqcDqu
	kqKs+O8oT5zpHGxYwd7x4V8hZYkrBx7Mz5KgZvZKXAZ5JFS3Jw3iDny52MKDlpLQ5JmKbVOngcL
	4HuaGsz/nb3uDfsDt3Kko3gL41VPCVE5Wi6im0EktQr9C+4IdJILNdeNUBci7689RSUIcFePcHT
	RHvxZoOKP4LyoZQCTNIomvpX2LVpJVFr7SOeYnjQWXxQ5dzisfZQtbyVsfL0ebmh/5hf7x40bf2
	BfY+fZaq7z0NpJ3aNUtjLSOswgsfw9/KDFhSWAmtmUg4lhNG05qpih0CqveLZNF92d7sH/odgrB
	mPOngV0B70pOrVwL7YRLqutdRCS/qIqdz7hWI4YeMGQxg/2ZwtOToWOLajqswLMJUExPuYgfrRv
	26ZdTm7zgIo3dzK3zWtm517rg1RBL4q6v09iFsdTNY2PivRYtGJIoh
X-Google-Smtp-Source: AGHT+IFTcMjqbQo6r79oHp3sjUI0kyb5M5mVknZJSBm6b6l4a5CPZBWI/hK37CSIEBUg2VwCq7BKNQ==
X-Received: by 2002:a17:903:4b27:b0:2a0:c1be:f436 with SMTP id d9443c01a7336-2a2f2c5eacdmr379675025ad.59.1767239012235;
        Wed, 31 Dec 2025 19:43:32 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:31 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 2/8] arm: dts: mstar: breadbee: Correct regulator names
Date: Thu,  1 Jan 2026 12:43:00 +0900
Message-ID: <20260101034306.1233091-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194333_046230_8150978E 
X-CRM114-Status: GOOD (  12.58  )
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

The regulator names had a "@<n>" in them so the dt validation
stuff wanted a reg property. Fix the names to match what the regulator
is for and remove the "@<n>" bit.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
index 507ff2fba837..99f5a5603dc7 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity-breadbee-common.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	vcc_core: fixedregulator@0 {
+	vcc_core: regulator-core {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_core";
 		regulator-min-microvolt = <1000000>;
@@ -15,7 +15,7 @@ vcc_core: fixedregulator@0 {
 		regulator-boot-on;
 	};
 
-	vcc_dram: fixedregulator@1 {
+	vcc_dram: regulator-dram {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_dram";
 		regulator-min-microvolt = <1800000>;
@@ -23,7 +23,7 @@ vcc_dram: fixedregulator@1 {
 		regulator-boot-on;
 	};
 
-	vcc_io: fixedregulator@2 {
+	vcc_io: regulator-io {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_io";
 		regulator-min-microvolt = <3300000>;
-- 
2.51.0


