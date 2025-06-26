Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666DEC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUF5e7KcE3XiMfllKypGpHsZM9sN7VYFN27kMzcWq80=; b=uwu52xAPr0s16zTxOYqtnFyvVO
	MxtMDhOmbIisKZwS5EKNhkO2UrzzbGAhfc6oXLsp19CdZbe/M/k6wwXofo4IHigyyiXQ4FZ9KOGgi
	MNUHtxTYP0zsuQosC40OqekahtwnBWHKaSROALLZmLCFScmimXgK3zsGmy4UDMnreNTLtTdzsdvfV
	NCkXtKLKJa+LF4O9pbI/S9ny0QaXLV+kkbmo94V1NGooST51BFDIqd3f5elhaAXVPN4+agxXJRMyR
	tqwhyap7Hq01lIiQ4Z9yc73eDk3f+ISCzDy4fZMqV0H0hDFU1s/FSpFnvlC7mzvCVsDxNt7bvkMWe
	1sUeoF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiVq-0000000B585-3oqF;
	Thu, 26 Jun 2025 09:03:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUi0M-0000000AyQL-0AA3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:30:47 +0000
Received: from pendragon.ideasonboard.com (85-76-34-12-nat.elisa-mobile.fi [85.76.34.12])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 239736BE;
	Thu, 26 Jun 2025 10:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750926622;
	bh=RVnpBzh8Pk5p+vp6PHEE6etS4VhqUXMMyitmtLtuxXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JnZNiqDIFGYXfGGL7aQWAxeqFgx9ZF9/ernbTltasxc6pNHH5rZWWn+9JbL7NaGuY
	 5v5mc2tL3AKzjxAbtoVi+/CUOnZW3CMFstArDIP+baStQOkQHcXBpNGF36M0V/u5yC
	 c21JZlXODDVrhJreiowp64kWXjd+/SQSo3huKuUw=
Date: Thu, 26 Jun 2025 11:30:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <20250626083018.GB8738@pendragon.ideasonboard.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
 <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_013046_207497_0717FD6C 
X-CRM114-Status: GOOD (  12.78  )
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

On Thu, Jun 26, 2025 at 03:32:50AM +0300, Dan Carpenter wrote:
> On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > > This was returning IS_ERR() where PTR_ERR() was intended.
> > > 
> > > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> > 
> > I'll add a
> > 
> > Cc: stable@vger.kernel.org
> > 
> > to obey the media subsystem CI rules.
> 
> Wait, what?  The original commit hasn't hit Linus's tree and it's
> not marked for stable either.

I'm personally not in favour of adding Cc: stable on all patches that
have a Fixes: line. I'll let Mauro defend the rule, and I'm happy to
drop the Cc line and fix the CI.

-- 
Regards,

Laurent Pinchart

