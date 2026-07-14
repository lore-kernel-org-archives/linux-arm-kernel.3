Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rCH472Fm/tovXRRz59mCJ5fU+hD6fMIN1TYNRbso0Bk=; b=k+RyW1ptvkAvIUSmllmsiYv2Md
	kiL/mvUkA8HA9y5oLH22SqSWaI+zMFPGB5pYqTCorFgy/Eclyhrq04QbjOWXRCxxqpADdGVMLDX4U
	+oHlpv2HZjEyL/L+uP960IdQFCMKjXinCRHZByOH8zEC/AtRnNbrGY8azjcuhxOASagEexSemjWfd
	Y8FdVvnKYFY2kkrT9aRgbDLEXxTgzOSCqW+d9dEo1N4uew54cq93RxZjqtbO3VEjRiW+YaTNHW5/M
	UxU+qAHPLfBW/9GoJOnzGNfgQVTvvdyGhhgjKnUff1O9dTFbW/KauC1kPaRj/+0F1h1YT0takCcnq
	SQdqk62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVz0-0000000Ayoa-3cXr;
	Tue, 14 Jul 2026 05:47:06 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVyx-0000000Aynv-2qax
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:47:05 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3137706a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784008023; x=1784612823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCH472Fm/tovXRRz59mCJ5fU+hD6fMIN1TYNRbso0Bk=;
        b=eG9hv+LKNDMPDXM9qlKYu6dACi8C8GmcwVr5b3ZNBX8Qxh2qqovZDovEQPKhUHaRTV
         ZoFg7xlTe1bUnseyDwn7Kn4s8qDLH1srWHQ9tviKZoA/GXGhlzzY8tpsBZkHzo+n1MN3
         6Ppxr0c/HeSxpUPAemCPSqSJusTJr1LpFNLcTocl76V9jzBpRoQEzExuHwwkkXLSfA7h
         xi2gSk4U7xI9+KDydPbZSt9z7kTINg6Gm+uJQ2Tgz6NFJ/Q4UUEYDkoEHzNwdr24tdeC
         SrvYNLifO++wjj39IN3xxo9+emSaOrA36NQlm9T3f8tkz3KgmSbnayAnO/FM6dcpFNsB
         CRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008023; x=1784612823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCH472Fm/tovXRRz59mCJ5fU+hD6fMIN1TYNRbso0Bk=;
        b=EBp/jdQD8oZr5d8fulVuSPtCvdvyb+oUAjyubEOkwt6Gek0vNwCHEoPWLY1MS8xj/u
         BWv8LyRXCcLQO8PF0UKpvioUjwtnwRd9EGGwyNPaGWHKRwFJdhcKCauh63PRBwKICwkY
         ieyToo/5mt569txHHaZ0tmGA82VqI3afs9pK5YFz6NxKw5UorEVcQ7cO0DjV0eijUvPi
         2IJ586Q0WNGNNa0l3CVQzPCyBCnV7li645FsCHVc2su5PZ9BYXQmvnBBXepFMbZBIbHD
         RNcoHKgePSx6R9d+9n2jECJGmZSh0qw+jaiTmir2fy4RAH/D1e7GxU9QfDwG5Ds+CNp1
         Yb5A==
X-Forwarded-Encrypted: i=1; AHgh+Rqm0RnPawIxfQohty3sg+NYotBCges+QHn9h45j8/0Mj8Ml1Yi+UDE8cdiRllkjClJ06B4oxhtoJr172Em5u8hO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7kIYmIf1WanLk4IDcGM6Oo8igPQBqoRidXOor7MFaCXkE0dmr
	uzFNGhvWU6YpKsOnnhZBQDXsEfMqS+799rR/kcXiTlcw/AjkeWwC40nz
X-Gm-Gg: AfdE7cniZBsXTFbyUmsdqFg025vPfMNHPWhdQBAgw4bAiBHXVOp0sVrdBZhtbi0ETCq
	qU+yVCYc9YWlwNJz6IaB7Xh7KlDNDEJgWwtMkKKXhVeTEfhgI3oFa8mzbbmxpt6w3xteQ6eoBJ3
	E9s+F8GQuhnAjOXpiittHuKXmFZzQ0i9tvoe7KbWUZDVtqB2Y4Si58XvKaI/ezKwrdWk054dBhy
	4p1dP/bW9JzafuMFF+jwBVeYTlUtAYxahlCI4k+KwbcMVlaeraX/Ca4AFfhrQWAU4xJHgCQPlQR
	xrsGkzpoDj1SBAIcfLUeQmJaYsFOFQT3V6bTiL7nud0AWTbPbO0BSLWA6+ferLMAkk2+DBTyZD+
	3qKNNJ+n9SHPRXtWvexR+wKj0kdI6gXDJozF57i222uTD+8z0pUl+5UY719QGp5N7lSipYOzXKw
	r63atnQO9VC05yuljRvdU=
X-Received: by 2002:a05:6a21:730e:b0:3bc:5235:f386 with SMTP id adf61e73a8af0-3c35741635amr1111837637.32.1784008022663;
        Mon, 13 Jul 2026 22:47:02 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483dec6sm77965054eec.11.2026.07.13.22.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:47:01 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Tue, 14 Jul 2026 11:16:51 +0530
Message-ID: <20260714054653.266842-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_224704_067923_D8F75E33 
X-CRM114-Status: GOOD (  12.35  )
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

Note: This series is generated on top of the Vicharak Axon v8 series.

Changes since v3:
- Removed accidentally included unrelated netdevsim patch that was
  sent with the v3 series by mistake. No other changes.

Changes since v2:
- Moved 'compatible' before 'reg' in the PMIC node to follow DT
  coding style convention.
- Verified with dtbs_check: no warnings.

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


