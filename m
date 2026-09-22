Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9096CC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VjNl0wa/Nxv7LlY9fTplz72WoCM/sa6XfRLdYqoWf4=; b=ZmwG/95At1uxsdpICavPvAGFC9
	XxKOUUcFRaBwuqTeODE/Xi79oWM+kX5x8Groq9XcaSX85zWUsAAj0AdwyzLAM6dJPIL0lBHrwhG7Q
	wEdTbCHIwKa5ItXW7Zlkl2jj6xohdXRnfY38Bo01L0sjRX75N4xiCyuHI6zXQ9dgme86C2GTuhTpX
	A+z5FwrHqAEOzBUguUwH52nWu8j+c0wosxYwnTtRDJ/PB9WGyw6UTayvzxUVdjD8tWis0ivARyYnz
	bT2WqD5ZXacEHDHDDQKIH14w7R3wFIEf5f5rgrRfPdyqVtKF4oltq/2/6Qi6oxXT8OHXlF3P7v2ZO
	79T3qzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9016-00000005NPw-2akb;
	Tue, 22 Sep 2026 12:54:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9015-00000005NP8-07Jo;
	Tue, 22 Sep 2026 12:54:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790081625; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KTndc6JZaRZHwnEIOsJVOKmqMnPoyD0yJUj7daOPlmBUXrYCLC7sXrwHhSQE/M1j0SelAcsyof5PD3lQS0w0CQBr9yUNEWhUGag6v95l7NXo+BzIQ8Gce1U7JIP5hgSyjCQ/1LXPWKv2jxbgTyp2dNeb1Sm2ibtztE+5DPc8Ji4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790081625; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8VjNl0wa/Nxv7LlY9fTplz72WoCM/sa6XfRLdYqoWf4=; 
	b=iQEHTfp1vj8knug37pUf8qyg1jsi2Ik8q0L8i491jEO0OnRutlTdUNwhENof8gUq8voCE7STLUVB+/PzLLd95UmcLL1pBDYWthMysH2QgI55DWtF7mVJ2RQmP/Ftc/qBYmbCmCsjRTmZAL2aFbbo/cWYijsVLzEewVy1YHXAVg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790081625;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=8VjNl0wa/Nxv7LlY9fTplz72WoCM/sa6XfRLdYqoWf4=;
	b=TCdu6C7hW2pYijD6VGCaiC+wv5MqeYa3Fx6j1IxMBPJkKRSEEGQpJJdhmINCvJ3i
	zeMSbdPSbjZu51N/DttLQ5WTW3C38NdLEbu+/1NqKFSdt/fldM1iQ5G47a4IkHlsXrr
	x/iihlM9thTLVL5I1AkmxN9YehFWKw8QVIzXhiUI=
Received: by smtp.zohomail.com with SMTPS id 1790081623916135.24430513639902;
	Tue, 22 Sep 2026 05:53:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Leo Li <sunpeng.li@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 03/25] drm/atomic-helper: Set mode_changed on vrr_enabled
 change
Date: Tue, 22 Sep 2026 14:53:36 +0200
Message-ID: <XpLMHDHXSDOKXXVsZyU9Pg@collabora.com>
In-Reply-To: <75b82a61-fe82-4597-bfb5-3c717fbb0dda@amd.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-3-2fcd7d011646@collabora.com>
 <75b82a61-fe82-4597-bfb5-3c717fbb0dda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055435_125976_6D55C287 
X-CRM114-Status: GOOD (  26.79  )
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

On Monday, 21 September 2026 23:59:11 Central European Summer Time Leo Li wrote:
> Hi Nicholas,
> 
> Thanks for sending this out. I'm looking into an amdgpu implementation
> and had some comments along the way. Will reply inline on respective
> patches.
> 
> On 2026-09-21 11:51, Nicolas Frattaroli wrote:
> > A change in whether VRR is enabled or not on a CRTC will be of interest
> > to any VRR implementation, as they may need to recalculate certain
> > internal state in response. So far, this was handled ad-hoc in the
> > drivers that implement VRR.
> > 
> > Handle this in the common DRM atomic core by setting the mode_changed
> > flag when this occurs. The rationale for using mode_changed is that VRR
> > is deeply intertwined with the current mode with regards to its timing.
> > Consequently, any component that cares about a mode change is likely
> > also going to care about VRR being enabled/disabled.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 9d006f98413a..0664d5779282 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -694,6 +694,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  			new_crtc_state->active_changed = true;
> >  		}
> >  
> > +		if (old_crtc_state->vrr_enabled != new_crtc_state->vrr_enabled) {
> > +			drm_dbg_atomic(dev, "[CRTC:%d:%s] VRR changed\n",
> > +				       crtc->base.id, crtc->name);
> > +			new_crtc_state->mode_changed = true;
> > +		}
> > +
> 
> I don't think this is the case for all hardware, at least not for amdgpu.
> The parts in HW that adjust vtotal can be programmed without requiring
> bandwidth recalculations or reprogramming of pipes.

Thanks for pointing this out. I was already unsure of this patch before,
and I don't think Rockchip requires these recalculations either. Originally
I added this when I looked at the i915 code iirc and saw them setting it.

I think in the commit message I also conflate needing to know about VRR
being changed with needing to do a full modeset (which is what mode_changed
basically means).

I'll drop this patch on the next revision.

Kind regards,
Nicolas Frattaroli

> 
> - Leo
> 
> >  		if (new_crtc_state->enable != has_connectors) {
> >  			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
> >  				       crtc->base.id, crtc->name,
> > 
> 
> 





