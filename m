Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F9DC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=; b=Lu46nJq2THLfpT
	UGOumPNvQMmynDvts4JkzeXL5OrH4a1WI7EqREizLeYl4FtmtRQXmeDkJPhz+/RC9UHWNBP5eWfbZ
	ONXMMfl6QfQRczxnY2r/JNHG4qrkRZ8M51H1lQO6EBVqyVikjaQO7XKoInTCupYRIiDt/Tmpv2OWL
	tx5hkFW4w1LH06g5LHHyGYDluhNjn6xjURqXrZUck1VDWOIhK1ICygPLxHdHa4sbllJ329C7YmpKF
	Ns30ymKEjG3nz4VQCtrEVXT6Vm7TfZlwrsehtv96cShW79fbyYQAh0VM6KeCPMPFRRFt1xoPrrDAO
	wOMS6JZVUuuDfv+/y2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8m-000000063Sq-1SSR;
	Mon, 07 Sep 2026 06:47:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3T8c-000000063Oe-3hxn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:47:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-482f9309813so2762990f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763649; x=1789368449; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=rno1tZznrcSewWNJj7wFk5x4pHLC731zamVyGbzmMA8ezcuSE84PonDcceudZiA1Z/
         9RxbWQP7yyWoKjjeklBGPOdu47P930sZarU37DZCTezhMOivDq4n7yZiAfJR+YmnO3B8
         I/kBeSt9NP629cwBJ52rk9dQ0bfb1D0LF0AcDxKvn95iCRRFZ8woiAhHuokcGv0+hf/y
         hXKZEO1VnfhHV/nxIw9FGP7Mr5bRJ37+jrt8jCfHTDKR24Dl2b5lYB4u2sbU7v02Y+fn
         JWaBEMf0VZJ0e230E2aYThNq9rIfKm4J/hYx+ETOQoCaJm/tkHSa8kZHZwBdDAP5CAuK
         P2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=blpb8PXyKdP5yBOurmja5k7H1KjfYjuKRdsFiD3iZagWgZXWjD9zo/OmLLw4Z2btvp
         q5KTWVTYKF2oXjyl2RCVNJb546pBDoDYj0Ox7EXQyenznZtZLzzZhRBHBai/4PHubbf9
         NRC8GfcnWVIaHiXD5WNfdo4y5dvBMNexRXXjZChLj0sWIgHX1EI2ES1jKFB6RDB9dNaZ
         6V2Um5J/asVrF0sIlCDZRa5YnQczwGfO65+O8QZzCcB6vbrg48nuyIciCmTJfl5bJ54u
         aoCdnbGAuFP+AA4wdy5vqjr3K+shVQlm698I5aWOSBt5hTXJBPZxtnknrfiRMlSRULtE
         efiw==
X-Forwarded-Encrypted: i=1; AKwUvBzaOjTPuQBwQmb075qZWCH0T4CXe2f1h/Gxd2FQS1TgczKdo5WNQXfrvzWq9PWkOMW00dM78oXRGM8y3kHHtG0m@lists.infradead.org
X-Gm-Message-State: AFuF++n/wgxgfAmG9ivtrTQULXFcfWQ4pTqF7l9+g8QnOJofesUB/KEg
	kFeuC29jSNKrNIhO7h2VMrsfsl1mWSgPbCu4UCfgJ8STXuRoul++ECEE
X-Gm-Gg: AYBFou1UFDW+IM1homyITrgcU2fKvO4QaXuvVxp2Xf0XczevbHxavAfMxJ3hO1MIQI9
	yshVtXNypvNg2I9YnuxhcEzJSb3jIfaq98XkEvYNvjZhaVoXcGZpnyX4D4x6pZn/YFkNIHItN0m
	R5S5FQYqwYkqRQkD/0MO8r27qwpU1Yc3DqM1vFB64yLEMlDlxmG3TLLGgrHZRMO4pggNiGf5kpM
	DKsf1oZC7QigZDKgecF8xEfmSaCXFaGLApxTXnGxN+0GlgAGgjhoK2fsme8EmGbz7f23IJqUF3m
	cem7JtZuuV29MAld+D4lKY4bn8fGGO2QlyjGJwZQtRp6SqNa0+5K5dZPld8pNNPRCc4sJXLvKA+
	ud1Fnolzun7seCPCe/KY3NVKfakF13xMBdFuEGwUj8nnbeq3yXrtEsyUDh+wdBO8YAN0MGMPfMT
	3YzJS7UOLMWpYHhOb3Q+1ayBodRKFrfuUSGOC6j+lpwj/rfRjVJJCMORRc3kQ78TzXCrvc9u067
	O6MMzxCD51YAbVR6IqNlpNHPcpbjNLMt62xIaGC7widEH16r4z2wD8bAfFloBRdezBGKwroxrI6
	F5SpNrmO0qXSEJa7nz7qI6S8weVQLcTIXNhufPQurpIdFFR1
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr208334755e9.4.1788763646919;
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Mon, 07 Sep 2026 08:47:19 +0200
Message-Id: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPddnmoC/2WNQQ6CMBBFr0Jm7Zh2CBBceQ/CoraD1ERK2tpgC
 He3YFy5fMn7768Q2FsOcClW8JxssG7KQKcC9KimO6M1mYEE1aIVhMoY5Imjxtn5SNiUVUW1ank
 gDXk1ex7schS7/svhdXuwjntmN0YbovPv4zLJ3fvVy796kiiQFElZtqZRjb7mqTK8nLV7Qr9t2
 wd/n0NVwgAAAA==
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_234730_950887_9D6C9322 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v2:
- Fix node order on the imx95-aquila-dev.dts
- Link to v1: https://patch.msgid.link/20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com

---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


