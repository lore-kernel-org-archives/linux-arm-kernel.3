Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A344CC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6B4P6li35NYfvylmnEIJbA99kfnu8jlKpUXmSAMqD8=; b=yP+YjkLbC4Pb0TqrbVll2xCvLW
	ibwvKieUO5mxbEAvHFf8uiehl7E0zZwzA3LsxeNM6Q49HTseDTEbskT23DFkipHYRyqsQvQsC9G/g
	KjiUSjkpkg9bvHxdhKnUI01Jvpk44BhPRXrAaDAV2y5ftGWDW4IX++EAJQWjXOemmtvb+yV2MUU2r
	1g4BttVa1WtYV8rWAKo2c57CQP62MZpINSeJGe+8s1ZF5AJFOibGAy7U+1byOxYSM8RDt9y/X4ZLo
	aGjJvkB4iyv5bvIi1MwhFs5xaG06Ytr96LCyWriftXGZh6HKqVXoWssFetT9mtQsKRWpvSraguE6Z
	DFa7qJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Xl-0000000Ezn0-18e2;
	Fri, 14 Mar 2025 18:14:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9J6-0000000ExLA-3jvM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E95BE5C542D;
	Fri, 14 Mar 2025 17:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66A8C4CEE3;
	Fri, 14 Mar 2025 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975131;
	bh=z6B4P6li35NYfvylmnEIJbA99kfnu8jlKpUXmSAMqD8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Bw1jHUi3Ya3L6oLYeiERZiA1MI/e5bpo7F/Y15CRB6uQ5cBl6rauUOJ6hB9NRKdoC
	 v5IPQSKHkxpJgDLxYKOh4+Bmzb1eLA1/Lzaqq6EJ9uPIBDuV1WnuA7KdRk262rbtKa
	 Y5hCo9VHoLGAMPl9zE7emTWBoFJGyhkMoQDsk7v/b6Uc5qwZksQWU2oXe02jORkneO
	 MjxyIozdSoT3xoTkTo4QdCTZU4QNUNpCQB0K0Qr5bGCYNfovRHKVWvZa63MEUwRMw7
	 l2AmNkiIOZCpeB2dCmZqmNryEGuGxVp9yx3fpSy8BaO9/bZuZuf4aOgUd33QAZewtV
	 HxBIi6NEi7m/Q==
Message-ID: <ab48cc194d9fc1f5d3fc7846abbf4cce@kernel.org>
Date: Fri, 14 Mar 2025 17:58:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 01/11] drm/bridge: add devm_drm_bridge_alloc()
In-Reply-To: <20250314-drm-bridge-refcount-v7-1-152571f8c694@bootlin.com>
References: <20250314-drm-bridge-refcount-v7-1-152571f8c694@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa" <asrivats@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_105852_983675_0627BB38 
X-CRM114-Status: UNSURE (   6.68  )
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

On Fri, 14 Mar 2025 11:31:14 +0100, Luca Ceresoli wrote:
> Add a macro to allocate and initialize a DRM bridge embedded within a
> private driver struct.
>=20
> Compared to current practice, which is based on [devm_]kzalloc() allocati=
on
> followed by open-coded initialization of fields, this allows to have a
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

