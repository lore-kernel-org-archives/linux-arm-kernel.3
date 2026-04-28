Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A191FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hH5f9pRWZjIKa7upLj6O1FMpKJtS+Zt3OkL4sYouao=; b=aLkIkD+pSQicSKmNgvn2CfnfMI
	EyODcrQXDAhleWpicpgupDWd/RFLUPDxBSCtNXbkQxizb89zPFgmXeImAcjnA89wAii5bl7z7ztzh
	X+/zghcVX6atVql8WVzE3ck2DbwRsLRYO/T0rh+7YEHDjyweG2iJiO02YEYC1fPz/3wWSerWwLxax
	Gzp5uaebx/eYRpW9lg899nXc/XMWfQLUDSsvqsGzU2Th4DpKhpmxPVaqlBWWqlECnTwSJmRs18Xig
	4ngRxDGrjfpafwyEQ31TMcNmRpknvKwqZiR9oaEmi7ArEh7wmDyASmx7aMH0RiAMHmMc/PSvcLZRV
	Ww7ay8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHin7-00000001aDd-1RQQ;
	Tue, 28 Apr 2026 13:47:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHin6-00000001aDN-2BGJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8hH5f9pRWZjIKa7upLj6O1FMpKJtS+Zt3OkL4sYouao=; b=R369krHt8IPIUnwiVht/t4lCHQ
	uM7WE50gBKB5iJH1z+Rv+uvcCxueP8Kw/9PftoO6T6xVTjYi8Kkj1gSrmNBBYrtwu7zXJLRjS+o2q
	t4YO4NZJZ6qzxRt+NUQ/C+O/Dq4AUB4UFRXoqwHSuzPokA9Hl5XNXd4cExktRBx+cKMueVc6K/KK9
	BjUahw5IugwDg0Qmm7uR3KzENZ8TgkVv5Xe5PTgkZkElQlO+uTpfXBnfnQ8AHyY0jyVrCf/bkCVFg
	PZsRLpt4Q8zCOG+NwvyrVOVyOTzD6g1tNQ0JtPNas2FkC6uGc6YqzGjMEKvNpjFcIRjCz0+ae9t63
	GGTVlGLQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHin3-00000003Dyp-0hTc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:47:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3168BC5EF0B;
	Tue, 28 Apr 2026 13:48:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 625B2601D0;
	Tue, 28 Apr 2026 13:47:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACB6C10728C08;
	Tue, 28 Apr 2026 15:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777384070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8hH5f9pRWZjIKa7upLj6O1FMpKJtS+Zt3OkL4sYouao=;
	b=MaQ93KGSH+Hk8abA6MbWHlda1aC2uqGX/4nTQBQA//FFqhT5t6lxHiZAYhudeVv24bAcD5
	+G529G8DcjVQCvZ6Re1R8BX0iwjTpBm/zn6H4ufwwZu9XJZWY0o9lZJBOYADSOOX2eMsNg
	O35B1w4pJ1d2XnuAlOPaVvL7Ur0NlIhodLk8jTJOzrDDLV4OH5CeU3InEdnDiS8kQ0S98H
	0FCfEbRGWyo/1C5x3+YL2T4Z+YsB9IcvDrtlnIgcKhUhqsmOxqvTD+NWyf5q8B76mXUEN5
	5oNzad17rT+3SHX03p3YtPB5IYEtUY88RnIRW9qAggvL74Ih7I506P8YyCBR1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:47:41 +0200
Message-Id: <DI4U2DT3OBMR.23T3F7X8P75RU@bootlin.com>
Subject: Re: [PATCH v2 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
To: "Biju Das" <biju.das.jz@bp.renesas.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tian Tao" <tiantao6@hisilicon.com>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "John Stultz" <jstultz@google.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "tomi.valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-8-4300744a1c47@bootlin.com> <TY3PR01MB113466B70BFD2899AB0CF47AD86372@TY3PR01MB11346.jpnprd01.prod.outlook.com> <TY3PR01MB1134674FDD088299A4382D3D286372@TY3PR01MB11346.jpnprd01.prod.outlook.com> <DI4TGV2WURTY.39OXE7WWKRLA1@bootlin.com> <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E82D19FBE8544F51624286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_144753_513886_4A418FA9 
X-CRM114-Status: GOOD (  22.79  )
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

Hello,

On Tue Apr 28, 2026 at 3:31 PM CEST, Biju Das wrote:
>> >> > @@ -1251,10 +1251,9 @@ static int adv7511_probe(struct i2c_client
>> >> > *i2c)
>> >> >
>> >> >  	memset(&link_config, 0, sizeof(link_config));
>> >> >
>> >> > -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
>> >> > -					  &adv7511->next_bridge);
>> >> > -	if (ret && ret !=3D -ENODEV)
>> >> > -		return ret;
>> >> > +	adv7511->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev=
->of_node, 1, -1);
>> >> > +	if (IS_ERR(adv7511->bridge.next_bridge) && PTR_ERR(adv7511->bridg=
e.next_bridge) !=3D -ENODEV)
>> >> > +		return PTR_ERR(adv7511->bridge.next_bridge);
>> >>
>> >> Does it crash, if the error is  -EPROBE_DEFER?
>> >
>> > I see a crash with patch [1], which is fixed by avoiding the direct as=
signment.
>>
>> Ah, dammit! Good catch, thanks for the quick testing and follow-up!
>>
>> Indeed this driver assumes next_bridge is either NULL or a valid pointer=
, but due to the 'if(IS_ERR()
>> && some_other_condition)' now it can also be -ENODEV (not -EPROBE_DEFER,=
 but that's irrelevant).
>>
>> This affects the msm and zynqmp_dp patches equally.
>>
>> I'm sending a v3 soon with these fixed. I'm just not sure which approach=
 to use to fix (same for all
>> the 3 patches). Alternatives are:
>>
>>  1. -ENODEV is accepted, set next_bridge to NULL when it happens:
>>
>>       -       if (IS_ERR(adv7511->bridge.next_bridge) && PTR_ERR(adv7511=
->bridge.next_bridge) !=3D -
>> ENODEV)
>>       -               return PTR_ERR(adv7511->bridge.next_bridge);
>>       +       if (IS_ERR(adv7511->bridge.next_bridge)) {
>>       +               if (PTR_ERR(adv7511->bridge.next_bridge) =3D=3D -E=
NODEV)
>>       +                       adv7511->bridge.next_bridge =3D NULL;
>>       +               else
>>       +                       return PTR_ERR(adv7511->bridge.next_bridge=
);
>
> The point is you cannot return PTR_ERR as it will lead to crash, if it is
> direct assignment.

It would definitely crash when the next_bridge is dereferenced (which
happens in adv7511_bridge_attach()) but I don't see how it can crash
here. Here it _can_ be assigned -ENODEV, but it would be immediately be
cleared to NULL, or to enother error, but we'd immediately return. And in
case of return, when next_bridge is cleared by __drm_bridge_free ->
drm_bridge_put, the error value would be ignored thanks to patch 1.

>
>    if (IS_ERR(adv7511->bridge.next_bridge)) {
> 	int err =3D PTR_ERR(adv7511->bridge.next_bridge);
> 	adv7511->bridge.next_bridge =3D NULL;
> 	return err;
>   }

Is this if() condition wrong? The driver needs to accept the -ENODEV return
value, the next_bridge is conditional in the curent driver code.

>
> Cheers,
> Biju
>
>>  2. let nexxt_bridge hold -ENODEV but ignore it when it is used (only in
>>     the attach op, for all 3 drivers):
>>
>>       -       if (adv->bridge.next_bridge) {
>>       +       if (!IS_ERR_OR_NULL(adv->bridge.next_bridge)) {
>>
>> While the latter approach involves less code, it might let errors sneak =
in in case new usages of
>> next_bridge are added with just a NULL check.
>>
>> Opinions about the two?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

