Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA1CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=; b=R6dEwAUQl8l2o5ID1f+baexgsr
	Kx9sL0K+qFRkNYQpnL4l1K0UBjSuXlCiloUz2/egGPIeeSHKDD4miLp+ZCVjzFKNv8v3c3A4hQFHz
	NQNc8UzIiX0M9MtED1j/m1AV4nTc67vKEUZJULI75zd+MMhytzegCoObZNVpjtMY5ia3qx5YohZ/W
	RCIXtVEKoEFvBUOLvVRGrwmaSXINMkvYeDiKnzZeP3kgC+7l+lrozDwTXxVlWO7r0yw0qU2lKdy2l
	JDKUYKHOb2R33H8Tkx8980qr077UVrUfrDfjlT2NCzCsRMLDXFZbRLAZa8pslYundfBvJP8KaqLNU
	MCFM1m+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gN0-00000008tIB-048n;
	Thu, 10 Apr 2025 01:06:18 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGR-00000008s9K-1oPw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:32 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c546334bdeso25377685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246770; x=1744851570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=;
        b=du50bZNBH+gi73MSR5AH8gDZ5+9qZ7A9x6d4PdGdAJzD3Dmja1d8U5JhJjmPC3QHST
         wRLeYYdbrBLT/F3p1YNXIIp5hMaMZaJfMaM7uxVE9eHQES1JD1gpo3c5j8JV+deixlHS
         MYKmqQ0/lSa4fVlTBvydqE3BLJdUj3a17aI/5x9k+3HTDnL7knZo/oL+rMSFy+WY6VXi
         vaHvg01K1owdH4ZPGGw/8mnyeX11wFrADB9Cjxe+bWPAYXG0FU7coiWrvD7FHH6ZiYnh
         GapTrbbqMK0ECFxn0Cdk/f9gCxuI1TjBZkr/fd4C5zjVz3uMaJELIV+zBHswj1Fqs2Qv
         0bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246770; x=1744851570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=;
        b=VGYlUostC1X5uWcxonyfFFGpJLDRt5qg6xBnXThrROP7e0fC4logZ/e8xBGNagNpPg
         U8/o9iDrFG3B9crhMyXE/iK5DzCsW5LY1sq0a/djSIgoMYTg+QH6iekp11wbtnw1BORI
         5e8Q3rHxTAxh2K6D+W+A/1UImFL/MuyLFyvD2d6dc8k5v3n4rJzZ2u9JHCxiNDHnXY7D
         yX3r9PWkJEalNsowsngWD4SB6AZwcLT6KKPk2k3y18vHOF2iXn0ZFxptmSCiNGI9hiMI
         qn2qx86UZtOAbUh94uA24QsUlv2AdqB/AZiU/dxfIR/TN6kfwXLNy6G940gAbF6tef4H
         o/PQ==
X-Gm-Message-State: AOJu0YwBFXFM4EKGleoUO6qLHlflXTF53f3535PxA0vE902H9ugjATgd
	fj0Y4IqqvQSzHRrszC5gdQZgWxD4qdneLT55khVhzW/Q0gYoJMMLr5jd0Q==
X-Gm-Gg: ASbGnctvh4E5A2BgvFFDw5IN1WwNXc83RDquqMa8vKRle9qf3iQAKubptdnF+aRCBtE
	vqWfDbqrJxEHRxOBvEWk9DI7UbiVkTPWXRaSsd4pThHNgQ9jU44kUAMW+Uj3sN5yP85SMVSdkF/
	ozN7Cc7xM15kzyYDV9memJtcTKEsbmlBUc71R3ogOccTUJfpNLlbTzbwlC9XC0R4rx/upaYYwis
	vG66qxJoXUGdKPcAl3qhTJgrm1CRsyP3lKsMKi1pE0GG6ewF5AT+4bgcZG2rc5wZCJLYIIdmJ34
	3NySSBsFD3JAhV5HwI8BtUQSNxR20Gh/9TO2u3MSaKDE79GsgxWqgkuvv5joFBbQEfaBdOV+wV+
	GNecJPaW+jZRQabU=
X-Google-Smtp-Source: AGHT+IEOUsk3UgJ2ZjGZnVGL3oNGyliUXyIV9Ti6Sx7NFXjHWz4LHaoRQc2J2+koxguq/sC09DyYdQ==
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7a765becbmr144726185a.11.1744246769928;
        Wed, 09 Apr 2025 17:59:29 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:29 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: imx8mp-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:57 -0500
Message-ID: <20250410005912.118732-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175931_470067_F59FC759 
X-CRM114-Status: GOOD (  11.54  )
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

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 15f7ab58db36..88561df70d03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,6 +257,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1


