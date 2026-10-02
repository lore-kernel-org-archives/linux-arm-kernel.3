Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E15CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjdIvGj9EmDN1YxuaFdrEFHg8mUUSKAIm4tVYc4i1t8=; b=iEsk/pGImQi0NIwyefYLQgI87C
	+2oVW8/Cx22ewJ/Pz+spowG8JrF0fSNlNKcU4TBXvqbP7C69hTmK2TKvTRb60xON2qADePH0ONZve
	K7wF/eX99/zO0GDXXP4fJIcR/1A74fQ9cQKu7IRPywBGuW0N4hHODktxnxZcx6MINJkyNOLdTi3T9
	iqvDqmtfeQ8eeqOmhVcHLtmjld/yTyc71441rsldZuhA4OnfxtMizFFybLtb+PGQWo5/p5soRswMI
	rJq46Xnt61wu+UxK8+4//t+yUAhE6QYiCDniNE+gEepHmNMgOuItoNIfCX6ONoFrI4n6ETgu61vFt
	bUy1xgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf1p-0000000BtOa-2uGo;
	Fri, 02 Oct 2026 15:18:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf1n-0000000BtNI-1hNM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:18:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9505C143D;
	Fri,  2 Oct 2026 08:18:22 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCFED3F85F;
	Fri,  2 Oct 2026 08:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954306; bh=YHkCkAvI2azuXQy+PgJBhLP0u3/q7PVdTH38e6wb0i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hqQtFAEhY6zLjAb+OM/YPQYKPWIuccjUOUEav9q5KLka6+xdA/6QCD4JK0CqwRWSh
	 zS3NHqQd/+0nwrqaFy0JfLqvNAW6QfOwSuFrajaFNZwPpxJPqvahT8hjMmAu9GPLbT
	 vkoLmOQNsPN4Tz6sAShK2JzRgpB/7WaMfeL3N7WY=
Message-ID: <e1316f39-0c60-4331-9155-7b6c3fd7fdf5@arm.com>
Date: Fri, 2 Oct 2026 16:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm_mpam: Switch to kvzmalloc_objs() for
 allocation of component cfg
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-12-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-12-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_081827_491210_A7513C08 
X-CRM114-Status: GOOD (  13.12  )
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

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> Each component cfg is sized by the size of a per-PARTID multiplied by the
> number of PARTIDs. On a platform sized to push the limits of the
> specification, the allocation using kzalloc_objs() will consistently
> fail. Change to use kvzmalloc_objs() so that large allocations fall back to
> vmalloc() based allocations.

Makes sense. We should do this for any allocation that could be larger than
a page.


> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 10fc5168699b..d74292f8cdfd 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -157,7 +157,7 @@ static void mpam_free_garbage(void)
>  		if (iter->pdev)
>  			devm_kfree(&iter->pdev->dev, iter->to_free);
>  		else
> -			kfree(iter->to_free);
> +			kvfree(iter->to_free);

And kvfree() is safe to use with non-vmalloc'd memory that we use for things
like struct class, which get free'd here.


>  	}
>  }
>  
> @@ -2692,7 +2692,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
>  	if (comp->cfg)
>  		return 0;
>  
> -	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
> +	comp->cfg = kvzalloc_objs(*comp->cfg, mpam_partid_max + 1);
>  	if (!comp->cfg)
>  		return -ENOMEM;
>  


Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

