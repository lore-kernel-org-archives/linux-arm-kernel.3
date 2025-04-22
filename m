Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C263C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eduKEqp989VtzN3pDbGRSZ0xqVFdb4NEGh4iT4GHVrg=; b=DIQycs+ac0s2RngRXmHCBpt7Jc
	/DiYpvVytevO4MDRtg5QbcvoMOhtxWeW7FhHmty3gg3ocn/6K4XzH00muCKcRBVc2AjsVZ0PBB2ke
	SGtpENBddzHdlLTZdg+MQVIvGYI8AC7ZVwj5UBwQiVL604Z8Dx7hfDyPBSe4GvGp1dtcxr3+cpoGP
	MJwzG65yVSkjNEc2S9I+6S/xMSWMX04saFYw8xQ8/mTz8czMKH1oRyAnLOq7TKAb1Ov5SM/aIp0QS
	CBu7Xi+jr/PM9CwlCIiHgpe4hfOKsVPFBS/bfLWU4S0gAzycBvuFIGeBYbkGvc1oAb47Gixqphst7
	a0V6rMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7D8n-00000007CN1-02NJ;
	Tue, 22 Apr 2025 12:54:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C3u-0000000708g-3HTP;
	Tue, 22 Apr 2025 11:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eduKEqp989VtzN3pDbGRSZ0xqVFdb4NEGh4iT4GHVrg=; b=RPdD3O+sR+4EnrNmrEOnEEmUMV
	/yKMQq0LSvT22Ew3S6R3GbyVqT7cYb3nD8Rnf3j/IiK2D1FvASRWsycgcxRiLJuacnp/t1w+kLr1Y
	GCSl/B5pvkyVH/G05Rf9xQdznVPNfqOZ38q+6/CoNxo3CzRs6Lck/RNGlVJx6abaliWuDxRoJATXb
	wDRoF027reZTKxbCGVsTHqttErf+jH8qS9LeyRN94b/3zPEKNMPr96CjCndhE/M9c4MrnY62rTtZd
	yy2vumGQ+j+wCNQGIVeTfKKkMgrWEMKl166XPhV6EgEfRr7HC4sBiDsexAT3898T9/y66GXZYm+rq
	RwpZglGQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7C3H-0002kK-AM; Tue, 22 Apr 2025 13:44:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dianders@chromium.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	boris.brezillon@collabora.com,
	l.stach@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v8 00/13] Add eDP support for RK3588
Date: Tue, 22 Apr 2025 13:44:23 +0200
Message-ID: <174532226019.263993.6647221833577832330.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_044514_818038_80997EF5 
X-CRM114-Status: GOOD (  10.70  )
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


On Mon, 10 Mar 2025 18:41:01 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied, thanks!

[12/13] arm64: dts: rockchip: Add eDP0 node for RK3588
        commit: dc79d3d5e7c7b2c177b4a4ca84d20d271fb68da0
[13/13] arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
        commit: 53862b991e79d8816d5ff54b5954d6a0fe1dcd4c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

