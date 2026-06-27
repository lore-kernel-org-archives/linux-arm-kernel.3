Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA086C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qbxHK7uecwWqgUe87GQwNpPlZehyz7YstoE6aMIzcA=; b=FRcCMZSu+cb3L48wM0uAjOvCe2
	hr2EfOC8soFeOGGitU/L+BnM2PdN/tbH8TG+i36L4V3IWh26TR/A2DBRDj2d+EjdbqL81VihjnrYI
	jhY4rL/5Td8G/3BsHLIMMFBnbHWALN0ZPCfplm+h4TQvVemZOtGdGVCKShwA1xCkkI81tPoSVma/p
	SRkFwevdXAkpJhdw4RphXxb/orVFLwvqqcneG1Qv3a6OHjEVFQr19Gwb1GplLW9xzQS3bLUUO2j8e
	NBVeupTE9ra1a5ig5XN7GXoAwH8cjdXMwAoNJNNpgP8Zuh59dSpPh/o5/mUBoisy9f1M4GMBpcAEx
	qhep8COw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQFL-0000000CNJf-0gXO;
	Sat, 27 Jun 2026 10:26:47 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdQFI-0000000CNIy-2HxD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 10:26:45 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-13986d61b4eso4526921c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Jun 2026 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782556003; x=1783160803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qbxHK7uecwWqgUe87GQwNpPlZehyz7YstoE6aMIzcA=;
        b=iwF+bgCrpX0Fd/W+q/rOU/I9xkGTLUvrdlQM+OGVRMy90FLAzmIMxNZ/4c9pBpdEJw
         x8A4RvnzAwtdb4cwBw9nrf6e75F01Kdp4Tjq7hYBZoofz0lwU4xK+b9yivzyiEdgZ7qu
         rVFZdLe4djkYoaWSPPpSIpZclV2K0PKchObxbiouoyn6DhwU1SSG7Xc/+5oNnBHgseHe
         sjs+Lp0+2WI9wLMvwFzJ1/w4ctqMeDW20hrE7jPjM+cLBRsXXFoK9aBGwOh6w7d0dkV1
         TFyHPpwfRNIGyLkY/rU4JXXfyHiUVtLY5pIEVSguHbd0wr5iicAgowXqbO8QlGj0BSyj
         FK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782556003; x=1783160803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qbxHK7uecwWqgUe87GQwNpPlZehyz7YstoE6aMIzcA=;
        b=CNPzrSa5gRKO0juCKNw9iyWVXXk6cUvQydqA0W8Amj3DL3mW2VMGzaNKczns0Jt5ns
         RFMOPMMBvrjng6kDw7b9naNUz7uJmrxGBXyfzj+aIm7+V6LMRXSO+3byQ5P15PilJ2kn
         6tcFrAzUlRo1Lv2WPDpI2z6HoeMZBY3EXnQpyIs8nndoC/0dRmmc/8gcF+RKQkY/AMeK
         mBo++dptzQy0WoqudP3j0GA+qlTQW0LHB9BwaUKquVKD0si44MM8O1BiXKM6qRP8Urdz
         QdTrorr5adOjCgEA+DFZpmmIaKBYsrWeJcGCeviZLw2UGItVgnugmHFkEw+z/M/rAjZa
         93jA==
X-Forwarded-Encrypted: i=1; AFNElJ8DLUCXXi8Kxxqc/Almp+FUtIPfXSR8BECSXgzCuIIgtgt6LNijHtEA9Bj2dKdXPM/xUliO0Tw2xnWUqjKNgLmL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw64QzJVnjL26+MVXfgpQxavpP1gNb6YA0b+C0M2x4C/lYr0v+M
	cTgag5V0BUyDOWpdbjy1rhcG/pLqMopvsmco1bFWpupQQu6FtgY2tbH9
X-Gm-Gg: AfdE7clfY18YIPOxuN4CF3YMQFEuo/E/aSMkDMGwOfEiK7VbXqkRaZIeClemJFhAhGf
	E9RknfAnOsFWHxSQPX0ndCPZMaAklNbe/89/WZ1GQwHj//5zJo42KCAR61CyppJP11EJFSI0wI+
	K6JpZiA66ideVhmiXdE/3S+qN15FIJwVyInIQC0wg2naP9knybYA2WmYme4Zuaqun1xyCo2c42G
	3xDUNtTADt8IH4NKQKRqvSJmt0L/etHhoo02KpluVgfbymTAZE71kjzeCAGsr9DY2JIU3JKAN9D
	VOkqHLJF6c6zgBl/hfP14Mr5beDbGAbffULTXUfcxwiJr7/XvMJqPMi5EMpYkr5AuT0XsNZHOEs
	75D9BPnOqPe/GOnku10k4W5slU1YWmVuVH1Bu5x3f4hxB4oBpV4dUQnmupUZXdKISRGc7mEauDz
	GTHeko93n5gYGLYrBCBX0=
X-Received: by 2002:a05:701b:2415:b0:137:9ee5:2087 with SMTP id a92af1059eb24-139eb3fc149mr2286022c88.31.1782556003366;
        Sat, 27 Jun 2026 03:26:43 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm43776437c88.15.2026.06.27.03.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:26:42 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 15:56:31 +0530
Message-ID: <20260627102633.86222-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_032644_626035_DA753DFC 
X-CRM114-Status: GOOD (  12.14  )
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

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
- RK3588 SoC
- eMMC storage and microSD support
- RK806 PMIC and multiple RK8602/RK8603 regulators
- Real-time clock and status LED
- UART serial console and SARADC

Note: This series was generated on top of the pending Vicharak Axon
board support patches (v7) and includes the Axon entry in the context
of the YAML binding patch.

Changes in v2:
- Fixed rk806 PMIC pinctrl node names to comply with dtbs_check ('-pins' suffix).
- Removed I2S audio nodes which were unneeded for minimal boot.
- Cleaned up indentation throughout the DTS.

Patch 1 adds the binding documentation for the Vaaman2 board.
Patch 2 adds the actual device tree file and Makefile entry.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3


