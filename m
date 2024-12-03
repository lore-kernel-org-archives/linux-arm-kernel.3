Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F144E64AB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of1Ik4MvXXRmJiFvl6IgwhIZ3e6rTbtLF+pxPp+sWI8=; b=29OT58s/duzx64T2JiCq2mKUUf
	zHWzxM5N82qrZ47pWjo7b4U+VjpTdjp6fA/X3MmYObm5j3N2OFtIuV0S1Ol9WD9ZPTEZIWsvf6TZ6
	q4GPAWmPlVes/ODstOnbj3wA7weF/ZzVuxjFHpPejDCTmJNUEBnqsO+dE+PRuZorq3hV/TviYPV2b
	TVItdqQnRZ/L77r0w7TJb8r4bY4o+Jm3ItzV1k59KQ+bCOhGB0Z5IJYzg+7BcHBP0W3iAPVsuSRht
	zLZ/YAcZiaV7+QbDDP8dylNXH7Oc4PmYWIcAS6jc8w31r3HOoWl5/XdfaDODNKZdWDsAyGpd7EzDQ
	5vfdQgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITzi-00000009nNF-04Up;
	Tue, 03 Dec 2024 14:35:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITyC-00000009n4T-3Bkh;
	Tue, 03 Dec 2024 14:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Of1Ik4MvXXRmJiFvl6IgwhIZ3e6rTbtLF+pxPp+sWI8=; b=ZWN+XFdbOCZpPR6C8vli2AuztS
	lYPexP08MMXo2kw9KkIXVOnxnPuOwzXc56CyRwuHDNRShyuJerkvQ+iJ+v+BjV+8M7R3c1DOftM6e
	vhmekYQDPpb2/IfTbM3wFWAF7kIxOd+mZwArKFemUqU2PIko3cjAUnQOh9JbIJhxzeywUWSXRz3Af
	/KZFQv9F4/VHI6Cmuik7eyLbco909JU+UlZc8zGhn+dcLYrrqVcDsxe0qGESVdLRJvYzqk9aKbOj/
	v0rSFqeK+YDxwc6fhsmefR5pvbhuxRSyceDZlW37zfx+GlhzD9FgTj/s8zji/1qy0Ewq6wPBb7qBm
	8AFmkYfA==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITy8-00000002Oka-2Kui;
	Tue, 03 Dec 2024 14:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733236420; x=1764772420;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=t+NELF6Cs3AMXyjLkXGAGVtag15igAgDFRlk6+wOWag=;
  b=D2nSTb+qAQLlv/X6ydahb9KPTDyjbzzyTOk7LYEoYVsnugDiK/quXAqb
   VLdT3Gj/r2eX6be174jeHi9lCXbXrPoLz9tkXAXnfqgc5yAv78XqAHXLD
   C6ejUtV2+qj9uvbqTl+Of0duUkQorVayp4YPZQNMyw//udrMpl8DP21+e
   XzDJC3MFeQdn7XKQftm4WuIetIbq7r1uXwQcxPtTUeAZYR02jLTY4x87+
   nC96vmlDU58K6MoZkFzaHM0e8Kb0iv/Hp4DwAKuWnzHVcR8imdoBDCDk/
   7PkHYgIfqOQnlmVUKxyZEIw4LWu/K5rydpv1P3YaYp2KZqQJbcmvm++SU
   g==;
X-CSE-ConnectionGUID: 9Afd1mzSQoWr4p3K0Cyo6w==
X-CSE-MsgGUID: 4XHdnxznToSFISqxotEzdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33331023"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33331023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:33:37 -0800
X-CSE-ConnectionGUID: qFwNGDLVTlKCszQVkKdgBQ==
X-CSE-MsgGUID: YuyBpSYvSa20R8vswupuDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="98223136"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:32:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
 <20241202-married-bald-raven-7acd83@houat>
 <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>
Date: Tue, 03 Dec 2024 16:32:44 +0200
Message-ID: <877c8g4z1v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_143340_972589_4347769E 
X-CRM114-Status: GOOD (  33.86  )
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

On Tue, 03 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Mon, Dec 02, 2024 at 02:27:49PM +0100, Maxime Ripard wrote:
>> Hi,
>> 
>> On Sun, Dec 01, 2024 at 02:44:13AM +0200, Dmitry Baryshkov wrote:
>> > Use the helper function to update the connector's information. This
>> > makes sure that HDMI-related events are handled in a generic way.
>> > Currently it is limited to the HDMI state reporting to the sound system.
>> > 
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
>> >  1 file changed, 7 insertions(+), 2 deletions(-)
>> > 
>> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> > index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00777f11da8301bc1 100644
>> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>> > @@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
>> >  	 */
>> >  
>> >  	if (status == connector_status_disconnected) {
>> > +		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
>> >  		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
>> >  		return;
>> >  	}
>> >  
>> >  	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
>> >  
>> > -	drm_edid_connector_update(connector, drm_edid);
>> > +	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
>> > +	// CEC support
>> > +	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
>> 
>> So, it's not just about EDID, and I think we shouldn't really focus on
>> that either.
>> 
>> As that patch points out, even if we only consider EDID's, we have
>> different path depending on the connector status. It shouldn't be up to
>> the drivers to get this right.
>> 
>> What I had in mind was something like a
>> drm_atomic_helper_connector_hdmi_hotplug function that would obviously
>> deal with EDID only here, but would expand to CEC, scrambling, etc.
>> later on.
>
> I thought about it, after our discussion, but in the end I had to
> implement the EDID-specific function, using edid == NULL as
> "disconnected" event. The issue is pretty simple: there is no standard
> way to get EDID from the connector. The devices can call
> drm_edid_read(), drm_edid_read_ddc(connector->ddc) or (especially
> embedded bridges) use drm_edid_read_custom().

Lack of EDID may be a good approximation of disconnected for displays
that should have one, but just a reminder that having an EDID should not
be the only approximation for connected.

This is relevant for the debugfs/firmware EDID case. You'll want to be
able to have that, without it implying connected.

BR,
Jani.


>
> Of course we can go with the functional way and add the
> .read_edid(drm_connector) callback to the HDMI funcs. Then the
> drm_atomic_helper_connector_hdmi_hotplug() function can read EDID on its
> own.
>
> Also the function that you proposed perfectly fits the HPD notification
> callbacks, but which function should be called from the .get_modes()?
> The _hdmi_hotplug() doesn't fit there. Do we still end up with both
> drm_atomic_helper_connector_hdmi_hotplug() and
> drm_atomic_helper_connector_hdmi_update_edid()?
>
>> 
>> And would cover both the connected/disconnected cases.
>> 
>> Maxime

-- 
Jani Nikula, Intel

