Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CE8CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOBAPfUxyKsTBtO44UKmLZeN6Sp2bXaJQ/NJVaqh9rU=; b=caUf5H4iLx8YOEq93P/jirYzzM
	QZbnbbB4hjF6jrKy5577OJtd7x6mL6GBMsanwIiPmSnVzLcPS3pOF5gSqMtXi2wyi0+fzTV2rK10i
	16GqYCeGQYhZSJs4pWajQNF9RCj0bgW/zP5+NeuEQFyXTtu34PPZ9OSkPpXvo1aOrnzrN67wkSs6P
	3n6TowumS0f1pi1Ng5tn+GaoxNCezChNB8Ti7Q0xdsZuEFMnLiMduWYomIyj44JW/Zfydl6ageIk9
	RlnMq48/g8AmrYWwLnZ8sRAztEUtWiwFTt3pIHTCrRRrdL5GlFy6K4mA8gaTDXmNyLJOYTWl2hMXw
	sbp2dKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPmjv-00000005czw-2KCT;
	Wed, 20 May 2026 19:37:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPmjs-00000005cxu-3Bdl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 19:37:58 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B85E742B;
	Wed, 20 May 2026 21:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779305859;
	bh=xfHpI83heRSimp+xUd5auoVVzUnuFuzgp2nyUTguwbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rh+ddrz6vluW7eOSX3w0csL8BG1ZMGUTeEA1D5i3pT/cqe2X2/RPBp1NRODlaP/Ul
	 gWF25FXOIscJJzOk5C0GrhzarSETL4daclHPKw/ir0BZpk4t0CD9MAeuIb+JEKThdG
	 FicaYwyS52kR3g61vaFsz+r3/MyhirnsBsCgfXzo=
Date: Wed, 20 May 2026 21:37:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Frank Li <frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: nxp: imx8-isi: Fix scale factor
 calculation for hardware rounding
Message-ID: <20260520193752.GA12152@killaraus.ideasonboard.com>
References: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
 <20260323-isi-v3-2-8df53b24e622@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-isi-v3-2-8df53b24e622@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_123756_939604_FF8FA40A 
X-CRM114-Status: GOOD (  20.15  )
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

Hi Guoniu,

Thank you for the patch.

On Mon, Mar 23, 2026 at 04:33:31PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The ISI hardware rounds the actual output size up to an integer, as
> described in i.MX93 Reference Manual section 57.7.8 (Channel 0 Scale
> Factor). The scale factor must be calculated to ensure the theoretical
> output value rounds up to exactly the desired size.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 37e59d687ed7..a2edac8292a7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -112,7 +112,16 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
>  	else
>  		*dec = 8;
>  
> -	return min_t(u32, from * 0x1000 / (to * *dec), ISI_DOWNSCALE_THRESHOLD);
> +	/*
> +	 * The ISI rounds output dimensions up to the next integer (i.MX93 RM
> +	 * section 57.7.8). Calculate the scale factor such that the theoretical
> +	 * output (input / scale_factor) rounds up to exactly the desired output.

I assume you have verified this applies to the ISI in the i.MX8 family.

> +	 *
> +	 * Example from the reference manual: Scaling 800 to 720 lines
> +	 *   - scale = 0x11C8: 800/0x1C8 = 719.859375 -> 720 (correct)
> +	 *   - scale = 0x11C7: 800/0x1C7 = 720.017578 -> 721 (one extra line)

I think the first paragraph is clear enough, the example is not
required.

> +	 */
> +	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec), ISI_DOWNSCALE_THRESHOLD);

Line wrap please.

	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec),
		     ISI_DOWNSCALE_THRESHOLD);

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

No need to send a new version, I'll handle those changes.

>  }
>  
>  static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,

-- 
Regards,

Laurent Pinchart

