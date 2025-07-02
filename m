Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NurDUL3qWW3BRW3Xf8hjnBLC453/Drcn5+KeEWfyCs=; b=PZ8rbaZ12lsJdD3zTtJfLYt3CK
	tve4tX9ukIi0xK0N27UeQuPusSv4R56cg6vX5L3GUMk5c+EuyXUew0Ffdd7uYoXbZ9mH7Mj+u/SD4
	00pL45tg4lX5SmvWEDaUtNJ5AzTYSag66+NE2e55sj9O56bFgXx+F/XqTqzecx6ZGvA/iVUdU42lt
	s2vHgG27h/qiPpSrYfLJ1anieQlIQSXFxol0FP3br7zwmA0yV/y89X0fN+2LU+a4bQ2QaeEku/xBS
	jgmYiXTKQXhhlADDUMnN6+QiKNdbolRW1zhxtbnyqUXXrUpmllEx3lu3FEVqKd8IEQ1YZGZLB0maX
	ldGiqVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5Z7-00000009ewU-2s45;
	Wed, 02 Jul 2025 22:04:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5QH-00000009drc-11FG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 21:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E3356112C;
	Wed,  2 Jul 2025 21:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBC2C4CEE7;
	Wed,  2 Jul 2025 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751493319;
	bh=iGkBwzIdbza8qoD4B6aj+xlJlyErE9nD591815HAFqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txYuBzXBSRKbeFVOMXVCBpbM5Smf33hS+2wxhGLkFxlvKyR/BNSy6og0XV5svlqgh
	 RG1Zi5SgKSqpogdRaqjU1RUpaeUHS1qO3AmzIieSclZbNUStETr0pZbAJGp6IP9BWB
	 jFLUU9dFMRTy4NgoyGBSrqcUwzY1daDg1fK7RUDVp72TSmzGt4aDJdQywUuBOuIuGl
	 rdm1BzqTFL3LYmo45rVSfMZ69VsBTvOH7TYTDEUlpPJZpkSy3DtGYIfZ1qL28dfC+L
	 X2Ro4yRfJrby9W5BveTfy3Nn37QD3x0o86ji8oFjbCMkYHq16pXvogeg03y4PXVCby
	 kfdGmOegah1Ew==
Date: Wed, 2 Jul 2025 23:55:12 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/24] driver core: Export get_dev_from_fwnode()
Message-ID: <aGWqwNXy1AcCGf97@pollux>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-18-ulf.hansson@linaro.org>
 <2025070205-ignore-passive-17b4@gregkh>
 <aGWH2mH6iZJ3s3lL@pollux>
 <CAGETcx_yVXgvmbDFYe+Nbdp18D-m14W8xO_G9RyAujpag+M9ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx_yVXgvmbDFYe+Nbdp18D-m14W8xO_G9RyAujpag+M9ow@mail.gmail.com>
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

On Wed, Jul 02, 2025 at 02:34:04PM -0700, Saravana Kannan wrote:
> On Wed, Jul 2, 2025 at 12:26 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Wed, Jul 02, 2025 at 09:34:12AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Jul 01, 2025 at 01:47:19PM +0200, Ulf Hansson wrote:
> > > > It has turned out get_dev_from_fwnode() is useful at a few other places
> > > > outside of the driver core, as in gpiolib.c for example. Therefore let's
> > > > make it available as a common helper function.
> > > >
> > > > Suggested-by: Saravana Kannan <saravanak@google.com>
> > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > > > Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> > > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >  drivers/base/core.c    | 8 ++++++--
> > > >  include/linux/device.h | 1 +
> > > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > > >
> > >
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > I'm a bit concerned about exporting get_dev_from_fwnode() -- at least without a
> > clear note on that this helper should be used with caution.
> >
> > AFAIK, a struct fwnode_handle instance does not have a reference count for its
> > struct device pointer.
> >
> > Hence, calling get_dev_from_fwnode() with a valid fwnode handle is not enough.
> 
> Not enough for what?

Having a valid pointer to a fwnode does not guarantee that fwnode->dev is a
valid pointer. Given that fwnode is reference counted itself, but only has a
weak reference of the device behind fwnode->dev, the device may have been
released already.

If the scope this function is called from can't guarantee that fwnode->dev has
not been released yet, it's a potential UAF.

Yes, device_del() sets dev->fwnode->dev = NULL. But that makes it still racy.

If someone has a reference count on the fwnode and calls get_dev_from_fwnode()
while device_del() runs concurrently (assuming that device_del() drops the last
reference of the device), it's a race with a potential UAF.

We should warn about this, when makeing get_dev_from_fwnode() and API that can
be used by *everyone*.

- Danilo

