Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32959FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKQp9Yx/9Rvl8GakqhdXTO8YERBExsPUn/jaifH6kV4=; b=tS7Zo8qorc04C2l0wd+0FrDKJ9
	wbcNaDaqii9T/QZcqyOT78w7cZDZi8PJPzjB13wld2mOvhEW9kmAO3DTAcXIv8HbW2Z6nNO7DkKNj
	s9yJ56Rxb/KCfleWnUf2zChHK7x0tBa/alGRCvAOinZsGeO7+MiRqeC9u2f9+FRDFIGjiIl3hd9RX
	Gmew0J6EP413RlTWTv96xrOADKvG7iIPZ6DuEh7GK7NmgFERElC5nq8gD3Ec0dGJ8ykA6OI7WJL1W
	FyawOnfS1T8oHqgrOScPhfhB8MC4012mUKUeLqYRfk627XAPMhXpeJX+Fs8lfK8rVP3grTDmlgmBT
	K7W3VC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJWp-0000000Gj2v-1VG8;
	Mon, 27 Apr 2026 10:49:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJWm-0000000Gj2W-3e97;
	Mon, 27 Apr 2026 10:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OKQp9Yx/9Rvl8GakqhdXTO8YERBExsPUn/jaifH6kV4=; b=inO8LOazjzbcyLK+Das0bMG4D4
	bi5irue13RRAnKfAqTQ0TOZ+gJyPeHP3y1SVrjqDcbWXDvHckgzGhx56i+GKnVMQMt0d5MbneqI+2
	k+PQIcTUfg5Ca9/aMuHBca+rlCSUPyH1uHNkhQQCh/qZgmq2t/xE/F7PmJL1CJ81GFIdA80fVsI00
	KtgpioVyIybWuYeqb2UDpmHM2rgMHS2f5+S3W03654a/BLtjPD+iJlfX+TIq8cNmZ4R4eVQb9TbPo
	jztvMWKsD3gAqONgx2ywcMfP6w+Y8y6abA4U4WGkUAdOXMhk9h7fN+arHvvQF6A0zGrYJfvUcvKMs
	TbQGeSDw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v5 05/10] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC scrambling and
 high TMDS clock ratio support
Date: Mon, 27 Apr 2026 12:49:09 +0200
Message-ID: <3826043.PYKUYFuaPT@phil>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034924_972399_5CE2FD3A 
X-CRM114-Status: GOOD (  14.10  )
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

Am Sonntag, 26. April 2026, 02:20:17 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) by adding SCDC management
> for the high TMDS clock ratio and scrambling, required when the TMDS
> character rate exceeds the 340 MHz HDMI 1.4b limit.
>=20
> A periodic work item monitors the sink's scrambling status to recover
> from sink-side resets.  On hotplug detect, if SCDC scrambling state is
> out of sync with the driver, trigger a CRTC reset to re-establish the
> link.
>=20
> Reject modes requiring TMDS rates above 600 MHz, as those fall in the
> HDMI 2.1 FRL domain which is not supported. In no_hpd configurations,
> further restrict to 340 MHz since SCDC requires a connected sink.
>=20
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 188 +++++++++++++++++++++=
+++---
>  1 file changed, 172 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index d649a1cf07f5..c482a8e7da25 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
>   * Copyright (c) 2024 Collabora Ltd.
> + * Copyright (c) 2025 Amazon.com, Inc. or its affiliates.

I have no real clue about the inner workings of hdmi, but that line
does make me curious, because no part of the patch authorship does
mention Amazon ;-) .

Also I think "or it's affiliates" might be way too broad, because this
can be essentially everyone. So noone in the future will know who to
ask on copyright questions.

Similarly when _somebody_ comes forward with "I hold a copyright on this"
no-one could verify this claim as well.

I somehow expect _one_ entity being specified, not possibly hundreds.


Heiko



