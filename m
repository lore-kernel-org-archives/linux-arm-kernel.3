Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067DF10F9963
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=; b=oP2kTZ5g0MxTpZ955r4vSU/d4j
	HKhikkXFPJS3pl5U5t7ExWoF7w7t7drxM3TnGx4n6gMVhdCIsmCYeRaNF4Rc17WpVClOvKotZKy2I
	XN+h3qqnWC3F/gJXEgx3NABOJfcz2UejdDXMmAlxU/IMfH3gr3AMUwYX8ycR8HKtYf37gjQXWbKE5
	cy+2t1M9TbqzbSyL4QGaXgmBkLSmvKuwWpvCQAZy43KZGls5B00Texq5QNb5YnO/fGq+nBqI+MYIa
	Lka3IZf0tJewDAtl5MDQA07Ztgqbxn7LLSikxruh7qplOf6uBhIRHqGmSw9h00Klt5BQkzTIJCsY/
	iK8daDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtP-00000009Cb0-0iry;
	Wed, 08 Apr 2026 17:40:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtN-00000009CYM-2TeD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:40:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso605235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670039; x=1776274839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=;
        b=pqinDn+9N04QuNpT5yx/2+8C36xSFhYLC1JkxqXB7vBy+JxemmbjxUBvp5E0i4F0OP
         54DJqvWZnHTVuvnG1JU3vlcOd1RreGScT/QZTlriLgBJu33SIjsU+m4GDYo2su3Ez1uu
         scjJDCh9vp1qHJKpBC2r1RcaB4r245y5XzdAkwS9GLHe6Bw9QNq7cfYb5bBrCJvKEo1T
         8otiKsI8G8zeSaet9Rf6vkZCzLOairBXize5jOWCuPUw8du+KrkQiR2ySv77LNAZMt9r
         GYsu2Z3qxLEr/J2E1149m0yKn2qaov1v1L4QGDSsrbhG4hFUMtCyR5k2PMRExk+G6wP9
         4uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670039; x=1776274839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVknTNXnOvlztmP5bPCaJ9VCAFMggsih6gMsKKZCoUg=;
        b=NTrF4tDCEKfRtEwEHq479Pw27lLBWTDTKcME744ThMHh7l0Mj3AeCwkSK2ZnMFZVjF
         pmvTbfVdWztP2EqSKVXzJiZ4GJ7xIatNPPx3RJ1OZ+8LREhvL4S+4EufsXUSBtV/P8bL
         9kKZACZ7XoCa4brK5hFRiDEU2t8ZY3H1lpFykoqpjTokFVMbabbA1gVrkoHTVdVDrWT5
         REFm9oAlmkhDI3MtaIWSLwv2/5jja6J7gLk5QCSYisUNCnUOxH1lwuMIjRAtvUPYFkcx
         It/Edm9JWH7HsVEkWtZQIQ5/KWsVAuVjz2xt7h7PkmSmYhdx67R5aeY2IWRV1JRiMrYI
         bfXA==
X-Forwarded-Encrypted: i=1; AJvYcCVlVyyIQXaRGq6lNJpxelv73H6AfNjWr74Fz8fH0rrTWPL1Oqe01NxS6T4hC+ynQOV8wmn43Qv9ZCbiUhVJvsDk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7xq02J0ZMOcHgC+chhHaIvUsoHTrOMU3B6llMkpyQcsnMFae+
	b0tOMbw4ITdI4NLZOTWeEJciaKMhLs8VxJsNhBRNNtIqPPVVoBTQHVcucaHEXUJ1
X-Gm-Gg: AeBDievqVdjdzJW4irHpfW4ieu0YL/x+A1sp7gMafrWD2qbAoh9KqznYKX6wHi7E/tQ
	Gn/TXkj8P0rDC1VDsb9s6Sio1tbC9kD35fWXvEVAwnMU9feKaEXac/F9/SfAa4o6Jt3QVMzr5Qq
	sozkMIzvzGK2lE5cIZmOkvOkPZM8Km6+VBR2YXze8Mvt8mh94UQj0anqZTMRLx/Db8bXXk/Aiha
	szS1KFNkB17B4Q2cc6fEquUO1D6Xrwug/rnIAWUBj3NBhNjpQMLfODS1NOn6spDeHQwnieWulUH
	vAHLeduy4f80IM7hR07aL6ArRULVCap2EiMfmfms8AkYEdrQN5lK7cHFNAS2qyddpIFlINYRY8e
	w+Y5Soj5QMP6UswxtOkb48myfc9osfpp03RX4QYsrr4xsrnC7o4M1Q+l7PjIAIuxX6PrzEd2xij
	qLjKqqb7d6OgqAlLkM2ZOfPyVg262ZS1nlFh//vs3T39RDMIFsuIWDQxk0EOUFKJesf/PCwCiJy
	Esr1Z7HTqHk4UiHQ35Xk8I/Zgcjey+MN14d8rPQtuqhzNxY
X-Received: by 2002:a05:600c:1884:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488a2aca44emr139853645e9.12.1775670039126;
        Wed, 08 Apr 2026 10:40:39 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:38 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-MX91 and Symphony board
Date: Wed,  8 Apr 2026 19:39:43 +0200
Message-ID: <cover.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_104041_644932_DD2ADF46 
X-CRM114-Status: GOOD (  13.00  )
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

This patch series adds support for the Variscite VAR-SOM-MX91 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
  arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
  arm64: dts: imx91-var-som: Add support for Variscite Symphony board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-som-symphony.dts  | 527 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-som.dtsi     | 456 +++++++++++++++
 4 files changed, 990 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi


base-commit: 52bd553667e68b91ae6bb686ebddb66e539c7798
prerequisite-patch-id: 6aed59e9105465c7ff1c01475972351600be1526
-- 
2.47.3


