Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC68CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=; b=YIbbKpM6uIw3/MMcs5KnmrWrG7
	8msKe5/tYz+m2kxqine9YD3GUhc09sKyXuW24EQsy/MpDwkzASInCplGULGBTmZ7DfaJXAq0cs0oY
	0qVzDDedy3yYGjPKBIuf6OV5MvMBt6V1xydwS3kFgU7atQwfS8sRwP3gdycFPEAU2aQ1deaSq14Bs
	q86324kZgtdiMfQdKdm5qBetfQMQ2IHC+6KtsHw5lmkzQdeRpEuQ/FOAcRaz0q8N6nzuQ33yJbqYQ
	CFXgBrRugKGO2FpMp7di0ItUrZy9hs1xtO7fl5Z1KwD8QxCCFFg3MtQyiXjp1xp/bXHIncahpiYKU
	4G6yl61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsHQ-000000057he-1sHV;
	Tue, 09 Jun 2026 08:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsHP-000000057hD-0wih
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=; b=MbAfOaRaTQh5MmtMaM8vZ5MR/3
	rqytWClznEdSkoXEwm3ccWDvE0JLeopn4uuaAlDHSaauq11oqmojTFbnuL3MUblUNtOzIj8uc03Ai
	77gi16api3kOqL0N6bc+5X+T7WputZcEYBuWCX2pys1WBxsBjuRbGkRUo09vhjFvGsdYtpz8nIeq2
	MGleo6osB8Q0A7B8iwT1Mu4WnTbUFdlSAeQSaTYqO9jaSy/vuR4SCbGDywE/3bPd8TFauYQ0lDoPF
	GZYwJQcZdLr6OktkjYQMGsxTe0P1gswt7GrjqjLM9brdryx05Ehau1zFHyq2yahYewTheQs7/aNvu
	jVHOHRSg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsHL-00000002D4u-3ywz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:57:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso59514755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995466; x=1781600266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=;
        b=D5PcnM2pFd3XhKOXFWtLVE6MciCBXev9RCHnoY5YtbSWutoFlNo7aWJ/4glIU6obsg
         wVZzMMNdj9bTvAppb50J2f0K7xVrdKr0J5Nc+4DbQM7Q3WMVS+bCy//FD+NxHedObhy2
         ZplgHJD4p1ofjKMiRKZPqypDwhHZlBsQQW/Z/jQPYJSxugmWJ21XqX0fahHc9yKdwwKi
         XIlu82Bs1ckjsbUbYce3GbBKWKwBaXbWM3ZokkQgzlwU6ANj5btmDpXU85Bhz++iN1d/
         m8UuVaHG51eKmS2NeBNSpd+kafzakFmJ/QttsNgy5Q0L7TrJZYjiIao+3aQwRJcDUbuz
         PpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995466; x=1781600266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=;
        b=VzrwBXuORbACUVIC2+eSUqnyEPz3myPuShs/Qcag0+/7k5wQAHJPAtMJJcxxpIC8Ca
         dVM21TJUKRO7Ho1nwc0vpJtQoElUdZyMQP7ARoW4T66yCYicmc2XN4sOoz2l8rBjiEbR
         OE3NFhQ6tV2toYtQ+UrRaVt8RCWhaZ+ucKsnLWKjlKGc/6QShs6AKdHNbv/mrfvN1iSv
         LSPk/7wkGR4gX8sVgvR2br0b28CknVu3LPYFmouCCra4uDyZHiDuE7TgwkahIgt7irKB
         DB/HCWHjV3frAXhpH/EmgqH0/ebbws53SoWGi5jpXgyOKgPXyY0hTLo9mVp5vLO7Kkka
         TSzg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZdKTBtQQj68qIEpnTBaHes5IXMHKSObo2C3ak+bzzoPKjb/9+uK0a/1te+DllB9BuQy01HbGsL7LLumSXLsS0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5zyqtCstJ8BfeFEGIHS9G+GAMEh+96lvKExhWnrdH0egcauz1
	ZI7nnKjCyS9EdUr1ai6roebiTafYjsMstUlT8UbZQ0VXX19eWx1JwTg+
X-Gm-Gg: Acq92OHAAmbJo+jSpRWZMb61eyENDfYVcbCDh+UdrLN9ziBHzGAyg8Fykg+1LwW+xeZ
	LHCRKTr8UacgTCHibR1diSN/0KbMPDKgNZBD31easCz3gwHK+zFFrPxi4L/uThoEXe2e0jx6gMr
	o9y3ojLehaxq+Z6TEsgH5CYp/51fBz0MjyWoHEP5qtk6/NPFFqJ/ibnjHFlpLDcCRAQpPy7OJur
	Q8+76sm5scHEpTehJYpUksCPHIsMwS5EffOqWiVS9sdG3BWM7QYlkQdg2vUPJK9XVxIs+f8L7DM
	N50eaytKb9iwg51B/HVanXaE+76klRPm/ZNW6msvuPZm1fFW8KB4l9AUGeSpiQmpGm+IG8yZ4OW
	3wprm4e1MEK2mTs5PlfbNWwlIf4P1OaWklcZZMS8VUw7c59vMFD11AHylcF1tADdotflvSy21MZ
	ksGwPv+A8U4wp/7e6IncS2Z7UIG+ikPR5P29FBczAv9n4lwR3Zn/CuCSOdDHhEJxCe19Wh156JO
	m4fp0fOKSgEkVIYl6KRK85ZUromrqPmrCVXU9y/XyvPkFA=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr334881915e9.21.1780995465435;
        Tue, 09 Jun 2026 01:57:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm305234475e9.2.2026.06.09.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:57:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 10:57:37 +0200
Message-ID: <cover.1780995368.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_095748_402850_52C0A0AD 
X-CRM114-Status: GOOD (  12.96  )
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

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 723 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3


