Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3zujwTDTSnOftF9d4bbs2FCsfJL0He6fFCsD1C9TNw=; b=fTFfdDIdNYhGa/7UN8oY54B9Vl
	kotZqdLgQrqfiJ9p5xsdU7fp1hKUukczv0BCQGfJ/TpmS17EOkepxOszGGG/82e/DS68tf6HDBgk9
	msXgCDLmSaP8ENMyfLdsh72yHhiP1HrogZxbgU5L3S1yY375TV1MvqZQ857/Gp+1e8hr70Gc5ivEE
	Q1SH3/GLA0VR6djSvC0y6Zgui7LzFqeZU7B22nbAbu0XrOJj4XpPim4IIcL+RUXsAb+piBBfJMHrS
	aYrRiS6caCQK13uETgrn1GldgPaZ9cRvCRArWeg+WdCB+YAGwTig8x/igXN8wVfj3GEczMY5blHvA
	YfjDOMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUo1-0000000Dpol-2AMS;
	Fri, 07 Mar 2025 10:19:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUmO-0000000DpSD-2C9V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:18:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-391342fc148so303850f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342686; x=1741947486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3zujwTDTSnOftF9d4bbs2FCsfJL0He6fFCsD1C9TNw=;
        b=BTXXD8yqY1t1cj5U1SmWTBv8DlvAiCgE+zDi1a0yR5hmfHR0amlM0oWnZTHQH3BR5l
         Ktk8zLArCqg3Sbn4J3Cm0byLP6IyuL3vbQcsWHasQXDumVjcIXYkT1u5ZuKE53D6C/JO
         HAY1on7wi+uo0RZrdjqlghXj9Tb0cTOKqNpVeBPAcH40JwKF0cY+c3w5pCkbQfHSkURd
         Qm7sygTygH58o5P82wByCi52xhpy/k8aehCZDMwJ/jjJeHSn3FKHkenSEnKp8x1eZLGU
         CmVwikmH044CMxWEkjGQpXUMgPxEg/jupReQHZopLM2UorfCp8mh4Ql+3nND/C/4wFZK
         +csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342686; x=1741947486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3zujwTDTSnOftF9d4bbs2FCsfJL0He6fFCsD1C9TNw=;
        b=hQVA8jd1z4uKhDqsRbYmHl0Serr6YXoZFInZXEvJltrYPD9NQeqOscruswmTcF3EzO
         CsXuh2BOM0FxEFVGvqnzOuw+sMGjnY9pATuC/uXQuWoDEcSkpH6b4VXs0TvdgwnBcQwO
         27UkYkIf34ZDgTL1BWvrMJmPfzDKmxpEzvYsdFopHlQ0+0yxqpNwowiykojwTidYAJD9
         5Brdq1XH3HMqdTL8EhlF2oKbjuJmRg43DFvqj/HMZR4Vo2q2ZsxLy4VXqO62vXpaf/EU
         BfhGiJpTLa8t2g1iNWP0NofMhZb2rbdMbcpMhYT2UeBzvtXmcXVjng0b8DMES07mJB7a
         oh5w==
X-Forwarded-Encrypted: i=1; AJvYcCWOkT5VfSWaL1FSy+AdmjXIi6AriuE7sXE3323SHEggZ8tbNbdSzAlbhqWryqGijfn1wWyc92sMZWsjLto8Fz0F@lists.infradead.org
X-Gm-Message-State: AOJu0YyAwzrJw8Liv71n16NjkUsl+GoYzwgjIGbbVtOSPWafRkRdqHs8
	25ClPoIOiFZOSDe71KQcZc1QuQgnCG+6fyuG0kkoe7pbSkuh4+vC2IXphZ+O
X-Gm-Gg: ASbGncsgVECOW2hejnXOFiorqXSJKT5mDieY/VF5ozYNK+YR4EwBha4/l0/tBg03cPJ
	aV8iK/1OAKv0fZuNyKXesbTEW74/Dyqc7itOVD6zog5lXGwepYWgzcveV0DdR25k/OSs6Wdh9pN
	9iHqaSaIzxGvsNupxMYUnFmyFinhcf3NEvRE5IQzbGw6Zr3Y6TKezHiNPPFNZM3ZDmAmWU8UMhc
	py+WseoeECPAUAySOOmDEZRtu77HYw4HIq+YdbD2UkD9M/1KAsA9v6S2IGQJQwfZO5PLyrel0xa
	WD/tRap6xysWTR5OwF75bnSHl3wlvTwf+czzNxI8c6qHPQ/l1wSAwmu0fNg7EZV2eDnJEr5FEin
	ZOXhodo1V+xdqKvZG2s8y81E=
X-Google-Smtp-Source: AGHT+IGm5hWJ5tWDkJ/PuMrlbEjX8ZelRicivEZmMFKj0WGovJlJZMjjCvPcqwJRfFTKZqrD3ik87A==
X-Received: by 2002:a5d:5f89:0:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39132d671b9mr1522906f8f.1.1741342686055;
        Fri, 07 Mar 2025 02:18:06 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm4900262f8f.94.2025.03.07.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:18:05 -0800 (PST)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 0/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Date: Fri,  7 Mar 2025 11:17:47 +0100
Message-ID: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_021808_560635_356280A3 
X-CRM114-Status: GOOD (  13.69  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
which is EOL, with the TLA2024 ADC and AD7879 touch controller.

Accurately describe the new hardware.

v1.1 of these SoMs is still described by the following DTSI files:
imx6qdl-apalis.dtsi
imx6qdl-colibri.dtsi

The STMPE811 touchscreen controller is no longer disabled by default.
The STMPE811 is self contained within the SoM, therefore, disabling it
is not the correct default behavior.

v1.2 is now supported by a DTSI that modifies v1.1:
imx6qdl-apalis-v1.2.dtsi
imx6qdl-colibri-v1.2.dtsi

For each carrier board using these modules, a new DTS file was added
that includes the v1.1 DTS and modifies it with this v1.2 DTSI.

The original DTS can be used for modules up to and including v1.1.

v2: Fixed the "From" field
v1: https://lore.kernel.org/all/20250227170556.589668-1-ernest.vanhoecke@toradex.com/

Ernest Van Hoecke (2):
  ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
  ARM: dts: apalis/colibri-imx6: Add support for v1.2

 arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
 .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
 .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
 .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
 .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
 14 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi

-- 
2.43.0


