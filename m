Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057D9C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd247lnTgm//7Mot/s4CRwgKu7aTLB1vlg6ipR1BxPA=; b=kOoBj14keS6QxAOgqS9hUEArn5
	SG/sEsnzl3pYQVD3PB3mkRagw4i85in0AthHbJCFvut7AemXBldywGsMYDtB6PXcLRVAnVtb9kx0e
	DbgIgxGkpw0kWfE+CiHtdWlCrgfJo+YWxKmuxC+i+GOlOX4QhO0cFpV7KZ8P8eMBp6Bq20/xlCClL
	ZNXwCK0rN4FRUz91h+/+L5mfdt/0c8SMlhN9GjWlIQGH1pHNyQfLpDVldDMRkp4yM0Xr7yw8BDbj/
	FzWc0d2HjzUIaR5zmW8vGJTdRvSBOsoGCmrPTtsqX2q7uNUfnSGM7z+wittuuKn03U/Ci+YmITgDn
	mDpCKN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHzQ-0000000C6Y9-3TNa;
	Mon, 26 Jan 2026 08:30:28 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHzI-0000000C6Vf-0U28
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:30:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E5D4EC225BA;
	Mon, 26 Jan 2026 08:29:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 602AB60717;
	Mon, 26 Jan 2026 08:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE10119A80E2;
	Mon, 26 Jan 2026 09:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769416196; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zd247lnTgm//7Mot/s4CRwgKu7aTLB1vlg6ipR1BxPA=;
	b=UEQQKtzQX01kRC0KKp+1QBwdn9M6lmlbMCMssM4G8Hf6XyfFJioF600O7pn9UJkYhjELzo
	PeYldsasnd9253Eei/kPGALVXExNCMJ40I5Eknal3AvJf2qN2H/IQSmIfMeQWLHqujfsdt
	wXo78MpRUy5kXspvqj+qTpqyUTlCQ0d6A8/sRzHYn/lyZb33aSV/98LRPRJj3T6Fb+CNg0
	30EnB6+7fojKyX+9tZn2DRRgfRfKMWV+v7/4cLscAlA+b0GeIVhdgtk56+/oQmXBVSFL/g
	pcXKF4M1xvyw5bdZvA+iSZ0P06cdzO8GVAaNHxMxoy4lBl+Xu32odfbM58bKlg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:29:49 +0100
Message-Id: <DFYDOVQ1DOQE.1NDH5JC5M90KV@bootlin.com>
Subject: Re: [PATCH 1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer
 dereference in imx8qxp_ldb_bridge_destroy()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
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
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-1-8bb85ada5866@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_003020_979421_9157928C 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
> Pointer bridge->driver_private in imx8qxp_ldb_bridge_destroy() is NULL
> when a LDB channel is unavailable or imx8qxp_ldb_probe() returns error,
> because ldb_add_bridge_helper() is the last function called from
> imx8qxp_ldb_probe() and it doesn't initialize bridge->driver_private if
> a LDB channel is unavailable.  The NULL pointer would be set to pointer
> ldb_ch and then NULL pointer ldb_ch would be dereferenced.  Fix this
> by returning early from imx8qxp_ldb_bridge_destroy() if !ldb_ch is true.
>
> Fixes: 32529d384cea ("drm/bridge: imx8qxp-ldb: convert to of_drm_find_and=
_get_bridge()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

