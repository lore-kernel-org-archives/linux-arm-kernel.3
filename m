Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC40E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV0DzN/aRpIaOzSPvYfCHGoC2ttPbO09aHLQyIdly64=; b=thNVQOxVJH5uQr7MDu0/wNSC1Z
	fOfC0GX8rlJ15jBLLzpWu/PvZoZqQjUL4HTIDrUNJ8wsqt7mbXYncvmK7TLJuEi2s1lndmCemBqXx
	pHYVi54azWPiiV7Kv++SByd1YRmWyThi5WUzrGPGY62fwukBHjF54RSdbqSUREZoeAMViglkgs8gi
	Gg13WgVi190boVLPQBIjDhoGnDeMC9Q+lMP1Jn66Wmhvaq5pnzC9pbDJoumY7dDhsLh7ZGr4kB2ZH
	jmwbXfnB/yWKwek2q7R8InLek78of9/FmIaWAdoCYikI5vd1fYqvDj60WFpIO+W6E+aNjGOLQP9Qd
	SA3RegFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKDX-0000000EcCZ-3Dod;
	Wed, 11 Dec 2024 10:45:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKCU-0000000Ec64-0tAq;
	Wed, 11 Dec 2024 10:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EV0DzN/aRpIaOzSPvYfCHGoC2ttPbO09aHLQyIdly64=; b=GPXVlF94a82JRfXo0MuftR38+o
	EPuKL7i9Bbdnlhjixyj/tPflX+n7eqReFh5PEE3ff4jbMdHlhRqNRovWS13UH3kY/aqf80tj5sCv4
	FkUaHkdorBrYAWxiVC2uLb1m50H/TloWhkQffIkRc0kAoAD4E4vv1tz5xBU6e5fCnlRZ4UM3SFM67
	wVJ9yp5ioiYBDStUdfNR41mtofEe27i+4qfV7uyEP5tR3JgWNl/VKTAa7nLLxR4xanoMIkvqibB0J
	wI4uYmjgn/93sKeen5ecCOF/05jNdGISz0yYyTrljgIlO/k14nMlVGlgerWbUTAZLAOvjvVqnfg90
	on7vqbcw==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tLKC8-0001Vg-Hx; Wed, 11 Dec 2024 11:43:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexandre ARNOUD <aarnoud@me.com>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
Date: Wed, 11 Dec 2024 11:43:42 +0100
Message-ID: <173391381115.2426313.13144345816370660962.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_024414_268015_DD4620D7 
X-CRM114-Status: GOOD (  12.84  )
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


On Wed, 11 Dec 2024 01:06:13 +0200, Cristian Ciocaltea wrote:
> The patches provide the basic support to handle the second HDMI output
> port found on Rockchip RK3588 SoC.
> 
> For now I enabled it on Radxa ROCK 5B only, the board I've been using to
> validate this.
> 
> ** IMPORTANT **
> 
> [...]

Applied, thanks!

[1/4] drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
      commit: 0f818db20c77506ddd870761785740f8230a4207

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

