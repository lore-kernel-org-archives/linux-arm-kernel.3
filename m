Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417FDCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVUeWlKKpdLIZvOOLJnl3h9BUHCCwQDUhwgZkOAnPCw=; b=RUXolti/+oTv/qzLhx0Pz41Dx3
	vdqDE/k+8R+J2Jz2wgNhjSMcU8xA5L8rUSjJ3ffmAYt9DOe24NFOVJUvc5KVw289AkJ7n1Jg8oXtp
	nG8i/E+6q6HZn4EqsbHzPwBJ9fV7FzoReQkmqXsyKbE+XKnQx0YnhPLiu/vdgS6u0lWKZHHW7laR0
	3zwHk/e2wrW0SWI2rdZj0fxPtPxYt+6o2pYJco7lIl7kv6UKd9nRzF3hM8CcHDDCkL8up9vr5Zv+J
	KWo7vIsBVrkr93xKWwkPAfN+Sn3+uQtakSzxuPEjKZzs1N3hrfBqCDnpqz50UWK1mQ53QyH6xJBE2
	zh+ksKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPztk-00000007L0x-0R9Z;
	Thu, 21 May 2026 09:41:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzti-00000007L02-19Zd;
	Thu, 21 May 2026 09:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FVUeWlKKpdLIZvOOLJnl3h9BUHCCwQDUhwgZkOAnPCw=; b=egc7+pmFKxo9bXuGpGKaODVu3c
	mInxx6dPQ5IWFQ5XLFIMeAvngzaZwCRkpWjbw4o0Vbr84YasEymd02U5+/aenR1B7qNm1ozn/294+
	7xX9kzv9kJcE1QgREU7dUHnDu+aO5shFIN/vyUl0PAVRh/losQwesRsQF+4Z8vHy79tusnVCe4KCn
	jryUgY8KouDTZAhJKHpRWtlre4uIcYbBog+8gsgAyAH0zF+KjS3b5HDdEYus5x9nhHVjyXT2ZwCqg
	LgPmP1CmSK04D/2jnqNMsSK8JatYzo2bfhiPhdB0Csca4gn1bd7s6ptPPqY/R5DsVhzdkXVMgIc+A
	XeujQ25w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 00/11] drm/rockchip: dw_hdmi: Misc cleanup and propagate bus
 format
Date: Thu, 21 May 2026 11:40:48 +0200
Message-ID: <5220966.G96rZvMJ2N@phil>
In-Reply-To: <20260518193748.2482823-1-jonas@kwiboo.se>
References: <20260518193748.2482823-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024058_310546_A604A67D 
X-CRM114-Status: UNSURE (   9.60  )
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

Am Montag, 18. Mai 2026, 21:37:34 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jonas Karlman:
> This series include misc cleanup of the dwhdmi-rockchip driver and
> prepares for future support of YCbCr output and Deep Color modes.
>=20
> Patch 1-7 cleanup and changes to use drmres helpers for the encoder.
> Patch 8 prepare for use of a display-connector bridge for RK3568/RK3566.
> Patch 9-10 prepares for future support of YCbCr and Deep Color modes.
> Patch 11 changes to use resume_early pm ops for system suspend.
>=20
> This series depends on the patch "drm/rockchip: dw_hdmi: avoid direct
> dereference of phy->dev.of_node" [1] from the series "Split Generic PHY
> consumer and provider API" [2].
>=20
> [1] https://lore.kernel.org/linux-phy/20260505100523.1922388-16-vladimir.=
oltean@nxp.com/
> [2] https://lore.kernel.org/linux-phy/20260505100523.1922388-1-vladimir.o=
ltean@nxp.com/

With Vladimir's agreement, I've pulled that patch out of the phy-series
and applied it to drm-misc-next - as it's a change that can stand on
its own.

Series:
Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3328




