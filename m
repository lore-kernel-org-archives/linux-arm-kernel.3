Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9ECCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=; b=xAx5dvbPOOsZko1EQtX+hoqpIy
	qMJtVYAc+xxGgWDXTamDb30S5vKmG5lTxdgHnC66bbIOucgS8OoAuj5CvGMyVHtYn0GOX+PoF6Hxu
	azbOi0wtDcBeKz5j2ZXHzEOD6GLKgoSJanxBkVxIz/9ahNh9OjiEIArIo8P95sGr8B2vit3YEc2jr
	q3MQz6XPw5cMzZTSNUO7gpcp6vW9j5FvydzZNubxt8du+6kdeZUQtus+z7gsbPE0LLteb9y7q8Zs/
	p4tT7lZRR55vRr/7aAYDWZdv9cH2l5tCXVIrPoHat47mHilNiO3eJEvGPpoPKEhzitBG3YgYcfus+
	fX68V6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWDV-00000003ApB-40B1;
	Mon, 08 Jun 2026 09:24:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWDT-00000003AnX-2NFD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:24:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490c1915793so24160385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 02:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910657; x=1781515457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=;
        b=CH3TkGtYOV7AAn0Pc2JGMMrAF464uj6ro6W4L0S9TyJATX+IztUadyzsRkdkayX+Up
         WFLSNFsBXkHzXWppV/aJbzWNuxov/2YxRb96fEl7RJAWiSFj9eWL0I4TD1PMrXPDgtWo
         D/3RiT/Lx+5UOUQKBPsNb17IgQQEkbTuGT3MQISWc2KhTNFVHRFjaDkCau56BaVm6ezn
         0RlOQ4RuBGZ8fkjEFvKzZwt+8nb02h7IbnsMv41hNM2dF7haAwMofzBgmjkk3IWlWkum
         ZJP7K3dZv8HTeBAhu74PLbF2DCiKfZHDMljOwfNeOsTwJZahvs6vF5ngjyq2WjI0o665
         wWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910657; x=1781515457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz5Bg/D78093usgf5+fdj8sYVjMQjFuVf2DjS/EcSng=;
        b=rkiv0jzrPjhrrFHvDuxVBCIkgMFXeYC64TsuOcvuWOIdIH9GYxDYToRLRzaS1YplyY
         aYM19MkXTs3OBOYmlWzN3xwj0PQxhBXZw3nVDQlNgj/jj5rgIlyP761pH+dpeEJPMjSg
         xT9J+VFQua6WZtHUSbyOlHEYQn3sio2LzNgOSub4igdT6dLaljmJp98Rj0A/D/vAh3kv
         Olw54ZPlUYbbZAZrjUl9zrJWwZNC90BGjDfaBXgbQlOIQ0pFNXmz4ujByYNJv0cnpPLL
         bblwd/ja0MyZCUdsn1qtXUaCQ1BkG7feBOg1d7ZzxLJdwtuvQaZPl4KXVQZa8uQFojRL
         NZdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pCo4/ZWHDniZZqUfBNdDsx+VU1VmvC047AZGLB/jtQxo/78mWLN6XsQiwG/P4TeNbriqQnDFikbgsgguTbusf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6Dm/a+h+8ozzdbkJjOIm7FT1x0f4IONcigw3puG3Y+2k95dU
	YJI5eiSFHxW8nMge7up7S1J9MZZ6Z2lfYrfTSiRKJ+CYfsFrj+rdghK/
X-Gm-Gg: Acq92OF48uIzLc9PFpFhSGGEFUeC1IIAUFCCoFQchpJ4mIyFyu5rrREfLZ875AsfBG9
	rQBO1yoSYiT3iLWQlQfMJ904kOHj4EILPIi7uZHVxpLqQRmGvH1Wsp8ma+9Y1eQilULUVh7f+bt
	dxQUmhVhD+xrTHczWjxIFL8NNu5faYKVsM9za0NVR6/sGhyJN52hJxGk9evWFm0eF4ty9G5SEQa
	jsPrbm6grBnw25okqiHMLNXKIdPW72shcerTjjviOq2REl3s2gkgqTJ2jSM1JqgfEFKc8lM71AI
	P/imRqaM28JPBSXo3GHdVEPl2Zzg8m6i30OQWAKabpV9qAvsbw9ipudWPGcjv0mWSe+nX6+CVRj
	Q0FHuC5mztf6E+b0GEcjG2vJ5ihAPDAGBkh1Z/0j4f6ZTGDIngJoP8UEyKLnWhqIurlANbLv76+
	7WDiZYF/rpXGnFFfvuZu9X9XYe5eKT9CvxY2FGWWxXcEi31fVso81uFyagpJYE2Bh/5qxzO+4Yx
	yXOduttvv/YdRO+bKRgRuPWSJyeC1vE+wz3s+GgcS4L6n2e
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr233896345e9.29.1780910656960;
        Mon, 08 Jun 2026 02:24:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm364812725e9.13.2026.06.08.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:24:16 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Mon,  8 Jun 2026 11:24:08 +0200
Message-ID: <cover.1780910435.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_022419_627916_4D0279E9 
X-CRM114-Status: GOOD (  12.80  )
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

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 716 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3


