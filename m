Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D45D6406C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAvaRpzOSVNKUVUd3z7yZ4rULdWPUD/lWxZmIty2N/Y=; b=DPfJeJt4V6fCsZ+7Hy839iZAOa
	652UArbORKMVDMUg0DpoDfzGSAS7/C+FRzS+YMB5yRZnGk6MsSyRExDdOutW8oIP2q4sMZpNjOUBf
	o1npb7BYG/zpNONYG+DDYEFT/QIK2EdPPJWtTmlidtJhGcmgDAN/VnZlVTkfBjEo5bKDmxV5BSs5X
	6/tHt9Z8PFWvnaVurQqo6Dv3SgWhkAUtPgBZcxa0A5JRHZmAF8+1QaB4k1OnfY98YA67YGxdmur+Y
	MScojl5olvP7HvPTlx0mILtCeeCrpShqOkY/LFGbeBQJb9RIDvB5fDH6BItUb5Wbn4pmlCJLFg0b5
	mtOqzW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUm-000000064MG-3vWf;
	Wed, 17 Dec 2025 02:42:32 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUf-000000064I9-09Dm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:42:28 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so4990510b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939344; x=1766544144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAvaRpzOSVNKUVUd3z7yZ4rULdWPUD/lWxZmIty2N/Y=;
        b=IgBvrB5LrlstUIUfHdFwJxdfm8kgXtqF6g5KeH9o8y/BCnrSahn+yF3fB1kEVhS+ca
         xg64UvR9f31E/lk2jkCb7SpjxLnqGRCb/auQc7nAA35mLOCzF9ip9Uug7HIXTtDcnUn9
         xDp6qlJoWr1ssW3US/yp27BZvT2OPTvLIWtLG2IkmmBF1QuLs3586991glELpDUtHQJN
         8dIx5VvrOrqXrqHX8IlMdSOLr541loNVwoLsSvKK8QQ3uU8xyvYetOgJwTPNNUttwiBK
         JrnT0/CUQMYMAEssSn01810KZ3stPTm48vrrhVgeciztgDtSDaAJPQmPpgi69QhnJ86L
         VaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939344; x=1766544144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RAvaRpzOSVNKUVUd3z7yZ4rULdWPUD/lWxZmIty2N/Y=;
        b=gqxMPFg9ycBa6aRsR8sTtfCm4WDBaa9OoAJs0OKAxCafe66ituclBSfnhrzlaVhYvD
         TsrQNBBvszcxdpeK5xzfFyRZ38GaQucWxtuj++K40nJTBJjbgnNqLszU78yVuIxa1/hz
         WuMjL+75ckTHPsM2DKiyJ2jCcg9LYckfrZu9bRDO8ZffNVHqQx2IuaY30I4A32l5sKbY
         kmDDKlz6VYtDZtBZP8/57foHYty9aNc4j+vveCvEfwwxRy1EZjDlrQQXna/jMt72P3ts
         QfU1WTyxUjRpHM7rSR4hYgv3P28I1BsiZzoTRkGEl4bhBQQGYId+ARophqqVCU8kFe+d
         80Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXCafHnG7RzU1Ae866zAblpLG1eKfYoabxsPGRoM51MZukeRd8zcZDAORC3nCT81FVxx+k4gQ0e5TTULkevaukm@lists.infradead.org
X-Gm-Message-State: AOJu0YxUuHngPi1zifnhfMVLiDxTg0aATZttnvWKHqu5Kb7dsEmEbiYK
	aFYNpuX4kKzPM6KIJLGbohIMfI3FuGgQkMGFZU79Rb94LM4u3pnZQGNQ
X-Gm-Gg: AY/fxX4CHSie9JsdfzLNAfkiOTPLiIEy2vOT6B2l/P5dFn1A99QSXldMM2QbieLmSoh
	NGZ2YAGaa6mq0xyk7jJyMErBxH53XDqy7DFuS6ZJziJeUQma12KCiHffITM4aHrSFby5LlWa/Pu
	BkhhV2yUhHxheOLosc50rocJGTcCfq1/7eVjyLzYZBNKj2v/N1HbhSN9YiwchBDfNpvBwIkCrHo
	65q5dce6QVmdILXgVp0GB+ooyXUd540EYbPTkwyMpuivOKV+siDfModvMhr/EGqeYKUr4L8cUgf
	CukvXjcwEfgzYPLhh15LPR+sNA80LFdYnEzFZVXRKR3ffiPjIu9NbrWeb1ON2UPlS5wItvJqpM6
	e/Lm44mekquFVqK5D6LOeA4C/3VMxxtAVh9H2aInO+HZOh2e0k6mM19Cu9LIVI4iC+GPb+NVOU2
	lTWJVUm45B1eUGV0YigfTnqP9ipA7nsfctQ+EnnDQZyWiCM2UQ6yxZnpxvkzrK3H4FR/ua+r16R
	cvosDjTsecYhME=
X-Google-Smtp-Source: AGHT+IEdo+oIswqNvPYTC0alUaHeiWR1/K/Mfky4uyf2799xeagzkReyHg/WBV9BGT3F3fHpH3VwIQ==
X-Received: by 2002:a05:6a00:a118:b0:7ef:3f4e:9182 with SMTP id d2e1a72fcca58-7f669a8b0c3mr14790222b3a.47.1765939344119;
        Tue, 16 Dec 2025 18:42:24 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8c29738sm941342b3a.17.2025.12.16.18.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:42:23 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 3/5] ARM: dts: aspeed: bletchley: Remove unused pca9539 properties
Date: Wed, 17 Dec 2025 10:39:36 +0800
Message-ID: <20251217023938.445721-4-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217023938.445721-1-chou.cosmo@gmail.com>
References: <20251217023938.445721-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_184225_111071_0C8E9EAB 
X-CRM114-Status: UNSURE (   8.35  )
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

Remove unused #address-cells and #size-cells properties from
pca9539 nodes to fix dt-schema warnings.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-bletchley.dts     | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 5919a5046078..8df145d2bcfd 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -373,8 +373,6 @@ sled1_ioexp41: pca9536@41 {
 	sled1_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -462,8 +460,6 @@ sled2_ioexp41: pca9536@41 {
 	sled2_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -551,8 +547,6 @@ sled3_ioexp41: pca9536@41 {
 	sled3_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -640,8 +634,6 @@ sled4_ioexp41: pca9536@41 {
 	sled4_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -729,8 +721,6 @@ sled5_ioexp41: pca9536@41 {
 	sled5_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -818,8 +808,6 @@ sled6_ioexp41: pca9536@41 {
 	sled6_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
-- 
2.43.0


