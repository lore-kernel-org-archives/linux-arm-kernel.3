Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AA1CFD642
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTlOT3AM4kdk7PxlNs3Skb2xq4/lCpkf95bKd6Z7IFA=; b=LYqTvO+fKCo9fdgz/t4PgjpPMQ
	6e7/WYEgz4+lQQ+Xrq3k75cKtvxeRW7yySBg+rrLRxY0bKWF+m4/kKjTb8KiMjQDlbJK8jIU5kKAa
	1zC0DaHYb1gd96RxH95EyvsLUEBnA3sY9AOPcxewwGWnoqfMC1WyRRp7FFSpIEvUOUIEfUs36+GDP
	TuHz5z6CoVV2IFwg2DCzwX1IA472XBcxAalUmm3lZnO/fXvvlq5c+iOVwQ2oW+aXz9jwJvVPAqjlK
	nQ8VaTJ9CvM0N3yYHv7q8NKjVetk69Y0/RZWjVJZ3j0CBWQYL+UhtQwEf/tHVJi0U/yGYkzzfFBQ2
	ga10PKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUn9-0000000F7C0-06uS;
	Wed, 07 Jan 2026 14:45:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUn5-0000000F7BE-0hVk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:45:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 616CD1A26E0;
	Wed,  7 Jan 2026 14:45:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3334A606F8;
	Wed,  7 Jan 2026 14:45:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54B3D103C87C1;
	Wed,  7 Jan 2026 15:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767797135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nTlOT3AM4kdk7PxlNs3Skb2xq4/lCpkf95bKd6Z7IFA=;
	b=mwG58V21Feidw7j15RkZ1DlmeBnygryUTg12PFyeun6SbL9UTMeQuBa/8vHS1eHFd8029L
	gUBiXaA5jWnwZ2IoTRm9A0ijTAesUa4m5wNMBnTmFh/kEfP25+oWQuPHZcFzPm52arShlN
	Z6LgEDcsgolgB1iwvYzSEO7kLDdcRqlxXrCocxejFHvB+d3UGfDMa3mipAFKt/h/EQuM9/
	vMFxUGBzyLB/mtlmKx5GPM6T8Ub5eDu524wcrnK1htz4OoOxRzvVkBhGLLVU2p/DojiX3V
	E3WLiGA8J/pTx5Gb0zznUhkhDBxNE2CLn0CfTKOwLLdUB8Mgwhp5crAsU6ogSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 15:45:24 +0100
Message-Id: <DFIFS3S64SGO.3UGHYN3F6HHRQ@bootlin.com>
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Philippe Cornu"
 <philippe.cornu@st.com>, <benjamin.gaignard@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com> <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
In-Reply-To: <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_064539_342898_7DE48AA1 
X-CRM114-Status: GOOD (  14.06  )
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

Thanks for the blazingly fast review of the entire series!

On Wed Jan 7, 2026 at 3:08 PM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Jan 07, 2026 at 02:13:00PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/=
bridge/imx/imx8qxp-ldb.c
>> index 122502968927..6b80d798b27a 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>> @@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx=
8qxp_ldb *imx8qxp_ldb)
>>  		goto out;
>>  	}
>>
>> -	imx8qxp_ldb->companion =3D of_drm_find_bridge(companion_port);
>> +	imx8qxp_ldb->companion =3D of_drm_find_and_get_bridge(companion_port);
>>  	if (!imx8qxp_ldb->companion) {
>>  		ret =3D -EPROBE_DEFER;
>>  		DRM_DEV_DEBUG_DRIVER(dev,
>> @@ -679,6 +679,7 @@ static void imx8qxp_ldb_remove(struct platform_devic=
e *pdev)
>>  	struct ldb *ldb =3D &imx8qxp_ldb->base;
>>
>>  	ldb_remove_bridge_helper(ldb);
>> +	drm_bridge_put(imx8qxp_ldb->companion);
>
> the companion bridge is used in pretty much every KMS hook, we need to
> put the reference in destroy.

Ouch, indeed! Will fix in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

