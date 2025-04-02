Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EF8C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LOF3+LYeMmYgLFlCiTFCTpyMKPry7lsHUqtLJGG81c=; b=3BXvE61iKGVE2A/nRjFziUUQ2y
	AQfjTfxInaR5xByz/KZG6RYAQDtmLoTs3Aetb13A1qnEsxnpa+ma8HzlUyf21c4iQEfHqvkPSgN9X
	yrFEUZKrtHp5YYCOKJ6lTXvFnTqeKvGEhw1WXzXXIkryyw4JnRZ5yFl7Ex4PfPtsCQPZaxWZi8KyL
	XuiumhPddVSUmE87nhoyrYUlyTxnPRc0rO6bcpsVtejadGn8EpRiJTJSjRyaeaYg1Claa5hCN1eIC
	CZV3bLVR9GWPJ7cNDzTG/S4vwNZV6NXa9BBoEB2GcfmMVgqMmcVR5pzFUECiYrHL4uWrF/zZJegsn
	8cnDdUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxeP-00000006ADK-1cBh;
	Wed, 02 Apr 2025 12:57:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxXv-000000068i8-3rYZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:50:21 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA8163B;
	Wed,  2 Apr 2025 14:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743598102;
	bh=seEcfsTx/2axYLwPT5YXHyXv+dAslO1ezGacxvR5VHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+NQD2PD8PiA3RJhi7tyR7HaK5qJrm5RVlw6DEqp4nPt/pn08/DJEkLOqExnzuto+
	 RUQSRPX6PgKd+D/v1ASa1EVrzqEn7FWNPxNG3tMPIIqWhkqmRSkJkw6Mnj62Hzl+H5
	 n3SZJFRMETsYmMR2QNreddDMFnLLwc3ypynaMvOk=
Date: Wed, 2 Apr 2025 15:49:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: shao.mingyin@zte.com.cn
Cc: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
	simona@ffwll.ch, jonathanh@nvidia.com,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, zhang.enpei@zte.com.cn
Subject: Re: [PATCH linux-next 2/2] gpu: drm: xlnx: zynqmp_dp: Use
 dev_err_probe()
Message-ID: <20250402124951.GA13762@pendragon.ideasonboard.com>
References: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
 <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_055020_088994_116EDFE9 
X-CRM114-Status: GOOD (  14.71  )
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

On Wed, Apr 02, 2025 at 07:38:52PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index a6a4a871f197..28efa4c7ec8e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2466,10 +2466,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> 
>  	dp->reset = devm_reset_control_get(dp->dev, NULL);
>  	if (IS_ERR(dp->reset)) {
> -		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
> -			dev_err(dp->dev, "failed to get reset: %ld\n",
> -				PTR_ERR(dp->reset));
> -		ret = PTR_ERR(dp->reset);
> +		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
> +				    "failed to get reset\n");
>  		goto err_free;
>  	}
> 

-- 
Regards,

Laurent Pinchart

