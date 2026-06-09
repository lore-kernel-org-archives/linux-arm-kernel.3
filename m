Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94F3CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zXrAUk1pFWryVHJ+cTmWZacOn6b/LzGd6CUX95U4bk=; b=h5Pgf+b8zIlZdB4Oas+40MGfXf
	znX7QqcvUmq32MolP397mAx9T5ehhJZ1wwi2X4A47jBmwUV9nLfG8IoDHUHoHmFQOZRxd+Gy7rL7q
	oCwNyodyDfEjMrlaD5MTh1LjTo9d2MTPTQ9EGcW+a+qvh2RZPWVUF37NCGBJRmkhSRhJbDuL7SoCj
	uUrc3fb2Zklx9nPzPx+qfl6mvrCN1EwbkfSAo9mbPWLK1s828cvlur3+/vS1JcO1trWzdh7nu45Q0
	FTAjwPhzCzS21YzA/tpMFyJ466q3fM3Eget1Lb/h3AesS6gUrEpWtS/2qV2ZkN6XEkRzdt9spASb5
	Qu4uokbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsoc-00000005DNc-0WmZ;
	Tue, 09 Jun 2026 09:32:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsoZ-00000005DLu-20Vo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:32:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E47F1A37EC;
	Tue,  9 Jun 2026 09:32:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 516A45FFC1;
	Tue,  9 Jun 2026 09:32:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66026106A2B00;
	Tue,  9 Jun 2026 11:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6zXrAUk1pFWryVHJ+cTmWZacOn6b/LzGd6CUX95U4bk=;
	b=v53Jn3IKQ5rZa2HCyXQ90s8wLx3ywQ0LmCHWSpsKOlmG1GMrLmdJxhURMAuhdpUyfinCA5
	kBWsBqIZCUE3jUB5DcF7VI5zsALo2/URxkoqIMpU9T5QbnrPR7dQO093j8HHedbVVOo2g5
	r7eYn6p2PY5AgtYgjfgsbmtDruRPk1bLjSAsX5o5/XT2voEgPPx/+iWWcCTepf/A3Xw1xV
	IqOLuAjykmVA4gL2UkS3NucPuWkEIYICi2KknBjygTjP6z8FaoZqD3OQ/+lhvN87bd3wYM
	PKSmwi8rne9T2Lttqex5iV4qcahwOiAynoxVzOj/A6pU/U5ZTAbSOVGqGZbk1Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 11:31:59 +0200
Message-Id: <DJ4EXH5Y424H.3455WD05N981M@bootlin.com>
Subject: Re: [PATCH 25/37] drm/bridge: shutdown and cleanup on bridge unplug
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
 <20260519-drm-bridge-hotplug-v1-25-45e2bdb3dfb4@bootlin.com>
 <20260608-resilient-outgoing-panther-9efc53@houat>
In-Reply-To: <20260608-resilient-outgoing-panther-9efc53@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_023207_657698_CD3D35AA 
X-CRM114-Status: GOOD (  17.60  )
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

On Mon Jun 8, 2026 at 2:07 PM CEST, Maxime Ripard wrote:
> Hi,
>
> On Tue, May 19, 2026 at 12:37:42PM +0200, Luca Ceresoli wrote:
>> With the upcoming support for DRM bridge hot(un)plugging, bridges can be
>> removed at any time withotu tearing down the entire card. When this
>> happens, shutdown the pipeline and detach from the encoder chain the bri=
dge
>> being removed along with all the following ones.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 7f2d1a81d730..d45fb74ec8c2 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -462,9 +462,17 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>>   * it won't be found by users via of_drm_find_and_get_bridge(), and add=
 it
>>   * to the lingering bridge list, to keep track of it until its allocate=
d
>>   * memory is eventually freed.
>> + *
>> + * If the bridge is attached, also disable the active output and detach
>> + * this bridge and the following ones.
>>   */
>>  void drm_bridge_remove(struct drm_bridge *bridge)
>>  {
>> +	if (bridge->encoder) {
>> +		drm_atomic_shutdown(bridge->dev);
>> +		drm_encoder_cleanup_from(bridge->encoder, bridge);
>> +	}
>> +
>>  	mutex_lock(&bridge_lock);
>>  	list_move_tail(&bridge->list, &bridge_lingering_list);
>>  	mutex_unlock(&bridge_lock);
>
> I don't think this makes a lot of sense to disable the whole device at
> once. The connector, encoder, and the CRTC might, but the whole device
> doesn't.

Indeed this is wrong. Dmitry pointed it out during the discussion at
Display Next Hackfest (see my report in reply to the cover letter). The
drm_atomic_shutdown() call will be dropped.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

