Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EC5CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtlnioyZElbz8ugOrc7hlVY7Dm6ti5mP/kZWdCnL0xI=; b=nuRUgyLehxxfw2FP2i0O9mHnWX
	ZaxDGmWR15/ZjWUOHJw9mL25p2PqWS63kf5qtrY6ESxVf0S8FefynTwOXBHI6NaMP6EWBIL57Tid1
	FUVElbG9nCHuRoiYc4XZaN4yZ8wL9kuB2vQPKa8t1Wk8ppd188VxUC0amXq/cvidx9oDhuCLU5eAR
	wSc6sa4WjY0iya9G5uyQ8xwbrL+UtDJlFSWZ/LxSQkRhV7Blf57kEb0rP9O1JP9JYEmcov/Qx37DU
	+pCc3OvO+BcF5sE0icLFK9ZqgyHVE8oWAGpWR1FCOkBQLgARsRKOIZEXyHJKMR36Gx+Dk5eQvNKQf
	yH11aclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC9u-00000008AH8-1lCO;
	Thu, 01 Oct 2026 08:28:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC9t-00000008AGo-115a;
	Thu, 01 Oct 2026 08:28:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 526966022B;
	Thu,  1 Oct 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE381F000FF;
	Thu,  1 Oct 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843332;
	bh=jtlnioyZElbz8ugOrc7hlVY7Dm6ti5mP/kZWdCnL0xI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=aS3/O4L+0prg4o9Ac7Pz8qUr0Hvf6tmu2Hz2EpAjfJEV68bRJHJvHUB+i8jk/XuWY
	 p4U1+0dwJqg+Okw0T/5wLUkajLTkA0aKK+971zYluVCI5ISDiV0oDMu7T8SRlTkWsO
	 +ZxmCoDEJf1TtpqpBbasTXa7jNTMz4/LtnVUeXBVMv3ZcMR4y5PrJb6/skmOIjNcxK
	 N+eTUVDTxzPGeZoQXYma/2QIi7hIJ5VwBF+YF4VlsBDktAy73fjTJ+t8LcA70mPrcg
	 39z3KQVbFUPjg1S92GJw7XsyK1KvkAHHjAf2Yi1s9/x6L1iFTxryG61XZUw2IP5D8r
	 VZaFd0S9NlROA==
Message-ID: <f90b5b37f0afda1ebf866a16c1502780@kernel.org>
Date: Thu, 01 Oct 2026 08:28:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 1/2] drm/rockchip: rk3066_hdmi: Convert to
 devm_drm_bridge_alloc() API
In-Reply-To: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
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

On Thu, 1 Oct 2026 11:25:11 +0300, Cristian Ciocaltea wrote:
> Bridge drivers are expected to use devm_drm_bridge_alloc() instead of
> devm_kzalloc() for allocating and partially initializing a private
> driver struct embedding a struct drm_bridge.
> 
> Perform the API conversion and drop the now redundant manual
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

