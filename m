Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE4EFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi11yIAKIeUtq1BstSRzJLBfPBpY7CpkArje5as7Flw=; b=glmdo4WzCBrBwGo9+aX0XekSmf
	slmGdP2EYMRVyShAOZqNLFBo3/rh5bwi64LRfbRrPQuAPcBf/qavIYmcO2uBbhRsMvtltqz+XMAPo
	QRjb3apYYin+7y1q0rAXyFMHwbiOJizmD2QjRtJYx+BiOy97ictCpc5HdTW7YTjRIieXPYCmNF2Ex
	hOk8qxtiKrzIT4Wvr8dnrdHm4axmxDunmT6PYw+/Mg+ZZehBDSdk1aDH3lPMKmuUlWZ1k7e6yImdm
	AdS4zU3dA9Sdr+jx43r1uw2El+XQ43xoGEMCyO071MOW+zNnvaq2rZR0uKFjJ/26f4/r32YFXokfH
	7Yt0IZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHish-00000001auH-3qhE;
	Tue, 28 Apr 2026 13:53:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHisg-00000001auB-2lF4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Subject:From:To
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mi11yIAKIeUtq1BstSRzJLBfPBpY7CpkArje5as7Flw=; b=OaheSK5N0kl0NTUOUrBWrSyTmF
	grMqcaBqYBjCvBSszgHb1eJPAfRWIWdDna56+geBuef9DeGdPei/aIsIROyLjcTervmobKGqxwXF5
	agCDUMNoFe788EsoFB71bMIpt38mmc6QltdZQHD3/IgJHtHM/xIHjFIAP1PbmyS47aLWQ2kRLloWb
	RE34bHFC9BtmCYFN0y4wVaJhHfKv2cPaEslXIRl48P0Gu4XxsvgZN6G7XAB/WGTDk2f/qTbiSRpcj
	v+x4ZctmGnzldZ7V0GJSuZJUAFrNZMWoA0JHYUqlnGsGlMNx3DDBGMPt45T1/l9WYFuS/gogR+Anm
	9YBiRwcA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHisd-00000003F0A-2nHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:53:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D71B94E42B56;
	Tue, 28 Apr 2026 13:53:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A090F601D0;
	Tue, 28 Apr 2026 13:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C28410728C3C;
	Tue, 28 Apr 2026 15:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777384416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mi11yIAKIeUtq1BstSRzJLBfPBpY7CpkArje5as7Flw=;
	b=1b2DowR6+l483OumXJsOi9RuRKuwGfgpP6qQ9aP93gJb5bkBB1iEofOoFTFpEBHvtAg1aC
	F52wa8jZJxXmACT+s6pZgeAvRJ3ASqE/KD7AyBIjIJKJncz0iR2cmdWCPHeW/68USn6Tu6
	iyEwwGmUJOHPiVWnygRdTuir3lf1vlWx0nqNbrv2gZtGZNu7A7tw4fj5HQo/8sVFRhXiFR
	0pzr9osvlwr7UXb5yPlWgWdIBvcNbZVrO96eayX7rpZGKYHCyZJeo1rXvCEvIFnkmV+bzo
	o4aGLUXTsuXGJIh395YwzezFbNnKhSwdfTwTjpt8VohTmRU5TFN0NRH3y39nwQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 15:53:27 +0200
Message-Id: <DI4U6SPMW5GG.34DH11UKWPUEX@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Tian Tao" <tiantao6@hisilicon.com>,
 "Xinwei Kong" <kong.kongxinwei@hisilicon.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "John Stultz" <jstultz@google.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
To: "Gyeyoung Baek" <gye976@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 07/11] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
X-Mailer: aerc 0.20.1
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com> <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-7-4300744a1c47@bootlin.com> <CAKbEznt-PUvg48tegibw+0xYCCvK+1jwESnuHx9+MG0p3MD5gA@mail.gmail.com>
In-Reply-To: <CAKbEznt-PUvg48tegibw+0xYCCvK+1jwESnuHx9+MG0p3MD5gA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_145339_818006_96610F70 
X-CRM114-Status: GOOD (  11.20  )
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

On Tue Apr 28, 2026 at 3:18 PM CEST, Gyeyoung Baek wrote:
>>
>> @@ -1058,7 +1057,11 @@ static int lt9611_parse_dt(struct device *dev,
>>
>>         lt9611->ac_mode =3D of_property_read_bool(dev->of_node, "lt,ac-m=
ode");
>>
>> -       return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &l=
t9611->next_bridge);
>> +       lt9611->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dev=
->of_node, 2, -1);
>> +       if (IS_ERR(lt9611->bridge.next_bridge))
>> +               return PTR_ERR(lt9611->bridge.next_bridge);
>> +
>> +       return 0;
>>  }
>
> Hello Luca,
> Could you take a look at this alternative?
> ------
> struct drm_bridge *next_bridge =3D
>     of_drm_get_bridge_by_endpoint(dev->of_node, 2, -1);
>
> if (IS_ERR(next_bridge))
>     return PTR_ERR(next_bridge);
>
> lt9611->bridge.next_bridge =3D next_bridge;
> return 0;
> ------
>
>  I think it reads a bit cleaner and avoids holding the ERR_PTR in the str=
uct.

Yes, but more verbose.

Based on this and the patch 8 fallback reported by Biju, I started
wondering whether the v1 version of this function, while being a bit ugly,
was leading to cleaner code... An example: [0].

Dmitry, your opinion?

[0] https://lore.kernel.org/all/20260413-drm-bridge-alloc-getput-panel_or_b=
ridge-v1-6-acd01cd79a1f@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

