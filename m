Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283BAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BEMZBBbJ1+s2eMLkCG2yBTAi95T3tyOqM6FbWZlEyc4=; b=vfJFPqY/Qpobj7DWvtvu3MfomX
	1xucnpSXdGD3cCR/hApFxWw9sIx4iUWA+i/3bdyGroSkEzcP9ep42plwau5zbFzdRXT7B1rfHAfVl
	2y+NUMeX/jneT660Os/iJLNOK9yHNAAltvSWLhMm4fwXWjZQR969Nc2X9qkavaYSCrBn74yCGJ/Q+
	IHrzw+fSevt8c2OLlHYZ3skICmU2mv20Zg5NpK22LAUuWuiwXS5yUdbmCLoZHj+hyz1uPYOdVGdPe
	TtSy2SQD9QH1Sxx1cCCLETCdx+73TkFu9oDieZj9FrDVFss88VJF0S5B6rXpIuXdQC4Z6xBDb8czg
	oWZPikVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKqI-00000008yEX-06G6;
	Wed, 12 Feb 2025 22:04:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiKok-00000008xso-3tGu;
	Wed, 12 Feb 2025 22:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739397768;
	bh=2uo7IfeiuOXUi0myVVwnmI+JmegC4mWq+V748nOaNYs=;
	h=From:To:Cc:Subject:Date:From;
	b=RwrY2tJWxCkgV7LvDs4ThiXuOybb7OsYoH8G4TA67PXuqzXDswZfaaA8A30b9VN37
	 DprhJ84emcYIM7VnkpHgI0cDNjohzqFNBCofH57DYu2sgepvTJunDoN3hf0qMi9rC9
	 s7RkI7pmeUrQ4Q2s15qK5elzbvAj65dODWbFCQk8amHzZTsCwW3N4c1v9DFGslvgQi
	 oEqLc3Qh657novN9qi8L17Zx0+TRm9gLnowfe4QuFizbIpVnb2FwPl5a2/zFA87mkg
	 3KuNgqaquA59148HTMB39OyNzXA6pYQFozmdoTKXCZB04wrsOPPOk13jpdE50jR6V0
	 MVDVawmnT5PFA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3565417E01B3;
	Wed, 12 Feb 2025 23:02:46 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chris Morgan <macromorgan@hotmail.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Stephen Chen <stephen@radxa.com>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Alexey Charkov <alchark@gmail.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/1] Add Radxa Rock 4D support
Date: Wed, 12 Feb 2025 16:56:48 -0500
Message-ID: <20250212220236.116383-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_140251_119427_FAC2266C 
X-CRM114-Status: UNSURE (   9.59  )
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

Add the basic support for the board. (Not officially released yet)
It is based on the Rockchip rk3576 SoC, so I haven't added the
following devices yet:
 - VOP/HDMI
 - UFS
as the support for those has not been merged yet, but are close to be
and I already validated that they work.
It will come with another patch set.

The following devices are supported and working:
 - UART
 - SD Card
 - Ethernet
 - USB
 - RTC

Stephen Chen (1):
  arm64: dts: rockchip: Add Radxa ROCK 4D device tree

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 649 ++++++++++++++++++
 2 files changed, 650 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts

-- 
2.48.1


