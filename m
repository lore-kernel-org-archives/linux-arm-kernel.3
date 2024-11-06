Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D01BD44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ta5KNS21UEn6OXLlp807nLSpRRb7UzRnrUsb9sZkcIs=; b=gQpE6d4rw4JoZqnU/OKXLOMr/n
	9L/MyUnw48sAEaHmA6SbHIu809mWfB6toVC+feyp8Xh8ix43FtLegIu2DFIZGG2zfgYMRzDdxECFd
	20hR0qcwzeyr1YHx7wxnIf6xTgjpqLhCykgJdFA3nXU1x8imFCL9Qe98r30gWhwZtcGpD1Lk5wZUZ
	qnThaYIaUdL3TnmulL+VF+PNEZw944Q7Lz5VZztM1uQjRpmmX0G2KjzdQsxbu4ZvQDfK/LmUp+tMA
	BNWEbNitzWgcxprJSDd+yeScBk5EjWY4kaHv2kSlxZho0JbdMjNM9rLY7uUTxi16X+mUkyYMN8Uxp
	T+XFHn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuH-00000003NV6-3Avc;
	Wed, 06 Nov 2024 13:17:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fIX-00000003F80-05GP;
	Wed, 06 Nov 2024 12:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ta5KNS21UEn6OXLlp807nLSpRRb7UzRnrUsb9sZkcIs=; b=GMXE5ianbRdR/UjEa6+5nNK/8X
	DmuFbVFNKg0C29lqCkZwI6X0pXfhZ8jqcJPmaKgF5Sm9K6aoBaJdbkF9m5b00hhUlgBleaSIwFGvq
	XXmBDEkM1vursvBqLN3SvOKu11KOY9tBu4tFkXYrSLDqUEDD20joQYNAvJkXaP98XMAKJAtOzBAmY
	++0J5y/cBmBY8mW64OYszATX0FgnUsvvG249uG9Rh070tOJDheXyMrizJ1dq89+/m/Hn10nR5iy/N
	ajnDT1lkTFmPaVdpvbhA/AMgS5d0GsYqYK5aQHrengHvqnoPNHFvgsUKw8IqVr515zFaemesZUJkg
	XjCYtdPw==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t8fIV-0007A8-HI; Wed, 06 Nov 2024 13:38:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: rockchip: add and enable DSI2 on rk3588
Date: Wed,  6 Nov 2024 13:37:55 +0100
Message-ID: <20241106123758.423584-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_043809_255539_3F3D5F5E 
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

This adds the dcphy and dsi2 controller nodes and adds an overlay
for the Tiger-Haikou Video-Demo adapter that provides a DSI display.

Heiko Stuebner (3):
  arm64: dts: rockchip: add mipi dcphy nodes to rk3588
  arm64: dts: rockchip: add dsi controller nodes on rk3588
  arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  98 +++++++++++
 .../rk3588-tiger-haikou-video-demo.dtso       | 153 ++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtso

-- 
2.45.2


