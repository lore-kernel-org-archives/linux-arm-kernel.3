Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F34C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IweysX6newFGS35tJYDHCHe5fr7wHaVqFdqp5NyxgvQ=; b=eW8HOY7NAFGjbBKOc84KTWLM1d
	JJQnshgix3hegbsbuEAKvWI67OYg+5LGug/cShrjrAtfn23vW0NyDyCpdHMZ+m0DO4vWP0E98OFGc
	N8dycnEZ2HRboNJ9KweH863zXUoAM9/ImxwntInmlvUZ5lJPnjZK/sGFDlVfiUXPbaTNe0JJSg+8X
	XJOcGHfAVilZU1btYdB6IeK9Qu5/sa6smNe78tUpZKC8a8yTSNhZs4cJLdsm/hRLPCMDWipO1yE/n
	iAO7gH5IaDujSkunMNAogvBlAJ/priqJRq6K3PCeJuI/LKYUJDyGfkpaOKz8y2tfWOdAPPVS046IL
	TYonM0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUyT-0000000CxnV-05Ht;
	Mon, 24 Feb 2025 09:42:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUf3-0000000Ct4d-1kOG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:22:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F42F55A;
	Mon, 24 Feb 2025 10:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740388832;
	bh=6s6mE6iWL2zLpUlwDFdCQx4XhtHfEW/hJy2iFvXQnHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKCFL4+lUe+cwxys5YXBpNb6v6150ygxINtgje7a9KI1N2NgUWCmK2b+uqeP1ih+A
	 BHtTxQ9tpd/5GI+SVum39bcOPKx4l/+FJN8vtRMQ204Ych1Xe1U8mnT0PEVe42k9yr
	 Y7T8GDFdHJ6I8+/ngq/6RKYuF7C31YeZypBQg54c=
Date: Mon, 24 Feb 2025 11:21:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <20250224092140.GA29646@pendragon.ideasonboard.com>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
 <20241105165928.GJ14276@pendragon.ideasonboard.com>
 <71d343e7-ff9f-44e6-abfc-64425640c4f6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71d343e7-ff9f-44e6-abfc-64425640c4f6@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_012201_777417_29146452 
X-CRM114-Status: GOOD (  26.37  )
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

Hi Hans,

On Mon, Feb 24, 2025 at 09:49:47AM +0100, Hans Verkuil wrote:
> On 05/11/2024 17:59, Laurent Pinchart wrote:
> > Hi Dan,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> >> This loop was recently converted to use for_each_of_graph_port() which
> >> automatically does __cleanup__ on the "port" iterator variable.  Delete
> >> the calls to of_node_put(port) to avoid a double put bug.
> >>
> >> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > The offending commit wasn't merged through the media tree, so we can't
> > easily merge the fix there either. I'm fine merging this fix through
> > Rob's tree.
> 
> I don't see this patch merged anywhere. Should I just pick it up? I think
> it got lost in the noise.
> 
> The commit 393194cdf11e is now available in our media tree, so it should
> be fine, I think, if I pick it up. It needs a CC to stable as well, right?
> I can add that.

Yes, I'd CC stable. Thank you for handling it.

> >> ---
> >>  drivers/media/platform/xilinx/xilinx-tpg.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> >> index cb93711ea3e3..7deec6e37edc 100644
> >> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> >> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> >> @@ -722,7 +722,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
> >>  		format = xvip_of_get_format(port);
> >>  		if (IS_ERR(format)) {
> >>  			dev_err(dev, "invalid format in DT");
> >> -			of_node_put(port);
> >>  			return PTR_ERR(format);
> >>  		}
> >>  
> >> @@ -731,7 +730,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
> >>  			xtpg->vip_format = format;
> >>  		} else if (xtpg->vip_format != format) {
> >>  			dev_err(dev, "in/out format mismatch in DT");
> >> -			of_node_put(port);
> >>  			return -EINVAL;
> >>  		}
> >>  

-- 
Regards,

Laurent Pinchart

