Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B1C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=; b=ikDoZWuKgi/ydPbRp3C/15iX6y
	7NSgzBby+k817JIW1n7Gnlmxjt9hdyA+sGQ5BSzx/pWDJdHO6UJ8kczFI2Fo26lGz/rtqnN7q5rsO
	DbpCo0fCf4kWt1O/A5NK6OwP87ihz1PEGxfNR61gkS8LP/qYhESQmhxDoDkVwWy346XoHaxQm9UQJ
	GvIrKOx94QCXmxJFu1RhdunJICBK1AzzSJix9sx2w57fwSk7d6N/pcEnrpCPXBJTLAcbC2CRQZCgD
	hRb8eEO2fB28YxRKPSFsVIKIiGMa7YcUhaHj/tS4FajQlXzOcyN5Fhy5Vgg30bqYFkHcycu5a8EpG
	Dyewbk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4M-00000000o0Q-3jv9;
	Thu, 13 Aug 2026 14:06:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4K-00000000nzN-2RJU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:06:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso19954165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629962; x=1787234762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=;
        b=oXtU6lomnxZGNWfomX/KrEHrVnF4ctOC1Ijdrp2zOeyG3881Ayk5qfFrodiJuSBJGf
         f7LmCVvDHbAVrhOjzq4zHo17dC/esSqwGg95XDrONOJ9Q+Gumb5gLscLrytJ5EXd2GYv
         ZrAfRtTYXfH5ucmXieUvoqZj9r/vHynR+nguphnrNiYJR/Ms5+klY9+kyGlb8oKKyIDF
         NJJFqNh3OW+Glv+bMcGIKt318Lb9u9ZUxOSXtLSzj900Fg/oU5UP5NJyJF9IsYjFUaV+
         LQTu2ajLM5ErogyGN4K0WBrqdGqqSBufReXaliu8JDcEtZB/f9Sl3fyS1syPGWDayF4u
         ED2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629962; x=1787234762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USvILuDtTiPA6dYavysHHB08OaS594TOWNHKjjfu0XQ=;
        b=kgrVB1zCJNP5ECre7UGyEIa37xiqycpkBGII6FwQqMjDfnJYtPG3KZGtHbGUZ9/wDj
         rAVeljTtEEsmq/C7fRN+FffHecidnwwMiu872ltJP9FrDqRNW0bzQlvAy+LI8SPHXAH8
         6+oxlPfu2yC2K6L2kXdXMF1CfBj5xjISK9BfBRuLKlMH3Cj7oPwj5jb+cLFRQ8fT/hXe
         EnFW5mGNducZTQ+7HGmTCEvb4xFvQheIS/g353yx2d+AzrUrZSY/VeA3YfwCDFQUbIzW
         hDF958jcn2lAuBUslbkI5YYHdRDokE7iYOpdsmahbWMy+HzRTAiDUgwIRWQ1sflXzvyr
         BRtw==
X-Forwarded-Encrypted: i=1; AHgh+RppJvNv7lrDA1MsGHcG0m44bR8ZMGJoPKPQMArmBYcohRV/rg4VYpa6YDY/olyzBOl1eph943+KkgAOdmtJ95rK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy34Yea5dJTJsH5CPBZDDqiG47OIfj5Dorp1RLUn8dXB3jx+VMs
	Vm++aQ3Ft/2DUcm4JdBPLlirypyVcLo6LFYZJHN6Y8UtO3LMFUJUduQh
X-Gm-Gg: AR+sD11R8TBG1sRJzcA3+L8LXrygVbUpA9uDrAVPIs+psbXD/Zaj1CdTyqZU5P5xIGZ
	GPSEPEc/i9Hyvmk1Dr6OhApBojs1RbAwlQRNcXJBLwItex506effhvw7FCHi4ZBxFz0C8tlRIH7
	04jgFAqiY3m/+mX3puzZ9CIQ4DatJX6NBOy6qZuCZ92ZarKelmcqC+nhmBlByuqVJuwDjA6wCne
	PhkmMTBFnI8pMNpq5Bgd9xlDASBKUd7dTiVY8z296OHdwzjRoTQZO0mU7smOJIXSrX9q0zLWNB1
	ELQIUcs/p9fhwJZ2IPBglSz5M1Hn4LSh+s57bN13e5zuF122rTUx43iS1zXKZYxlbyzZfVWpQ8S
	ghz5HkHEvH+pNmNx9W4cwAiLs3CsRjxZvEHsF5+Qdkombvq/YmmyTniT1Zo/c2NTe/kb7BL4rVc
	mM7UqVPnFO01TX2r7kODWhiStoEP6NiQu4gFPWTKTXW7BXmbSv0jGvo+p0s2ldaltUYA==
X-Received: by 2002:a05:600c:1c25:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499821d91d9mr57412055e9.19.1786629961887;
        Thu, 13 Aug 2026 07:06:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 16:05:56 +0200
Message-ID: <20260813140600.1824949-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_070604_641277_F9B845D5 
X-CRM114-Status: GOOD (  14.18  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18:
Ethernet, USB host and OTG, all three UARTs, i2c with the carrier RTC,
SPI, the microSD slot and the RS232 transceiver hogs.

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
  instead of adding standalone entries
- use hyphens in the newly introduced compatibles
  (toradex,vf500-colibri-vf50-on-iris, toradex,vf610-colibri-vf61-on-iris)
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 117 ++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      | 153 ++++++++++++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 308 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0


