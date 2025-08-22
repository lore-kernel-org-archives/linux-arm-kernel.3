Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49143CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kqa1T2jKAaNLUMJlsTczjdoF7tPB/vfoO4AbxX1t6u4=; b=b8OY7U3FuDTng/6dg5bSQQGccI
	NMEFZAOUTt3Gc+5CmP6Svpi9EbvbTRl6XfTx/dNRBmUm9M9a5LsRgoXBFHmiuF+aN9uqqKNn1wBOm
	g1K1a5c9uCFwW/ngRgEF37ISWcBAZ0WXLCNYye6JPbtwgPEsYdLoKNcpz4gZKeJ5Jsa1kRY7SpERD
	/IE8WQGaevpzr5HMqibeh5nZuQafl80idXrkBqUBHV/q1O8Mw71zMYnEqm9Pab3dXHwhn3nevvzW/
	LkwKDZjtNiwhIMiMm30Vgqe80pjLukybUU0Ym2fPW0VP6xxp2QalzYB2T8m49o3lZRPfcw6Awh2jI
	RsbXuxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwA-00000004CwZ-1rGl;
	Sat, 23 Aug 2025 06:41:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVkM-00000003Fjq-46wr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:40:18 +0000
Received: from pendragon.ideasonboard.com (unknown [185.22.192.49])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 46CB08CB;
	Fri, 22 Aug 2025 19:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755884348;
	bh=wOYlUElulsIPCYoWODQpF+Pjb0jgLY3gHhL6O/KuWuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPKj+SHVRjF13GMdYN7YsHuLVasJf20VQTKuEF6V9MpKhYPgpfPaHBeaTznU49STX
	 i0rnH0/sSfuQgJ99DC8ifD0aPGI21Ik/oYpbj0Q9XcsDCt+YgqXnrsAgtgT6Wt8Wh2
	 XizvmeVhxRs0374t1Raxw0pXM2vHda1QX/ikCTsY=
Date: Fri, 22 Aug 2025 19:39:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 12/13] media: imx-mipi-csis: Initial support for
 multiple output channels
Message-ID: <20250822144341.GB22572@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
 <aKh8NG1lHKyAEoct@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKh8NG1lHKyAEoct@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104015_150881_56C3442D 
X-CRM114-Status: GOOD (  18.98  )
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

Hi Frank,

On Fri, Aug 22, 2025 at 10:18:28AM -0400, Frank Li wrote:
> On Fri, Aug 22, 2025 at 03:27:32AM +0300, Laurent Pinchart wrote:
> > Some CSIS instances feature more than one output channel. Update
> > register macros accordingly, parse the number of channels from the
> > device tree, and update register dumps and event counters to log
> > per-channel data.
> >
> > Support for routing virtual channels and data types to output channels
> > through the subdev internal routing API will come later.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Update more per-channel registers
> > - Update commit message
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
> >  1 file changed, 152 insertions(+), 87 deletions(-)
> ...
> > +		return dev_err_probe(csis->dev, -EINVAL,
> > +				     "Invalid fsl,num-channels value\n");
> > +
> >  	return 0;
> >  }
> >
> > @@ -1444,10 +1511,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >
> >  	/* Parse DT properties. */
> >  	ret = mipi_csis_parse_dt(csis);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > +	if (ret < 0)
> >  		return ret;
> > -	}
> 
> I think this change is not belong to this patch.

The reason why this message is removed is because the
mipi_csis_parse_dt() function now prints error messages internally, so
this would be a duplicate.

> >
> >  	/* Acquire resources. */
> >  	csis->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
Regards,

Laurent Pinchart

