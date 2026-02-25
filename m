Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0946FD376A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p/gKDfNO0yZEaX4mw+sj25TM6DxomC6HSWL+mXYtDWw=; b=OcOB+ub0C3YMIev292VLk5eOig
	T8W1mXk5OKW1BFG6BOjzbdIcb7T5yq8Q/+Y0ADFmmncTHExDvQxDVVjukFl2dHw9it0gmNpoPlC+7
	j//e0PhURZPgyRDvAjx8Lq4nXjxn48vUxsmBchrzQljOzTTZ5oAwH5S0tD3icQzcm5lVkQ8iP2Pzq
	z5mV/wjkbAJkBks1DvVfZ/yfP/e6VwaZPVVUKZLs1GrQ2rZs0W3cn5aijSsej7fauAPnuFYrjtukL
	2mNZM5mp8f9KJpoLeVhPUAEeosYKQsZAjNnenw4Cv2f/PPeNboO3o3k8koI8qmaOtZ9PTQSXSr2Sm
	rW/b/X+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIIq-00000004b7f-15S0;
	Wed, 25 Feb 2026 17:04:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIIo-00000004b6R-1Sqd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:03:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso54717265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039036; x=1772643836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/gKDfNO0yZEaX4mw+sj25TM6DxomC6HSWL+mXYtDWw=;
        b=JlAK0wGYifiFBwiEtmPS0tgCNrBkOigUDwQnlvHAMJoWGgwEzV3yh+5l37l0UDZsfF
         c3tb1vci4GYKyFrfAH24kLfuWOeM9QCK+WfsieEyJ25no/6folJZ5z6YA7RaTCBEnpbA
         PLbxMGEfPwZsDdH2EAHr//UlAtGRaMkBqlCaMham6cMSVQL+5yV6fISFqeciDVbmhvXA
         WJZHdNHLIw8HhaHWFQM24LtGc0+Bcww/yeBgZ4XnFHCUEI8aent25qjEHZL0opd3Nt1F
         ziND8zlSoGr3X0vQ8Xg9xX6n6Qf9bqKqdcT5kDTDHi3lW0D0O4qJFthNaJQvvBDBeB0z
         JLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039036; x=1772643836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/gKDfNO0yZEaX4mw+sj25TM6DxomC6HSWL+mXYtDWw=;
        b=I1dV9vePBmurAoNLAm4jVWSov0iSCLuSqK5ASP9Z3we3b3t9FkbLf2H2OhJPnIYS7b
         +3IdP9Zo1t8GPHBJPOgLsEuvi13oIGX6JCEAVES3XyG9KAikAyheOxqz9LB2cDiy8+jw
         rwQmvmSeRn5HMffX0kbxfl6IW4wl3dhtVxYoAZkqcZwKa4bD+qRal0A4PCOyidyYgQED
         eESQfmUgBQ7P6CRCXJZ86kzTUi/WWP2myE8V++0/IQxWBb/XmZUIHxgdTfJJ6Pi4Ido5
         wheZSBHircbsYH1caIZ2a67e+P9mPUTQ+sM4bOeE9p5On9niQOuJrcXlWGMML89pZEau
         ohMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVzF4cm1m6G8CDiYyWqdYDdXKX2xL/aiWiZgWqLnu7ZwYSP/jiEzib//KuM/jQHhK91HCnYGcw+YkvgBYDjRoi@lists.infradead.org
X-Gm-Message-State: AOJu0YyXvEALm6xxokPgOiXQ4SDJT9so6mOyIC/OTyobmyjtLoa3RRsF
	RFwNSROi6gyi8NBsseRUuOVnWAfS73U7PHk1qPN5upO5mrvLi+mNTvJ7921arQ==
X-Gm-Gg: ATEYQzwVm6rPH4zAjHe8ICYREPAohIKI3bQ30vT5pB6wLMlrrYJH0lbvl6gaiI4q7/B
	+XpWYhiw7CvOsuw+5ogKQePvYHB4owZ4RgNWOuRPHrKnMBFcOMCPm4NOaPiYZFvwuZmIzE0nNxY
	2lquhgH2wd9VW9ZrT6hafUftYCzBQX45C7XYLZMXI3kmhgLrZo/3c1HWuZdH/F72tFsgt42cF9p
	vzPfJRiFp2U0lkoNnOvxQnyQ5jjZafnIJluN1QvkbjJlfKXCBbioLzuhrCW1SKJtNv64MVxTCxN
	Wx8lyaGL5getbVw5SH5mjNPqldWKp1ydBGyNTYpmkRYY9rUdKgD57HVfY/G25o+C5iROJnVobVe
	b1sKGLiHnKk2F/IU+qdjhmbhOh/2XsX1mKtI+U5aA45Tfa0yim6M571Znt7VonTtElD/VVrNTD+
	RF6wbRKQPlV/jKM+yacqAcbz0/MAv+piyWt70Qh8z29xFXTP5aCYEskcqbzQ1TAyEaKnvePcbiX
	eNvAmMUz7f3Osjlbn5uX6hOK1QTYCVP/MERa64Pr26pnlob0g==
X-Received: by 2002:a05:600c:5486:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483a95dea69mr263172375e9.22.1772039035675;
        Wed, 25 Feb 2026 09:03:55 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm88276935e9.6.2026.02.25.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:03:54 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Wed, 25 Feb 2026 18:03:35 +0100
Message-ID: <20260225170347.77841-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090358_403926_F6D84617 
X-CRM114-Status: GOOD (  15.07  )
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

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 591 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 425 +++++++++++++
 4 files changed, 1023 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3


