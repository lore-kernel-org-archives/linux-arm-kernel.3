Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B5C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc3Q5bHjC9Y5EjOyv/5Amr9ZepClgh/msjX52TvdD9I=; b=39CMcHT96vdD90UFvcJFAPuZDe
	nup73ua2/SGJa/VxGpcqOfbeTTXesq403X3v1mKhj8xCyIfEbu7gtgd975YqfK3dNv5nS8p3HIPOQ
	paa7i8SxivIprUInw/z8l+xghnkRCC4kj+XGT8XEazofqu/AIWL2RaP6hC+AvQ9DODVjlWBLdIXuJ
	fNR6RMjnHnMgAHWFRUgAuJ9ULrfMDbLQIk0A4gAZt7MNCJCuSmoVzXqqb1IJhX1jjz8DwCg/0U0D5
	aksaiGyhd79ORyuV0kUaRDxkM1sMAnhU6/Qk4GHFqrBPUuZHH8DcjjPGWG2+Rsgkg0PPjpZ+bhibU
	xo6/WIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y6P-000000019f6-0cpF;
	Mon, 21 Sep 2026 07:06:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Y6L-000000019dl-2zT4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 07:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lc3Q5bHjC9Y5EjOyv/5Amr9ZepClgh/msjX52TvdD9I=; b=P4ssuQMQymEQ0ViV9Z9FdgHF0N
	Lb1QY6UckJgZPgKhgeyYe8hykiuyH4SrJ3MuvFPOdqpl/BfR8ssl0BkMLYTJKsyp42vMkTujjZCaA
	0m1ypZFcDHnDPJkAWEyVR2M/hsyhfwy/rx5P++PAxcmIOxL5I9pWY04p+yG1Or5Ciq0GCOr7JluaZ
	VHYpQ/D5IZw/tU9LwOSZm2TMj0P6CBreZlZnk1i1DGSFPTU8Ja1+C8yQux1QqZn2j4kYLM/KD8bu4
	H2Iw11X3z9umHUhpIxLGItgBpfjC47xLsqswq1/GeoHmj6fcqQDLjpgo11ApKfBLT5G27ynEYXoLO
	ojHmdYWQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Y6F-0000000Buzs-2yIy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:06:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB902C2C652;
	Mon, 21 Sep 2026 07:06:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC2FD60339;
	Mon, 21 Sep 2026 07:06:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79EEC10328ED0;
	Mon, 21 Sep 2026 09:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789974357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lc3Q5bHjC9Y5EjOyv/5Amr9ZepClgh/msjX52TvdD9I=;
	b=oIGWPfNvDSRbuhkeQtz7bxBJxWZYBW2cPZXT+UaEDez5iBFH2fF/5qtRmniX5pWZGz8E3K
	q74f2AJxyvO54Nw2fgwxH0oY7iv3GFATtVa9GXDdxGNpeQhgcdnuS6q/aZMlIuCUtu+/sb
	4iQ+/XyCd2B1VnpR+ZPSGkDM+9JVT+5mDsBCyziy25sxPBu9ZcbPg0GoNguKP1G05ucFLL
	BMFC/U3CxdZw/9Kl6afCteUQDoNtTYjQ7SnsgvWqFB0O14Y0n8Bh2fmJ6XlJf9nitdwE1Z
	dm61Uq7NAkZqZJzwTtkc5Gro/DbLRu4zBMjgv+5b5LNTZXEZV46O9KlQTh9fTg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 09:05:40 +0200
Message-Id: <DLKSY3W6CGW1.3C0J6DHKV8P2Z@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v11 13/74] drm/bridge: Fix NULL deref in
 drm_bridge_add() for legacy bridges
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Raphael Gallais-Pou"
 <rgallaispou@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Liu Ying" <victor.liu@nxp.com>, "Phong LE"
 <ple@baylibre.com>, "Helge Deller" <deller@gmx.de>, <kernel@collabora.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
 "Sashiko" <sashiko-bot@kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>
X-Mailer: aerc 0.22.0
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-13-bc12954a0688@collabora.com>
 <ap_Tr_Viqy29f515@houat>
In-Reply-To: <ap_Tr_Viqy29f515@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_080605_225920_A9AAD9E1 
X-CRM114-Status: GOOD (  20.07  )
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

On Tue Sep 8, 2026 at 11:24 AM CEST, Maxime Ripard wrote:
> On Tue, Sep 01, 2026 at 09:50:37PM +0300, Cristian Ciocaltea wrote:
>> Legacy bridge drivers that embed struct drm_bridge in a zero-initialized
>> allocation, rather than obtaining it from devm_drm_bridge_alloc(), never
>> run INIT_LIST_HEAD() on bridge->list, leaving next and prev NULL.
>> list_empty() compares next against &bridge->list, so it reports such a
>> list head as non-empty.  list_del_init() therefore runs and dereferences
>> the NULL pointers, panicking the kernel during probe.  Only builds with
>> CONFIG_DEBUG_LIST survive, with a list corruption report.
>>
>> This affects rk3066_hdmi and the i.MX8 LDB bridges, which still embed a
>> bridge in a devm_kzalloc()'d struct.
>>
>> Initialize the list head when it is found to be NULL, so that the bridge
>> ends up with a valid empty list head and list_del_init() is only reached
>> for bridges that can actually be linked.
>>
>> Fixes: 17805a15d175 ("drm/bridge: add list of removed refcounted bridges=
")
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://lore.kernel.org/all/20260731175016.C5D591F00AC4@smtp.ker=
nel.org/
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 2c457ad74f3b..a8b6df5c13ea 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -453,9 +453,16 @@ void drm_bridge_add(struct drm_bridge *bridge)
>>  	 * If the bridge was previously added and then removed, it is now
>>  	 * in bridge_lingering_list. Remove it or bridge_lingering_list will b=
e
>>  	 * corrupted when adding this bridge to bridge_list below.
>> +	 *
>> +	 * Legacy drivers that allocate the bridge with kzalloc() rather than
>> +	 * devm_drm_bridge_alloc() leave list.next NULL. Such a bridge cannot
>> +	 * be on any list, and list_del_init() would dereference NULL, so
>> +	 * initialize the list head first.
>
> "legacy" bridges are ambigous and was also used for non-atomic bridges.
> That being said, it's now *required* that bridges use
> devm_drm_bridge_alloc() instead of kzalloc, and we warn in
> drm_bridge_add if it hasn't.
>
> So I don't think we should merge this patch.

I agree.

I theory all drivers are be already using devm_drm_bridge_alloc() by now.

In practice rk3066_hdmi is actually still using kzalloc, it should be fixed
to use devm_drm_bridge_alloc(). Are you OK with doing it in v12?

By "i.MX8 LDB" I guess you mean fsl-ldb.c, which was converted in
9c399719cfb9 ("drm: convert many bridge drivers from devm_kzalloc() to
devm_drm_bridge_alloc() API").

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

