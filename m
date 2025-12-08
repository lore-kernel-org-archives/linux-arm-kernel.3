Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E116D3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 07:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJPHCHT+6fsyjs+1ZZbsqkGYN8B/qM5j+hb/xUt2r6Y=; b=JUYu0xeMvtVI5BP9rMOvXXutjU
	n0UoXDIHS2YCLVoDPJgKOcmOi3YctzS9X+hSIlPD4ut/IY2k1jyUy+TpMt4gLwjjP/WmHkC2FNvCI
	7p+slani7uhsk2LFmnB7CDhs3kXdqIWM84ucy2+ryvmPLPTwUXdo51gVH9o+XT3fnW73u7d/nJ2Xf
	xs77tnYhxWery1fAB3Vr43mjGf6HQVWTI/w/SAe3WNfHlM968aKxDaDyz2/f9NEtWW4Rlmoh9Sw/G
	DW1OAZgjVwUba3gLJfwY5Gnu8Q32UHyNkShQwSA56k519EuzWKhCfNKP7bTx1nDRrXyMYLZZb+QBt
	c2HPTeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVcc-0000000CkCl-1ZI8;
	Mon, 08 Dec 2025 07:25:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVcZ-0000000CkCE-063G;
	Mon, 08 Dec 2025 07:25:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765178700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ewJI6knbGrlnaZl7umoObm8pr5FJX3RNMkdDxMFQAT6f1kzqNGKD/bUVRmCBXWD3p0URdBZe9HxfTndO+dQl6Vcc18P2RAXPRfGqLeGhP6fnJsUvkQctn1i0j1HnJKSd9GubC/p8JMcsJ8vHfZVaRkcjSA1Rfm8Oc0AAyCQG3Sc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765178700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lJPHCHT+6fsyjs+1ZZbsqkGYN8B/qM5j+hb/xUt2r6Y=; 
	b=GofoYoYdlC0Mv14fJn6E+evn9e2Xg0mpNaUK3TqSzgb33EUkrzfviyeJw0Sn/Hting1M3ws25eoYkWqvIs87cRA/DaGEZXnnWgZcpIkInyJaptE/yfsiqQ8eXeGvx+7qIVzKLLpNpVVnb8euAAXc9wFzEaGrSMec5XWejTvqAp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765178700;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=lJPHCHT+6fsyjs+1ZZbsqkGYN8B/qM5j+hb/xUt2r6Y=;
	b=RwecaA6Pm538t7uoLW7pbZlSdnrB9lY85dulpDlsxp89dWzPSGLUTg3X1kD3XeB3
	hsS7Gwgfl5DyEGk9Q7cDmSxQHQq858TDzAiTndgcOagIbX2O8TRumYfiUIk3vbXzutv
	xRtUGiVY4h5d6HuXfXdQYcVK8L3LB0lAiVgN9T7k=
Received: by mx.zohomail.com with SMTPS id 1765178699286809.6705037383997;
	Sun, 7 Dec 2025 23:24:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment in
 plane_check
Date: Mon, 08 Dec 2025 08:24:52 +0100
Message-ID: <4696988.LvFx2qVVIh@workhorse>
In-Reply-To: <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-5-7fb45bbfbebd@collabora.com>
 <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_232523_154657_64A3EBEB 
X-CRM114-Status: GOOD (  22.34  )
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

On Monday, 8 December 2025 03:48:24 Central European Standard Time Chaoyi Chen wrote:
> Hello Nicolas, Daniel,
> 
> On 12/7/2025 4:45 AM, Nicolas Frattaroli wrote:
> > From: Daniel Stone <daniels@collabora.com>
> > 
> > Planes can only source AFBC framebuffers at multiples of 4px wide on
> > RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
> > unaligned source rectangle, reject the configuration in the plane's
> > atomic check on RK3566/RK3568 only.
> > 
> > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > [Make RK3566/RK3568 specific, reword message]
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index bc1ed0ffede0..e23213337104 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
> >  		return -EINVAL;
> >  	}
> >  
> > +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
> > +		drm_dbg_kms(vop2->drm,
> > +			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
> > +			    src_w);
> > +		return -EINVAL;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
> >  	WARN_ON(src_w < 4);
> >  	WARN_ON(src_h < 4);
> >  
> > -	if (afbc_en && src_w % 4) {
> > -		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
> > -			    vp->id, win->data->name, src_w);
> > -		src_w = ALIGN_DOWN(src_w, 4);
> > -	}
> > +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
> > +		WARN_ON(src_w % 4);
> >  
> >  	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
> >  	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
> > 
> 
> You haven't replied to Andy's comment yet [0].
> 
> [0] https://lore.kernel.org/dri-devel/7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com/
> 

Hello,

I addressed the follow-ups where it was clarified that the 4 pixel
limitation was RK3566/RK3568-only. I'm not going to bring back the
post-atomic_check modification for a fast path, but I'm open to
suggestions on how to do this differently.

One solution might be to modify the state with the ALIGN_DOWN stuff
in atomic_check instead, where userspace is then aware of the change
being done to its requested parameters. I'll need to double-check
whether this is in line with atomic modesetting's design.

Kind regards,
Nicolas Frattaroli



