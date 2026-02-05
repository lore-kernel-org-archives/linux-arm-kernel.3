Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9964EE9129A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhnniDnleOJRYD4v165EXk4k3ynNf9KHvznFDNU0nvA=; b=1bjaU1y0GJEWkDGs1+KFZZQY+/
	LGOIm6L2nsR+HoXatyFtFZULTjluht76p66VG8Mt5rH400kowHMBFHug041GKKA6x6UuFZo3Q0f/z
	/Tmo018Y0R9xA/EYrY/Tr9lVZSCoHOKfL+7HyLsAfp6vFqsz0tFjOH+A6kaaej33tk8Gnl5vxdPlW
	zUC/5X+L0EYIs1e6j+KxYDAVKUf8AcaIJJuNbE/Bk6ZtpL30/RQHyodSPse5zqW/34wHy3mcndMUH
	57zIz1G7cqegdnU/wYu0wsfg7WkUtJxWh9qhQEJFOa2RZW98zTCxoSxg/xZRDKMv6kBn5YxBCqG9y
	auolQXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvSj-00000009gUY-2PvH;
	Thu, 05 Feb 2026 09:15:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvSe-00000009gUE-0Ej2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 09:15:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12CE01A2C1B;
	Thu,  5 Feb 2026 09:15:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D84C2606FD;
	Thu,  5 Feb 2026 09:15:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FC30119A88F8;
	Thu,  5 Feb 2026 10:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770282937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IhnniDnleOJRYD4v165EXk4k3ynNf9KHvznFDNU0nvA=;
	b=qyMfgDWdUTQb39ZA2e1rwvq040Mn39QlnEq8ButdLERRRFFrDldcetAZz+hJupSCvCKMSs
	3og3PxJEbJRAyHmGx4MLBlkufiTOxvW2QYvBFnt8UO0i8jCimxuR2GjbKG2D7YwV+5okuQ
	rMW9UwhQF5csUeyDCNqbcTiOIuqNnaFNRPKj3zf0QYteZ5rfgKHxAiiyy+ut2KXZIs7bZU
	5C19+DI9/j2CckJoiR48hRSQoqChpmlXeiChe6pVVD5StioCCW8iqm9MV/pYha+/sYkroQ
	kt3lCj+TGNCKjsuZt36p5XGAlFgknB1bKdmWdZnLorC3NiHf+6vvyyVFUdUvxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 10:15:31 +0100
Message-Id: <DG6WXBLE7CZ0.27X527V71HZ7N@bootlin.com>
Subject: Re: [PATCH] drm/imx: parallel-display: check return value of
 devm_drm_bridge_add() in imx_pd_probe()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Chen Ni" <nichen@iscas.ac.cn>, <p.zabel@pengutronix.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <louis.chauvet@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260204090629.2209542-1-nichen@iscas.ac.cn>
In-Reply-To: <20260204090629.2209542-1-nichen@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_011540_248413_AC0115A1 
X-CRM114-Status: UNSURE (   8.40  )
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

On Wed Feb 4, 2026 at 10:06 AM CET, Chen Ni wrote:
> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
>
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete bridge setup.
>
> Fixes: bf7e97910b9f ("drm/imx: parallel-display: add the bridge before at=
taching it")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

