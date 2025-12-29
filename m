Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4421FE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wHEN0giZ9ctJ3eXe7pXHVE7NUCY/SFiNC6nnXZg3quQ=; b=WgxA/asVPVNU8bAUB68E7sxvi2
	rA+ItTmSp4Xg0oN2W+w+8ZuddgIF2qjG4ECCl0c8elbaV6nr/6h7huzOpZabwoYR1+25ZUBMxYo6G
	kfIRwQw4w8buPdCMPMgmRdtqlFb3bhje4ZfzdHoDq7mF27SBd/aymcs+b+LpaR5F+a3Y/2feYfkQm
	+i4tq664R30kPLcc22gnhpRDz1POlHmCx0gP/s87MGCCWz5D+VWae5s1Bh51b7nj6U8X//7SDScCV
	Z8QyWsFJQQyvDnwwKQIkc6No+/7V3uvkoRVoJ9fv8UCznYdulIATYjqDiLHdZmYVxAqBeJp9r7yA1
	7cyKZcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEno-00000003ogz-3qX5;
	Mon, 29 Dec 2025 15:04:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEnm-00000003ogX-1Hay
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 15:04:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1132327f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 07:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020692; x=1767625492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHEN0giZ9ctJ3eXe7pXHVE7NUCY/SFiNC6nnXZg3quQ=;
        b=HCphqswuWb/q69jEKt3ZCGxcR0M8YgVkxmLdRolFwK26g6kRAe5vduVrdzE4OcqP9z
         RcUgxkw/q+eMhSB35a6NykTvrgdEXqbiFZr/tZbKVBL1ZS7fmPmYb3Hw3emoifO4mA+I
         Ek8xQETCi3N7EljzEz7bwJjwaIkAHJiK3uG9MxxHasJ0bzS112jbTD+6ymDJ3a1U0rcg
         AkkX7NFmO9b4k16WhWtd9NHkrtBpHPio2LmZLMpGgS3oJY1SQLjb+aWCofkZEw0YdZx9
         5QXn+ARdgR473KDCsGZReLLj82ymh72JrGzHaog2eDQe3ABEGTx2BT8QfjBpZwasjO54
         dSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020692; x=1767625492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHEN0giZ9ctJ3eXe7pXHVE7NUCY/SFiNC6nnXZg3quQ=;
        b=tMkfXmigmTDkCJv4uTyb/Ecot+qWybsVCe4sDVImDFRWTN7DNyARh52hPE3H9wL4P/
         /RfOccIN6/59ZPA5vo+dXEFciJ4oiLYA1nluU0Hrba3VnB5U32KG/0E1TX2xCwPN+kkR
         nZuxcdNFh0GlbYfO4UeFgZp2FXWoKs4y9T2GPgGinLhfiCCGgHWhob1UCz27DFjegwGI
         omMKu4TuypKqjaiqWF6DbJ2qVSLge4uYsfTC//OaZEKpGTLa+gOOEUNWnyN1RsOTXdvT
         uxZO3vOU+pWik2K6j5jun11FJGtFHKSYw1qiPsoN9Dj/HHxOM5Y9NQIiKY6FIfAH97km
         Ctyw==
X-Forwarded-Encrypted: i=1; AJvYcCWwSVqKGtbyRNaJzhp4CU6iennX1ShsYEB57VfpblB7nZN116lpalg4tauQkBx/Rzdw0kK5PP4RBJjjIoY8RJlM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3HwT77DJC2T5XYDnNGXlVItut5KSs86BQsISSxtUf4ixNC7W9
	W0jSHAxbfzb+KgKs4LMWwc5/fw7Nx4femVcRbhWXKz5ejjILhxNdGUmG
X-Gm-Gg: AY/fxX4ZaKuVI7iXj2Zomi0XEmklDNdTvzifRP5PAPbGWDoiTt0+0yX06ZAr/e162Kq
	qx9G3l9VtC//EOJEjPGoevWlGsEiKZkFmT6UE3Ye2INFxGt090fiVdvdfR+N5Voc3jFVUc1wbSz
	uAX0/RGaH2de1nIzS0GvH+xeBWvqdFAYGQGUxZvG2y099WowFyRGsy7G6Hck+/UOD77S5fGgoRE
	YrIIzT/XpwouuBtNn8qvx7rZITlpDfgODeZEZ1agqqhM89VQch0BCgRZP+u7lTWDI5Iux0OS10x
	ZXhsiAJYXVkBQaTtUUumg8vP1BN7agEu2hJqqMKtCqrb0lnivkQ+6z9+LOUM5JJw4aDRgshnmya
	5jd3AX8cD2EGmhQ2OeLtkkM/EQPk8G13yeTr6ehztPfjA57dpmBiM1i4n9SNxJf8P1/fSUoWDVX
	c2gtsCM8KOuaEQrLM2tObQy5IkFy48BW3P2Khg6UFsjTJeQIJG6dkFWJaDZ2TpKChy14l8dmnTQ
	cTVLK+vaZlNuskkbBDF
X-Google-Smtp-Source: AGHT+IFYl+a9l1HFC9fZU6kSuVFpDYvy7t7ogNUxGwrhMkfCrZCdqiRvwnzBMD8/3Q77QJVIhjX1uw==
X-Received: by 2002:a05:6000:26cf:b0:431:a33:d87c with SMTP id ffacd0b85a97d-4324e4bf65fmr42256380f8f.11.1767020691618;
        Mon, 29 Dec 2025 07:04:51 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm52899902f8f.16.2025.12.29.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:04:51 -0800 (PST)
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
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Mon, 29 Dec 2025 16:04:08 +0100
Message-ID: <20251229150421.57616-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_070454_365226_3846C6B2 
X-CRM114-Status: GOOD (  13.02  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

This patch series adds support for the Variscite DART-MX95 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX95
  arm64: dts: imx95-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-var-dart-sonata.dts   | 588 ++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 462 ++++++++++++++
 4 files changed, 1057 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi


base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
-- 
2.47.3


