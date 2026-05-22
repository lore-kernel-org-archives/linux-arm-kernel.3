Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6F6CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+geE85oo38R4XUU2Qb3gWckawRQ9IEhNVLya137svg=; b=n0HgaUnBABapK3nVINOujpiQWH
	3Txi1NiupWMjiYGGWDu/7D42uXKTsGXVD/MzuE64vblRavdMFk7jjLmENcMrpmRQFYyQcxqEG5dVk
	2OZR32AzFbW0yTsWycsgBRkDlx2jo2RiED/ROCRs9SIuBsuMDUgDxu8mUqfakUqTWciOXvdIQ/54+
	S6lXtxGVNYHihU8GZn9S4PziUXijNxr55O1/kKZ5xjsyxq8Ftu4OgaIFwpF/cfmNUWVvhIIfOdKK9
	4ZqIJk+xhl90bqiZt0SYvkEfVKcW9eqb8K/rZWu1SJ9Nfl5rZ+AYSJzhDzRju4XQAgpvDeCFqqw8t
	iFC1qkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS4j-0000000BK0L-2OHe;
	Fri, 22 May 2026 15:46:13 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS4g-0000000BJz9-2aNT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 15:46:12 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c8016d642b2so3609586a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779464770; x=1780069570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+geE85oo38R4XUU2Qb3gWckawRQ9IEhNVLya137svg=;
        b=Y5SgE9QWuQiZvAJSJ6+meWN/lD5VyR2+WSa7gD8TSk6W5vYRvu1abss82jMTYWBnbV
         yzKWbgafyzsnFqLY0gxvf/p7BGHQtk/AkRFckdmF0OyFJqqAVFde87pv68uXlHJUj5a1
         LfZy5csdwgUCVFzDnbEFi+Z+lHm3S66psncSNQz6E+AqbeYQn97M3j3HaJFS2WiNDD10
         UIzI7WzcpCRalq/JvrHhIr/vqbMLqbXC7G4TJgfgHwv49GSS0xiDeQLMKuztiF1wYN8F
         pte9OXSl9X5BUf9g8Qgg+kUS5p9wt5kPVFjyox2pPIyl7+JEkKAwFXCKgDOG2yNqPyal
         9yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464770; x=1780069570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+geE85oo38R4XUU2Qb3gWckawRQ9IEhNVLya137svg=;
        b=kfZ27Fq6GKmkHRjao6Ha5nwHdPBM5ah9R1i6cZghe7I0FLwCSgbLhN9UHMYPUkTkOw
         jJfVWLgcYHr7H4e+iU/x8Hn/qINFtxPoASaSsOtT5+sDWA245FwtL5jRJeoq4fTmru81
         oYIaQTXAG9gIluqIRNx732XfHtzd0DiRygk5Vhts/Ryfw8icnV6pU2+g8iUmf8FRceRL
         9lGjZkU0xeFXuqhIa59Qa+3LA4E9QCfkDKq8WUuSCR6l+1/UI3lDlXvXarK5R24tAXqm
         gVuiRTS4irtMz8QZZm2FQ5bi0kwf3XBGjuMhvxqJWNhygT9zVMdCrjOmvqp2CXz3Gb0W
         jEbw==
X-Forwarded-Encrypted: i=1; AFNElJ87HWox4DT4UqKmEqqRidr5/HDnxqRcNtB0iI6WrzPYxDvvgTSkUkAUo+z2YrU3EIqxf+MFw5y1hiDJ8KderS6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzhH3sVM9eNVeKF/UKvDOvVACRbV0EVrp/O6InGWoYCZTlUYnMY
	4jKdn5Gk0OmkFEyYutsfdqhSR/4AfRUYdvtGMNCiH2xNPdi/5TjikKM8TgdqS/FAQ1c=
X-Gm-Gg: Acq92OF49okfDw6Z/nlOyI//+qoqPLH2VoGYWEKSGW0RyIVcI8GkLK1lEqrw1uOE9lI
	hlxCr77c+gN3yg8e7K4QdQA+KxIADPOuGG5Go/jGbo11llCFys7WOM0N6TBO8iSQopVYKpxxNOt
	se6fkVu62wvDu/q85P2DbWGR64qI7hj3psv71xIYczik/6CNf3B3attSS6OPBTkaNBoA1OdTL8U
	eoVqcZCmCg07oLDaNrK3BqtkqtHI3cuwrPDB2o5RDR9WgD7bOR0Fp1RxgCq8bPe/5S6hdIvV54C
	mqRmPfQRO5XclVMILw305Nh0bvqohbzX2acHC6+HLEmSj4B2cexCkKaIg0bmc6LGzu4KjnofrRm
	5gWi8RLCs878A2TiWiadct1sdMOygxSagZbQHw1EKR5Ug9Knj9+kM/9/n8mvEI6rFlIzJChtlrJ
	Rbh6E3aCkdtxY+Qd1mIq74jIrmsQ==
X-Received: by 2002:a05:6a20:7485:b0:39b:8571:3051 with SMTP id adf61e73a8af0-3b307f420e2mr7844589637.28.1779464769598;
        Fri, 22 May 2026 08:46:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:dc1e:387:6364:2ccc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a789dsm1828934a12.9.2026.05.22.08.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:46:09 -0700 (PDT)
Date: Fri, 22 May 2026 09:46:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
Message-ID: <ahB6Pvquw6wuEHgl@p14s>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com>
 <ag9FcXeIIiJWdld7@p14s>
 <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084610_678903_C6B68500 
X-CRM114-Status: GOOD (  56.12  )
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

On Thu, May 21, 2026 at 01:38:57PM -0500, Shah, Tanmay wrote:
> Hello,
> 
> Thank you for the reviews, please find my comments below:
> 
> On 5/21/2026 12:48 PM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > I don't recal reviewing the first revision of this set.  Can you provide a link
> > to it so that I can read the comments that were provided?
> > 
> 
> Here it is:
> https://lore.kernel.org/linux-remoteproc/20260422202558.2362971-1-tanmay.shah@amd.com/
> 
> The device-tree bindings needed rework in v1, so I sent v2, before we
> ever reviewed the driver part.
> 
> 
> > On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> >> remoteproc framework has capability to start (or attach to) the remote
> > 
> > The remoteproc framework...
> > 
> 
> Ack.
> 
> >> processor automatically if auto boot flag is set by the driver during
> >> probe. If remote core is not started before the Linux boot, and linux is
> >> expected to start the remote core then it uses "firmware-name" property
> >> to load default firmware during auto boot.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
> >>  1 file changed, 34 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 45a62cb98072..652030f9cea2 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
> >>  };
> >>  
> >>  /**
> >> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> >> - * Allocate and add struct rproc object for each r5f core
> >> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> >> + * Allocate struct rproc object for each r5f core
> >>   * This is called for each individual r5f core
> >>   *
> >>   * @cdev: Device node of each r5 core
> >>   *
> >>   * Return: zynqmp_r5_core object for success else error code pointer
> >>   */
> >> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> > 
> > Why is there a need to change the function's name?
> > 
> 
> Before, the function was actually adding the rproc core by calling
> rproc_add() function, but now it only allocates the memory by calling
> rproc_alloc(). For auto boot to work it's important to add rproc core
> after all the other hw is initialized (such as mbox, tcm, sram,
> power-domains etc). More details below [1].
> 

Ok

> >>  {
> >>  	struct zynqmp_r5_core *r5_core;
> >> +	const char *fw_name = NULL;
> >>  	struct rproc *r5_rproc;
> >>  	int ret;
> >>  
> >> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  	if (ret)
> >>  		return ERR_PTR(ret);
> >>  
> >> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> >> +	if (ret < 0 && ret != -EINVAL)
> >> +		return ERR_PTR(dev_err_probe(cdev, ret,
> >> +					     "failed to parse firmware-name\n"));
> >> +
> >>  	/* Allocate remoteproc instance */
> >>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
> >>  			       &zynqmp_r5_rproc_ops,
> >> -			       NULL, sizeof(struct zynqmp_r5_core));
> >> +			       fw_name, sizeof(struct zynqmp_r5_core));
> >>  	if (!r5_rproc) {
> >>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
> >>  		return ERR_PTR(-ENOMEM);
> >> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  	r5_rproc->recovery_disabled = true;
> >>  	r5_rproc->has_iommu = false;
> >>  	r5_rproc->auto_boot = false;
> >> +
> >> +	/* attempt to boot automatically if the firmware-name is provided */
> >> +	if (fw_name)
> >> +		r5_rproc->auto_boot = true;
> >> +
> > 
> > What happens when a firmware name needs to be provided in the DT but you don't
> > want to automatically boot the remote processor?
> > 
> 
> I think that use case is not needed. If the user/system-designer doesn't
> want auto-boot, then having firmware-name in the device-tree serves no
> purpose. User can always load the firmware via sysfs once kernel boots.
> 

Ok

> >>  	r5_core = r5_rproc->priv;
> >>  	r5_core->dev = cdev;
> >>  	r5_core->np = dev_of_node(cdev);
> >> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> >>  		goto free_rproc;
> >>  	}
> >>  
> >> -	/* Add R5 remoteproc core */
> >> -	ret = rproc_add(r5_rproc);
> >> -	if (ret) {
> >> -		dev_err(cdev, "failed to add r5 remoteproc\n");
> >> -		goto free_rproc;
> >> -	}
> >> -
> > 
> > I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
> > it simply to make the error path easier to handle?  If so, please do that in a
> > separate patch.
> > 
> 
> [1] This was moved to make auto-boot work. The remote core can auto-boot
> only after other hardware is initialized. The zynqmp_r5_core_init()
> initializes sram, TCM and power-domains of the core. Also, mailbox is
> requested before zynqmp_r5_core_init() as well. We can't auto-boot core
> directly without all this. So, I had to move rproc_add() at the end of
> the cluster init, and rename above function from
> zynqmp_r5_add_rproc_core to zynqmp_r5_alloc_rproc_core.
> 
> If you prefer, I will add above explanation in the commit text, or as
> comment right before rproc_add().
> 

Yes, please add that to the commit log.

> 
> 
> >>  	r5_core->rproc = r5_rproc;
> >>  	return r5_core;
> >>  
> >> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
> >>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
> >>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
> >>  			r5_core->rproc->state = RPROC_DETACHED;
> >> +			r5_core->rproc->auto_boot = true;
> > 
> > I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?
> > 
> 
> That function is now zynqmp_r5_alloc_core() as mentioned above. Also,
> until now, auto_boot was set to 'false' only to show that it is
> disabled. It is actually used and enabled now.
> 

Ok

> > Thanks,
> > Mathieu
> > 
> >>  		}
> >>  	}
> >>  
> >> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>  	enum rpu_oper_mode fw_reg_val;
> >>  	struct device **child_devs;
> >>  	enum rpu_tcm_comb tcm_mode;
> >> -	int core_count, ret, i;
> >> +	int core_count, ret, i, j;
> >>  	struct mbox_info *ipi;
> >>  
> >>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> >> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>  		child_devs[i] = &child_pdev->dev;
> >>  
> >>  		/* create and add remoteproc instance of type struct rproc */
> >> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> >> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
> >>  		if (IS_ERR(r5_cores[i])) {
> >>  			ret = PTR_ERR(r5_cores[i]);
> >>  			r5_cores[i] = NULL;
> >> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
> >>  		goto release_r5_cores;
> >>  	}
> >>  
> >> +	for (j = 0; j < cluster->core_count; j++) {
> >> +		/* Add R5 remoteproc core */
> >> +		ret = rproc_add(r5_cores[j]->rproc);
> >> +		if (ret) {
> >> +			dev_err_probe(r5_cores[j]->dev, ret,
> >> +				      "failed to add remoteproc\n");
> >> +			goto delete_r5_cores;
> >> +		}
> >> +	}
> >> +
> >>  	kfree(child_devs);
> >>  	return 0;
> >>  
> >> +delete_r5_cores:
> >> +	i = core_count - 1;
> >> +	/* delete previous added rproc */
> >> +	while (--j >= 0)
> >> +		rproc_del(r5_cores[j]->rproc);
> >> +
> >>  release_r5_cores:
> >>  	while (i >= 0) {
> >>  		put_device(child_devs[i]);
> >>  		if (r5_cores[i]) {
> >>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
> >>  			of_reserved_mem_device_release(r5_cores[i]->dev);
> >> -			rproc_del(r5_cores[i]->rproc);
> >>  			rproc_free(r5_cores[i]->rproc);
> >>  		}
> >>  		i--;
> >> -- 
> >> 2.34.1
> >>
> 

