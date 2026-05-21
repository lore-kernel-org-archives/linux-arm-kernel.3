Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4705BCD5BB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=; b=v1pGGNtYbgs/d4bsRiz2uq1uI0
	ScP3Id+Nby+PJjDV+t37lExDR/UGi5YHhdRhICrZKgP4dxILUIW/B4+pid26Ad7F1w1PRpaig7tl6
	h6KGsM/qQJniFxaxU3liDk9E2MdDs/v04z/wwDgg7B8KuI3ZZylCVpEhJg4vctmMOBMUh3cwzHOjy
	R4HksCC8Z8hVOKF/3hxBQ8oLKyav2zXm86TtXGwrbHRrtUdksnMKzeGLGBu5cc238V8R2vEFDrAqX
	M3z/vVpQ8KVJKUgFYU3TewhqMRug9x4oTPKKYCmu+an2An9oQAkdWqQ/76EFoonLipGICNsk6TXlb
	2mVKFUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7Vg-00000008guU-36ZG;
	Thu, 21 May 2026 17:48:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7Ve-00000008gtj-01Zu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:48:39 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c80148ae949so2698824a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779385717; x=1779990517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=;
        b=PLbi1slTHn3dDTHovfPPpm7pwqn2OC99xmwmcPNkvq/J6MMyWifkpFoUK2hPw+gFQB
         4u0B6GzQrAI4XjOp2cBe4zHBV72AEr0X39ZMAUvtNabWH3eIfthIMV3UPcDbD2iWLxLw
         am4fRBcgAEiRVOjQHAtNJW4VdvlRbvr5mm5fUlUaAcrSV/TdbeqTh7JxfTlrdldzAcpC
         06OB7e1qVyDJArj/tKzMW988dzL2rFLYLwtFqFRZCgKYGeJNCddGYFlweEvt3QIv+cgb
         MuO3qULQNAf4A/WZsRQjfWuvB6mhRbN0T0EW+7+1l/IhaFpm/5k4oQmP46tJo5PVnYEQ
         NnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385717; x=1779990517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=;
        b=re+9hWwi8H0jLa8VHMroq3Awd7e4lrN8O/vbOTuixN6MahfqpSw8BuaROW3CX/6lF6
         Mqk5pqCTL+9WTODsE8sn+mfxzvyOPtvWIRBDHtNG3o8TcJJxcm9HZMbMqgqD952cFyda
         tcCNcjGP01l2CqVxShSudOTmTqSCRN1/+l1pOS3zjSxunhMKw++E2xyVBK/vO5Uigfae
         xSn+AzCTguGr9bl5mL88pxdhHSJJusfWt8iisZNEbN1YtPX0WA8W8NTiQ3ZVP8Q4SwYw
         OW3EPAgDGhfBGvpiE1vYIn/Aiaf8hJTAjU/l7dfMakGuTY246BqLuQtwX7izJE/UB8TW
         xL6w==
X-Forwarded-Encrypted: i=1; AFNElJ9Lb+ZrNcbdSzNNghmVn+VbR08VYL3yXtPIM2B9Bt7EkEkhUZ1w2+QtVte4JR5TqoQXv5GrhJMJHaFIwSB1BNpv@lists.infradead.org
X-Gm-Message-State: AOJu0YxDSGzjSQFiR5eDQfzvlFWrTwLQo+OesHeLTvN0O2OSZTZW0Qz5
	OzlG4RZqWG7f11gnBkY+s0DFdti3tgEdwG5ZvhROfE5bNBq3R5v7HU+iHutbeb2aBnU=
X-Gm-Gg: Acq92OGGOJQNtAc9o3FFlSVXywBsnmoE2rSn5GgUEgiyYCDttyZBVkHbwWXtX97+zCd
	FFNQ78rfXih7eC9o2btp9RNO4dm+A7oaiRUs6b69R7BpXYCEzVnrOs+HGAiSqJUwhOMejoMp5Lb
	Ix77SaaXK3ZI3l/ANE1gFaBgELSF4DJlxy4o/iMhlwm0FTwFb5wSEILnhqBuNyAL0HbiBABdY6J
	DTBAkMuZ8rtyYlXcy+8/bnDCx1fMJVlp7ym9IrCrwKGTc4Z74FbhVmgwr7515HrJpjwLZ5o+tBI
	hiVGxTUJ38B1rFjWFbNMWA2F0jtwtZ1arkeyTZNMA/tFzjB45aJan9hBalyPCXErN7hHhJ/Aq3t
	oFc/TgibhrqJf/pH31hB+TJGlgrl6mx9Ihz+hb+YtvHsBQStvVpseBZi9guONq17cnfSIzTlo6V
	qb3sOpAb26E6gCcoGRF0qY3DSjlo8=
X-Received: by 2002:a05:6a20:7491:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3b30883a17bmr4801497637.44.1779385716400;
        Thu, 21 May 2026 10:48:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7ba6:1f4c:9869:500c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85197ef536sm952270a12.8.2026.05.21.10.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:48:35 -0700 (PDT)
Date: Thu, 21 May 2026 11:48:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
Message-ID: <ag9FcXeIIiJWdld7@p14s>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-3-tanmay.shah@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_104838_072145_61E3CBCE 
X-CRM114-Status: GOOD (  37.52  )
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

Good morning,

I don't recal reviewing the first revision of this set.  Can you provide a link
to it so that I can read the comments that were provided?

On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> remoteproc framework has capability to start (or attach to) the remote

The remoteproc framework...

> processor automatically if auto boot flag is set by the driver during
> probe. If remote core is not started before the Linux boot, and linux is
> expected to start the remote core then it uses "firmware-name" property
> to load default firmware during auto boot.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..652030f9cea2 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  };
>  
>  /**
> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> - * Allocate and add struct rproc object for each r5f core
> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> + * Allocate struct rproc object for each r5f core
>   * This is called for each individual r5f core
>   *
>   * @cdev: Device node of each r5 core
>   *
>   * Return: zynqmp_r5_core object for success else error code pointer
>   */
> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)

Why is there a need to change the function's name?

>  {
>  	struct zynqmp_r5_core *r5_core;
> +	const char *fw_name = NULL;
>  	struct rproc *r5_rproc;
>  	int ret;
>  
> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return ERR_PTR(dev_err_probe(cdev, ret,
> +					     "failed to parse firmware-name\n"));
> +
>  	/* Allocate remoteproc instance */
>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
>  			       &zynqmp_r5_rproc_ops,
> -			       NULL, sizeof(struct zynqmp_r5_core));
> +			       fw_name, sizeof(struct zynqmp_r5_core));
>  	if (!r5_rproc) {
>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>  		return ERR_PTR(-ENOMEM);
> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	r5_rproc->recovery_disabled = true;
>  	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
> +
> +	/* attempt to boot automatically if the firmware-name is provided */
> +	if (fw_name)
> +		r5_rproc->auto_boot = true;
> +

What happens when a firmware name needs to be provided in the DT but you don't
want to automatically boot the remote processor?

>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
>  	r5_core->np = dev_of_node(cdev);
> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> -	/* Add R5 remoteproc core */
> -	ret = rproc_add(r5_rproc);
> -	if (ret) {
> -		dev_err(cdev, "failed to add r5 remoteproc\n");
> -		goto free_rproc;
> -	}
> -

I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
it simply to make the error path easier to handle?  If so, please do that in a
separate patch.

>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
>  			r5_core->rproc->state = RPROC_DETACHED;
> +			r5_core->rproc->auto_boot = true;

I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?

Thanks,
Mathieu

>  		}
>  	}
>  
> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  	enum rpu_oper_mode fw_reg_val;
>  	struct device **child_devs;
>  	enum rpu_tcm_comb tcm_mode;
> -	int core_count, ret, i;
> +	int core_count, ret, i, j;
>  	struct mbox_info *ipi;
>  
>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		child_devs[i] = &child_pdev->dev;
>  
>  		/* create and add remoteproc instance of type struct rproc */
> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
>  		if (IS_ERR(r5_cores[i])) {
>  			ret = PTR_ERR(r5_cores[i]);
>  			r5_cores[i] = NULL;
> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		goto release_r5_cores;
>  	}
>  
> +	for (j = 0; j < cluster->core_count; j++) {
> +		/* Add R5 remoteproc core */
> +		ret = rproc_add(r5_cores[j]->rproc);
> +		if (ret) {
> +			dev_err_probe(r5_cores[j]->dev, ret,
> +				      "failed to add remoteproc\n");
> +			goto delete_r5_cores;
> +		}
> +	}
> +
>  	kfree(child_devs);
>  	return 0;
>  
> +delete_r5_cores:
> +	i = core_count - 1;
> +	/* delete previous added rproc */
> +	while (--j >= 0)
> +		rproc_del(r5_cores[j]->rproc);
> +
>  release_r5_cores:
>  	while (i >= 0) {
>  		put_device(child_devs[i]);
>  		if (r5_cores[i]) {
>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
>  			of_reserved_mem_device_release(r5_cores[i]->dev);
> -			rproc_del(r5_cores[i]->rproc);
>  			rproc_free(r5_cores[i]->rproc);
>  		}
>  		i--;
> -- 
> 2.34.1
> 

