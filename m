Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2D0D2AB2C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0rrp5xrTxl0hGh1RK0+7VZvEHCMBhzUuqSkpHc7vyU=; b=DAuB8URMRu58vih1B0ss/Cayr5
	SBCKmtROa+R6Mt08lqytyzV0E82JXXrfDUNcZH1HqlkIqZVXGSODfLlu2Tm5oGPt+FydkW/2TlgM0
	9H7bdNg1DmOuy9haYuZZLdHyzK6orcfkeD+bAefs/F/SGKUnKTuAOQsDNQ+3Orx6aXtMK7GS1i7JY
	OWad6dQCOIMq7r5bwNKwaIFP9UhuwoYVoqgGWFG14UZHXIQ08kf5fyu4iZHiRKEVc+zE2VMySF8OL
	ecDvQfC+1u0WveCoEOG0mEfXPhnUj0s7W3F+rclzIZ9VCZnb4GBSeQHLMGwjHaM522PKbMJb3F0ng
	YVzQ4mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tL2-0000000FtyJ-21fp;
	Tue, 29 Oct 2024 21:01:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slS-0000000FlL6-3gBz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d43a34a0cso655610f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233469; x=1730838269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0rrp5xrTxl0hGh1RK0+7VZvEHCMBhzUuqSkpHc7vyU=;
        b=fNIbmKi2sc1HSZK9QCxnhYpynrbTy34Kt2xV0JRJABqdvWx/aXwEwrlprMc+P4up98
         iaPLOGVurBlCMeGiOaMBnGcJFVBB50wyeFn0zUovp1Wd+PD+W8dTImb0vL3wYHEAJyh5
         i8A2i16hqb4GYFfwhk9PVitWi9P3OkpA+KYekkI/WIHRaFHYn8/ot1L33j2O5Ldfq7Jt
         4ztH1C8jSgLILXQ9KvLbSwZ9f1oe9USCdK3u/YTdbQjmfLFhzq8V+y+UVKdkLUnvS7Rk
         65kfUQrA2uhyT5gSfjz4EZsvUf7am0T9jtIoNBK+0kOes7CEXlE+LCY87nf2Z7h4g/VR
         qJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233469; x=1730838269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0rrp5xrTxl0hGh1RK0+7VZvEHCMBhzUuqSkpHc7vyU=;
        b=DNogd5K3kocLnl7PTTUkBdKcGLPvBhpoOONWsa+NMLhz9UVbjSDiu1TTyb9NTc9AN9
         JlVOxGGEPJ9tDz5WEq5s/1DMdQ5BalHCd2h3xj1z6vW6M44sojy78sCPBaO9da8nquYm
         050/LaRVg1JyxdsQzRnfAu6TMy22owfQG29B1JCPg9rMFUtkBLWzVqVGCKm5qUxfLERW
         rzA2SbyKCClT/NX8WbaIl7c9sZxCN4eMwg+mC5ZXHYSIsLD6NPmyL2+CQLK1BaWP097T
         /XA22QaMVCaKrtRfRFfoc7j4nKM4OKsLtGXif4rB2j37JxLG8a0HOSTJ93qvmIs6uXO3
         Uy9A==
X-Forwarded-Encrypted: i=1; AJvYcCX1vIs0eZEXPdSHrD3Y6lI4u7nI5pbcipakK70O7fJ2ZU1KymJhIL43xhPS23IB48Rsj/VYSSO1hk2eW9j0azz6@lists.infradead.org
X-Gm-Message-State: AOJu0YwMfB1TvY6jox3aMXe3QcGCtUbinkyNTkTmiojlK/nthsbY+cjZ
	5dMM1RgSLt/7rykKBacwtY4hztVEe2sY4wZeNJc0b1NeH8YPRjpj
X-Google-Smtp-Source: AGHT+IEhYwBOUVTvTj3Hj0ZMICPfIHBCtNgFSxbtpX78XFkcd9rCEeOvpqOMJ3bxsigpakj/rBHQPA==
X-Received: by 2002:a05:600c:3b13:b0:431:55f3:d34b with SMTP id 5b1f17b1804b1-4319aca248dmr50351615e9.3.1730233468766;
        Tue, 29 Oct 2024 13:24:28 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:28 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 21/23] ARM: dts: socfpga: removal of generic PE1 dts
Date: Tue, 29 Oct 2024 20:23:47 +0000
Message-Id: <20241029202349.69442-22-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132430_935507_2A0409ED 
X-CRM114-Status: GOOD (  13.42  )
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

Remove the older socfpga_arria10_mercury_pe1.dts, since it is duplicate,
the hardware is covered by the combination of Enclustra's .dtsi files.

The older .dts was limited to only the case of having an Enclustra
Mercury+ AA1 on a Mercury+ PE1 base board, booting from sdmmc. This
functionality is provided also by the generic Enclustra dtsi and dts
files, in particular socfpga_arria10_mercury_aa1_pe1_sdmmc.dts. Since
both .dts files cover the same, the older one is to e replaced in
favor of the more modularized approach.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 -
 .../socfpga/socfpga_arria10_mercury_pe1.dts   | 55 -------------------
 2 files changed, 56 deletions(-)
 delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index c467828ae..d95862e34 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -2,7 +2,6 @@
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
 	socfpga_arria10_chameleonv3.dtb \
-	socfpga_arria10_mercury_pe1.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
deleted file mode 100644
index cf533f76a..000000000
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright 2023 Steffen Trumtrar <kernel@pengutronix.de>
- */
-/dts-v1/;
-#include "socfpga_arria10_mercury_aa1.dtsi"
-
-/ {
-	model = "Enclustra Mercury+ PE1";
-	compatible = "enclustra,mercury-pe1", "enclustra,mercury-aa1",
-		     "altr,socfpga-arria10", "altr,socfpga";
-
-	aliases {
-		ethernet0 = &gmac0;
-		serial0 = &uart0;
-		serial1 = &uart1;
-	};
-};
-
-&gmac0 {
-	status = "okay";
-};
-
-&gpio0 {
-	status = "okay";
-};
-
-&gpio1 {
-	status = "okay";
-};
-
-&gpio2 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&mmc {
-	status = "okay";
-};
-
-&uart0 {
-	status = "okay";
-};
-
-&uart1 {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-	dr_mode = "host";
-};
-- 
2.25.1


