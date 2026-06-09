Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578CACD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHx7IH4CQnKVKKiwpqK0zhDBHfLiKLUyXdppF6LNFCI=; b=ojxVFId2N108EQI7B7c0iXzO1q
	/yYrlCuRQV9rAgsAPRk0GAg++RlgW7hJkBybDdx9Z/bh8yA6G2zOrxYDqP5+oWg6hTEPZxXjXfLY+
	zgrsO1eXktbWhwYLeRs739oOpjoTr0UE6Is4089lmvDJody7ZOTAU5S+uDWGSZB7POVhcCy2htQgI
	2cnju+MvjIhzrOQqs70GE8aZWvruoRvFkeTr3jHROVdMm4H4Mknqk8uUngX7n5Ii5xBArACqrwknu
	4Jm0aLK8LJblAuCMoYqnGv0x+fUykUwo2IpCEabdUcRpDyowMsFDG6ULPPn4wYlid69+zwkXzFfHM
	ZSNlWBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrkM-000000053Vh-0DaL;
	Tue, 09 Jun 2026 08:23:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrkI-000000053Ud-3tQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:23:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE7BA4E42D42;
	Tue,  9 Jun 2026 08:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88A575FFC1;
	Tue,  9 Jun 2026 08:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A6E7106A2A9D;
	Tue,  9 Jun 2026 10:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780993414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHx7IH4CQnKVKKiwpqK0zhDBHfLiKLUyXdppF6LNFCI=;
	b=hBvKze0J9N8/PmsSE6wYyE0e6AUrZ2far59k3pTSOl2RKwQor+bVUthTqYbZzuGRC/LqUy
	XEtovmur3V7GsJWjLsQPdA4/cQnjZRRpq3BRdCj7AHlZsPO4vJ3HMd0pMVjkoa8bot+yZq
	LFfie0S6ftflFFnNPOtYWsJxBk2JgQRBT9NzJIrvDOhZ2NxHcQGletZrbMTNalwFH9wKN/
	8MxgXYJ97sakzc/ZnElRG4JexPstQoQhZik71MXWLzyV6Pzz9mjBLw3BqxUDvTi+ToftvT
	fLjB/nO/tKgurtlMQxRP5TWpzQQTooBZCawYuuYREldkQdfoNHDEoxYhf2B/6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 10:23:24 +0200
Message-Id: <DJ4DGYZ3GQZH.3AZOC0Z69W92S@bootlin.com>
Subject: Re: [PATCH 30/37] drm/bridge: add drm_bridge_is_tail() to know
 whether a bridge completes the pipeline
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
 <20260519-drm-bridge-hotplug-v1-30-45e2bdb3dfb4@bootlin.com>
 <20260608-shapeless-opal-ferret-c8b105@houat>
In-Reply-To: <20260608-shapeless-opal-ferret-c8b105@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_012339_107606_F4CB6B45 
X-CRM114-Status: GOOD (  24.80  )
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

thanks for the review of this long series!

On Mon Jun 8, 2026 at 2:34 PM CEST, Maxime Ripard wrote:
...
>> --- a/include/drm/drm_bridge.h
>> +++ b/include/drm/drm_bridge.h
>> @@ -78,6 +78,19 @@ struct drm_bridge_funcs {
>>  	int (*attach)(struct drm_bridge *bridge, struct drm_encoder *encoder,
>>  		      enum drm_bridge_attach_flags flags);
>>
>> +	/**
>> +	 * @is_tail:
>> +	 *
>> +	 * Returns true if this is a tail bridge, i.e. it does not need a
>> +	 * next bridge to work. E.g. a panel_bridge is a tail bridge, a
>> +	 * DSI-to-LVDS bridge is not a tail bridge (no matter whether the
>> +	 * next bridge is present or not).
>
> Why a DSI-to-LDVS bridge isn't a tail bridge? It only needs a panel
> next, right?

Uhm, good point, but I'd say it can be a tail bridge or not: in the
ATTACH_NO_CONNECTOR case it will need a bridge (a panel_bridge most
likely), no?

However this is possibly irrelevant as the whole .is_tail is meant to
disappear in v2, see below.

>> +	 * The @is_tail callback is optional but it is required if the
>> +	 * bridge is part of a pipeline with hot-pluggable components.
>> +	 */
>> +	bool (*is_tail)(struct drm_bridge *bridge);
>> +
>
> I don't think that's the right way to think about it, if only because
> you never really know at the driver level if you're supposed to be last
> or not. A DSI-to-LVDS bridge might just as well be chained with an
> LVDS-to-eDP bridge, or feed the panel directly without any additional
> bridge.
>
> I *think* that what you're trying to find out here is whether the chain
> is complete or not.

You nailed it.

That was the main point discussed during the Display Next Hackfest 2026
(see the report [0]) and we all agreed the .is_tail along with the
-EPROBE_DEFER changes (patches 20+35) are not a good approach.

This is actually the most crucial aspect of the whole work still not having
no well-defined solution.

> I think you can get the same information by checking
> whether you have a connector for that bridge chain. If you don't, you
> know the chain isn't complete, and if you do, it's supposed to be.

There's a checken-egg problem here. Knowing whether the pipeline is
complete or not is needed to know whether we have to create a
connector. See patch 36:

  +  if (drm_bridge_connector_pipeline_is_complete(bridge_connector))
  +          drm_bridge_connector_add_connector(bridge_connector);

So the question is still open, what I need the most right now is comments
on the overall architecture of this aspecs. Maybe replying to [0] can be
more effective than here.

In a nutshell what we need is:

 * when a bridge needs a following element (a bridge, or a panel which
   however might/should have a panel_bridge), but that element is not
   present, instead of deferring the whole card probe the card should be
   allowed to probe but without a connector

 * when something is added to an incomplete pipeline we need to know
   whether the pipeline has become complete (in order to create the
   connector)

How to implement this is still an open point. I'll welcome proposals in
addition to the ones in [0].

[0] https://lore.kernel.org/all/DIXTUCXAU68V.1T7X89LMEUF2F@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

