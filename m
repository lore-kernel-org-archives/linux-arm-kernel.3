Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C02ECD9AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 00:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/CkXxDAVpZ5VzimmURkmkqZuq4yyt0MhuMw5fXxYUE=; b=tQZFkWA2JD0zFls3E5yV0ZL97w
	cNiIvzNss9vEey9TEkeJGqvTAZUQyQlEb0KBptrzoIj3X6ECBg03kQuGEivX1V4ivRLDTMnkeULV9
	S/piXQdkFj3Y6eVMy4PCQV0EqTJDcV3sP0cTCc3U0+VDvHWhC1phRp4YQWBAQAQyJAjfGGihUxGFJ
	AOH7dD1WNap40OIt/NbavghJUr1CinvogAB6ylnJteMf1dTU1QPWtAzb6BqqCMhft6O407BseDKdq
	xRPydmiHoqAxrdjyKiP4dfPUdpOcULi4IChZVV2lvmKNQnsGiXyCjn8xwBa0JKRwVsXu5OYYyyin3
	w9EPIIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9im-0000000AfWB-0XqG;
	Fri, 06 Feb 2026 00:29:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9ik-0000000AfVC-13Zf;
	Fri, 06 Feb 2026 00:29:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 248632E0;
	Fri,  6 Feb 2026 01:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770337709;
	bh=CC+SfZLx5g1lXxlDGq9BgjDqqjVtUTE8BdJ9PT3TbFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLdz+UAmhv6XS1xaWsrBmbUr8zlcJzEMzIS95Og4Vule26DAGGHPPfD9HWJpuGUn2
	 y+zJigsSQtwxI7DwbN5xE5UvQoImj68AcKvWh/Z6c0t5Vr21Rlne9oDN3ZLwc55kLX
	 2FzbGinQAptzazFhQkSm/TH2kR7K8ePolTHjaV7o=
Date: Fri, 6 Feb 2026 02:29:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rkisp1: Treat 8 bus width and 16 bus width
 formats the same
Message-ID: <20260206002910.GE1376807@killaraus.ideasonboard.com>
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
 <20260205103207.4020959-3-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205103207.4020959-3-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162914_433915_51CDA035 
X-CRM114-Status: GOOD (  21.93  )
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

On Thu, Feb 05, 2026 at 10:32:07AM +0000, Isaac Scott wrote:
> As MIPI CSI is a serial interface, we should be able to use a bit depth
> of 16 in the same way as 8 bit depth. Add a fallthrough case to ensure
> we don't reject 16 bit depth formats.

I think the change is right, but the commit message isn't.

The driver already lists YUV 1X16 formats as supported on the ISP sink
pad in the rkisp1_formats array. Those formats report a bus width of 16,
and they are used by the CSI-2 receivers for YUV formats. However, the
rkisp1_config_isp() function doesn't support the 16-bit bus width, and
returns an error. It needs to be fixed to enable YUV capture. You could
check the git history to see if this got broken at some point (in which
case a Fixes: tag would be nice), or if it has never worked.

The 16 bits per pixel YUV formats use 8 bits per component, so they are
handled by the ISP input as 8-bit format. That's why you can use
RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO, as for the 8-bit bus width.

With an updated commit message this patch should be good.

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 21bfa0edbaf1..0fc1ca7f97a0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -261,6 +261,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  
>  		switch (sink_fmt->bus_width) {
>  		case 8:
> +		case 16:
>  			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
>  			break;
>  		case 10:

-- 
Regards,

Laurent Pinchart

