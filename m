Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1921061B0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyeg6iayvtBq5U3BEZwyp48Jrpk6LAXb3+GpCeAE3IA=; b=yEYTh2oNfrJ7L7Jw81/65YCdTx
	reJxYgJcAWtBzQ9blNF2Q8Zuqg/wXuaTCTyCQOo5CGdRHv1nb0tv3Kz/kWNjxz7pjkR+NlREEInfu
	xaj6M7WJukdoQN+8URZt/X8C5V9iUJX6JJE6zLOvMcr738ScqtU396bm86rYlxvJH75t+pIyScDnL
	g4I2zi717oIyUDdwGmXe0GdDpAXyV8Fk1GuXw0trC6PcmkHNan+mIKzMYYpiz5LLtqmnE6mHN3fQz
	BqgEYgitKVK0O5F33JxLYVOWSLTiOueXtPR+DirWobKHMCJBRnKKASIsAIR1thDc0c7FlAIGCxEY4
	krQGSzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ejs-0000000BaRh-2ogv;
	Mon, 30 Mar 2026 15:41:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ejq-0000000BaRL-3vOg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:41:16 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A47D531A5;
	Mon, 30 Mar 2026 17:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774885188;
	bh=xaSzERUuJy7JnMaBD/nIS0H/EorknSGHlGyyizgShTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBmQdObiOv+SX86h/cuGNczYimXJ0Ys04bDSLeRJh3T2swF2aHoGM8977Pt4B3Qv8
	 F3625fJu76fV1+RsPBqPFldv82Ln7N7IcWf6mLMiFy0ayHBXlcygaMuo1+mVA6Hzat
	 c5kxGCczqW3UWqxOFe+co76cof8gR3GzjesY91+o=
Date: Mon, 30 Mar 2026 18:41:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: David Carlier <devnexen@gmail.com>, mchehab@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, jacopo@jmondi.org,
	aisheng.dong@nxp.com, guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
Message-ID: <20260330154108.GA3389518@killaraus.ideasonboard.com>
References: <20260327222711.268132-1-devnexen@gmail.com>
 <acqM06YySijL1VpU@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acqM06YySijL1VpU@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_084115_136555_48670782 
X-CRM114-Status: GOOD (  23.92  )
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

On Mon, Mar 30, 2026 at 10:46:43AM -0400, Frank Li wrote:
> On Fri, Mar 27, 2026 at 10:27:11PM +0000, David Carlier wrote:
> > mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> > frees it on any probe failure path or in mxc_isi_remove(), leaking the
> > allocation on every failed probe and every normal unbind.
> >
> > Additionally, when mxc_isi_pipe_init() fails partway through the
> > channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> > pipes are not cleaned up — their media entities and mutexes are leaked.
> >
> > Fix both by adding kfree(isi->pipes) to all probe error paths and to
> > mxc_isi_remove(), and cleaning up already-initialized pipes in the
> > err_xbar error path.
> >
> > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISP Channel driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
> 
> I think provide a helper function, devm_kzalloc_objs(), or using old
> devm_kzalloc is better fix method.

I quite agree. Kees said he's planning to introduce devm_kzalloc_objs().
I assume this will come in the next kernel version. I think we can wait
for that to fix this leak as it's a really minor issue.

> >  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 4bf8570e1b9e..ab32c5b6ac9c 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >
> >  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > -	if (isi->num_clks < 0)
> > +	if (isi->num_clks < 0) {
> > +		kfree(isi->pipes);
> >  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> > +	}
> >
> >

-- 
Regards,

Laurent Pinchart

