Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C33DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwPDbQEyAXc77Q5C6257jMdBP0ZXb8K4s1MUTLeX9mA=; b=MYJRuW1rk2sf2Dg5jfd3kpgyTf
	GCd6K54IG1kL7txJIRuNiDlv8Tm+zXCrpfCqFA2kEmBPIYvi1EVIHmMbVpBJJrhhZxYzoBK9dlIJf
	RtFbKKjRBHWPET2A+cc6anixzFntlPEETN7X+rA5pZux0bOQUkn8mCKg1W1XDRn/wbeTU+CYxXRjV
	63tAHicNn/jB52lBOs88tu6Fn9kzc7tm0Z3W/FJacU66EpBA/STegoPzSeT0JIzq+7qJHathhTxmv
	KcgrKhmSGTHrVo9PSBklWXQkzr5zx7UCFxxnxiSOaah1MchgBq67ZTtfAPsNUjC+94jtU3lW+0qwI
	o8kpEteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7tF-00000007PSQ-3Qe8;
	Thu, 06 Feb 2025 19:50:21 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7ri-00000007PIt-1pkF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 19:48:47 +0000
Message-ID: <487916d8-da54-4932-81dd-f139870a734a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738871319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwPDbQEyAXc77Q5C6257jMdBP0ZXb8K4s1MUTLeX9mA=;
	b=L56l4iREX7uPZFdUgfZLgCzh+xM4hGXE8xVUwHTzHq/M4h9cgKCj0VvxDO+QWay4IX2nLe
	Vb2cd+2xlmJQtlFFhEDjZJdIZSjc7mDU62eRinjTmqy25wlmTHhkCYPzjdV13rvFRAxbvf
	dJB1IKw0+uN99W2fs7DxKemlUZtnAt0=
Date: Thu, 6 Feb 2025 14:48:35 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/10] drm: xlnx: zynqmp: Fix max dma segment size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-10-160327ca652a@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250115-xilinx-formats-v2-10-160327ca652a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_114846_622621_5268C9E7 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Tomi,

On 1/15/25 04:03, Tomi Valkeinen wrote:
> Fix "mapping sg segment longer than device claims to support" warning by
> setting the max segment size.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
> Tested-by: Sean Anderson <sean.anderson@linux.dev>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index f5781939de9c..a25b22238e3d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -231,6 +231,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +
>  	/* Try the reserved memory. Proceed if there's none. */
>  	of_reserved_mem_device_init(&pdev->dev);
>  
> 

Can you apply this patch? I ran into this warning again today and I think this change
is independent from the rest of the series.

--Sean

