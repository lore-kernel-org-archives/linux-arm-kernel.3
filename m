Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB99C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jn4fU7y77lECs7I6hTxfYjF0J9XYYojKqt6y7PNxEWI=; b=W06RjhPC9kITbD0omJZQnGfxGe
	8/ns5oa9AMUsEPBAqINMNuXFEmKSjrk2wakk6nNsByZvx8RBWwoZU9a9X2x0tA4Tv1Fq1OWiJCZgC
	JoL1EWlEPDPmG3FqC4WQSl8E3Dxv6Ql8yUsjGPDCAOj7kjN1uvlBZN1qbcaPaBAmqUu4Y934eJ/+l
	e49rI0PUoi2+MN+r0du0Rwhyl8O0wMRuoh1udkQ9TRC+aOdleTlQhHkvrZAMWXwvPoYdAi8rTD9At
	/nrpMxYpnPyTlt9HNjbgBj9+e2oqnaORXtJogYfNUjj973ek4hjEpaqiXY/mdr7DXaZKy/uRRAwz5
	2z5t7hkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Eh3-00000000byV-4Bl7;
	Thu, 03 Sep 2026 21:09:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Eh1-00000000bxs-14sY;
	Thu, 03 Sep 2026 21:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Jn4fU7y77lECs7I6hTxfYjF0J9XYYojKqt6y7PNxEWI=; b=rHE/PaMWwEQJHJqpiFRbjAmxov
	H82kIeKRs6/bXHDWJZNT8gfDziefluhXSWk/oBJu/qlFwhCD18Nh3jpgb1kEi3igslJvIgl1cVTk7
	k6xcPxk3f5gGof/gUfxFZanoLSh3VrFmtnqabn2OiJU17+yWOjWEWXQCJzz1YHRtZ5qp3riHreGUR
	8ZN0ET0Xg6UWBWpKSjcmvW+Y0SfufXtWdVP+Ii/P3x6FlRnQuwKECbRrqu3Z0o/cljfeES/ZLghaM
	kx5hpxb3paAjFaq4DWpgMgIamX8cTLBzKYtnJNsCeQVBmsfi5qdrutLeYpQliXhI+HmjGSsnNPHBW
	/li1+feA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Johan Jonker <jbx6244@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>
Subject: Re: [PATCH v2] drm/rockchip: rk3066_hdmi: convert to devm_drm_bridge_alloc()
 API
Date: Thu, 03 Sep 2026 23:09:38 +0200
Message-ID: <4592222.hdfAi7Kttb@diego>
In-Reply-To: <afde7cfa-bd1e-40d2-9315-d3d88abb7606@gmail.com>
References: <20260824-drm-v2-1-7f9273c6020b@gmail.com> <2814844.6tgchFWduM@diego>
 <afde7cfa-bd1e-40d2-9315-d3d88abb7606@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_140955_317987_FB322C87 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Johan,

Am Donnerstag, 3. September 2026, 22:44:57 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Johan Jonker:
> On 9/3/26 17:12, Heiko St=C3=BCbner wrote:
> > Am Montag, 24. August 2026, 12:21:19 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Johan Jonker via B4 Relay:
> >> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> >>
> >> The function devm_drm_bridge_alloc() is the new API for allocating DRM=
 bridges.
> >> This conversion was missed during the initial conversion of all bridge=
s to
> >> the new API.
> >>
> >> Signed-off-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >> ---
> >>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/=
rockchip/rk3066_hdmi.c
> >> index f28d6a883e09..39c65ee07caa 100644
> >> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> >> @@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struc=
t rk3066_hdmi *hdmi)
> >>  			 DRM_MODE_ENCODER_TMDS, NULL);
> >> =20
>=20
> >>  	hdmi->bridge.driver_private =3D hdmi;
>=20
> Can this be removed?
> See link/comment below.

that is what I meant. bridge.container holds the same information and
bridge.private_data is not used in the rk3066_hdmi driver at all.

So if some future function needs to access the struct rk3066_hdmi it can
do so via the container field.


> and hdmi->bridge.funcs are redundant by this change?
>=20
> Not redundant, just funcs are attached in a common function __devm_drm_br=
idge_alloc()

that's exactly wat I meant. As they are attached already in the common
function, there is no need to do it _again_ in rk3066_hdmi_register()

>=20
> Please advise what changes are needed?
> RK3066_hdmi is broken since somewhere 2025-05.

So both should be dropped.

Heiko



