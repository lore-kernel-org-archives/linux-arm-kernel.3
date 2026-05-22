Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD80CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KXvQ6RS9ouG5Uiy9/dpRJTh2ZZAbFANTX0T4nY3SZQ=; b=m5PpNeNO51HnphiSxKlBQu3RD1
	NS9N8/d6JCKvSExQWiM182eCRGEfDNJRhrrIcbdl4yX3yOYnYgweunreqE5zkOFuW2rbpTPgA5FgS
	SR4fjVG7UIAY4M3wY1UNrA38yldzhVVRJamBdOkyl4861+Ws8u9NEJic7O745BfquTHYwjho/wdo8
	SEV6qJTu8TgSPIzpib0rQfFjQ0bwtt8l8fTbWIS1QG+DTz51P8/gY/sgPb3omXMdX/6zXYV7PQs5P
	psmoVQ/niAfWFKpBJOI2Wa5AbHIoaU+4gfmeaouieloZYpWR21wfBcSvRmoYMroX4/b083qIrGlMY
	i8ZBAZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLCO-0000000AC10-1M4I;
	Fri, 22 May 2026 08:25:40 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLCL-0000000AC0T-2uu1;
	Fri, 22 May 2026 08:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779438337; x=1810974337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wig18oMoF2h7CU1hfyPk9X2nSxt/aprardkBIspwbSA=;
  b=MRn84S8GEHS+8PiK6kJeXPcnMmkpYpFtoJZ/ub929GsA/iIFosOUOeVN
   7omh9gt9MK403qum8Mf1loYPlq7SI9jrvymHmaWLnn/KGCUSbGHqHupfq
   bpPekMekPj8NgImyir1JvCHrVQV5WACBMljuyR1F8f69Kk15fQjevv7xc
   fcJFxITIUo1S3rJuFwbDGnBtpdGIXtN8hRIyP4qzxYwFa/blTuO+8i/4l
   5KUddZgk8iRUzqRAQIieOi/+/OGoPnDLJAkjcDALUkSpY8hyaZhi3GhRK
   B8JT5WONH3i0jkbyniOsCWlcXcftdHEfTwCuAdw+HyjBbyD+nxSDSwgTy
   g==;
X-CSE-ConnectionGUID: 7XRilWgxQdeleof5LNg6xQ==
X-CSE-MsgGUID: EUm9L0SKQum4z1A7kVDVBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90664136"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="90664136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 01:25:36 -0700
X-CSE-ConnectionGUID: 24HI4OtNRwaIvNcadNz6UA==
X-CSE-MsgGUID: OtKb06yyTouwMKypEtH3Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="278964990"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 01:25:34 -0700
Date: Fri, 22 May 2026 10:25:25 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: michael.riesch@collabora.com, mchehab@kernel.org, heiko@sntech.de, 
	hverkuil+cisco@kernel.org, gerald.loacker@wolfvision.net, bryan.odonoghue@linaro.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Fix error handling for
 media_entity_remote_source_pad_unique()
Message-ID: <ahAR0-zm1Jue6pGl@mdjait-mobl>
References: <20260522065548.2438545-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522065548.2438545-1-nichen@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_012537_811778_3BE3524B 
X-CRM114-Status: GOOD (  16.85  )
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

Hello Chen,

Thank you for the patch.

I see this issue in the rpi cfe driver also.

On Fri, May 22, 2026 at 02:55:48PM +0800, Chen Ni wrote:
> The media_entity_remote_source_pad_unique() function returns an error
> pointer on failure, not NULL. Fix the check to use IS_ERR() and return
> PTR_ERR() to correctly handle allocation failures.
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..542aa877919d 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  	struct rkcif_stream *stream = to_rkcif_stream(vdev);
>  	int ret = -EINVAL;
>  
> -	if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
>  		return -ENOTCONN;
>  
>  	sd = media_entity_to_v4l2_subdev(link->source->entity);

--
Kind Regards
Mehdi Djait

