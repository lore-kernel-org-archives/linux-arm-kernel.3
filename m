Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E59DEE2083
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ohf4MH/KUu9EMThI3rlAE4IunFox9h2weBjK+6xJGnE=; b=Pmf6jaStk81KM7WQCHgKKOw5Dn
	OuNAmFAbh3TRChsuDON6fhmCeorYhquR54n9gsS6qBva2B4geM6V5WCE8Ht19wRBhWzjl1WpJ/XcN
	ZVsXCgfGqy+fyJB7HZn2u9MPrduNn888e2OHaPZq/aO4KUUpJrB6VkPq5hdqAZgjM2Hqt/+AzLSg4
	QMBsb2kH3CZOyt+fay0s9FeEhmoJDNVHAYIsLQ5stnOeDLF8q0cGKfMlrVmcU6BzYLmpW+ntTuGBE
	gvswHs5Q2377YR1q40vYsFD05fNBBCB76/FFFXxsHNw4oLcljI5RardWLzpsldN6Grn3dza1AdJ7x
	V4M+iwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkg-0000000B92L-1lhc;
	Fri, 06 Feb 2026 10:07:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIkd-0000000B8zq-1cz8;
	Fri, 06 Feb 2026 10:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770372464;
	bh=wnZwLWaSvSPrx+R72etyzO7XJdu4H99M+0FmRwh+wW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IuX9FuiNq99Dt0qBw0zTGFvee7x/zXNuWcDV08Q1a0MjcSafh7iQkVAJduflPynPW
	 i8sG6FVR0VPKQYN5tFCQoXyCmO6pMY8ubemHk55ZML0I2E+v/VsXtfyuWOPC1zStQf
	 QzP9G588LnKFk2spuNuRbSfyUBYl5MoMlKtEyHa5ErX5MqwBzaOIA9g5irtqFPZDPq
	 4OfrcAPkXe2lWiiG5dhphnEpOqckTLjnHAMyIPJPi9N+snBaiOuh5Q83sxU2MPtYSW
	 SwOiL9aZCoL+u3Z76/hwoRu/eUZVVizVF/cm/r5+S95T9JiFoeBewfE6WLBldCKIug
	 NwOgCTwZFC2Ow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5181017E14F1;
	Fri,  6 Feb 2026 11:07:43 +0100 (CET)
Message-ID: <258ba2c2-a9fa-4190-8842-9e87f5e6b258@collabora.com>
Date: Fri, 6 Feb 2026 11:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/mediatek: Initialize colorops when creating
 plane
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 daniels@collabora.com, ariel.dalessandro@collabora.com, kernel@collabora.com
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-2-0cb99bd0ab33@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-2-0cb99bd0ab33@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020747_582488_B56C3265 
X-CRM114-Status: UNSURE (   5.90  )
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

Il 23/12/25 20:44, Nícolas F. R. A. Prado ha scritto:
> During initialization of a plane, if the DDP component supplying it
> defines a plane_colorops_init() hook, call it to initialize the color
> pipeline on the plane.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


