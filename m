Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32951E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBnkfPPwd/0z0UzRp7pSBtfbNp5mlwbhbYUinjn7t6s=; b=U3Yqupu9vGbsqq0QzSpgXXy4GS
	5w7lnksRu2jkVjJE4G4EXUNc9ub83kP2z8OqzGORyg6OAOHrteqlkQvwqelqD8DME2zpyDITCavzi
	YfPdMuPkZt3srxmVsELOHRHCqpmW8+nV7I9MH28r0FixIT7p5SeT80X8y9SBmBK036/9Gs1i0LDAc
	7P1YJK+5zX9BUTz3azGlUzBkJ+ltOdjCDfBAeN1b9tJsKbqp9By5d1Wpua9sY+3wjM30Tjml2/mfq
	uzj4qtO1SmYVWZZQRFBzctWu8qs4Oxh8bzm1bR97f+e3ifqVX5/KO2MEaM7wu+eoafT9nEQDLRkiP
	A0BDTgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjMS-00000000fqH-1PiV;
	Mon, 06 Jan 2025 09:25:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjLF-00000000fbM-1UmN;
	Mon, 06 Jan 2025 09:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VBnkfPPwd/0z0UzRp7pSBtfbNp5mlwbhbYUinjn7t6s=; b=C6PgRuatqaL/JCQeSBgq90fYbR
	cgS9RBnuNFoNmBPp82CGyMEIE98ptU4gncieb/wDBgYHeNrMAgDiOfjWNR4H1pvLRbqz16DhI6ziZ
	lVH+IdsGn+z4Q0WMmKaGPekvYreupbWXQl3ZVKd70kqq+j6yRCSOu0o9zU40Oc/HSOgVMHzTOf0Hn
	j1gcFw88ylpQUZAEAwnUNLm0S5dc4OhH03UcUE97EJ7B0azFCG7qamRBaX/M0HyBrGZS86vcR/5bS
	WSpJP1Vs8zHOkuB3WK1+/UXhMv16JmpmJYBexATgN45dORXy7Yb/Dm1c+t0O7Vj/kmKo1umLIM82a
	MoPAvHJA==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tUjKx-0003r1-RV; Mon, 06 Jan 2025 10:23:51 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, mripard@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/3] drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
Date: Mon, 06 Jan 2025 10:23:50 +0100
Message-ID: <2263586.72vocr9iq0@diego>
In-Reply-To: <2f23fa41.82d9.1943ac12d62.Coremail.andyshrk@163.com>
References: <20241225103741.364597-1-andyshrk@163.com> <2175680.OBFZWjSADL@diego>
 <2f23fa41.82d9.1943ac12d62.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_012409_412735_67422BCC 
X-CRM114-Status: GOOD (  20.40  )
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

Am Montag, 6. Januar 2025, 09:35:26 CET schrieb Andy Yan:
>=20
> Hi Heiko,
>=20
> At 2025-01-02 19:51:58, "Heiko St=FCbner" <heiko@sntech.de> wrote:
> >Hi Andy,
> >
> >Am Mittwoch, 25. Dezember 2024, 11:37:29 CET schrieb Andy Yan:
> >> From: Andy Yan <andy.yan@rock-chips.com>
> >>=20
> >> There are some control bits for IO and interrupts status scattered
> >> across different GRF on differt SOC.
> >> Add platform callback for this IO setting and interrupts status
> >> handling.
> >>=20
> >> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> >>=20
> >> ---
> >>=20
> >>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 81 ++++++++++++-------
> >>  1 file changed, 54 insertions(+), 27 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/=
gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> index c36fc130b734..b21e868e7c16 100644
> >> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> @@ -62,6 +62,12 @@ struct rockchip_hdmi_qp {
> >>  	int port_id;
> >>  };
> >> =20
> >> +struct rockchip_hdmi_qp_ctrl_ops {
> >> +	void (*io_init)(struct rockchip_hdmi_qp *hdmi);
> >> +	irqreturn_t (*irq_callback)(int irq, void *dev_id);
> >> +	irqreturn_t (*hardirq_callback)(int irq, void *dev_id);
> >> +};
> >> +
> >>  static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encode=
r *encoder)
> >>  {
> >>  	struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);
> >> @@ -226,9 +232,47 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq,=
 void *dev_id)
> >>  	return IRQ_HANDLED;
> >>  }
> >> =20
> >> +static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
> >> +{
> >> +	u32 val;
> >> +
> >> +	val =3D HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
> >> +	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
> >> +	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
> >> +	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
> >> +
> >
> >nit: below val =3D ... and regmap_write don't have a blank line between =
them
> >which makes sense to show that they belong together. So the blank above
> >can probably also go away.
>=20
> Okay, it will be removed in V2.

just realized that I commented on the "wrong" version :-)

https://lore.kernel.org/r/20241231094425.253398-1-andyshrk@163.com
seems to be the most recent one.

Heiko



