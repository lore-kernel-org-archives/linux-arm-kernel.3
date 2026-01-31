Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82FFD73EB3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0GLAxiMOsLVdd68D5Q5jgpRId3SxU0Ogg0V46Yapj0=; b=oXm8rLBGD67B1x7gSWEXlwvxwS
	dUFJ5NvumDbbkMihIOKACIhykxtM8uS+QrLLS0/UzqsZVde1uVQwfeZuAiITzYOeqBjM5WSNkgJxG
	0KEZ6YmEQtM7Igy+DTInp19S7ZaFuIcr29oQ8GW7gTFr08KVWwgoYFAXQmlwVLFBYIAc18W9vFArk
	V0HDU1MQ83mfoyrdXb6ryMkFhgu40qR5P/PjkVy6ygRyKs4fsyRK5FE6CGrYkZV3dJsUHkvPkv/PD
	ec/FecDkxQ0zn03hsZNuyvyRVPSHL2zOh5D27ObQJBgDCAq0Vas90gg1fg4xiLf/NJig7e9Owu+wr
	jPnIbsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmF0I-00000002rZw-0Y3v;
	Sat, 31 Jan 2026 17:43:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmF0E-00000002rZb-3s6m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 17:43:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 218C64E4237A;
	Sat, 31 Jan 2026 17:43:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA50E606B6;
	Sat, 31 Jan 2026 17:43:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 472E9119A888D;
	Sat, 31 Jan 2026 18:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769881397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+0GLAxiMOsLVdd68D5Q5jgpRId3SxU0Ogg0V46Yapj0=;
	b=SJMrMNctuR74wAN8d4z0NJzEOlaGLF1diXKFZ5u1qknb7SE9NOGtn8mUGXpYpQvfDYtdeR
	Zbx6nd1axeg5Aoze4vT/4lnKT+ZC4qxC2FpFj7h+1o2LxxUj/7seU8u1leoz1PWioDNpzU
	6k0hOqGHR/CHDUsXeEwYmj9yxTfS9F7E3EIVNVWB2zX3FLZojA5jQnIAOusXd1Fox40j0k
	lOFxwTi3ls00YGrvWActsK5XmsiCv/rxtvGmexbrfInrtdcZVHYMpnCnTx9f+nFPRFoz4j
	dPwItRhhKdKhrWIU8wFOi1ekIvo3hsuK+SHh1cYbvFQqnpvN33/aAK7+QtkszQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 18:43:08 +0100
Message-Id: <DG2YL94N216P.31GDSWQ0OD1PT@bootlin.com>
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
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com> <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com> <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com> <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com> <d0836d04-d15d-45de-a765-bacad9e7759a@nxp.com> <aff6f95e-abdc-4253-8724-eec4a98bb268@nxp.com>
In-Reply-To: <aff6f95e-abdc-4253-8724-eec4a98bb268@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_094323_250605_BF36BD7D 
X-CRM114-Status: GOOD (  19.09  )
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

On Thu Jan 29, 2026 at 9:18 AM CET, Liu Ying wrote:
>
>
> On Thu, Jan 29, 2026 at 03:49:38PM +0800, Liu Ying wrote:
>>
>>
>> On Wed, Jan 28, 2026 at 04:58:18PM +0100, Luca Ceresoli wrote:
>>> On Tue Jan 27, 2026 at 4:54 AM CET, Liu Ying wrote:
>>>
>>> ...
>>>
>>>>>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(=
struct imx8qxp_pixel_link *pl)
>>>>>>>  {
>>>>>>>  	struct device_node *np =3D pl->dev->of_node;
>>>>>>>  	struct device_node *port;
>>>>>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>>>>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NUL=
L;
>>>>>>>  	u32 port_id;
>>>>>>>  	bool found_port =3D false;
>>>>>>>  	int reg;
>>>>>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(=
struct imx8qxp_pixel_link *pl)
>>>>>>>  			continue;
>>>>>>>  		}
>>>>>>>
>>>>>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>>>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>>>>>> +			of_drm_find_and_get_bridge(remote);
>>>>>>>  		if (!next_bridge)
>>>>>>>  			return -EPROBE_DEFER;
>>>>>>>
>>>>>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridg=
e(struct imx8qxp_pixel_link *pl)
>>>>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>>>>  		 * present, otherwise default to the first bridge
>>>>>>>  		 */
>>>>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,compani=
on-pxl2dpi"))
>>>>>>> -			selected_bridge =3D next_bridge;
>>>>>>> +		if (!selected_bridge || of_property_present(remote, "fsl,compani=
on-pxl2dpi")) {
>>>>>>> +			drm_bridge_put(selected_bridge);
>>>>>>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>>>>>>
>>>>>> Considering selecting the first bridge without the companion pxl2dpi=
,
>>>>>> there would be a superfluous refcount for the selected bridge:
>>>>>>
>>>>>> 1) of_drm_find_and_get_bridge: refcount =3D 1
>>>>>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D=
 1
>>>>>> 3) drm_bridge_get: refcount =3D 2
>>>>>> 4) drm_bridge_put(__free): refcount =3D 1
>>>>>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2
>>>>>
>>>>> Here you are missing one put. There are two drm_bridge_put(__free), o=
ne for
>>>>> next_bridge and one for selected_bridge. So your list should rather b=
e:
>>>>>
>>>>> 1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
>>>>> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NU=
LL, refcount =3D 1
>>>>> 3) selected_bridge =3D drm_bridge_get: refcount =3D 2
>>>>> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =
=3D 1
>>>>> 5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
>>>>> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: re=
fcount =3D 1
>>>>
>>>> Ah, right, I did miss this last put because selected_bridge is declare=
d with
>>>> __free a bit far away from the loop at the very beginning of
>>>> imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but=
 I'm
>>>> not even sure if I'll fall into this same pitfall again after a while,=
 which
>>>> makes the driver difficult to maintain.
>>>>
>>>> Also, it seems that the refcount dance(back and forth bewteen 1 and 2)=
 is not
>>>> something straightforward for driver readers to follow.
>>>
>>> I thing the whole logic becomes straightforward if you think it this wa=
y:
>>>
>>>  * when a pointer is assigned =3D a new reference starts existing -> re=
fcount++
>>>  * when a pointer is cleared/overwritten or goes out of scope =3D a ref=
erence
>>>    stops existing -> refcount--
>>>
>>> In short: one pointer, one reference, one refcount.
>>>
>>> If you re-read the patch with this in mind, does it become clearer?
>>
>> Thanks for more explaination, maybe it becomes a bit clearer, I'm not su=
re:/
>>
>> Anyway, to simplify things with another try, I came up with the below
>> snippet in that loop, which drops the two intermediate bridges(local
>> next_bridge and selected_bridge) and uses pl->next_bridge only.
>
> Fix a typo:
> s/pl->next_bridge/pl->bridge.next_bridge/
>
>> It looks ok to me(at least, refcount dance is much simpler).
>>
>> -8<-
>> if (!pl->next_bridge || of_property_present(remote, "fsl,companion-pxl2d=
pi")) {
>>         drm_bridge_put(pl->next_bridge);
>>         pl->next_bridge =3D of_drm_find_and_get_bridge(remote);
>>         if (!pl->next_bridge)
>>                 return -EPROBE_DEFER;
>> }
>> -8<-
>
> -8<-
> if (!pl->bridge.next_bridge || of_property_present(remote, "fsl,companion=
-pxl2dpi")) {
>         drm_bridge_put(pl->bridge.next_bridge);
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
> -8<-

It's OK enough, so in v5 I'm going to split the if() and skip the
intermediate selected_bridge variable.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

