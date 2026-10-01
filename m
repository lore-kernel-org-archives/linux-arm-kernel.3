Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F37CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKDPtfxAhV/dREsJEcSyq7SoOHuO3ciIber1G1Mlbkk=; b=BsdoF9CxPVPAd2Tt5ej3PupZgO
	bn9rH7vfAoNE7IHrA4YVgD71g7ojQayxAZhMaKOyKcWeiWOt/MaXavx+l1778bBXq6kfyhqXyTBrT
	1Nh/fY1ghedoIJ0qXJyR6ym9Jvz44O9lUFIuV2DN4JeD3aNtE0Bhwm4rfn8SFZ40q8H90WwuPfVFR
	dSlOQ3D2e9z4G755kjp2FZkMjuDYpwTGrxa/nExNEdN0yepKZi3E9gp55AhcNL8FTy3VMSjR4IAdQ
	OyuPqgRsbcKxuOKUgXK3BUGoiHGhXDmi+WqQsOEtaBj01unBM1iKsH1sSf7lEFQAlyQMw7sf5sJKn
	coWqA9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCItM-00000009ZN2-1Z7u;
	Thu, 01 Oct 2026 15:40:16 +0000
Received: from mail2.ecloud.global ([135.181.6.248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCItJ-00000009ZKp-1z3o;
	Thu, 01 Oct 2026 15:40:15 +0000
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id F0DEB720BA3;
	Thu, 01 Oct 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1790869209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qKDPtfxAhV/dREsJEcSyq7SoOHuO3ciIber1G1Mlbkk=;
	b=TCEoFDBbjYRUo3c3fevSgQ02QIdoN8xUTOuZX4DnbNjkrxZf3NsSMJCDP/MJ2ahHmsp/ob
	CZm9EzW0JqyQepC+Mnx/wD6iInO/gE6qqTN6uPkLE2YHijtYT2D6xeDv6kzMtQ2zw9Yp6m
	oqIa9aQsK+srkNwKqeXCFbnHDAubzL8=
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail2; cv=none; t=1790869209;
	b=VNETGM+K8h+iqT1UgCB1Tyj/1jgj3s+OJmVqwrK8EC6gaoplSJXbAgezfVTDHlQqR7w31Y
	pJJjeVIznq7magjlH4S0Y4KzwY/p8b8liSEVRALNAhMz6cVOJT5tnFoOv1mhJrF2LsWiVD
	RwXYI5A6T6b7Ep9svcPR2Rxzh01/mPM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1790869209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qKDPtfxAhV/dREsJEcSyq7SoOHuO3ciIber1G1Mlbkk=;
	b=ZNq50gAmDVE09SbtqXvrb4VyxebLiZgRYzrViBFsX459PliBv+F2kxIilSuf95+w28YMvk
	pKYEUbbhSKrCyLVj+Klf7A5Rg3h61gXuL5gSAokYwrBVKrb0/Rr3OS4KugTIbU9NALael8
	V9nPlJRRQHNAr/SJI/WBGam7iDaXO7w=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
Message-ID: <6462d084-5861-4df6-94ca-dbd23e619a61@murena.io>
Date: Thu, 1 Oct 2026 17:40:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v5 01/21] drm/bridge: inno-hdmi: fix swapped HSYNC and
 VSYNC polarity
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Byron Stanoszek <gandalf@winds.org>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103203eucas1p14cb6262ba2c7bbaf36856f24f7bdc9e7@eucas1p1.samsung.com>
 <20260929-jh7110-clean-send-v5-1-82b4d8e3c6c7@samsung.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20260929-jh7110-clean-send-v5-1-82b4d8e3c6c7@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084013_707616_C12B7D3D 
X-CRM114-Status: GOOD (  14.51  )
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

Hi Michal,

Fixed! Thanks!

Tested-by: Maud Spierings <maud_spierings@murena.io>

Kind regards,
Maud

On 9/29/26 12:30, Michal Wilczynski wrote:
> v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
> hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
> opposite. Most CEA modes drive both syncs with the same polarity so it
> goes unnoticed; it only shows up on modes where the two differ.
> 
> Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
> Reported-by: Maud Spierings <maud_spierings@murena.io>
> Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
> Reported-by: Byron Stanoszek <gandalf@winds.org>
> Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@winds.org/
> Suggested-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>   drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
> index dd35f5a875d3d842fee6d2ead0de88503f9914e1..d7c33b92e2ddf4ced84d17304463f44be52270b8 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -122,8 +122,8 @@ enum {
>   #define v_VIDEO_MUTE(n)			((n) << 0)
>   
>   #define HDMI_VIDEO_TIMING_CTL		0x08
> -#define v_HSYNC_POLARITY(n)		((n) << 3)
> -#define v_VSYNC_POLARITY(n)		((n) << 2)
> +#define v_VSYNC_POLARITY(n)		((n) << 3)
> +#define v_HSYNC_POLARITY(n)		((n) << 2)
>   #define v_INETLACE(n)			((n) << 1)
>   #define v_EXTERANL_VIDEO(n)		((n) << 0)
>   
> 


