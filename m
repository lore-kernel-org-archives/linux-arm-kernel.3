Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047E9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 18:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TanZ82WbIAZxgS7XKqsTQ324oAaKj6StKyDW1vuc6Uc=; b=U2t8D4gwcRCEJVDn5+/7oWPjg8
	no2/ZfrBj3iTa42qZdMaygBZkz76D9f4V0L6V/QBmp6iPd3lU1WzOQ63Vz0gstN3NXgKzgQu5vD8q
	QPqArGouamtKJYNEvHVzfavG7UjfuXdrmGqt5+Bee3Td8Y67B94Xj24Pj566I51wj0BEvX81XaZWf
	duqnKv6+2LrMc8jqr3e98oXerTviSkAOeybNNl9RWyfmr7DKlzhQXKF5bAl3OMljiUde9/d8yaWjI
	n8kDqO1pKpL01vn1S36tcj5uwBTWJl88TAx5S3WB5lANLOhUbZ2wi4D+hQU9zJC34/FO7WmQz7mEI
	Uh+9cEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGi91-0000000EEWd-46Fu;
	Wed, 05 Nov 2025 18:22:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGi8z-0000000EEWE-0cvo;
	Wed, 05 Nov 2025 18:22:06 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 026A0664;
	Wed,  5 Nov 2025 19:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762366808;
	bh=rn6lpHyqVDDYjoTIgoDSgaML8D42aZry1x8K04rmuig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iChMyb/f0sa93v8E+Wol0iT8728tV55uRd6icHRLSqdFgKW1SOy2ARIEDA7fjlVg8
	 HnkIGixdFK++gk6DfKT1rzmXO/2t9UnBposK6fAg6xnd06ikdt471fRpROIHa7b3Dm
	 Qs87rWd1MaTt34+S6eedS8mNFrGbJgjCuGVu7hmk=
Date: Wed, 5 Nov 2025 20:21:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: Fix enum_framesizes accepting invalid
 pixel formats
Message-ID: <20251105182159.GE6046@pendragon.ideasonboard.com>
References: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829101425.95442-1-tarang.raval@siliconsignals.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_102205_332288_681F6BA7 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Tarang,

Thank you for the patch.

On Fri, Aug 29, 2025 at 03:44:24PM +0530, Tarang Raval wrote:
> Reject unsupported pixel formats in rkisp1_enum_framesizes() to
> fix v4l2-compliance failure.
> 
> v4l2-compliance test failure:
> 
> fail: ../utils/v4l2-compliance/v4l2-test-formats.cpp(403): Accepted framesize for invalid format
> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
> 
> Tested on: Debix i.MX8MP Model A
> Kernel version: v6.17-rc3
> v4l2-compliance: 1.31.0-5387
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

I've tested this with libcamera, so

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 6dcefd144d5a..107937b77153 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1383,6 +1383,9 @@ static int rkisp1_enum_framesizes(struct file *file, void *fh,
>  	};
>  	struct rkisp1_capture *cap = video_drvdata(file);
>  
> +	if (!rkisp1_find_fmt_cfg(cap, fsize->pixel_format))
> +		return -EINVAL;
> +
>  	if (fsize->index != 0)
>  		return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart

