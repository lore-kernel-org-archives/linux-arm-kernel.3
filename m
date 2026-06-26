Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8502C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiXIftSGz3/FakEy7iV1z44v7wCiE7fCNRBBHRqbE8s=; b=2JcgMDGTCkNMvdNr5bsWXnWQ+J
	j5AAI/KpcmXSqnahy8Z+PfkrltQkISNzZ23h3AwnWrAwx7I5F0lEfrm3jwyeVv+qltDH7MQ9JT13a
	knHOkykE8XjAeoJnRRYHQDvezCAtPtOm3S30lu6U1pHjWXGEs9zHK+G7W3adwp1L+3wOnYqZD4M+l
	p0ZbsEbak1Kp6qQn5kks/KYXPqVhtIEOLtRdw/7BbLw43dgN0ULLkCDxMNZsR20p4QcUc0iygtVmZ
	2MvhnOzcalhbW2AaIGO9YHUp3t0L4oxFfJ0JoKjJH1+TdMAatQDRfjFwVhVFJUux7t6s3O3Psl7ch
	KrCz1RmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7MZ-0000000BRVB-1EOl;
	Fri, 26 Jun 2026 14:16:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7MV-0000000BRUo-3SP1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:16:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02A4FC6344B;
	Fri, 26 Jun 2026 14:17:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 151A760232;
	Fri, 26 Jun 2026 14:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF1E0104C83B5;
	Fri, 26 Jun 2026 16:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782483410; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HiXIftSGz3/FakEy7iV1z44v7wCiE7fCNRBBHRqbE8s=;
	b=m5HGN2LNoMhBXxCIbtrRqDG7GXhu7+7ogaB+/nzDsIn4MLa5kkPA5pY+/7jFFwOuQ51aWQ
	Y+Tcx7DX2+P+8d4ut48OT1anz9HquQENZ0WzjRUAbHX97j1gupFhLqqki/VKyD2A9Dx2Be
	vdrjbYznwyl/q40lt4C1+d3/sLQEQa9cofGSPagfyOQAbLY1FANy+Q5RI5xWEVCyUsQ6x6
	dLkRu2lAcI5a7ksYedje41gF8Tyhu6BXYRvD3w7z40eozal46JS+mxnRIqaZlqdlgLoBB7
	rCRGmf8nusV+T4bc92twcZU1dSIM6/9nCt3HH2Mj2fsKKtnIRvB42cBwUIsl8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 16:16:39 +0200
Message-Id: <DJJ1MPCEJGZD.UZM9183V6ZE5@bootlin.com>
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code
 creating the connector to a subfunction
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
 <20260608-mindful-heavy-frigatebird-be9faf@houat>
 <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
 <20260624-proud-unbiased-pony-ecc3c3@houat>
 <DJHEAWSEZR79.19UFIKS8QJBQ7@bootlin.com>
 <20260626-polite-hairy-perch-25e1aa@houat>
In-Reply-To: <20260626-polite-hairy-perch-25e1aa@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_071656_219273_C98ED1D5 
X-CRM114-Status: GOOD (  33.78  )
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

Hi Maxime,

On Fri Jun 26, 2026 at 12:09 PM CEST, Maxime Ripard wrote:
> On Wed, Jun 24, 2026 at 05:47:10PM +0200, Luca Ceresoli wrote:
>> On Wed Jun 24, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
>> > Hi,x
>> >
>> > On Fri, Jun 12, 2026 at 02:56:24PM +0200, Luca Ceresoli wrote:
>> >> On Mon Jun 8, 2026 at 1:40 PM CEST, Maxime Ripard wrote:
>> >> > On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wrote:
>> >> >> In preparation to introduce bridge hotplug, split out from
>> >> >> drm_bridge_connector_init() the code adding the drm_connector into=
 a
>> >> >> dedicated function. This will be needed to be able to add (and re-=
add) the
>> >> >> connector from different code paths.
>> >> >
>> >> > Same story here, explaining what you need later on that calls for t=
hat
>> >> > change would be nice.
>> >>
>> >> Here's a more verbose version:
>> >>
>> >>     Currently drm_bridge_connector_init() does two things:
>> >>
>> >>      * allocate and initialize the drm_bridge_connector
>> >>        (which embeds a drm_connector)
>> >>      * initialize and register the embedded drm_connector
>> >>
>> >>     For bridge hotplug we need to separate these two actions:
>> >>
>> >>      * the drm_connector needs to be added and removed at any time ba=
sed on
>> >>        hotplug events
>> >>      * the drm_bridge_connector is designated to create and remove th=
e
>> >>        drm_connector, so it must be persistent for the card lifetime
>> >>
>> >>     As the lifetimes of drm_bridge_connector and drm_connector become
>> >>     different, we need to create them in different moments.
>> >>
>> >>     In preparation to support that, split out from
>> >>     drm_bridge_connector_init() the code adding the drm_connector int=
o a
>> >>     dedicated function. No functional changes, just moving code aroun=
d for
>> >>     now. A future commit will make the drm_connector be created based=
 on
>> >>     hotplug events.
>> >>
>> >> Looks good?
>> >
>> > The message itself, yes, thanks.
>> >
>> > However, I have questions now :)
>> >
>> > Do we really expect drm_bridge_connector to stick around when a bridge
>> > gets unplugged? If so, how does it cope with having, say, an HDMI
>> > connector, and then swapping out the hotplugged part for an LVDS one?
>> > Does the HDMI connector sticks around indefinitely?
>>
>> In your example, the HDMI drm_connector would be unregistered and put on
>> hotunplug. Its allocation will stick around until the last put but that'=
s
>> quite irrelevant. Then, on plugging the LVDS addon, a new LVDS
>> drm_connector will be created and registered.
>>
>> > *Especially* if we're using overlays for this, I'd expect everything
>> >  after the first hotplugged bridge to be destroyed, no?
>>
>> As said, it would be unregistered immediately but might be freed later o=
n
>> if still refcounted.
>>
>> This is visible in patches 36+15, the path to follow is:
>>
>>  drm_bridge_connector_handle_event(event =3D DRM_BRIDGE_DETACHED) [patch=
 36]
>>  -> drm_bridge_connector_dynconn_release()                      [patch 1=
5]
>>
>> Does this solve your concern?
>
> Not really, I'm talking about drm_bridge_connector. The fact that
> bridges are destroyed make sense to me. The fact that
> drm_bridge_connector sticks around doesn't. It's supposed to be a
> connector for bridges. If you don't have bridges because they got
> destroyed, and connector, drm_bridge_connector doesn't have a reason to
> exist anymore, unless it's drm_bridge_hotplug in a trench coat :)

It is not a hotplug-bridge in a trench coat, no :) The code is clear about
this.

I'd say with this series a "drm_bridge_connector" is just becoming
something more (perhaps something else too). Somewhat as "a drm_bridge is
either a bridge or something else". :)


But let's leave names aside for a moment. If just looking at the current
code, the drm_bridge_connector is "a handler, owned by the card/encoder and
having the same lifetime, which takes care of drm_connector
creation/destruction at card probe/removal".

What we need now is just the same plug " and on hotplug events" appended.

So in both cases there needs to be "a handler persitent with the card".

Do we agree so far?


Now, the reason I chose to extend the drm_bridge_connector to achieve the
above is what I tried to motivate in the cover letter:

> The drm_bridge_connector is nowadays the recommended way to implement DRM
> connectors when a chain of bridges is used. It takes care of adding the
> drm_connector when the pipeline is composed by an arbitrarily long chain =
of
> bridges, which it scans to properly implement the drm_connector
> operations.
>
> As such the drm_bridge_connector looked like the ideal component to
> implement DRM bridge hotplug.
>
> This series augments the drm_bridge_connector code to be able to create a=
nd
> destroy the drm_connector reacting on hot(un)plug events.

Before taking that approach I considered some options:

 1. Create a new component, which is a "a handler, owned by the
    card/encoder and having the same lifetime, which takes care of
    drm_connector creation/destruction at card probe/removal and on hotplug
    events", and wait for drivers to migrate from the drm_bridge_connector
    to this new thing

 2. Create a new component, which is a "handler, owned by the card/encoder
    and having the same lifetime, which reacts to hotplug events by
    creating/destroying a drm_bridge_connector (slightly modified to be
    non-drmm), which in turn takes care of drm_connector
    creation/destruction", and wait for drivers to migrate to this new
    thing

 3. Extend the dm_bridge_connector to:
    - behave as before if using the current API
    - behave as before + hotplug if using a new API
    (the migration in most cases is as simple as patch 37)

All 3 options require changes in card drivers to use a new API (and a new
object type for cases 1 and 2).

To me options 1 and 2 involve more redundant code and/or more complexity.

Your thoughts?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

