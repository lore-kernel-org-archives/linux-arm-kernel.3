Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97427C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbAISXgHduv3y1u8Pq4KaTHYqGR89Vm+sKszm0d/Kjg=; b=bbkMrcm3id98FIiCRUOZFNg6Xk
	6iUh1Omnl+igZIFrXmayZS0jPmaYDJTypmw6rHUMgkUPRmDLygGPVq9N9kg4wFP2+BIPio/0ZEfk2
	oohHIWm/EFXIkSU3WD/u/xpyzMX2iMFgUZA8lj9kpW+PR/w+vPLFvBOwKqJnELlMwMdGzHwVLZGqH
	puMjm6nBBfSsPu5lCSRrOakCBLWhssYVgsTx+Tu0+VcUPfmMOthvdRatZe1nblQsf2+v6Fyngt2oc
	3/gYa4rFht8L/x2MuAtCVi/bpVEhAL7RpakP8J8SYdfXDXv5jtWlaDZ9NHtjkq2LtkczGEAeJ9IN3
	uqn52/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig6p-0000000Cb0e-0jkB;
	Thu, 13 Feb 2025 20:46:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1x-0000000CZpP-0Ua7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:41:54 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BD1D594;
	Thu, 13 Feb 2025 21:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739479233;
	bh=1+AAiHUmcZ0YGwlI7FBzyZhAxpsavKtjHcxXh5On9+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyWOl391hTdGPhY0sOHjjkxZJUII2e32RnweKlJ7bD982MVv7Jag0MK+xPA0TcNdX
	 nYmLLvIKzU8DsUDWShycDP9fl95yasHYCYrDDQjBslXrzxiMakxcHHieAHvaepkzsJ
	 QkgfYV4eozq+sO01qewcctSkp5NOXqnD65uUBslQ=
Date: Thu, 13 Feb 2025 22:41:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/11] drm/fourcc: Add warning for bad bpp
Message-ID: <20250213204140.GB22998@pendragon.ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-1-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-1-90d0fe106995@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_124153_294644_0F4BDD6C 
X-CRM114-Status: GOOD (  20.58  )
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

Hi Tomi,

Thank you for the patch.

On Wed, Feb 12, 2025 at 04:56:05PM +0200, Tomi Valkeinen wrote:
> drm_format_info_bpp() cannot be used for formats which do not have an
> integer bits-per-pixel in a pixel block.
> 
> E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
> pixels (Y components), and two padding bits, in a 4 byte block. That is
> 10.666... bits per pixel when considering the whole 4 byte block, which
> is what drm_format_info_bpp() does. Thus a driver that supports such
> formats cannot use drm_format_info_bpp(),
> 
> It is a driver bug if this happens, but so handle wrong calls by
> printing a warning and returning 0.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 3a94ca211f9c..1e9afbf6ef99 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -457,6 +457,13 @@ unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
>  	if (!info || plane < 0 || plane >= info->num_planes)
>  		return 0;
>  
> +	if (info->char_per_block[plane] * 8 %
> +	    (drm_format_info_block_width(info, plane) *
> +	     drm_format_info_block_height(info, plane))) {

Can you cache 

	    drm_format_info_block_width(info, plane) *
	    drm_format_info_block_height(info, plane)

in a local variable to avoid computing it twice ?

> +		pr_warn("unable to return an integer bpp\n");

It would be nice to print the warning in the context of the drm device,
but we don't have the required structure here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return 0;
> +	}
> +
>  	return info->char_per_block[plane] * 8 /
>  	       (drm_format_info_block_width(info, plane) *
>  		drm_format_info_block_height(info, plane));

-- 
Regards,

Laurent Pinchart

