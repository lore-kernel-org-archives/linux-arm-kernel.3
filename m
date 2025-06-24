Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A9BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIG8nJ5xFnVvRchqUp1gsfn6zCk9kV1BtrbNcF+X0jI=; b=PERtmsz59Lo0iybziGv8kol6Rq
	v9N+SXVbuzlvHnhDoynLMxsBy8+SMODDcKY5xr/yRNxcUIYeelU+CFHQuer0OsJqSctxoiZHKFTrq
	ef1BuPLmtfx4Mhf/kCDulV8/zzNPtNvrXoFbrLnfgy7kdj8crjaT3zLe66iQ0PRT2xkjVSMhP00fp
	7K2IRbgYT01sBwPK10o9tWccXL2GGGxWwTa7iwirbARSsRVQYyPhojQ9RrT4TdJ6lwOiTDrCDVCaG
	cnVzHeh5a0toQUwKe35tAv8CB0irqNW5yu70u2B+rC3Qmz9yQFuQPTJh1a9uKGGXEc52Z2ZhhwTu1
	LrO10DqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxvI-00000004qus-21SJ;
	Tue, 24 Jun 2025 07:18:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxoR-00000004qDH-0Hgx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:11:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D5896115E;
	Tue, 24 Jun 2025 07:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C64C4CEE3;
	Tue, 24 Jun 2025 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750749081;
	bh=yJDKd5+dKK2xzoUm23JVLkaJJEcp1/KtgKkWApjEWtY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=J3xKKSlsiZo6RsDo6+oL9tA3PzHpoCx/xIdEv0xHuYFNnWMun83Uv70+HHZxocJH9
	 lbDLJOUAgxzoq0XUcqU7/FkESMHZnS/MTq6WbzhY4XfJPLhcYrtnSlUkpOi5Iy7RAe
	 aV5hvTLj2WxyFLIj0DB7Np0t+x1NbMeTD8efL3bDlabjvVuri03n/h6tfevhHLN4lj
	 XO5eXE2xkoY7BaCXNZi9v2jaQdCB89GfcUqvVpEqstdGQjWakECjn4n0I024RzRNOI
	 aYWYOhrgqlNT+9gm4ETZmz7KNswFU1fSzV2g1qdrSostmeDrLACTZwHwyiuCWrjUQ6
	 J+w4jYeG21yig==
Message-ID: <0b92d749fcd2714db7b501e5a6fe4a7f@kernel.org>
Date: Tue, 24 Jun 2025 07:11:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 4/5] drm/atomic-helper: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
In-Reply-To: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-4-0321845fcafb@bootlin.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-4-0321845fcafb@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stefan
 Agner" <stefan@agner.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 20 Jun 2025 19:26:16 +0200, Luca Ceresoli wrote:
> The bridge returned by drm_bridge_chain_get_first_bridge() is
> refcounted. Put it when done.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

