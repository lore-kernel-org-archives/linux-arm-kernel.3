Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869ECE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igjA0bf52SaPqkDya2LSrS582NdA2yVuVKrviEKirK4=; b=XlZ1DpQzY6fiY41VTaKZD7WQRS
	AB50WnBX1K4dnDUMnQlMiBUKRAvUzV6xlAHnYcuHKUU4v4+70r0whf6aAY/rNQB7JMocre+WA1Pui
	thBgE7YqIZN4jgZ/WgAcdz2YAL0mzzZRYirGwBElRFiNpxLpbbUyGmtPuZC6VA5jVrEGlmBLbZCJF
	ZIQeP6MVkXuyWN0d8GfkuQ5Pn2GYBz796O94g7fqdjSraiTgaWDN8utHWaV6O8C7iCmJIOQT/hPMD
	hfltuWe7L2siHR1W240Sv0V/y/jCZq1378X8BeLMM+J8ve8tGtvVeCn9POtf3Sn10dqHwzQvKsFUL
	N+3Fv7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBsB-00000005Vkh-1z7J;
	Tue, 07 Jan 2025 15:52:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAic-00000005FK9-1CHX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50A665C630D;
	Tue,  7 Jan 2025 14:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEABC4CED6;
	Tue,  7 Jan 2025 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736260685;
	bh=q1lYaEr0dqb+piQWDLCGtCOJiuUuHbTSk0/Gq064y3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzJMcPYQ1xOITG8Xhogrge775rj20I/2xPdkh7phzjWBk0juCTiNbQnXsvWa+wrdH
	 ddyPfhjdU5SkBFzn3XMXxZ3ckM0b4+Ft+Sa2lqtlFJNte1zOcYmjWMjplQTYSWEaZv
	 mJWRKXedsL5XILhCcIS/D+8ioOcbYnWhLSvO1Aw/wne47LQ1imiZIGCES9T2AvTNdc
	 mR7aMsjYe2vkvi9Xos9jp2Sqa4nET2SbbDyLkS+H+qO851TAIZ8WWaADFrf7DQKuYp
	 pLs/HoCoQ3R9R4/TODiHTHwygNXx4KRdXjYNVThVj8pQd2HGIEe8MJ9RJJP6rOomsm
	 6dhdo6MjZG6/g==
Date: Tue, 7 Jan 2025 15:37:58 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <Z308RoMdP2U64Dfx@pollux>
References: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-nouveau-encoder-slave-v3-0-1d37d2f2c67f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_063806_408045_3B378248 
X-CRM114-Status: GOOD (  19.50  )
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

On Mon, Jan 06, 2025 at 01:00:12AM +0200, Dmitry Baryshkov wrote:
> The nouveau driver is the only user of the drm_encoder_slave interface.
> Demote it from KMS helpers module to the nouveau driver itself, moving
> corresponding I2C encoders to be handled by nouveau driver too.
> 
> Ideally those two drivers should be converted to the drm_bridge
> interface, but it's unclear if it's worth spending time on that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied to drm-misc-next, thanks!

> ---
> Changes in v3:
> - Moved includes to drivers/gpu/drm/nouveau/include/dispnv04/i2c/
>   (Danilo)
> - Trimmed Kconfig entries to remove mentions of "some nVidia cards"
>   (Danilo)
> - Fixed checkpatch issues related to alignment and code formatting
>   (Danilo)
> - Link to v2: https://lore.kernel.org/r/20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org
> 
> Changes in v2:
> - Renamed symbols in defconfig (Laurent)
> - Added missing Kbuild file (Laurent, LKP)
> - Renamed guarding defines in include files.
> - Dropped mentions of two removed functions.
> - Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org
> 
> ---
> Dmitry Baryshkov (2):
>       drm/nouveau: incorporate I2C TV encoder drivers
>       drm/nouveau: vendor in drm_encoder_slave API
> 
>  arch/arm/configs/multi_v7_defconfig                |   4 +-
>  arch/parisc/configs/generic-32bit_defconfig        |   4 +-
>  arch/parisc/configs/generic-64bit_defconfig        |   4 +-
>  drivers/gpu/drm/Makefile                           |   1 -
>  drivers/gpu/drm/i2c/Kconfig                        |  18 ---
>  drivers/gpu/drm/i2c/Makefile                       |   6 -
>  drivers/gpu/drm/nouveau/Kconfig                    |  18 +++
>  drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  17 +--
>  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
>  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 ++---
>  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
>  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 +-
>  .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 +++---
>  .../dispnv04/nouveau_i2c_encoder.c}                |  95 +++++-----------
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  24 ++--
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
>  .../gpu/drm/nouveau/include/dispnv04}/i2c/ch7006.h |   4 +-
>  .../drm/nouveau/include/dispnv04/i2c/encoder_i2c.h | 121 +++++++++------------
>  .../gpu/drm/nouveau/include/dispnv04}/i2c/sil164.h |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c        |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
>  22 files changed, 190 insertions(+), 247 deletions(-)
> ---
> base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
> change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

