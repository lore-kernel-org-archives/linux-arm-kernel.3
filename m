Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1E7CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGlW74vpJcZ4OSVM+89PNXDIFyepH4PZecQS8TKIPag=; b=giH0dWiLOhZpuhWyPd9BqrtT6g
	/PuMgeT613ZHxT4cgkNX4Q2o/7fGDujzMU4Qi/yYhn6DkP4kBLpptXdGrILEw2viD3tFcGJjv9NP/
	31EM5ux+UwujDrMNe10MbEp+EYvTe4QFWUyLOtQrht5KN+yFeVa8gQf4J1k1KcIN/1LY3B1SZWOqY
	I9yuRORACtdmCEu1tj1JDljJJSaC+i2Lt0Z05HGQe4Uo4NgmTepoqIDZapwj+jFV2i5EfyNnt5lBM
	JInikTejF4o3mEJ7xgt57PKZ/OCUtD9lYPlu6exNSXA5GUTOmhgh33AoRqqrP86Rc3mLIp8Xo0dAE
	YHKNy7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd5f-000000013LY-0kIB;
	Wed, 06 May 2026 14:19:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd5e-000000013Ku-0S2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:19:06 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 423B463D;
	Wed,  6 May 2026 16:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778077140;
	bh=faLeW0wtzD3frY5Q7ZoepRa1sIizw1jaytAj9zqKE5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdkgGNsGh0t/g9DtHJ+l3yZR9k8jmOHAsxfu2OsdU3z+PWu0lxW3INXfnW7jIR6zH
	 qxo1709JWCey5XCpOAaPpqg+kv4EZt9A/vSwuHzTyl5QRlAF1OlMXHuDntNWer2brp
	 nGbvCRjF/dqU1k1azSc3NrT2RCYadvVoau0s7ED4=
Date: Wed, 6 May 2026 17:19:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: imx8-isi: clean up already-initialized
 pipes on probe failure
Message-ID: <20260506141902.GQ1598374@killaraus.ideasonboard.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-5-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506031210.2769998-5-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_071906_286374_5160E8FD 
X-CRM114-Status: GOOD (  15.44  )
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

On Wed, May 06, 2026 at 11:12:10AM +0800, Xiaolei Wang wrote:
> When mxc_isi_pipe_init() fails partway through the channel loop or
> when mxc_isi_v4l2_init() fails, the already initialized pipes are
> not cleaned up.
> 
> Fix this by calling mxc_isi_pipe_cleanup() for each already-initialized
> pipe in the err_xbar error path.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2b76fb9c18f6..8533a979d60a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -539,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_xbar:
> +	while (i--)
> +		mxc_isi_pipe_cleanup(&isi->pipes[i]);
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart

