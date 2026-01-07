Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1694CFD625
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Is5RjV5W1u9YGVarjcRU6ceNIN9IKqpKYrkNrDF/4MQ=; b=2owVGI6UZ0V6aJitislM7AfC9F
	E0jvoH0qXvvZCgh8yIrTHkPdI2H0s666VfEFo25bNS9U3dJoYVoJLFTMMZYr0xZtM5wz+s/rowAxp
	VUkuHqkx91ARC21UDZCjBcpxOzft1CneVtSg0KryroMWuCmLgr1AyZ9N3imMKBvBDvEApugMIFO+a
	ohb2Up2hiHN7mq7idZJ/pJMeutrNoJTVwpMQ2+Ga/e1oKvWrhZX5zubFgJJK7HfdFwmLb8zdbDEjz
	jiXYZ+FJkWb/PXbuNlKbPpXxhaU1nRHZhf4hR2EwIga92PO1r6BRxL4wEPBRUEOQBtj6dXnPjMjl8
	08LhKsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdT04-0000000Evk9-2QWM;
	Wed, 07 Jan 2026 12:50:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdT02-0000000EvjU-0T5l;
	Wed, 07 Jan 2026 12:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD70B43B87;
	Wed,  7 Jan 2026 12:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F902C4CEF7;
	Wed,  7 Jan 2026 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790253;
	bh=Is5RjV5W1u9YGVarjcRU6ceNIN9IKqpKYrkNrDF/4MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdtNBxpCkcQ+J4H95qIr3QfX6X38re9VsczT9QDHJOelKLRMPw0ZAybPLWkJT/BYt
	 qBVIOG1TpBraZfpFcb9sHRYZD4hYsQX1YNB/c3DKoTsjfQ8h9gmu0pNFOsuOTp8pwd
	 6JnV3p1TlDu+25XdF8kWiT/pWdoNfwElGtGmMU+ThGuuuS43S2YuUg/sGfkw/3Tlj3
	 4eu40L+vU5uuxAtGViRQ5eXxP540CVDfAhCdnD5T562No2Z61O+CR4BPRaAdS0u201
	 xMJ72P80lwivWepjJ19FrxjJLpICrKdlq/TqB4fE0LbyeL/ASQDPdHCztqVjRHN1dy
	 YyrJCg8uezBOQ==
Date: Wed, 7 Jan 2026 13:50:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <20260107-fascinating-boa-of-fertility-1886a0@houat>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5jzjabvum6jmi43c"
Content-Disposition: inline
In-Reply-To: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_045054_195079_4A133ADB 
X-CRM114-Status: GOOD (  11.66  )
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


--5jzjabvum6jmi43c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
MIME-Version: 1.0

Hi,

On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> Updating the InfoFrame if it can not be sent over the wire makes no
> sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> an error if Audio InfoFrame callbacks are not implemented.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

IIRC, audio infoframes are mandatory if you send audio over the cable,
so maybe we should do like you did for drmm_connector_hdmi_init and
error in drm_connector_hdmi_audio_init if we don't have the proper
write_infoframe hook set?

Maxime

--5jzjabvum6jmi43c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV5WpQAKCRAnX84Zoj2+
dvQoAX0ZrPZ4Tvz4pn+WykRaXQmRL9fYSOrsCkdNU/U/YeDmV7idPNZOoovjGxhA
lol6AlQBgKrZOSgOR63zJZLAb5FVpUis1h8cxg8f+AZWDU9CuIucM8fJDumWT/jC
l8IATNMIWw==
=i55g
-----END PGP SIGNATURE-----

--5jzjabvum6jmi43c--

