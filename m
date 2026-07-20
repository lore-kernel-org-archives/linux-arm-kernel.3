Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5FBC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/BuCN6RLG8s6eBB8VuQi51MbQU6pQGsEAvJoaJmY04=; b=FNRkMyz4UNrD9tMw962w1ITCxy
	Gl9qDhj7AlM21XPnWONpYsyudPMz4zuX0Jz8ZDqUhT2rqhTD5ZLrUa8lYlLGMJJg07WPA87KKfJlm
	9DtLKPY2aqHao92krPlWUCdTFAflW6i6EbIJH1zea/9uvYd02w/sbuUTCskWQP4zDLBeSscR82OUc
	tmj8idFw/we+yxy1cj64owzLNEB05MJc8XeJq4U2oc/KDMFe18kggLD3g0KD42SgtNSJkICS7vtSX
	waspaqjP5mBGJHZAQhAsPw1X+Y7GD47HUZHHDO0NZFhj0+h6KIuxMZrv0pMPLc+hmgS0AsD/pjj2g
	QU0Sq6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrqh-00000007XtX-2kFJ;
	Mon, 20 Jul 2026 17:32:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrqe-00000007XsI-1jED
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:32:14 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16120289;
	Mon, 20 Jul 2026 19:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784568672;
	bh=cYGNX9mRpVXFAQsh4CySThVivtxoWoVmU2ZjBC7rjd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EW7Zrizv8m+gSZXtFawFuU/ZOIyv2wPIARm92Y3ILP94dmnEfJuP8oVd8kJh/89Vz
	 alQy/wSGeEx5o5h2U5EC8d0h3OqtYGdGD0oqHae8A+7A4Xq1pzw1vzMJ2TYdc+K8Rj
	 vjIJNV4G3i8okkI5uD/Ao7CniMG8AHPV+68Xx+qc=
Date: Mon, 20 Jul 2026 20:32:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: nxp: imx8-isi: Add stream ID validation
 for crossbar routing
Message-ID: <20260720173209.GB50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
 <al46mfiUE5lr8rRF@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al46mfiUE5lr8rRF@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103212_598921_7D682413 
X-CRM114-Status: GOOD (  23.93  )
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

On Mon, Jul 20, 2026 at 10:11:21AM -0500, Frank Li wrote:
> On Mon, Jul 20, 2026 at 11:34:04AM +0800, Guoniu Zhou wrote:
> > Add validation to enforce hardware constraints that were previously
> > missing in the crossbar routing configuration:
> >
> > - SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)
> >
> > This check complements the existing memory input validation and ensures
> > that all routing configurations respect hardware limitations.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> > Changes in v2:
> > - New patch split from v1 1/5: adds stream ID validation on top of
> >   for_each_active_route() fix (Frank Li)
> > - Remove incorrect sink_stream validation
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 84871bceb31d..328d08a278ea 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -106,8 +106,20 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
> >  	if (ret)
> >  		return ret;
> >
> > -	/* The memory input can be routed to the first pipeline only. */
> > +	/*
> > +	 * Validate routes against hardware constraints:
> > +	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
> > +	 * - Memory input can only route to the first pipeline
> > +	 */
> >  	for_each_active_route(routing, route) {
> > +		if (route->source_stream != 0) {
> > +			dev_dbg(xbar->isi->dev,
> 
> it is one error, should be dev_err()?

As this is an error that can be triggered by userspace, we prefer
dev_dbg() to avoid giving unpriviledge userspace a way to flood the
kernel log.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +				"route to pipe %u must use source_stream=0, got %u\n",
> > +				route->source_pad - xbar->num_sinks,
> > +				route->source_stream);
> > +			return -ENXIO;
> > +		}
> > +
> >  		if (route->sink_pad == xbar->num_sinks - 1 &&
> >  		    route->source_pad != xbar->num_sinks) {
> >  			dev_dbg(xbar->isi->dev,

-- 
Regards,

Laurent Pinchart

