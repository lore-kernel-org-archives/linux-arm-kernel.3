Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B4CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diYE6dfNWnlt90OJsOup7nUEn5tDgsDFlN/poXjsyQo=; b=qPyFn+1HvoPVHMMZMejOWUQ7K/
	w2/wRDLTxdHrAphscdMOnH8tvhNoVlN/K1aicIB09eRTOWFYO9/CTfpM2EDxor0aBPbVVFCtzgmJp
	eQKRdKF9jo5gsFkJSOddnoKzSx5vR3zQ4sEDkT8cGd5KS10xDdZZsKNrfap4JViMG54y6AyyunXlL
	xSwtJ4VfVgMCsWrU3EXqE0a6JZc/4nH7f1DJQnUVfzz/zi4QItC6RzA/Zb8LOyZes2Gr8OAC2H1Oo
	6Hl9T2lPgBZpghi5xbutdQYCU2lgJ5NwkmPyJNg+MyPqQzUhJwIZmNdvrYUi8Myt+C86HRcBmCR2C
	pw5/xsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNhV-00000003kRE-2RW3;
	Fri, 09 May 2025 13:23:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMqq-00000003ahG-1JXA;
	Fri, 09 May 2025 12:29:17 +0000
Received: from pyrite.rasen.tech (unknown [IPv6:2001:861:3a80:3300:4f2f:8c2c:b3ef:17d4])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F12A48DB;
	Fri,  9 May 2025 14:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746793738;
	bh=AUaHMoaWFUQ4iEYeil8536kyUZaoosXunY70b+YQh7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wc13+ol7l9WuIdWoCMeCe+l5jMDGEObMTCn9YtYSmkVqET8X+kyQqwt+cQJT2fOUv
	 tJ8+3bweTC+8n5wvRT+vzN08eW12zIp0QmsKwzyVgzKSya9qy8w913ntmGfCJ0Mzcx
	 gd5KTqvTVa0l23Ypasjl9T8tcQRy466VlsefrJD8=
Date: Fri, 9 May 2025 14:29:06 +0200
From: Paul Elder <paul.elder@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
Message-ID: <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
References: <m3tt5u9q7h.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3tt5u9q7h.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052916_487483_19287AF1 
X-CRM114-Status: GOOD (  17.78  )
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

Hi Krzysztof,

Thanks for the patch.

The code change looks sound, but I'm confused about the reasoning behind
it.

On Fri, May 09, 2025 at 09:51:46AM +0200, Krzysztof Hałasa wrote:
> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> HIST_STEPSIZE = 3 (lowest permitted):

According to the datasheet, the histogram bins are 16-bit integer with a
4-bit fractional part. To prevent overflowing the 16-bit integer
counter, the step size should be 10.

Do you have any other information on this? Is it known that it's stable
and consistent to use all 20 bits anyway?

> isp_hist_h_size: 383 (= 1920 / 5 - 1)
> isp_hist_v_size: 215 (= 1080 / 5 - 1)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
> 
> Apparently the histogram is missing the last column (3-pixel wide,
> though only single pixels count) and the last (same idea) row
> of the input image: 1917 * 1077 / 3 / 3 = 229401

I don't quite understand this. With a sub-window width of
1920 / 5 - 1 = 383, shouldn't the resulting total window width be
383 * 5 = 1915? Same idea for the height.

Also according to my understanding, the / 3 calculation is correct, but
it comes from the step size and not about missing last column/row.
Where does the missing last column/row come from?

> 
> with the patch applied:
> isp_hist_h_size: 384 (= 1920 / 5)
> isp_hist_v_size: 216 (= 1080 / 5)
> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 230400
> 
> 1920 * 1080 / 3 / 3 = 230400

The fix looks fine though. Although, I'm wondering if there's a reason
why there was a -1 in the first place. Does anybody know?


Thanks,

Paul

> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..ca9b3e711e5f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -819,8 +819,8 @@ static void rkisp1_hst_config_v10(struct rkisp1_params *params,
>  		     arg->meas_window.v_offs);
>  
>  	block_hsize = arg->meas_window.h_size /
> -		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
> -	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10 - 1;
> +		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10;
> +	block_vsize = arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10;
>  
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
>  		     block_hsize);
> 
> -- 
> Krzysztof "Chris" Hałasa
> 
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

