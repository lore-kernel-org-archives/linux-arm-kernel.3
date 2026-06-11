Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45656CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4b25Ho+ItGseHhBRS5Gh6L3AIi5GEWNlEQHnamaQOA=; b=Goox8nZNuyF/eXa2slsrVD6OjV
	3Z3fJUMxuW6RLz+Al8kGTsPe7fAeiRFErvp/O+fJ0iagN3K4/yfy3+eGEjp5OovNbRhxoZYWzoA2E
	WUZJSNC59/Qf/Y2MydIgJ7XLRtlhgUeydOO07Pewcqs6/WRENKgDK3zpvJ39k0K4kD0u16mukOZTx
	HvCakAQdwrX72QHoUM9Vj/uJosyUFFPuZDfkoI3S7EdotGc0V01obVPr0nev63shwis5JgLAVTiT6
	A69o6UAQ/SMVOf6hpH0IPNr0fGG5ckkyghDzK1HkvVRk643npQk3kEbRYoI81hUPkHdez7l+u5oD/
	zBNF+tDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhOU-00000009gZ7-0Hks;
	Thu, 11 Jun 2026 15:32:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhOR-00000009gYx-49iQ;
	Thu, 11 Jun 2026 15:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3987643EFE;
	Thu, 11 Jun 2026 15:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909911F00898;
	Thu, 11 Jun 2026 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781191951;
	bh=U4b25Ho+ItGseHhBRS5Gh6L3AIi5GEWNlEQHnamaQOA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=E6JjFmTK8d6ee2miRza2BirHt4M4zPh9No880YNmvw71uiXJBxvX+x0l9rXMttYiC
	 prAz09+HQg9HHMF5DCr1VpHUBmIJ4Ecr/zs6elMSjCJVDdYOb5N5SyKiXVcvwNSkNm
	 7Fz12vNMMbZCIUaIZqmqK0ni+LILRQ7KF/BsTAz51C7DXbOCkyrTfPy+e5bnlTZMeu
	 KLKRp7XIOakTjjiSS7LVV8z2jl5vjHhQV8bSM3ZPasaNtr/y3NJju+bFEULpcIHgvR
	 S2C4+Tw84D0+G76skiHhglYVs0le53rQmRNjUfa4rdvl2M0kcB0pZzRyqwh4+yjVyj
	 n1JE2r2MJnESg==
Message-ID: <e6d0f078ffe3425dfbcd36a42ba9053a@kernel.org>
Date: Thu, 11 Jun 2026 15:32:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v7 24/30] drm/vc4: hdmi: Use common TMDS char rate
 constants
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-24-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-24-445eb54ee1ed@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 2 Jun 2026 01:44:24 +0300, Cristian Ciocaltea wrote:
> Replace HDMI_14_MAX_TMDS_CLK defined locally with
> HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ provided by linux/hdmi.h.  Note this
> incorrectly referenced HDMI 1.4, as the 340 MHz maximum TMDS character
> rate was actually introduced in HDMI 1.3.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

