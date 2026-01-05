Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB85C79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQOHBIIdr9wb3UwAOgWeXeSOOFCWd5Ehvaxx7a4u9wQ=; b=dUEHcYZh5seuA9S4YCRlIm7ZTQ
	gtpiaLUCV2K17fjc4X0Byad8Y5AgG6fB4iVQ4/PjpMvKE7d9YQErdzIpoRiGNOAUVhcy2jR8cd4ME
	OPeMfU/tw4Fd8xTknDl8eaK3bgpNHlRaW7E6goWLNnmpmBqZwUJEzF1C3boLbg3C++SoS5mSzW9Hc
	aIeDxJeR/n7weqrwRXDih+LFQJdRggE7KttB2dRFRo5QbbkjZ72DrT36qQj5g6ipT4N4aiZcgFz+b
	shiQ22PbQPPa6Ne6q7kSeo4/IS9sGvnh0bXMAXEHcRDhAYCwMAD+oCVgOMNrOWY89fgpFlEHe8Dxn
	PvsozZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqir-0000000C14j-1Z0S;
	Mon, 05 Jan 2026 19:58:37 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqip-0000000C13q-0H8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:58:36 +0000
Message-ID: <c28be0ef-f6c9-42e3-8f7b-133a93378d48@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767643110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQOHBIIdr9wb3UwAOgWeXeSOOFCWd5Ehvaxx7a4u9wQ=;
	b=kEePRUG7Bn7W31+FpUyH1Drkt4k55aSIkcEwC0LQ0v+Xdk+5so+Rn+p6C+mvxgZ4cJrzPS
	PZHL/K9e8ozNfpKTPZhfzmXGmcglbewyD0WHrmttQQ6486kMaBDvWSOroXHf9cZ59QZF/n
	kTa6aczXX3vLcaQAWQu59ws4X2nkAF0=
Date: Mon, 5 Jan 2026 14:58:25 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
 plane
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-4-sean.anderson@linux.dev>
 <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
 <b97065ce-2dc0-453b-ab8e-b2d134fc3467@linux.dev>
 <MW4PR12MB7165C437114B30DB21702365E6CBA@MW4PR12MB7165.namprd12.prod.outlook.com>
 <7f7423e9-809d-4023-be01-db59e6dd755e@linux.dev>
 <MW4PR12MB7165CDDB17CF0855EA19AACDE6A6A@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB7165CDDB17CF0855EA19AACDE6A6A@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_115835_263769_EFC4EBB9 
X-CRM114-Status: GOOD (  30.19  )
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

On 12/4/25 16:16, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Sean,
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Monday, November 17, 2025 7:36 AM
>> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>
>> Subject: Re: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> plane
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> On 11/14/25 19:12, Klymenko, Anatoliy wrote:
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >
>> >> -----Original Message-----
>> >> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Sean
>> >> Anderson
>> >> Sent: Thursday, November 13, 2025 3:07 PM
>> >> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>; Laurent Pinchart
>> >> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> >> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> >> Cc: linux-kernel@vger.kernel.org; Mike Looijmans
>> <mike.looijmans@topic.nl>;
>> >> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> >> <tzimmermann@suse.de>; Maarten Lankhorst
>> >> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>;
>> >> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>;
>> Simek,
>> >> Michal <michal.simek@amd.com>
>> >> Subject: Re: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> >> plane
>> >>
>> >> Caution: This message originated from an External Source. Use proper
>> caution
>> >> when opening attachments, clicking links, or responding.
>> >>
>> >>
>> >> On 11/13/25 18:03, Klymenko, Anatoliy wrote:
>> >> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >> >
>> >> > Hi Sean,
>> >> >
>> >> > Thank you for the patch.
>> >> >
>> >> >> -----Original Message-----
>> >> >> From: Sean Anderson <sean.anderson@linux.dev>
>> >> >> Sent: Thursday, November 13, 2025 12:37 PM
>> >> >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi
>> Valkeinen
>> >> >> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> >> >> Cc: linux-kernel@vger.kernel.org; Mike Looijmans
>> >> <mike.looijmans@topic.nl>;
>> >> >> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> >> >> <tzimmermann@suse.de>; Maarten Lankhorst
>> >> >> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> >> >> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>;
>> >> linux-
>> >> >> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>;
>> Simek,
>> >> >> Michal <michal.simek@amd.com>; Sean Anderson
>> >> >> <sean.anderson@linux.dev>
>> >> >> Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> >> plane
>> >> >>
>> >> >> Caution: This message originated from an External Source. Use proper
>> >> caution
>> >> >> when opening attachments, clicking links, or responding.
>> >> >>
>> >> >>
>> >> >> When global alpha is enabled, per-pixel alpha is ignored. Allow
>> >> >> userspace to explicitly specify whether to use per-pixel alpha by
>> >> >> exposing it through the blend mode property. I'm not sure whether the
>> >> >> per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
>> >> >> pre-multiplied so I guess we have to advertise it.
>> >> >>
>> >> >> [1] All we get is "The alpha value available with the graphics stream
>> >> >>     will define the transparency of the graphics."
>> >> >>
>> >> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> >> ---
>> >> >>
>> >> >>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
>> >> >>  1 file changed, 22 insertions(+), 2 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> >> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> >> index 456ada9ac003..fa1cfc16db36 100644
>> >> >> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> >> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> >> @@ -61,6 +61,13 @@ static int
>> zynqmp_dpsub_plane_atomic_check(struct
>> >> >> drm_plane *plane,
>> >> >>         if (!new_plane_state->crtc)
>> >> >>                 return 0;
>> >> >>
>> >> >> +       if (new_plane_state->pixel_blend_mode !=
>> >> >> DRM_MODE_BLEND_PIXEL_NONE &&
>> >> >> +           new_plane_state->alpha >> 8 != 0xff) {
>> >> >> +               drm_dbg_kms(plane->dev,
>> >> >> +                           "Plane alpha must be 1.0 when using pixel alpha\n");
>> >> >> +               return -EINVAL;
>> >> >> +       }
>> >> >> +
>> >> >>         crtc_state = drm_atomic_get_crtc_state(state, new_plane_state-
>> >crtc);
>> >> >>         if (IS_ERR(crtc_state))
>> >> >>                 return PTR_ERR(crtc_state);
>> >> >> @@ -117,9 +124,13 @@ static void
>> >> >> zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>> >> >>
>> >> >>         zynqmp_disp_layer_update(layer, new_state);
>> >> >>
>> >> >> -       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
>> >> >> -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
>> >> >> +       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
>> >> >> +               bool blend = plane->state->pixel_blend_mode ==
>> >> >> +                            DRM_MODE_BLEND_PIXEL_NONE;
>> >> >> +
>> >> >> +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
>> >> >>                                                    plane->state->alpha >> 8);
>> >> >> +       }
>> >> >>
>> >> >>         /*
>> >> >>          * Unconditionally enable the layer, as it may have been disabled
>> >> >> @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
>> >> >> zynqmp_dpsub *dpsub)
>> >> >>                         return ret;
>> >> >>
>> >> >>                 if (i == ZYNQMP_DPSUB_LAYER_GFX) {
>> >> >> +                       unsigned int blend_modes =
>> >> >> +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> >> >> +                               BIT(DRM_MODE_BLEND_PREMULTI);
>> >> >
>> >> > | BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the
>> >> hardware.
>> >>
>> >> Do you have a datasheet (or other) reference?
>> >>
>> >
>> > Yes https://docs.amd.com/v/u/en-US/ug1085-zynq-ultrascale-trm
>>
>> There is no mention of this in the TRM.
>>
>> | Video Blending is defined for two RGB video streams. One of these
>> | streams will be graphics that have an alpha value along with RGB
>> | stream. The alpha value available with the graphics stream will define
>> | the transparency of the graphics. Alpha value defined for blending
>> | function is always 8-bit. 1-bit alpha and 4-bit alpha are also
>> | supported, but these are scaled to 8-bits before they are used for
>> | alpha blending
>>
>> Please quote a specific section where the alpha blending formula is
>> documented.
>>
> 
> Yes, there is no explicit alpha blending formula in the TRM, although
> absence of "premultiplied alpha" term anywhere in the doc suggests that
> alpha is treated as a straight. Anyways, I cooked a quick test that proved
> the straight alpha theory: https://github.com/onotole/zynqmp-dp-alpha
> 
>> >> But in any case, DRM_MODE_BLEND_PREMULTI is mandatory even if we
>> >> don't support
>> >> it. See drm_plane_create_blend_mode_property for details.
>> >>
>> >
>> > No doubts here
>>
>> OK, so regardless of what the hardware does, we have to pretend to
>> support pre-multiplied alpha.
>>
> 
> Yes, we my pretend so, or we may work around backward compatibility check
> in drm_plane_create_blend_mode_property by setting blend mode to
> DRM_MODE_BLEND_COVERAGE immediately and later reject plane states
> with DRM_MODE_BLEND_PREMULTI mode.

OK, I'll add a patch to allow blend mode without premulti for v2. The
comment on the function says that it's a default for old userspace, but
we don't have a userspace that expects a particular blend mode in the
first place.

--Sean

