Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCAFEF9008
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iOKKDiE8UwEX6D8ImXPa3GsQCDK5MYHljgoPPgkonbw=; b=Lv4IgWWdrUyOZ4voeIHmBQRIRv
	VaxMloa6rO03vsjNCPAZFeUnHoVr+w0lFb8nNGFqpYZ0jpI/x9wqVJ9jq1+FJ1OI2KS16ADwcz6R8
	+fKhG04gqCExMAPh3MYkFrdr0P7NO6mvqDL32lg9yyAUZt+D9m/WZ7Ivgd+na55UiWSe2Z3WHFT4m
	pslyYwxzuqDVbEFwDYt47ISnGeRKQa4bPxgiQ92AgH1rZhRWhyzvLAy70i3vGsfWbFEf5MR+BMK1a
	f0N2Okj1qvLbg1JGQfNsssKlkWpZ3Mbk+lpKCOXiUyUmxgPzhr5i6I5amYC3Gl+C+DBaUEetVPUEQ
	T5Fx+Ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpa3-000000007Lb-0wNK;
	Wed, 04 Mar 2026 17:00:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpa0-000000007GO-1k4X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:00:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48379a42f76so59502625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643610; x=1773248410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOKKDiE8UwEX6D8ImXPa3GsQCDK5MYHljgoPPgkonbw=;
        b=Wl5UM9KSSMgvdzyJNE6Nb1nkRR4GRaP6k7bnnkoHB+rSbEtjEwWadn9ILCGU6H6IRs
         tPMgvjI4LzQaXhsALd1FB7kOg6UCBajsC0PsH2oaSpp5fH9CeodWPAOtMMo/EOT6kacy
         8BitQi3Uc9d7r2z2a1dj6llWsLkDaqcUIsQ4+lOm8WAW2xRAufHeS4W2m7D+IQhNVrEd
         mVAwHm6IHBwqeih7jOTESt4Yb83c96DnSXM5s++4fSYrRXh+JT0wBXA72KULbJLCotR6
         xSoUc1CgeIoV1OrvZ+Qh8Sq33xWN7xditJVZ09UddoHrmY0lrlcEaR2RnwPVj1h6VlBr
         RQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643610; x=1773248410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOKKDiE8UwEX6D8ImXPa3GsQCDK5MYHljgoPPgkonbw=;
        b=Pk4xJsd6NxPCfMzpRvPK2oE540ZeH9oYfo5TgjV2rhW/C0glwFC5tofai/sPmFc/Aw
         iTyrnEzY6Gn9KF7q2HTC4YuhN3eSYa5t0Ku1ECbY+8bx5e3U3WzhSPBrdsmjAjkMCMkf
         4X8ZNrpzZ84agwG3WXlfhBA7jNVDif6KALpHapPCONC6t+IbkfduaEMlWnKu04KPc5cT
         Wb9QZnLHAYwiSoxQUoKYc6HfBvTcIINFsYP78Y1tfeeNt3JWCSXqgcGymhFhczycjtAY
         /kZhY/RpW11+xq6GVRwC+8gKvJiYaf9FLTTfvqHVJObfX1VKQ26LWiUkTfWTxkVgno4B
         cGGA==
X-Forwarded-Encrypted: i=1; AJvYcCWoypfwgGegYtCaRBOV3c7z9YoGuuPaEMAMqP1ENbUxnzN+CIMv9rQOZOG7dtKXv9m1QqnRyLrRZbfSWv9kLf9x@lists.infradead.org
X-Gm-Message-State: AOJu0YyeCC+yxYIMFUXNCk9ojKrXc6YeZPCNhNHuvOOwkW7dUe8YI8nT
	o4RiDb5XAJoiysQmIxZpDJYb9MCMAdA+11DHb+ZYPX5dJZR6TiUv7htO
X-Gm-Gg: ATEYQzwgliWxWPRrdQEPA7KH39fgc9dsP6jMsnFVr8+dvoy+kq91De67VzexDbTw7B0
	dIP44s+pqnPQkU468DJKLCdsFm5N3FLZzWh3t9tfQD5ZWrIwLWuGBBSqL1V9RA7rl6v+5PjP9CR
	J8+5FlVTnC7tpIcSZ6allWCGRZtMYI1RazzXrywlr8FDfE0PJOZFEfD3Ny20toYJGOYiASssyU2
	KuWNlYcFaaOKVz29h9AfGI1TeuT0QHucS2GGTdptLdcz2RNfMiaKZPLiOdcUpk7/oC3bMvkv+Zz
	dwKJuTVc1DU99wdRgO6RTIXM070Qw5osYZb3L1dYW4ZraAYCj7Da81bd0OvopbYaryzDFiRQGGA
	3oqgpNN04ThOhV90MUZwJ6y/PW+BnmtOTZRB72YOczZaFEWR44kxk4G3Iz4avHXEynTnLOD1ZVQ
	rj9dZJiGI8bsIMclSIhGO11KIz5wQ67YLqOvgGOxOwABFCsOLFHmU17Cc8oqZWXi2QVGEH4MQCM
	eL47X/E4Vn5y2/DiAagHKJrfTcCe8ciSmit6D6z
X-Received: by 2002:a05:600c:314a:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-48519883ac9mr47568175e9.19.1772643609888;
        Wed, 04 Mar 2026 09:00:09 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851887fc54sm69946295e9.10.2026.03.04.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:00:09 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Wed,  4 Mar 2026 17:59:52 +0100
Message-ID: <cover.1772642881.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090012_485165_55D09520 
X-CRM114-Status: GOOD (  13.65  )
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

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 471 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 +++++++++++++++++
 4 files changed, 946 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
-- 
2.47.3


