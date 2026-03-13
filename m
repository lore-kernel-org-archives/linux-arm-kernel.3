Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F77107BCD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tStJn4LBdNSDPTkcJ9F6SyDC95zUtjG8M5+cKBjWoxQ=; b=e60CLLGQnA3yva/w4xTmusP/e5
	fNo+iKCveem8/d/K9WDc5uPQVSQJpufxA0iki/pTG4UdArG8Nsp9OvI3Z/7ZL8Lpb3P38pUthEple
	O25BMJXhaFHZc/t5lry5BWkQktbF7Wm+0rUWtDmlinuv4/Obr6KMeCXZWE2HRKzdJYtxInYqr+pVi
	CoAeTSB79yEtk08R8f8U0wTpvXkuovBzTF2rGsWg/p6zO0Hzszhzx2y6qCbn4bIAaR3Ke37TYjhaW
	li/cbE1wc5W2H7sSS8UcwfBB8dRT4yNxrfai/kEcQ+fMhIMg69mC9EFfGcoeGVUtOnSh7gkALT+wh
	DQC2AcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16bu-00000000maT-0Fp5;
	Fri, 13 Mar 2026 17:47:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16br-00000000ma7-37TQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:47:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-483487335c2so23560605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 10:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773424058; x=1774028858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tStJn4LBdNSDPTkcJ9F6SyDC95zUtjG8M5+cKBjWoxQ=;
        b=jSzC/9KRmphdy+Gzj7jEkhx9nMLI9wynpo0+JZqAfjKoBbD+ps+4zfv9BJrdebjK8j
         /h73JWmExOICTBYyMvE/M4OUFd5MQ6IkLh8OqOUG5Nv+LDWPymmbo+/hLXF90gt1h5NH
         QRSuNWujVDt0RdZZhEp7T+AldDDeaJ6kbFk+FhoCD4i5kDvhUDoeUm3HI1N2Io2ZRJbM
         MeONUyVsVA5RB2qETC7juO1G/7eS2Pf1L3GuXXwrquDuMXU3iKvbP2ZVABuPQo0Y5Vvo
         ZBRWPICsK6sR0srJzNqew1anJDGpVP9HBH7aSlqO2zg3SgpAjG0Hk5V/i/gyFkrdgOfi
         qF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424058; x=1774028858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tStJn4LBdNSDPTkcJ9F6SyDC95zUtjG8M5+cKBjWoxQ=;
        b=FS3abp7mPsmkujO6GR/3FWolorWOpz8/VUBRW279514L2eGPuZ02Ib+YjxUaFOCXEY
         vEPc98RnYMJCvD0mJgOw0rVeOjtPGnBp1UBr/glA2Tr/n4MnMBtKAHXGyCDP0sK/Hwu6
         hBXolqxD+ajOsBuPF+YtVOnFndyDbZ5fZxRncj78FDrDznnOM4V6sToMRdQ/UgRDhuZ0
         61isp1xw8NBM7pQJDNFUp26bIlXHfglo3hxXeMYhFK83Ie8mik2kyYeSkFswXWupEr0X
         NqofmO4FLsIS9g+HabRR1Mfyjr8OXWV0ZjxlPrYdl95BI+/M1pqDbgVmcHmrL/otHJKV
         5ZwA==
X-Forwarded-Encrypted: i=1; AJvYcCURRodaQd1ICG/JXiv1kuoRq8JkNG3PqCxkGKnQ/HE7RajL1gApjw76mtT5KQBG2f50lwjHyKS3DjWXZGCS1yhU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqr6Py+eVsqNmPnaQZaGURK906sWR/usZItYq9YnIrkSrGwOnq
	mH//WNZahk9bypJIbFCE7fCq/MOMkvY7z3E8piyg51XLojpOkozqGyx9
X-Gm-Gg: ATEYQzx3/u6Y6s4mxPjjB9yzVelOdUeKcdULDHyf8e6DTKOysFTNfRnwjh9VVwIlN3L
	KRCj3V6XntnyXMskau75K8Gd5wrgaWyziYue/FyTRd5PAmoKaL/OMucVQ4E3cbGWc39w74VKYJ1
	l43+57Deiv4nBBIFS2s/MyJadL3z05T1ml3yIQ23mp+lEN3vBVewrYc1Z/RGPNaZoEyOBPJWSGk
	X9pylMzpkwKoCJsjuJbu2kWyaDXw0y67fWhjEEfmYD95tgy7uUezRJIANP6Szg6pamvtrcEatjP
	9pYaXtf636Foi7mGa/+2ou1u/xZiz33cNCXrEpjA3pMfPJQ0ZqCA07OipCaIgEWL5Gu69B8CNp8
	IoZhziobQP4UIjAJ9zGcrTEAwJAz0GyRgkG/xhNTcVZyu1s/XDBVipWBDOH+F+8CUN5Q5dlGp90
	6UYgEOHjH0jyeWFGhvASJ/K4s5j58aS+2u7xKc5oII9kg53Ao1xTm33I6tUSqwTBhVPSbsdepiT
	0b7ruaRD6SUBx4FKQIQBMUmwcf2tqp9Fuc7fjk=
X-Received: by 2002:a05:600c:4f8f:b0:485:4371:539a with SMTP id 5b1f17b1804b1-4855670f7admr60093835e9.31.1773424057534;
        Fri, 13 Mar 2026 10:47:37 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6756e4sm257213575e9.15.2026.03.13.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:47:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/2] Add support for Variscite DART-MX95 and Sonata board
Date: Fri, 13 Mar 2026 18:47:01 +0100
Message-ID: <20260313174707.26902-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_104739_805425_AB8ECD78 
X-CRM114-Status: GOOD (  14.55  )
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

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v7:
- Order nodes in symphony dts
v6:
- Order by node name instead of by label
v5:
- Fix newlines and nodes order
v4:
- Fix typo in spacing
- Remove vpu and cm7 reserved memory
- Add GPIO_OPEN_DRAIN to i2c gpios
- Move pinmux to eof
v3:
- Fix specific node names with generic ones
- Remove fixed-link property for SFP
- Audio regulator cleanup
v2:
- Add SFP cage node for enetc_port2 following sff,sfp.yaml binding

Stefano Radaelli (2):
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 3 files changed, 1017 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
prerequisite-patch-id: 7ed0e453f554c70d0fafd5147d4d9b62cac6c10f
-- 
2.47.3


