Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7440BCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18GKF7IU2JXtGXP7TC6a3Q70FuCb/15ssJjAdTLISl0=; b=vo3++8gPzLfDyRk4YfUNLogEbZ
	s6+Q5tyBRddURWsF9emIYFqaLmLpSLQwxIKM2/a3S1FCqJiAMdSvfZCjxFh+GvTmKa8nnH+QCZvWu
	PExmP9Ndie0P6wgoauD7UTb8OvZoQQFiiyiXtd1pjXjmQaCugUsXE148NAQZpLCeSEeQXIVGMhg3q
	oKBon0i6nyWVwJ0TKN0AU9WPNoeRZ6IfCe4vL8pf944/OF7p2zt+oOQ3LWnHrbmbFvG4Asn6rXsL5
	zYBtyIE2gt6c4+VT3yaAecjMmU5C9GfViTr8KK+TJs0X+u5L6Rn8KSXoflg2fGHxa2s+399yI2VA7
	GNoQYjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbYv-00000000nCM-1k4q;
	Wed, 06 May 2026 12:41:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbYu-00000000nBg-0v2p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:41:12 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4965463D;
	Wed,  6 May 2026 14:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778071267;
	bh=/4qS0BCUqnUnIcX+Zc+8rx4aZz63MpUdpO+lQvtF0Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeLo/yo3QjcqXJGrQ7VPAVJ05lU97o1Q6RzYZ+aFuik9ya4cG8e7L7Fcb0LuT2IcV
	 zLelYH2L7ryuBTxslH6ztkeSl+MiKOlhDh1RoAjYblIAyz0phRMGq9rXhfuPYkj7Ip
	 v/Tip/5I+5UHTSN/gkg/1+LNq93yfHO6YqEtvqk4=
Date: Wed, 6 May 2026 15:41:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: imx8-isi: fix isi->pipes memory leak in
 probe and remove
Message-ID: <20260506124109.GP1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-4-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-4-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_054112_404377_52D63FB4 
X-CRM114-Status: GOOD (  18.30  )
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

Hello Xiaolei,

Thank you for the patch.

On Wed, May 06, 2026 at 11:12:09AM +0800, Xiaolei Wang wrote:
> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> frees it on any probe failure path or in mxc_isi_remove(), leaking
> the allocation on every failed probe and every normal unbind.
> 
> Fix this by switching from kzalloc_objs() to devm_kcalloc(), which
> ties the allocation lifetime to the device and eliminates the need
> for explicit kfree() in all error paths and in mxc_isi_remove().

There's ongoing work to add a devm_kzalloc_objs(), to I'd rather not
revert to kcalloc. If you want to fix this leak now without waiting for
devm_kzalloc_objs(), I would prefer adding kfree() in error paths and in
mxc_isi_remove().

> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2d639b789910..2b76fb9c18f6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  
>  	isi->pdata = of_device_get_match_data(dev);
>  
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
> +	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
> +				  sizeof(*isi->pipes), GFP_KERNEL);
>  	if (!isi->pipes)
>  		return -ENOMEM;
>  

-- 
Regards,

Laurent Pinchart

