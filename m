Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F96EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLbLURgaSXbVX6ElkPJAaeyiLaJ7UZfzAFJPXWQlb8E=; b=VhjoO2Fbf9FsNJZOpZsZRdIk2o
	sH/PJB36TWu7raUsk8MdP/DqtXX1F0iD2BxnheyRVuK27cpeQijrpV1/wtpOU+ZtmhpfDX4Uyyh5r
	FlIdPVXitKg+1aqdUXLAHMq1/KE69d/RREJ0d7gd+16Bzd8QzlCDbllPPGF8iPcrpcoSGl+Yk1V5F
	fv2ct+I4dTWo3QN057MKvTK6gcYO0UsgBf49t+Xh/fFumCPQey/RN4I/CaiyVld7G8/xG+nXc1uFN
	5xybxn1WcrCSzPL4rJtePzUyS1EGcA+BxCg/yhM8W/b0fY6hxse2WE55YGDJ+xuASZOqP2l10x9zm
	Sgu0JLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59F-0000000Eyhu-3bsk;
	Tue, 07 Jul 2026 12:43:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh59F-0000000EyhR-09Sx;
	Tue, 07 Jul 2026 12:43:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68EF74081F;
	Tue,  7 Jul 2026 12:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7C51F000E9;
	Tue,  7 Jul 2026 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428216;
	bh=vLbLURgaSXbVX6ElkPJAaeyiLaJ7UZfzAFJPXWQlb8E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=W7++D1oyyhs42GuGgtQf+ioCZBFx5Egz6xgLWjsp1wmjXqegfwZBI4csM1smd28YU
	 RpOJh3OjJQZnh7D/ay/Wi0Xo/V86nNMDPEJupgzdOpl6iU9OVdXWOmGWYEG8DktPOK
	 Ck06GrP5i4ky0Ijg+HdG9Qr3+C6r1J53MTr+v/h8Un8cpZEjDuoqp6CmlDwIFLzU8V
	 q2neN5keC7ygXQgqOtVS+i85w+HXp8XV/xHx37N6fMu9qOa2IX2JU0d3bzdWgnY3vb
	 dSarS8hY1F3Y1qZ7n0I68jNptC/Aq2aLumHQdOv2625sTZ+l4/uffmUqwqAzQc2u4F
	 yEgH3ZXSFYedw==
Message-ID: <7943162b55e184a40912d0803bd1ded7@kernel.org>
Date: Tue, 07 Jul 2026 12:43:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v8 30/39] drm/vc4: hdmi: Switch to
 drm_hdmi_mode_needs_scrambling()
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-30-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-30-d79890d00b6a@collabora.com>
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

On Thu, 2 Jul 2026 17:46:43 +0300, Cristian Ciocaltea wrote:
> The VC4 HDMI driver has a local helper to check whether a mode requires
> scrambling.  It is equivalent to drm_hdmi_mode_needs_scrambling(), so
> use the common helper instead.
> 
> No functional change intended.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

