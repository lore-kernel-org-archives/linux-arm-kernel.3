Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC54BC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T71grAhlefTCoaH3/HnR/Gxf7jbUfL6CXZ/mQnb6MnQ=; b=nP4lXjmYt6Xq81YINN+brQ3aXA
	0vZMPdqIv95BCdZ8mvoH7Sx8ve8efjmZi+ACGN7F5EztYdKGmCSSRJNpwk1AcJPfinu6LYi+hjZ1I
	SbWNWRmmVMk4iGGZU+9kRO5iExSQ4QXSMJAwT+kqAvJNPNzb1+BW8mDzQHGOHn2OZJ+7T3q75U2wD
	Eor1kwkccvu6XW1koYyXZIXVxhYvJkYNgsNRe+o6bOEcGXwSw4r8j8sTmmHs/JL93A4zqI8CizxQW
	wad5q8ia6FvYFT04168GEbLfV9RnFfwQ5oU48D8EJsuZy+feWijmJpyv4CCjKGLTprG3l9+txjWpq
	5Isxc4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAqp-00000009a0t-21jO;
	Tue, 21 Jul 2026 13:49:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAqn-00000009a0a-2zCE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:49:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07EDA41E8A;
	Tue, 21 Jul 2026 13:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F091F000E9;
	Tue, 21 Jul 2026 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641776;
	bh=T71grAhlefTCoaH3/HnR/Gxf7jbUfL6CXZ/mQnb6MnQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=QDJ9u6RhEeqAQ8jRz5BRa0K3ugTnmhNm7eztASTRdi5Y93mY+g3mkl5aB/7e68AKh
	 tIKQXQvBCnCJVEPkg+wTDAiVWVwiUqVK/TCvMdMPCVjkbf+ia+0kupgi786QSHjrPp
	 uTiuNedR3H6uLoeYDNzl9cwTvJtdJr/fb8nwubMlqBLK8bcpqr/Ca52ZLoG5hRErfn
	 J6/cwCL4/Ik5o+a2zOXOiOxc6YezMtne+yDrx68yGv6Zlpec7+b1Y+9A8Y0p62zsn4
	 HnCZZ3j0tCxSX4HjrTgmQv7RUiy//p73Vsi7rtGVOI3sqEACeM7ZOaW1Rg1mqAvkO/
	 guXxfX6ju+7+Q==
Message-ID: <41e0ff0b380e6f4bf4a9f64061f17d58@kernel.org>
Date: Tue, 21 Jul 2026 13:49:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 5/5] drm/display: hdmi-state-helper: Init SCDC
 debugfs for HDMI
In-Reply-To: <20260721-scdc-link-health-v7-5-92df1b6ad5fc@collabora.com>
References: <20260721-scdc-link-health-v7-5-92df1b6ad5fc@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Daniel
 Stone" <daniel@fooishbar.org>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Hans Verkuil" <hverkuil+cisco@kernel.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Tue, 21 Jul 2026 10:59:01 +0200, Nicolas Frattaroli wrote:
> Initialise the SCDC debugfs file for connectors that call the HDMI state
> helper's debugfs_init helper. This makes all connectors that use the
> helper expose the scdc_status file in their connector debugfs.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

