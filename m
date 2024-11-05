Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C9ED3176B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBg0QID7YLqrC4Qtre565hAluVRbFu/AYHC8KqiN4eI=; b=PSojEeSO4HdRWC6PK50/SVdxTX
	X5Kkg56bjiBRAuwvEL+p9oRuirgmfD07SkjpygLF6PYor22qXiNhYGwAfH7vhAA39zferWft91tXy
	BlxpsVu/XXTiVuYEELdsEkXVbXE9DvcCI1JYYCRAZDObc6p/JmpBzb+CUa77UHQnPhYCR8xEMtJjH
	Ls5kl3f4XTyA6xaAzaalo5+IC84/db7fYQlA40Aeb0DWLEB/o2fgX9pPgLwaSCRu8T/1sUiYY8JR0
	cFP/+LGxywSz7HPI4peGMkopZlDJFMXkQkSFGid/Pr+UJdDO9XGlTwT47gPE8rbxnXdcOu6BoW9cl
	15TpfAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NNw-00000000D27-2KlY;
	Tue, 05 Nov 2024 17:30:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mu0-000000008Zb-3aQj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:59:38 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F08F73E;
	Tue,  5 Nov 2024 17:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730825967;
	bh=ydILT59GR8AEnvXxgxP0u5JaNtkOLQNmxYiS5gzdAA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPHZviItmxp0MX6rGq+j/1nW53lOV34Hr2i2bSDsQ0xDT+W7L1Cn1RbqrHaHByBgb
	 R3hOioTR0i9iPhHwVNTOi5gXy8qRQzEWO0LSfa+puUUioFjBfNuXLcPGq+ibrM7c6r
	 qEtjWyQuEwpmwvXH8KLzaU2rBSMbzzmPfIcCFqVM=
Date: Tue, 5 Nov 2024 18:59:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <20241105165928.GJ14276@pendragon.ideasonboard.com>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_085937_056945_2B37D36B 
X-CRM114-Status: GOOD (  17.62  )
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

Hi Dan,

Thank you for the patch.

On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> This loop was recently converted to use for_each_of_graph_port() which
> automatically does __cleanup__ on the "port" iterator variable.  Delete
> the calls to of_node_put(port) to avoid a double put bug.
> 
> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The offending commit wasn't merged through the media tree, so we can't
easily merge the fix there either. I'm fine merging this fix through
Rob's tree.

> ---
>  drivers/media/platform/xilinx/xilinx-tpg.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> index cb93711ea3e3..7deec6e37edc 100644
> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -722,7 +722,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
>  		format = xvip_of_get_format(port);
>  		if (IS_ERR(format)) {
>  			dev_err(dev, "invalid format in DT");
> -			of_node_put(port);
>  			return PTR_ERR(format);
>  		}
>  
> @@ -731,7 +730,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
>  			xtpg->vip_format = format;
>  		} else if (xtpg->vip_format != format) {
>  			dev_err(dev, "in/out format mismatch in DT");
> -			of_node_put(port);
>  			return -EINVAL;
>  		}
>  

-- 
Regards,

Laurent Pinchart

