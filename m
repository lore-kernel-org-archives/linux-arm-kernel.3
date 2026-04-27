Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68526FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMiVQtO/20AP/BJG4HATSBBh4qLb0DtjiWzEe2Kk0IY=; b=HQ9mtL0bS0d5lT24LYfD2UWDrg
	v3DCOW8DAlAfBVFOCH8HP4VK3ZgaaqRqQ4+uA2Tmk7kmU4GIP27gyiwqzp8OSn3lAqJzi/QjmPUyU
	gGcAdj5nJKSKco48usqaeor7ddT2dGZvE/Hmg5YhqF/jqeCX9aFw9/nr35y11a9sZWXRyCGkTNGbF
	mI7CjLrcxbtOKbJzPfnJplQMx35XtILDj/Z0wTSweSKHbdobAMNluyTuPu6F0LqTKXOmFHPsBaQql
	C6X8ph39CQkNxQHc6b2F4wZTkbLSD1hSsF991paJmIGAMglmWNmSniMEyqHwPTCsEfYZh9dqmq/TH
	V/LDfhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRM4-000000002Gr-2PVZ;
	Mon, 27 Apr 2026 19:10:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRM2-000000002G5-0jLY;
	Mon, 27 Apr 2026 19:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eMiVQtO/20AP/BJG4HATSBBh4qLb0DtjiWzEe2Kk0IY=; b=Zcf+aeVgoqzfplXbcoalce31z8
	+BmBHRruAPnXcH9YOxAp9tjMDCa2Lb0uWI+20zzEttLj2p4HyhLOoA9MlNClW6iJG+YnmKOutdvl2
	zIG+m0aUKr3lmoYLV4hgHPxsTic7ka9c1EPDdFX9g/UxcKM04nhnZAkJs0Gtf4l7Vqkp6poE+dleT
	R265z67Emide8+Pba0LcwfUrmCt6irdOXyVG/CqCZoJ1VrG50t6nvbZpe1/IR8Tx5NOGig9TS5KAo
	gtVmrnJOZR6ohZ599ZwxmlNJGqI1dHJPMav4aJK2vdoMO10sPfVHs0kFbknsBDZXRDvSQUjhLeEWt
	EpCX/KNQ==;
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
Date: Mon, 27 Apr 2026 21:10:35 +0200
Message-ID: <3837777.yKVeVyVuyW@phil>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_121050_215874_6DA4D27A 
X-CRM114-Status: UNSURE (   7.66  )
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

The change looks fine to my semi-trained eye, so even with my copyright
concern addressed, I can only provide an

Acked-by: Heiko Stuebner <heiko@sntech.de>



