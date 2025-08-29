Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3364ECA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 01:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSiXnFNMhbGWyzrQUq1p1OLKuc73ypZQPHqffR4Wb5E=; b=f56zOWYZuopNMt/U7Md8ZFYaAz
	0T0NHJO/fEGua3QrmzgKjKY2xmLWhnQrpUC37MLQL1bNJXF8Xk4TLy+roXqRwP/uejexiNn/8QBCn
	HO0K+/VA+Gg7FoyfYk3AetmBTEQoJBfvPu5gkD7zXft3whA83mw1TtbS1TIhL0BxcFKBNM0Hv5Gw8
	lpZMRuBMCy0WJw2TmfmCmkfQOpmrmCBsiQoET7yNxRZSuqOeEXtzCunIVB1PFx35fR1uGlyIgizVw
	miwCFZdfqHl/aL/c32E+UQA9hggEv3CDVJIjOAWfIzYks7290W8A2kol56PZx5Web1lIHVLWwzTUy
	LdT2zQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAnB-00000007Isn-2PYB;
	Sat, 30 Aug 2025 01:54:09 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2MT-00000006Sde-3ltW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:54:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61cbfa1d820so4561378a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756486440; x=1757091240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSiXnFNMhbGWyzrQUq1p1OLKuc73ypZQPHqffR4Wb5E=;
        b=TOp0INjLuFLbB/KpXj75Cpr3cp6E1+XiMwpyMx5TEyp5ZpI0a2e1fVeqMga/x5qWZR
         bcJWLZ0BZ7YWcRMhtwXYFeelUJ/UqMoi88E/I6bCnh+LRR12ps+aG9OQ1jqe0CFFVf+I
         dYnr1kBCyrjck2oeOFHLDQiaWCofeIrGrqh/U6fSzdbGw6aFBRJEvq+XYyMFh7fiRgow
         ZM71apnWDhms2nOUxflYorPrYD+nn7lXzNk1AQGIbcc1h7/vs+Q4ekdfmjUCdtpdJYQX
         h2PUQJYQWk7ULFN7M/Ty+m9mzaHoL/u87Uoy83+bbhtKl6+/Z8U2nc+teCqe+X/E63Nk
         0F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756486440; x=1757091240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSiXnFNMhbGWyzrQUq1p1OLKuc73ypZQPHqffR4Wb5E=;
        b=dHPNTbOZ8sVmmA10ZSe+b1WTP9/WiXEmw7zhyKC6IYh1ZOhEv68Gcu33/pxaO95p1s
         2Lk4QUFSazOuK8E4wsSWjxVhTOcU+Aes/D34SaldRwmtve1tktrwcRsXrjpR4PfmcKlW
         ZQrzgr4VWN3oatKEWAvKjYCGfEG5Y+3cEtW/aI54gOIsT27oTC7qZVmUbazG7LJxA6U6
         uilGEf9zUg20ymkgXBAAJkUoR73bYW5OKIe2fQT2eY2ni2GAeloXJ/wopNj6vXME+ElX
         s5a4fFHejp0T9LZfoLPp4NqRGc0Cos0m8X6lqQ4YJb+2ohktAzH2k57UnrORPGLTNIak
         K8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBmaokEql0zSbau/NfmJTrRiSXEXmKhJFT+NnFLae+yXXodQHxlo6bp+rAxZaonHaDAXZXPnWzYfJ0uG5tcrHc@lists.infradead.org
X-Gm-Message-State: AOJu0YwbkphOrjJmqAJKLMYley5XCqjix1eX45Ybp/NH99ZHPYCMdvjE
	yRvWao711Ri/nWDMhJVQh7tzbhBnKgIStHcdceWaeVZ3Z4ulw+9b8AD+
X-Gm-Gg: ASbGnctgEXcYVPO/Tumkbltr8/cUbOMvtt+UUz3QRlCIth5F1IOMxs1CyxhXwt2k76H
	RhWgKlinu3+oHFsdAolumxdNhpydSBOOkEFLahxUTjKDd7toIDlioTuWEHyU1XM0oa+X8gf218q
	8jzu3eHE1RlRpsyoMlkQUnnTLPnzAiDNLqGiHjWKaTDUBH+tXpmLxHQU8U/3rsVUIZSjpWrkH0h
	uCKgRZPMSGQxR/ggGyHznZwcvBNB+D3V7vn3lpdxHMTnBFxbc1E1gX+NoLWXeF5bUOPwbMqUHzA
	ZODK/rVfHiOEhY1DV+3gkB1u6kEy4AfwaCW7lpSZc4Ma4mx7odEJNJyVIVy9iOaF0y1wTsHc67p
	8MIEB6cm+clS1iWIrFev5G+8zTFXbGVU8p9ovchPc1+vZ2OZhZu9z+PgVbmLIydQ3iIXehJyr9i
	VU+3T0pIHM1kOhS9bA
X-Google-Smtp-Source: AGHT+IHtrSLNKTu7xS6Qz+TQBOEpQiXNuNzq5jN5nWhxoEPMOUPi29C7dPZp8V5L6mpyiEmvm2PQxA==
X-Received: by 2002:a05:6402:5041:b0:61c:f91f:4365 with SMTP id 4fb4d7f45d1cf-61cf91f52f8mr4225211a12.7.1756486439709;
        Fri, 29 Aug 2025 09:53:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7848sm2130350a12.2.2025.08.29.09.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:53:58 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Fri, 29 Aug 2025 18:53:16 +0200
Message-ID: <20250829165327.20007-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095401_935938_42E282D2 
X-CRM114-Status: GOOD (  13.39  )
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

This patch series adds support for the Variscite VAR-SOM-AM62P system on module
and the Symphony carrier board.

The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
peripheral interfaces. The Symphony board is a feature-rich carrier board that
showcases the SOM capabilities.

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern where the
SOM dtsi contains only peripherals mounted on the module, while carrier-specific
interfaces are enabled in the board dts.

Tested on VAR-SOM-AM62P with Symphony carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
  arm64: dts: ti: var-som-am62p: Add support for Variscite Symphony
    Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 500 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 387 ++++++++++++++
 4 files changed, 894 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
-- 
2.43.0


