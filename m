Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6652C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oib1sAGemzHmu6ROtRkEHyhCtwDTicVNKskycatCaao=; b=r0ht1/IsqE10inxiDId/TGLqyC
	NIYytp9QmzHCeIeivLTKk9QmB9SvKwjuPlQa7ki2k9lbddyaWATpMGSeFsIVh6sVBKMGx2HdF7frU
	689MEXTL2DtR5se+q1OU9uRoLpM8RHUPqu7TCYfKRXp+oHKVoZe8D05nnVAZ9FeekdVAMZ38cq2wW
	g5Wiq8lhGfCScTpW5E43+QzwtirF5gCr90mnZvR9qK6S4eTRT4vTohz8Rn5XSgz7Rf1r0unL7Ob9W
	t6H9rohQp5jJax99x6hadT+CUusigpnd7gABwElIQVY0AbfB8qpgpUS9xqFZhRSLLbBYWcvJHgnGS
	hYyzcdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwM9i-00000008JCg-2A5j;
	Tue, 18 Aug 2026 15:55:14 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwM9g-00000008JC7-1PPo;
	Tue, 18 Aug 2026 15:55:12 +0000
Message-ID: <916c4bd5-c73f-466e-8e9b-aee9d4d7d742@infradead.org>
Date: Tue, 18 Aug 2026 08:55:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/panic: Move panic display code into helper
 library
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-12-tzimmermann@suse.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260818125012.468092-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 8/18/26 5:28 AM, Thomas Zimmermann wrote:
>  M:	Hans de Goede <hansg@kernel.org>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 323422861e8f..cdfd72d9a9c5 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -45,6 +45,7 @@ config DRM_MIPI_DSI
>  config DRM_KMS_HELPER
>  	tristate
>  	depends on DRM
> +	select DRM_PANIC_HELPER if DRM_PANIC

but DRM_PANIC_HELPER depends on DRM_TTM so
DRM_KMS_HELPER should also depend on DRM_TTM. Otherwise:

WARNING: unmet direct dependencies detected for DRM_PANIC_HELPER
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_TTM [=n]
  Selected by [y]:
  - DRM_KMS_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_PANIC [=y]


>  	select FB_CORE if DRM_FBDEV_EMULATION
>  	help
>  	  CRTC helpers for KMS drivers.
> @@ -130,6 +131,10 @@ config DRM_PANIC_SCREEN_QR_VERSION
>  	  Smaller QR code are easier to read, but will contain less debugging
>  	  data. Default is 40.
>  
> +config DRM_PANIC_HELPER
> +	bool
> +	depends on DRM_TTM
> +
>  config DRM_RAS
>  	bool "DRM RAS support"
>  	depends on DRM

-- 
~Randy


