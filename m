Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0016C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FZuKI1wVxkt28jthn6Qr6eV84wewBB6ZEVTh0IZ8cg=; b=gl6vTJdyKIo3olTTHmsc7Gun15
	dxUh7QCwtZDAQrAAcMPz9mZzJXskiC4Y2w3lKjuj5mmOP8swYXqK/6IsAloUaaJ63f4g9plMoAQB9
	k2Myp00Ad61yPNLvYBSky+WQr90O2bSEcZAYAbFLSIxnfmF6GrunfM8tT6Kw8yNe4uvAbO7t2+aJQ
	PVK0xtfQlwDygcISZ6LWh7DJ94W5OXfR+SN42rIWV8qhz6oKnygGkDI0Tkx3Hi4AL/3SJ7BEgGyaD
	+nMZuWhjy1W5lYkaB+U/lGwqiEz3OjDEidcbiEFy69HVcwcxq31KHUAvF2N+mzazIvJ3CZELWOJUc
	04R+EcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLsA-0000000Cp02-0Dj6;
	Tue, 06 May 2025 17:14:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOZ-0000000C8Bt-1vBn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a0ac853894so668427f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538298; x=1747143098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FZuKI1wVxkt28jthn6Qr6eV84wewBB6ZEVTh0IZ8cg=;
        b=KmZ+SMkkvvkS3AKfRzC3MXo7AGVVw6apCPgo9/nfGnYWPHrYwoYB45SjjhWmiZGc6s
         wfdYC10HsbwggRkr4pbgDXtPwBroTB0eb42CSL1Oy5BdKO29rMd4OhleYfweDaWNGBQD
         pwQ8fUQxxDoqjV/0Fd1VxwUocuHlmyaHCuRcdSIY33ekLnC6uj9mR4Q5IQ0DvKBixlDw
         yWf7o0pGgXIZ/UGMiifDjWLhJxx1zxlmQQDrg0kDq1rfghTzNonSzFn3VnkyoasP3hZn
         4q8FhadyVPEdf/p5R3EUaWVgyM+dMwU3XKH2npErK1ECEwCo5avYg1PbN2Tw/L02yGVB
         lIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538298; x=1747143098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FZuKI1wVxkt28jthn6Qr6eV84wewBB6ZEVTh0IZ8cg=;
        b=CF6h1YXQ4vRLtUy1jffbgqEOCzsndCdmzBjv5Oa1lyts5pABrgHLzzhWIbc/g5+oyM
         ZdJzDuCrQu57emd+kCwIcphzawiiKSDMtdQhqzWabpjpc5ImDhnfTILErNbykDdMYiFP
         rwSL8CVeQjQqGDBMoj2zLrHGfhMcrU2UpsX4qtofz9v/3oZCNXZ8gAMPmNuIqPXMRqUG
         xfjkW/umf1XZ0yXQh6teEh3BUvYQXJhwk7AyxpbrrTlwXYMljpUBKRXYEenB8PvazYqU
         NJ1rfpvDno5podZKMwsISxsNKzG1DmkxTTYLoSLmc5usRXdlLE77/1I+Yz5NnBg3EFUC
         UQKw==
X-Forwarded-Encrypted: i=1; AJvYcCUov13LRXylMk40BVVI02t60CoHMMeCDDi53J+ic1rUhMin0mT8yuMK5M/PC+N6BIBSRIo13xUZvqAAqa9UMAn/@lists.infradead.org
X-Gm-Message-State: AOJu0Yygqlp7e3vMLQvxOxUI7K6G7Rpx0Dlm+uvR1fJ60qLnXBUQOJCR
	m+hQij8paEMNH/bS69gcO3EbK/cV8dpxLW+cETJgiIfYxVun031Fzc7bqg==
X-Gm-Gg: ASbGncuRAYhuvVGCCjU5q9r5Uh5R0wmCuwfXlzqhahKoPiCMucRR84hNOX11x97fmFJ
	npL1IEOTLUtySTIRyx3drlUYbEdRsWGMXgMNysq7vk+f7nvvLKGIXSUcpIoKX+QSb5+WOfcjB3r
	eAw953R+mbIeDIwyN2LKxjlpp4oxtRxo6lPar8KuaTrIZnn5RAYjYI6u8W0zpXeGx5Pn5F7GVRC
	KYmSING368+YkmHEeIdAqYMef/fONabZy6xMvhQ82Mw2shUbZ3nYhGNlVuH1Z6S/H4YEWLfWCeh
	kGPqV+km0HoaEmAcrC+prE57sNtt7i41iY1I7ZFLKXiqyO/ayLvVXQYPJxIUxRgpSNJ1FgqYcgA
	P9OglVHwj5KeBneWVQ2Y0qxBvMNxPM5TB
X-Google-Smtp-Source: AGHT+IFBCHEB0L0uiyTayzXbwMp0FPK0RJ1uHO4LY7M2FNE9zoE++cRfDFHGOUfb3EfkMWqDNRTRAg==
X-Received: by 2002:a05:6000:4310:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-3a09fddfc6bmr7593427f8f.58.1746538297951;
        Tue, 06 May 2025 06:31:37 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0c3dsm14127537f8f.12.2025.05.06.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/11] soc/tegra: Enable support for Tegra264
Date: Tue,  6 May 2025 15:31:13 +0200
Message-ID: <20250506133118.1011777-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063139_493617_8B3B6BF6 
X-CRM114-Status: GOOD (  10.67  )
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

From: Thierry Reding <treding@nvidia.com>

Tegra264 is the successor to Tegra234, with various improvements and new
hardware.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 33512558af9f..bc532cbe32e7 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -138,6 +138,14 @@ config ARCH_TEGRA_241_SOC
 	help
 	  Enable support for the NVIDIA Tegra241 SoC.
 
+config ARCH_TEGRA_264_SOC
+	bool "NVIDIA Tegra264 SoC"
+	depends on !CPU_BIG_ENDIAN
+	select MAILBOX
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra264 SoC.
+
 endif
 endif
 
-- 
2.49.0


