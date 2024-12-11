Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A16E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtx+6xhbU+aJko5pr1DHS1R6Jad78CfllVKF9uhKB3I=; b=hZGPEhrrJRHcFlUT9k1IuK23dK
	3mHLwcMjRqj7bI7nv9RpipSaqXNqGz78fRSbhEks6C3n4EmBeLoJWoTEF5O7I9zZgoo64ztHEF8NQ
	BREjXwQoR4ysRKZH0NrNSwTBdFT6IgErB3KEO4ZOzqoEVPUCK3yyCkbQOvM3TCKbvr3xuEkDbqDCy
	1wYnebe9Z5Z7e65XByBQiesHABrjta7y/c46SkPxvI8MkMqxs3bq8PKYLi/RegNbO16kIJboqbKXD
	NopE/06CUdNUME18fybfDxlFYejcdKo7NpAvyhP8VRzUsnVM6gPwV4oOow2HDZCaTrm7/RJ+l8XDj
	Fb1lYH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMOw-0000000EvbI-1KW4;
	Wed, 11 Dec 2024 13:05:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMJq-0000000EuDG-2zIN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:59:59 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8746C83D;
	Wed, 11 Dec 2024 13:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733921959;
	bh=9vwQ4DTXUQXSYuiFSuO8qJgz9ksaOqF3dLukB/AVSGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pw6/B1pigVl9UzRrAM00Ngki8vn4ZwCcifeQhyI1zN7yc6c+epaLp/4sOFBVdQ5/p
	 i00g9RUf2XLbBvUtQHWwHflqmAnkq1REab8IgOPL64krLJHd86czRbqNl2JyHrockm
	 uToREKoBgRGMaEsnQ0Zt7m5W5XrL1D7AW+LICakY=
Date: Wed, 11 Dec 2024 14:59:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Karol Przybylski <karprzy7@gmail.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, michal.simek@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: zynqmp_dp: Fix integer overflow in
 zynqmp_dp_rate_get()
Message-ID: <20241211125936.GA23711@pendragon.ideasonboard.com>
References: <20241211122026.797511-1-karprzy7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211122026.797511-1-karprzy7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_045958_881554_DAB7A3C7 
X-CRM114-Status: GOOD (  18.37  )
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

Hi Karol,

Thank you for the patch.

On Wed, Dec 11, 2024 at 01:20:26PM +0100, Karol Przybylski wrote:
> This patch fixes a potential integer overflow in the zynqmp_dp_rate_get() function.
> 
> The issue comes up when the expression drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit arithmetic.

Please wrap your commit message text to 82 columns.

> 
> Now the constant is casted to compatible u64 type.
> 
> Resolves CID 1636340 and CID 1635811
> 

Does this need a Fixes: tag ? How about 'Cc: stable@vger.kernel.org' to
get it backported to stable kernels ?

> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 25c5dc61e..55e92344b 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
>  	struct zynqmp_dp *dp = data;
>  
>  	mutex_lock(&dp->lock);
> -	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
> +	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * (u64)10000;

You can also make the integer a 64-bit constant with

	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;

>  	mutex_unlock(&dp->lock);
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

