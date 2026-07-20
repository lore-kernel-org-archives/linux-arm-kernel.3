Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBB6C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ut6J34bhcaxBKBCQeq4f+DwEXhDi7Ii27hYKDogmcqE=; b=jAU7sTp7jaJQDJygvyxp06nnbs
	v+HfjGNlTo7qIfN+plkJkvwq8wigYLJXQPZcLjqJinXY7tS+B7OwpEMyC9etTyuigON/ljvkc54wf
	IM4tyehGb0FwK5xn1Q5ktYw9ay+dj4OX4F8PBkXY2aRP4KaUVNBUc9E2basqp9mKyPdz9tnrVMbsO
	yKg49shGt0B04yc4X4LRtkZp0QCVu7x2upMtN3kDu1ei/FcmNlhAb/GHazB6hnMIc6N6nhs4SMiyU
	LENkmf2K4DM1QJvjau2pmvHtFcj8S1UWS5BTEXTP4gqFntR5IsPPWU7XWchvoefqjdu+j3jB06Str
	/7Y4QLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrRt-00000007TP6-1m5k;
	Mon, 20 Jul 2026 17:06:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrRr-00000007TOW-1Hc2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:06:36 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27721289;
	Mon, 20 Jul 2026 19:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784567135;
	bh=KmFigFmefZabsxaRB3B6z37SPB1Q+zApMfm6Cfoi8Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOeKkpgaavsNGQCRaQNloByoF9qSI80Y6od7hHv9kkeVLXu8YW2/vQz3GV5h8vHHl
	 FvfsnB1UKxBV9CZqTx/hbR8RNyjNV00+knrTSexHs1fm7s6lnbHtd9hbmzUJM4dk8O
	 76L0NSmdbTcxEgkzat2+akwfREvbN+ZBAllUJsFw=
Date: Mon, 20 Jul 2026 20:06:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual
 channel and frame descriptor support
Message-ID: <20260720170632.GD42426@killaraus.ideasonboard.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
 <178276214766.2429861.1950641421457268519.b4-ty@b4>
 <20260629202302.GK3054459@killaraus.ideasonboard.com>
 <akPsxPgLNgu3YsEV@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akPsxPgLNgu3YsEV@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_100635_495140_09905BB1 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue, Jun 30, 2026 at 11:20:20AM -0500, Frank Li wrote:
> On Mon, Jun 29, 2026 at 11:23:02PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 29, 2026 at 03:42:31PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > >
> > > On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> > > > This patch series enhances the i.MX ISI driver's with virtual channel
> > > > support and adds frame descriptor capabilities to the crossbar subdevice.
> > >
> > > Applied, thanks!
> > >
> > > [1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
> > >       commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e
> >
> > Is this a mistake ? Patch 1/2 has no R-b tag, and you're not listed as
> > maintainer for this driver.
> 
> Sorry, I missed checking Maintainer files, in media summit, agree on I pick
> imx's media drivers, but forget finalize the file\dir list. Can you help
> summery which files\dir I should take care?
> 
> If you have concern about this patch, I can drop it.

I would appreciate if you did. I'm collecting ISI patches for the next
merge window, I'd like to avoid conflicts.

-- 
Regards,

Laurent Pinchart

