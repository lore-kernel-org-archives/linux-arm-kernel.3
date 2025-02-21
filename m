Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9104BC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7RHCIXkAEB3Q6gvisTKmVhU8q9lDZL30dJeI5tINmhs=; b=1rsSf5nNXpXyx1t2APZJ3H4yCb
	0aRRbJaNjdB1rXqkQY7YczA2hlDdzOHL8ijS9UTtIm1LMgqnayTpsohe7mNHbpwyosjsqjG4FBEnb
	1dyfbe7VRHjzeWp4uGkbhF/T9OkIG8OHTQvx8czn5mee0ID7dBX+Et5mJEnuQJkTqrMOjrJWBMUaW
	n0WJX8MJx605P9aDJuCZgApwFvZWdJnsJq+9wNoUfeluuXp0rm2sww6Jufr/S2iZmrUZzjmM5mK09
	RKMA+QfE/Qqeh1d/9wnvaYxLiRLAJdhN99dMopsX/Sfbr1iNIi2EmCQ1Ugbm704iBzcQmGtphMuRa
	JwdWB5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVnk-000000069uH-3Wg8;
	Fri, 21 Feb 2025 16:22:56 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj3-000000068Ji-2Ji0;
	Fri, 21 Feb 2025 16:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7RHCIXkAEB3Q6gvisTKmVhU8q9lDZL30dJeI5tINmhs=; b=2hls+aUoDtpBz0zvI2ZI+E++3Y
	2siSdOmW4PBTuCYqdXDVDUjQQzkZolBRiM/lcNIyuEBi3qoke0fXe8kGHUj0EXivc5mMo90iPZlOj
	UugrMUSaZD6WPVVUXYBxfZ8qRsQpzkHGvN6lGAQVlprOSt+fsD+ZFLtNob53O7VRou3OqBDqpToaD
	O3Lmfdm+LI+F2GigjHqX68zctIEpDRVm+PgNmysmtiegJsoUH25nBghgwpD2+0aKgU5q7WPMf0xpv
	OLkrjOlqMvbx5EFFJlFxp5sAIQKRbDi1NJXVyvPkA9JrUsf4gM3A21nFS/uNLty+KLTvVlBrRC7mA
	SXhLlq+g==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlVit-00AOLX-29;
	Fri, 21 Feb 2025 17:17:55 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Date: Fri, 21 Feb 2025 17:17:46 +0100
Message-Id: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081805_743892_C6F7D6AA 
X-CRM114-Status: UNSURE (   7.98  )
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

Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
PD0..PD9 pins are used for either DSI or LVDS.

Other than having to use the combo D-PHY, LVDS output is configured in
the same way as on older chips.

This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
is then configured by the LCD TCON, which allows connecting a
single-link LVDS display panel.

Kuba Szczodrzyński (5):
  phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
  drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
  drm/sun4i: Enable LVDS output on sun20i D1s/T113
  riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
  riscv: dts: allwinner: d1s-t113: Add LVDS0 pins

 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 10 +++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 40 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 65 ++++++++++++++++++-
 4 files changed, 119 insertions(+), 2 deletions(-)

-- 
2.25.1


