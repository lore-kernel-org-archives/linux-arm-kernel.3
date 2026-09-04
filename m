Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257AFC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzSSeYpgZ1cl36kwxauq490fq+r6qAsAHJo6BhOSQ1w=; b=QRXlOm52MM8ZJ5sHHcSUWHCaqB
	TXv8c1EJfDx8DeQgm+MhEap6fsLZ5+odTDT8AfROOJDjXZDlqJaYWeWASASG7Fz4rkW4ZejTuZecW
	guk7DWb3dvR44O+1md0mXlzO3ukBbi+elHPpNPVM/aKxdm+p2OqCjEC+r6Z18tYx6bNGKTIjIGhkS
	mU+0hKyq6PUyaYuZWca+t6TafF3ieywW+25JJKWZDJxjPoh3ZFBd8kEKgVMEIypWmeFcrIWtHbLcQ
	uiksqnV4WAw6t3ZceGLSnVVvvU/h4iVfLRZQaPgMyaTuYvmAHZR4Jc6907Oyodd5etjWpVxA7LSyU
	oXhcsPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PLj-00000001NhJ-40pA;
	Fri, 04 Sep 2026 08:32:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PLj-00000001Nh0-0CCO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:32:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B957D43716;
	Fri,  4 Sep 2026 08:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F681F00A3D;
	Fri,  4 Sep 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510758;
	bh=MzSSeYpgZ1cl36kwxauq490fq+r6qAsAHJo6BhOSQ1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JFYXZymr1wFshuxLBjvl/iyhixHCkCSdNKcEN4AdpqHPjeNe7OCTSE9W9hyu9xtuR
	 /THPX4vBmSvJmF3/ZEUA0Da+o6/SwDv3VnW8nLLZ1vZUXCYX7XSUIRIpRRy20QtS1p
	 LF6EVoW/ugz7TlGexEb7v2M4BXLeUpHamQwlImMuJSyCceHzASAiMD7tjzJyLw4U0g
	 oQbNYEnp/4CefBvHa+Q+hpYns3elxf245Bc+SIoPF6gG8PcFbHVPHbmm+dQLvN3+G8
	 g/YEenlDO0dhAt+Ykn56tIdGC+h71gO4vAjFXu8vxm5d3fHugsZfydYpcumgCDAsZ1
	 Qwq7tPZZNOoKQ==
Date: Fri, 4 Sep 2026 10:32:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 07/13] drm/imx: dc: Use TCON operation mode
Message-ID: <apqBoxjblzSIuG36@houat>
References: <20260904-imx8-dc-prefetch-v6-0-26643e3f6cb7@nxp.com>
 <20260904-imx8-dc-prefetch-v6-7-26643e3f6cb7@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xjuaddo6esktd3cx"
Content-Disposition: inline
In-Reply-To: <20260904-imx8-dc-prefetch-v6-7-26643e3f6cb7@nxp.com>
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


--xjuaddo6esktd3cx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 07/13] drm/imx: dc: Use TCON operation mode
MIME-Version: 1.0

Hi,

On Fri, Sep 04, 2026 at 03:54:57PM +0800, Liu Ying wrote:
> @@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_commit *state)
>  	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>  	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
>  	dc_fg_shdtokgen(dc_crtc->fg);
> +
> +	/* Don't relinquish CPU until TCON is set to operation mode. */
> +	local_irq_save(flags);
> +	preempt_disable();
> +
>  	dc_fg_enable(dc_crtc->fg);
> +	/*
> +	 * Turn TCON into operation mode as soon as the first dumb
> +	 * frame is generated by DC(we don't relinquish CPU to ensure
> +	 * this).  This makes DPR/PRG be able to evade the frame.
> +	 */
> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> +	dc_tc_set_operation_mode(dc_crtc->tc);
> +
> +	local_irq_restore(flags);
> +	preempt_enable();

That's really not great... Can you expand on why you need this, and is
there really no other way to do it?

Maxime

--xjuaddo6esktd3cx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapqCIgAKCRAnX84Zoj2+
dir1AYCXpT5cVplY44dNchFSkeexJ/EEll6WarzurZvlyuK4ccEsQLN5u16HB+0M
d69UP2sBfR04gGdJ/dhDGLj+kSe/MOJTZ8fjbbkfK0hpumFAmqrpXyNhp/ODKajZ
YtkzHwfDPg==
=7yGx
-----END PGP SIGNATURE-----

--xjuaddo6esktd3cx--

