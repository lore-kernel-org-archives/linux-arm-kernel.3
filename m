Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F72D58D5F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7i2M1MmfzzWIDGBC0rtGgnmbT0kc0wm8ecl62clMzJM=; b=Exu/7QQYRJV2ZfHIxHkIXQKI3Y
	GzIex5p/+OdAgmbvl57GooosdkRBYaJBIjpKRUH/eRAGVr2LJFkuxC6mcPYa0BdVmrRw+CvH6WMmQ
	dsjkoBBOVAyAHYMuquA4CbHlGEvwHdmZa/n0T/JvJByDg8aqftk1CeUQXdfgl0X3bDKVms00ZGjwv
	xkUeI7u3HFRgtP87Yck6GYbYpEBAJeUk2NKi1tCT5YMqZbQbNHW/PiuNLnLpJsf9n3bq9jmt3Nu9d
	hWTDZDROnFboLybcUpyTNzgLyzZrtPVpoZqZsBSqRjVYk3Em2XMnlOgMu1A5XVBTqJJM1LZshSypa
	OAz2Kdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbZ4-00000008atr-3KAJ;
	Mon, 25 Nov 2024 16:03:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbWt-00000008aam-1zFQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A042DA4182A;
	Mon, 25 Nov 2024 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F267AC4CECE;
	Mon, 25 Nov 2024 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732550498;
	bh=TktsUwGeNhxSeHi0bdQOkR9d4PL26TzalaIYfQZs+o4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aYqZLs9V5Pxn7mIDQ5JSas85KEi//yGTAKVknCvaz0D7gciR09Pvhjk/kdo8YTLg7
	 yw1p7r2yI4yEmXdzv8CgDGoX187WTjrfLsunESoR4rfMUJGdi22W3qjaptiS5kiTM2
	 wlvpCXqNp4sFtCKa03uGLsUP0zw91Vd1XT8Rwq1orgIOKcwZcH9lynO+5b1lZ4jsd+
	 T3yVlX3WoRq86USUd1D0aqjkMIJV4kPc0kRkixUdWc9396mYbv6bNqZOMWNblTlQAd
	 KRXEeb6MK4eCcxqLcpXQadelJTRvL9OuRPyOis5oP5UuFVPS/y80skLhNLYN0UCPWz
	 pR2WSlqxE5v9w==
Message-ID: <1b1c0819f0a4ecafc13ed25c19e5d3d7@kernel.org>
Date: Mon, 25 Nov 2024 16:01:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Sean Nyekjaer" <sean@geanix.com>
Subject: Re: [PATCH v2 3/3] drm/stm: dsi: use drm_mode_validate_mode()
 helper function
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@csie.org>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Philippe Cornu" <philippe.cornu@foss.st.com>, "Raphael
 Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_080139_762762_90915D01 
X-CRM114-Status: UNSURE (   7.53  )
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

On Mon, 25 Nov 2024 14:49:28 +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> 
> In case for HDMI .5% tolerance is required.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

