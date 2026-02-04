Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EC0E9D3FB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8DNOdpBjdyt6uT2lcPY/R+fV9p8lK9gGtuvSeLx94M=; b=pVWa5IPsSunUwiLL18v+VzK+PB
	T8+wYjMnyQlvJN7weE63ehc8g5UWC0lYBeW1t9Oo8VoMU2Iy8LOEFp/Wzk/PUDOEy9eIbFD9KNDmk
	hx2FrkM+B0OSPi+R++DpOku+z88VjHl0lGejjZrGRgc+fwgDskQcAzttR0osShkQjl4Vjq/IM1ItQ
	YizKj6nhaS+oLfYPoGyFxxACBKE5sjmZh1m++VeLyu3QmN9YbSh3yx+YXmrNzvSNexjiT22lW0d8B
	yPYhAEl5N1vC1jjteYBT7XIAJCihSJVFSWCiFR3DAXCj05UPU8vecvs7FetyWjuAL4S9auyRPDxpC
	Wz55Q/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vneo5-00000008f2A-3ENr;
	Wed, 04 Feb 2026 15:28:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vneo2-00000008f0b-2xoW;
	Wed, 04 Feb 2026 15:28:40 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5C1325B2;
	Wed,  4 Feb 2026 16:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770218871;
	bh=8b7NEE0pg/AHJ7XBOifwnvN2QzfrWc6nJZvHlB+YsXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0Vm94fLIs+83Fk6V4H4NAhZAPn8f+D8O3tIrhgLiGgziGvTVnCBLJjqUJVW3rzSI
	 cS/XrjCViIC+KBTsZ/XitinuPNHB6CFjOGE06d/F/0PZEozrslR+1EXU0o4F4CbGM/
	 eiASLTINLyyFKJ/kWY66M7R67dgsc0KH1iarS8MY=
Date: Wed, 4 Feb 2026 17:28:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] media: rkisp1-isp: Propagate sink -> source
 format in YUV passthough
Message-ID: <20260204152831.GA170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-5-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-5-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_072838_880113_69AA6265 
X-CRM114-Status: GOOD (  17.42  )
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

On Wed, Feb 04, 2026 at 11:25:04AM +0000, Isaac Scott wrote:
> If we are in bypass mode, we should propagate the sink format of the ISP
> to the source format to ensure the pipeline is valid. Ensure the source
> pad format of the ISP is configured to the same format as the sink pad.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 716bd7f3c66d..c457593526c5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -630,6 +630,11 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  	 */
>  	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>  

A comment would be useful here, or maybe better a rework of the comment
block just above.

> +	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> +		format->code = sink_fmt->code;
> +		dev_dbg(isp->rkisp1->dev, "ISP sink pad is YUV");

Drop the debug message.

> +	}
> +
>  	src_fmt->code = format->code;
>  	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>  	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {

-- 
Regards,

Laurent Pinchart

