Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1102ED3F084
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opAspiy4bTRYcLC6unWKPdWWHfqQ8ZUrRbEYl36TmAQ=; b=gONKYBwdSUa27aEMdpHIAiyZ1K
	M3lVlaqBvP2fJ5kMvkiwayt7ln4Xhky1Z5ZpSnRufMnDbYWQAyMnw9WeM4G9mQrfu7/zvDSzRLpnc
	9R1YIZmP0GflYb5g5OZtWDITjpeya3ePO9H7TCv4kkoyzVdNzTZ8BAE1IKKvpGmuj8sa+8ly8o02Z
	exFS3pfK/mJUAXOUDmaOY+OMA7UY9Uw32NfGgzzHBfTEahlrVwQU1DQbNyZ0Ry6+VdyLspRZHensC
	ezD8iT+AFPm8h44c3pD1XP4VEb9rn0KMomousyurJyWALN+6KQjus5OIMPhI80WHT19Zx+b2PrQXQ
	zYKYq9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7wB-0000000GKT3-3UOP;
	Wed, 28 Jan 2026 15:58:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7wA-0000000GKSq-0JmF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 15:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=opAspiy4bTRYcLC6unWKPdWWHfqQ8ZUrRbEYl36TmAQ=; b=VzselD4ILqY0rtBCld4mp3C/N/
	wZbrIVWsOvvtMECvaa8hY5CsG+NVfdaHueImCmTsOYX6y39fHbRu7P1oBF0X+e3Y5MWAxxQhaI6VY
	NDIr8BRmXk6BXM6uZO3Ytn1ab/5UnXh6yBkEoLMs/NFoszxZT8rchO9Gx6++oeJ9Te3eJjS39jLpT
	v/HeesHvZgH5kTPOdfJHdfQGaMbPmMvwvg51KjrCR2Jb6z/dDA3X0BVoI8I2HZkjHmdLQSRIPnBko
	rD1E0yo2qyvyBvw43LHI7bkQm2nH/VhkfA/NnUiwQQv6nlPUCFFN0Znp5yxFiD2dLR/sc54O5QkSP
	Cw+q2OLQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7w6-00000008t8I-1NZQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:58:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 02EC61A2ACA;
	Wed, 28 Jan 2026 15:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8DD06071F;
	Wed, 28 Jan 2026 15:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C68C4119A880E;
	Wed, 28 Jan 2026 16:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769615906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=opAspiy4bTRYcLC6unWKPdWWHfqQ8ZUrRbEYl36TmAQ=;
	b=QamPg3xM/8AtOWXPVKLc0zQYrpOuZwfbPdoikFrYbxLui6jdcfG7NjcdieV7BNDPrjj+Lw
	rEc6DRq8w0F8oS+UQ5VoVnmbOp1n9qMLfRQKl3c5efASRc6MC9ceoMkU0Fn2yk+SfaLCQ8
	XcceSvgfcibNP4C7fekLjCJgdKZ8qkxjSl0CivQkkTMgzphGvSpsy4O8uEmHyNPRiI20l3
	BpmCJ9EChqaTYfc6huYMMomKw5MHNGcqYcVWKUsY7wqFm416lZhLlnsfPRg/jNPlzNNv/8
	aBSUCRLcEH6XZfJqoS211BBiMpOPkrb3jTiIfvh142LnY872qGqJSHteXn4dXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:58:18 +0100
Message-Id: <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com> <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com> <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
In-Reply-To: <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_155830_577074_656DC741 
X-CRM114-Status: GOOD (  27.25  )
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

On Tue Jan 27, 2026 at 4:54 AM CET, Liu Ying wrote:

...

>>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>>>  {
>>>>  	struct device_node *np =3D pl->dev->of_node;
>>>>  	struct device_node *port;
>>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>>>  	u32 port_id;
>>>>  	bool found_port =3D false;
>>>>  	int reg;
>>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>>>  			continue;
>>>>  		}
>>>>
>>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>>> +			of_drm_find_and_get_bridge(remote);
>>>>  		if (!next_bridge)
>>>>  			return -EPROBE_DEFER;
>>>>
>>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(s=
truct imx8qxp_pixel_link *pl)
>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>  		 * present, otherwise default to the first bridge
>>>>  		 */
>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-=
pxl2dpi"))
>>>> -			selected_bridge =3D next_bridge;
>>>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-=
pxl2dpi")) {
>>>> +			drm_bridge_put(selected_bridge);
>>>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>>>
>>> Considering selecting the first bridge without the companion pxl2dpi,
>>> there would be a superfluous refcount for the selected bridge:
>>>
>>> 1) of_drm_find_and_get_bridge: refcount =3D 1
>>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
>>> 3) drm_bridge_get: refcount =3D 2
>>> 4) drm_bridge_put(__free): refcount =3D 1
>>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2
>>
>> Here you are missing one put. There are two drm_bridge_put(__free), one =
for
>> next_bridge and one for selected_bridge. So your list should rather be:
>>
>> 1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
>> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL,=
 refcount =3D 1
>> 3) selected_bridge =3D drm_bridge_get: refcount =3D 2
>> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D =
1
>> 5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
>> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: refco=
unt =3D 1
>
> Ah, right, I did miss this last put because selected_bridge is declared w=
ith
> __free a bit far away from the loop at the very beginning of
> imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but I'=
m
> not even sure if I'll fall into this same pitfall again after a while, wh=
ich
> makes the driver difficult to maintain.
>
> Also, it seems that the refcount dance(back and forth bewteen 1 and 2) is=
 not
> something straightforward for driver readers to follow.

I thing the whole logic becomes straightforward if you think it this way:

 * when a pointer is assigned =3D a new reference starts existing -> refcou=
nt++
 * when a pointer is cleared/overwritten or goes out of scope =3D a referen=
ce
   stops existing -> refcount--

In short: one pointer, one reference, one refcount.

If you re-read the patch with this in mind, does it become clearer?

>>> I think the below snippet would be the right thing to do:
>>> -8<-
>>> {
>>> 	...
>>>
>>> 	struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>> 		of_drm_find_and_get_bridge(remote);
>>>   		if (!next_bridge)
>>>   			return -EPROBE_DEFER;
>>>
>>> 	/*
>>> 	 * Select the next bridge with companion PXL2DPI if
>>> 	 * present, otherwise default to the first bridge
>>> 	 */
>>> 	if (!selected_bridge)
>>> 		selected_bridge =3D drm_bridge_get(next_bridge);
>>>
>>> 	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>>> 		if (selected_bridge)
>>> 			drm_bridge_put(selected_bridge);
>>>
>>> 		selected_bridge =3D drm_bridge_get(next_bridge);
>>> 	}
>>> }
>>
>> Your version of the code looks OK as well so far, but totally equivalent=
 to
>> what my patch proposes.
>>
>> Do you think splitting the if() into two if()s is clearer? Would you lik=
e
>> me to change this?
>
> Yes, please.  Two if()s are easier for me to read.

OK, will do.

> Also I think the
> "if (selected_bridge)" before "drm_bridge_put(selected_bridge)" improves
> readability, though I know drm_bridge_put() checks input parameter bridge
> for now.

I was about to reply "the NULL check in drm_bridge_put() is part of the API
contract as its documentation says", but then realized the documentation
does not say that. My bad, I was convinced I had documented that behaviour
to make it part of the contract so users can rely on it. I'm sending a
patch ASAP to document that.

>
>>
>>> ...
>>> pl->bridge.next_bridge =3D selected_bridge;
>>
>> Based on the logic above the drm_bridge_get() is still needed here (both
>> with the single if() or the split if()s) because at function exit the
>> selected_bridge reference will be put.
>
> Can the refcount dance be simplified a bit by dropping the put at
> function exit?  This snippet is what I'd propose if not too scary:
>
> -8<-
> 	struct drm_bridge *selected_bridge =3D NULL;
> 	...
>
> 	{
> 		...
>
> 		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
> 			of_drm_find_and_get_bridge(remote);
> 			if (!next_bridge)
> 				return -EPROBE_DEFER;
>
> 		/*
> 		 * Select the next bridge with companion PXL2DPI if
> 		 * present, otherwise default to the first bridge
> 		 */
> 		if (!selected_bridge)
> 			selected_bridge =3D drm_bridge_get(next_bridge);
>
> 		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
> 			if (selected_bridge)
> 				drm_bridge_put(selected_bridge);
>
> 			selected_bridge =3D drm_bridge_get(next_bridge);
> 		}
> 	}
>
> 	...
> 	pl->bridge.next_bridge =3D selected_bridge;
> -8<-

Based on the "one pointer, one reference, one refcount" logic I explained
above, I find this version more complex to understand. I read it as:
selected_bridge and pl->bridge.next_bridge are two pointers sharing a
single reference, and we know that would not create bugs because by careful
code inspection we realize that the life of the two references is
overlapped without a hole inbetween. I'm not a fan of this.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

