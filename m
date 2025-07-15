Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4EFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnslrGiezYsUYrWhAmO/NbmQH3o76F8Ub38ABKSerhA=; b=gdV1h3BkUGcZ5JK0VT6n+g6y78
	G03bT+lqQCJHMd9gVn1U8YodcfEkuRN8v2baeEvJCAUfX6xuTdt73NiRIv7Anu2nZ7d3zTlvIltlq
	gTEMxp7TP4kANM367JU9JTfRGsPyZku6UXeFEXFb6fQ3/aMPDnqYYhN3swJRWo8yY44esR1OxNH9B
	I/DEpOfmssiHub781iSZVufAltmxY0oDiKwIGhWqgmIDXlE30gMmGwnBGprjK3UaidtAIMoftYSu+
	OuWBL1KQWinS1JCC03ojj9IwPd4+lSQHugyuO8WZN5/WgZSC1XUbJ205YcnAfK93x5o7QWLn3k3KF
	ixouBYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpL5-00000006QQp-1ZBn;
	Tue, 15 Jul 2025 23:45:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpIf-00000006QJO-43L3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 23:43:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F35F861489;
	Tue, 15 Jul 2025 23:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D22C4CEE3;
	Tue, 15 Jul 2025 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752622984;
	bh=oIkUYfDgAMBmComyQL46QfRRvvbeCNaERG0b0OclZGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzkvdF8/yTgHzxS4GWWzOX3MNf4yT/HYcZnvr8glkE4W0Pxmu1lz7A2uYcEN+XzuW
	 nOVolShmJUUj28oA7KzqfIQmVGgOHB1uSA956PstXl9/dP6eBxTYNrd5zbcDNUCaky
	 mcMRxKlylObJc+6tQ8djX6o71Mw8eSltMXt00dopXLGeGeRZwZwA+15HQq6/KQ31iE
	 HelbunvlA9M9ptdjzLuuVQ+MxVeZbnaucqNQa/LJLrG87dvcuKUp6VCBAhGgcgLnCx
	 pzn3lOi3QgJC46OAhOkiOWujzQ0zWjhRR9bZaJNiECosEvyiX5jUrsjf9lSgiPRbIx
	 jhLz6kvar9zZQ==
Received: by venus (Postfix, from userid 1000)
	id 6D31F180F0F; Wed, 16 Jul 2025 01:43:02 +0200 (CEST)
Date: Wed, 16 Jul 2025 01:43:02 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev, 
	support.opensource@diasemi.com, duje.mihanovic@skole.hr, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
Message-ID: <67hurwpxz4c2ropgbq3q6umybr2fgucgtbdu4qc6y3qk3uypc4@3xkijgin5ydl>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-3-tzimmermann@suse.de>
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

Hi,

On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_u32(). Avoids
> dependency on backlight header to include it.

device_property_*() is from <linux/property.h>, which is already
included in the following line...

Greetings,

-- Sebastian

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index ea241c89593b..930948cb615f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/media-bus-format.h>
> -- 
> 2.50.0
> 

