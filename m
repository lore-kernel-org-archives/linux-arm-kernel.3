Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300BDC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7bEKQGHUgc4QA8xdZ13jzbjLw4qQ92cli3uju/L+EgQ=; b=mADPZddW9b0UsCbEev8WrIXxUv
	Rsyqa6yafDutRF3CaUBCygiVZeQCV+lDYB7WpK0Pil51F0y5xWry1+EfDgdM1KoLohir4/59Sftef
	wc+lD/T/KW3QrfdsNMtkUnVaCZG0hq23sX7RAWsst5MzwMa/s/PjcHjkosIlSG6A9ZcIIZweAg2sy
	6nMjbWWBOf+tTQc7RQ+jsFF8TGe8iWBphNa3KyGmrwK8pPnlbVveCux+Lgm2wxpP08Q2OoWVKG+7r
	ZluGybHS//K9+oisTdfm9EvRf3MXBD33IIe11QEthetFduBB6PlhlK8+Xv9Vwpm9cJ/4Z1La+EUWv
	2SmkZ4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIPB-0000000Grft-1UkZ;
	Thu, 16 Jul 2026 09:29:21 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIP8-0000000Greb-2OUq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:29:19 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-66804667af2so2656862d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194157; x=1784798957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bEKQGHUgc4QA8xdZ13jzbjLw4qQ92cli3uju/L+EgQ=;
        b=YLfE4jpl/PjtWeZyDZg7HUwGXW0veSPzZiKgWBY/0SoBs9FMUTgeWreQGccGissUmA
         r3Xwq9PkyHsOnh4LiA70CdpGjTmNgZV9JV+f4PAAg0Zpb48yVuqbI15qErBwlhkeV0bu
         bU8WhggWu7tDLd8exsQnBx9DTW6UqzgBlb+zR9oParTnXBdweJqd8Ev4EHpXIIAOHA4d
         KxmnYLJm8HcZe09NsGkQhVwOKyUPuqSGT+cZtDykwl3E/4z+Wx5GtmR+6rDm1/3+9/VD
         w3ydlLLu6ODgcD/WvZfC/OWc9ORPVgCdzSPqi9PUb9KfQ4ZTSoS21aweuVUCbMisqWe8
         OFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194157; x=1784798957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bEKQGHUgc4QA8xdZ13jzbjLw4qQ92cli3uju/L+EgQ=;
        b=I12a7+H9LbVM2SY4UVeDn4xJ79/MU6G1WWUHQu1OblM0nIAnb9+xICQ3DmSIiK9BVB
         sC6GlGbsoTikupSUSLZwelKa4cEWDdd42cQMTtKMyZGBxJVeIuLFGTJVgOM0yOLKu7Ck
         SoJM6C8mK9VHnzrdDLUzyi0NWBTYCsfB1h9MBRpWGG5o8k20yYrBFKqT/bGwc+9Z3htj
         oOXjFckMoKq0oZMho2KbUGu4PNpUGLM636qfQW6I7NHiJ8B++4O+4HI4ouWphvEkYpia
         fmx7/Ar8F4LI5/7pQgjOHu6hmK9k9+zPLX88oWPCQqP1MrhBWGYzDPOxaS0pxwepKcF5
         jI+w==
X-Forwarded-Encrypted: i=1; AHgh+RrbeBImPl/SiEOaey1Rzme4SHwSnNtSuct6/5rdGNq7f2o0TDRrO2FGC1XkFDf84MSBysD40/aVAI32qYWKqRkU@lists.infradead.org
X-Gm-Message-State: AOJu0YyY6e3wBRee8brUqLmO/LAJuMrXW2wbMHUZ+jykNwKWUVgUxsLf
	rnvzxfpABh9UuyaSevjmf+JZtKnA4gAs93BwjpU4evtIZkPzN5lPDLSc
X-Gm-Gg: AfdE7ckZRWOQ4PHiPNV6yiwQUPsxSQf1wSq1eagYJD8Gw/s0F/RDoJn/d72cYrLO1co
	JshP0UVPmnzc5EGLz+/fKoRPLTE29fSX1k7yJ3R+M2MR15UYB+bnCPc04KptZVT0ca9MfflopqH
	aIRuhDMF5Mbo0g8l7luIPkEr1BTypvpHo5p3ZsDOCdlUvadk29LS3ZjdABbn8cpN5b70O868vAG
	duelVgrvE46YJJ7b+yzIfek9uiPu8tt+TTWLIeYxVqZ6kgJe5xA2TEPDo3Gipq68iTdFz6/d6Vf
	/Dq3Z+wnLgotevasJq2g1gIR7XNdndIdcB4NUT693NmbJFiaKYo0vNaUMG5oeW/6glNFQVDaCYU
	U8hPhx9QKhWMNmcNzVsNfE2dq8h1HUalas8a8Icuats49kNrcqFOVhZcE2q14MbCWaNQM+qOTP5
	nntD+gwVsqMQ==
X-Received: by 2002:a53:c053:0:20b0:667:8b90:2eb8 with SMTP id 956f58d0204a3-667d7f48184mr12002616d50.87.1784194157327;
        Thu, 16 Jul 2026 02:29:17 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e950567eesm130241807b3.13.2026.07.16.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:29:16 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] Add support for Vicharak Vaaman board 
Date: Thu, 16 Jul 2026 14:58:57 +0530
Message-ID: <20260716092859.512306-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022918_610147_3E1C17BB 
X-CRM114-Status: GOOD (  10.60  )
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

This series adds initial support for the Vicharak Vaaman, an
RK3399-based single-board computer.

Patch 1 documents the "vicharak,vaaman" compatible string in the
Rockchip arm bindings.

Patch 2 adds the board devicetree, enabling the RK808 PMIC with
SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet,
eMMC, microSD, SARADC/TSADC, and UART2 console.

Tested by booting to a userspace shell over serial and verifying
eMMC/microSD storage and Ethernet.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman board
  arm64: dts: rockchip: Add Vicharak Vaaman board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

-- 
2.47.3


