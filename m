Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A744CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2E/grzk0lu+Y4pxCTa9p5IsOW7E7z/8K0e7zf8zNVv8=; b=3btgcEF30yllau5YHysEKgCdVP
	F+QtRIgNlg9cnFTqR2+e0EczEPlg4/Y/2jm3sXlaBKIB5W0OKcXMa4zQ5YF2FrH/AEhPMSOYEOrwl
	MWMOuuquu8d5GaO99VHQESvvOm4sWwFF7EZqKutUwecyn5tgnBWfNxJ92Jmt5SrSFTiVvRifw6loG
	hY5bxejlxUWpC/CB+Adb54YwcWdZcWxH78za8LpsWdEda/4+A2oGLn1oKfG16oaI9cYoUlFMiRC6+
	9vEBYas2IbODtrhpPzDSJZCqUbQtesdL3ruUQMIsDB2czHCginBEEp6RXevvMIXlenTSP6wfpeKJt
	gzekY96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfM0X-00000005FDQ-2Pdd;
	Thu, 02 Jul 2026 18:19:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfM0T-00000005FCM-0Xwh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 18:19:28 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58B7F22B;
	Thu,  2 Jul 2026 20:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783016316;
	bh=iMO17iTJWoMt5HRqYvRyCxPEU2GVfSbOr9hY4SHBp+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPBG9AD57PqMUbbV4c8F5rp5Dxrl9hEWI7znN6ivnuTxoP6cW1ENk5f3fXliUt63a
	 dep90ED20b45Z/eJfJHwHeb7IDRe7zMtvjNtjnQYHegXsWKAzK+0ZABu6pdBr6L4y7
	 dqc7sSKTDHBcNBd8iRFCrABCrH+2RpnDW3noPK34=
Date: Thu, 2 Jul 2026 21:19:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Message-ID: <20260702181920.GJ3534761@killaraus.ideasonboard.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
 <20260702161519.GI3534761@killaraus.ideasonboard.com>
 <akapt6v_DBJSAnj0@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akapt6v_DBJSAnj0@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111926_822764_711E539C 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, Jul 02, 2026 at 01:11:03PM -0500, Frank Li wrote:
> On Thu, Jul 02, 2026 at 07:15:19PM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Have you missed the comment in v6 ?
> >
> > https://lore.kernel.org/all/20260629084654.GB3054459@killaraus.ideasonboard.com/
> 
> Sorry, I forget emphased it in change log.
> 
> "For the reason stated by Sakari in patch 1/9 (dependency from MC to
> V4L2), I don't think a "media_async_register_subdev()" function is a
> good idea."
> 
> The reason already NOT existed in v7, I removed v4l2_fwnode_endpoint from
> media_pad. So MC will not depdent to V4L2.
> 
> So this comments is not suit for this version.

media_async_register_subdev(), with its "media_" prefix, appears part of
the MC API, but it operates on a subdev. At least the function name
should be changed in my opinion.

-- 
Regards,

Laurent Pinchart

