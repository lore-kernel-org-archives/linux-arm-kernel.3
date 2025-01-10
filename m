Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA12E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+ZK2sNVQG3CftxXFAyvg9WnLzu0fKqq3YAoWAkxSFo=; b=r8/X56czpK5ylrYE/J/iGh3d4e
	wThT6pd765pT6kM0+0IrHdFbdnY+5e5o94RrshubrvkW/HPwCERU4VQIeWc7MdnrTObOO+jAvUfSI
	qN9ucOyqLcMMIIu35QxypmCPXeIgOA9HJAwAA73y+0pdCOaPGvIVfUmBWa973MQDPP2W2hRnsVS/Q
	Atp8qIBTnBlU0q0McRZSfL8FMv/RTE4E/OdgQtFpLMYRxCGKtJjc6zs3JzljCVoDKAQZJ56r8FYvv
	UCALJDns8OFQC9+UmuO4KXQTmZ1d5S3niUvFY5LULn9Txps1zKsdvXBcZrJaa+S51S5YHfVdpKCpU
	SyGuivbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJTr-0000000GWfE-1B0m;
	Fri, 10 Jan 2025 18:11:35 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJSb-0000000GWW7-2UJB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:10:19 +0000
Message-ID: <b18dfc63-94fc-4459-ba0d-67b704d38f0c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736532613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+ZK2sNVQG3CftxXFAyvg9WnLzu0fKqq3YAoWAkxSFo=;
	b=VTC54PXO0Q8s4bDBQnojNz3yhaEmT4/m2eBO8ccEqRBY8/HTl09MaK6eylomDEcPrfwfwp
	EZj2aiuTNcPodNCQsTaAt/YkJhW9Z+Q2ZLPhrUS2txsC9qb8CdY+ISQy4OdLnOEDupYQSx
	EK2Rh/GVToquQrg2gCyJzbMw9211hc0=
Date: Fri, 10 Jan 2025 13:10:09 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 10/10] drm: xlnx: zynqmp: Fix max dma segment size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
 <20241204-xilinx-formats-v1-10-0bf2c5147db1@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241204-xilinx-formats-v1-10-0bf2c5147db1@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_101018_708759_EE5C2DD5 
X-CRM114-Status: GOOD (  12.52  )
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

On 12/4/24 04:31, Tomi Valkeinen wrote:
> Fix "mapping sg segment longer than device claims to support" warning by
> setting the max segment size.
> 
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

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
Tested-by: Sean Anderson <sean.anderson@linux.dev>

