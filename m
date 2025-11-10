Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B4CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9BmbIA/+sHJ8iI+3v9x5VDORTf0Od/t7SFqNp049bY=; b=UqQwRfYOd6S02P4V/fs7w3QxB9
	noJ0glyylM+C7clyHJ3jCaa2Jj/NFhrSkD1VABp0Q0+qrki9s4wuQ7NIkwFZBpQ0OhNviT9XLdgHw
	lm3ADF4SERjMuKeWE7EqP5tPNID4e5gwH+uTMMP8CwqfI9sr15/hGXX0AFBltBHkRor23qJd4qB30
	MigxpM3SRgOEBkPvLk9pTG/iBOXFAhRbNixAi9O1fBzIvOqxe/nCAsLqRxrBiWWMh6whofUmXAXj4
	+iqzSOpHatVgL5X+Fg03Rx6SCefZwL16nDRnLz4FRwb5qD+zbN5V6qMTZDCvfzwTyHtrp0o9arZFR
	MmlUC3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINb0-000000051WY-3Vbz;
	Mon, 10 Nov 2025 08:49:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINay-000000051WJ-42gK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EEB960008;
	Mon, 10 Nov 2025 08:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A397EC116D0;
	Mon, 10 Nov 2025 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762764591;
	bh=L8WwRtc/KVhcwVxx2iw6AWXl76LzJPVUQX89gEvL+zg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=J769OGb7KshC5EGg3bpiJMvSav3sFXhFww5eKdD9rO+6S+MFA/po/bP2bDDzj16I+
	 pvr3d1tCPbD5S8VpW3iOECSeIPqVmdDu+S1ZY6qTTbCHLnnbn/k42Aeqbsq3O1o0aP
	 DYM5wJlMi8l3/IrJEDAv7tzs/B2O7Vj+d1lHEzyMpyRdtG72+lUzZfIoNXE61p3LGJ
	 nG1ADhmy4jP7veqcP8uRKG79G4SriQ12z8XIG054oThmxnRaOvB0jPt9LbR99GI9Y1
	 MWpbm5ItcxEx5agO/oSv/V9OGVmjTPjbdokukGsmTasTSRQtj5tqjl7zOHa4HK2+ln
	 0h+OqSF3jOWYg==
Message-ID: <51c19bc4-35cb-43ea-a4d6-4496142baa9e@kernel.org>
Date: Mon, 10 Nov 2025 09:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 17/18] media: videodev2.h, v4l2-ioctl: Add microchip
 statistics format
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
 <3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20251009155251.102472-18-balamanikandan.gunasundar@microchip.com>
Content-Language: en-US, nl
In-Reply-To: <20251009155251.102472-18-balamanikandan.gunasundar@microchip.com>
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

On 09/10/2025 17:52, Balamanikandan Gunasundar wrote:
> Add microchip ISC specific statistics meta data format. This data consists
> of raw histogram statistics that is exported to userspace for further
> processing. This fixes the kernel warning "Unknown pixelformat"
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 01cf52c3ea33..a03e8f3ab610 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1467,6 +1467,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
>  	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
> +	case V4L2_META_FMT_ISC_STAT_3A: descr = "Microchip ISP statistics"; break;

statistics -> Statistics

>  	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index becd08fdbddb..ba628f9bb89f 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -875,6 +875,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
>  
> +/* Vendor specific - used for Microchip camera sub-system */
> +#define V4L2_META_FMT_ISC_STAT_3A      v4l2_fourcc('I', 'S', 'C', 'S')
> +
>  /* Vendor specific - used for C3_ISP */
>  #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
>  #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */

This meta format must be documented just like e.g. V4L2_META_FMT_C3ISP_STATS.

Regards,

	Hans

