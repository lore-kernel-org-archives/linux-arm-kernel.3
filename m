Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B449A1125839
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGXKk+XZV5OUBibd4BfhKYW1ym362esonYfB9+F4Duc=; b=fu1RPZV5haqmWIIi/Gshql/C5K
	sT57jHkpQrfj1GV5ZSe69niaugz3PXX6L3NR2xu7lGDZTHqeUvJLWxoLdDHymjGkkXehScJ4pCst1
	sIXQDWlWy3i7Y1ulmtz4sybH0r9oJDYfy39Ai74PhXhHIs4CTrxeufXigaFPoy7aYR05weuSw7l+z
	mMm5kB9XkMmKXK1KN8aUhyx9vTUj7bq+0muRy31uUJZ7Dd/Kn2KuvjbKobV+a+UcBYDkwnoz6cE3a
	a0YmYI6eNHXyrlJq5s3yJ6su3OqzxmnaubqhrQ+g0eB1dDoCm5fnciKKyPDHF2Ogro2wWw7kH/nCw
	iRqRLjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KSh-0000000BhNm-3XPj;
	Wed, 11 Mar 2026 14:22:59 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KSf-0000000BhN9-2Bcx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 14:22:58 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509062d829dso534301cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773238975; x=1773843775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sGXKk+XZV5OUBibd4BfhKYW1ym362esonYfB9+F4Duc=;
        b=Vz+2iyuXDZ3oalDY7SD1V9ogmTKIPqv5VzunY45jOT7rpBqwqubNcZUozUQSA4Sem7
         xCMMMPi1MiTCJ0MKrZtmV6fED2m8W0pCn/hMnTbF5tt2+HFl9m2uRrKoFAc8FiNnlnJk
         JvKosM12E7Lc3srWD883NUkd3pvCzlgMLU9g8KCJON4T9vLuSgudAWd0aPiDOc9M0YAe
         +dvhlgbXgGMbGpbBtaQjL7JH0gGD4WWP19o/ZllAf5jTnw2+m/50RNkCTViIY8VXBDQR
         3KSjNPguxP6JK8Zjy+pK1xYqeJww59hkR+9oRKNRHTX2hzkMIxmVuLjlxPZkBDVUioRN
         tQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238975; x=1773843775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGXKk+XZV5OUBibd4BfhKYW1ym362esonYfB9+F4Duc=;
        b=rT6JtDttWGUfZ06AHP5aod6lcAZ6O0ciALhUs8xFVIK9onpjVAg4L6egiB06bo6bK6
         DO3hFdDHntwFiqlQwWoNwsJu0YRGcl4lB0Jo9fwMN4tYrBQktquo78SnfpHWT5e/WXh+
         on5b1f/SMBmTBifyqe+IJPBeEddEhbLzCUqN5PrIw69wdsFGcvmaN8OvOGv63knkdOP+
         db/ykowBC2SPlIXLNDPyQ382WG+5KbCvvgF+xnq/g5G4iO+5/G7lzCGB5Gdt+JpJKnlx
         bk4NFrz9T2OdkOI/Lyir5dkK1h4Rv45qI/qxair+Ts3wM6o+wVGjKt1CiMXq8HrO3Hlr
         LxNg==
X-Forwarded-Encrypted: i=1; AJvYcCXYu70wf88oDvnYkfYX1rDf2KDFpc3cdD+wTcabT6CO6FGqx5FD9g7NfF46hOt6sCli4B8npDNSurkjrJguB0oI@lists.infradead.org
X-Gm-Message-State: AOJu0YzvlHq1DAb8WhwypZUdJoAVfzk0kEDFB2W3awWSWKt9kVveH3zE
	4kC74BrDcOz8UVgL5aEZzAHnRSukUfEc5VHekuq6S2TOvNrmyeTraFT4Wb/7iw7mFw==
X-Gm-Gg: ATEYQzw5oFZRMfB9pE8SLKQUOJmxRsNE/bJBo5sl4lkQTYTTur5f/V4l8CXMs/wjI0A
	ehvidiE/+JsJ4gsRBQeMFWBvckSqYfpHr1q9Ne0OMRDkbUoCZnxjKp1wmH6Tlr7aIdL2inDx/lN
	Sc0hrCXPXmvqu+DMchxCIDY/Xf0aq0EBrkMK+eIKTWMXiMZcarum47ZU5OBMN/02nOk62lKrTX9
	r+tLCOTDY43tU5j0TC5bPa+pRQwajcg3T/ut+Cc1eIKZbAzfDyEyJWwZ3n4sNcVZOiBCVwPEiVH
	JMj/JzIcgRdooWl6RMM5ht1bJ1GTZTpNLsk0bbRT+4m6ae/YbLhS2ZhY3Pt9+dfKBW1sOFiWb0z
	QJQSLSMz7Q6sAtFoystVIgl+0NB5sA/DL2vkQ9Kd3nizb2FPKr9xf3x0TDA7AzSLY5kew7OgbgH
	RRq1vD1xVqWqdCs9siKZMbSflh+kCD3UidE96rdir93cTfbZT4v7zxQ0TFLA==
X-Received: by 2002:a05:622a:15c8:b0:4f3:5475:6b10 with SMTP id d75a77b69052e-5093827de9dmr13929241cf.8.1773238974789;
        Wed, 11 Mar 2026 07:22:54 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734125bdasm1337658b6e.1.2026.03.11.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:22:54 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:22:50 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: will@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allocate cmdq_batch on the heap
Message-ID: <abF6un_jrQ8zGZZ4@google.com>
References: <20260311094444.3714302-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311094444.3714302-1-yphbchou0911@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_072257_579526_FC616F0A 
X-CRM114-Status: GOOD (  26.61  )
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

On Wed, Mar 11, 2026 at 05:44:44PM +0800, Cheng-Yang Chou wrote:
> The arm_smmu_cmdq_batch structure is large and was being allocated on
> the stack in four call sites, causing stack frame sizes to exceed the
> 1024-byte limit:
> 
> - arm_smmu_atc_inv_domain: 1120 bytes
> - arm_smmu_atc_inv_master: 1088 bytes
> - arm_smmu_sync_cd: 1088 bytes
> - __arm_smmu_tlb_inv_range: 1072 bytes
> 
> Move these allocations to the heap using kmalloc_obj() and kfree() to
> eliminate the -Wframe-larger-than=1024 warnings and prevent potential
> stack overflows.
> 

Thanks for the patch. I agree that we should address these warnings, but
moving these allocations to the heap via kmalloc_obj() in the fast path
is problematic. Introducing heap allocation adds unnecessary latency and
potential for allocation failure in hot paths.

So, yes, we are using a lot of stack but we're using it to do good
things.. 

IMO, if we really want to address these, instead of kmalloc, we could
potentially consider some pre-allocated per-CPU buffers (that's a lot of
additional book-keeping though) to keep the data off the stack or
something similar following a simple rule: The fast path must be 
deterministic- no SLAB allocations and no introducing new failure points

The last thing we'd want is a graphic driver's shrinker calling
dma-unmaps when the system is already under heavy memory pressure and 
calling kmalloc leading to a circular dependency or allocation failure
exactly when the system needs to perform the unmap the most.

Thanks,
Praan

> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 66 +++++++++++++++------
>  1 file changed, 48 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 4d00d796f078..734546dc6a78 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1281,7 +1281,7 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
>  			     int ssid, bool leaf)
>  {
>  	size_t i;
> -	struct arm_smmu_cmdq_batch cmds;
> +	struct arm_smmu_cmdq_batch *cmds;
>  	struct arm_smmu_device *smmu = master->smmu;
>  	struct arm_smmu_cmdq_ent cmd = {
>  		.opcode	= CMDQ_OP_CFGI_CD,
> @@ -1291,13 +1291,23 @@ static void arm_smmu_sync_cd(struct arm_smmu_master *master,
>  		},
>  	};
>  
> -	arm_smmu_cmdq_batch_init(smmu, &cmds, &cmd);
> +	cmds = kmalloc_obj(*cmds);
> +	if (!cmds) {
> +		struct arm_smmu_cmdq_ent cmd_all = { .opcode = CMDQ_OP_CFGI_ALL };
> +
> +		WARN_ONCE(1, "arm-smmu-v3: failed to allocate cmdq_batch, falling back to full CD invalidation\n");
> +		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd_all);
> +		return;
> +	}
> +
> +	arm_smmu_cmdq_batch_init(smmu, cmds, &cmd);
>  	for (i = 0; i < master->num_streams; i++) {
>  		cmd.cfgi.sid = master->streams[i].id;
> -		arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +		arm_smmu_cmdq_batch_add(smmu, cmds, &cmd);
>  	}
>  
> -	arm_smmu_cmdq_batch_submit(smmu, &cmds);
> +	arm_smmu_cmdq_batch_submit(smmu, cmds);
> +	kfree(cmds);
>  }
>  
>  static void arm_smmu_write_cd_l1_desc(struct arm_smmu_cdtab_l1 *dst,
> @@ -2225,31 +2235,37 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
>  				   ioasid_t ssid)
>  {
> -	int i;
> +	int i, ret;
>  	struct arm_smmu_cmdq_ent cmd;
> -	struct arm_smmu_cmdq_batch cmds;
> +	struct arm_smmu_cmdq_batch *cmds;
>  
>  	arm_smmu_atc_inv_to_cmd(ssid, 0, 0, &cmd);
>  
> -	arm_smmu_cmdq_batch_init(master->smmu, &cmds, &cmd);
> +	cmds = kmalloc_obj(*cmds);
> +	if (!cmds)
> +		return -ENOMEM;
> +
> +	arm_smmu_cmdq_batch_init(master->smmu, cmds, &cmd);
>  	for (i = 0; i < master->num_streams; i++) {
>  		cmd.atc.sid = master->streams[i].id;
> -		arm_smmu_cmdq_batch_add(master->smmu, &cmds, &cmd);
> +		arm_smmu_cmdq_batch_add(master->smmu, cmds, &cmd);
>  	}
>  
> -	return arm_smmu_cmdq_batch_submit(master->smmu, &cmds);
> +	ret = arm_smmu_cmdq_batch_submit(master->smmu, cmds);
> +	kfree(cmds);
> +	return ret;
>  }
>  
>  int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  			    unsigned long iova, size_t size)
>  {
>  	struct arm_smmu_master_domain *master_domain;
> -	int i;
> +	int i, ret;
>  	unsigned long flags;
>  	struct arm_smmu_cmdq_ent cmd = {
>  		.opcode = CMDQ_OP_ATC_INV,
>  	};
> -	struct arm_smmu_cmdq_batch cmds;
> +	struct arm_smmu_cmdq_batch *cmds;
>  
>  	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
>  		return 0;
> @@ -2271,7 +2287,11 @@ int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  	if (!atomic_read(&smmu_domain->nr_ats_masters))
>  		return 0;
>  
> -	arm_smmu_cmdq_batch_init(smmu_domain->smmu, &cmds, &cmd);
> +	cmds = kmalloc_obj(*cmds);
> +	if (!cmds)
> +		return -ENOMEM;
> +
> +	arm_smmu_cmdq_batch_init(smmu_domain->smmu, cmds, &cmd);
>  
>  	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>  	list_for_each_entry(master_domain, &smmu_domain->devices,
> @@ -2294,12 +2314,14 @@ int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  
>  		for (i = 0; i < master->num_streams; i++) {
>  			cmd.atc.sid = master->streams[i].id;
> -			arm_smmu_cmdq_batch_add(smmu_domain->smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_batch_add(smmu_domain->smmu, cmds, &cmd);
>  		}
>  	}
>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>  
> -	return arm_smmu_cmdq_batch_submit(smmu_domain->smmu, &cmds);
> +	ret = arm_smmu_cmdq_batch_submit(smmu_domain->smmu, cmds);
> +	kfree(cmds);
> +	return ret;
>  }
>  
>  /* IO_PGTABLE API */
> @@ -2334,7 +2356,7 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	unsigned long end = iova + size, num_pages = 0, tg = 0;
>  	size_t inv_range = granule;
> -	struct arm_smmu_cmdq_batch cmds;
> +	struct arm_smmu_cmdq_batch *cmds;
>  
>  	if (!size)
>  		return;
> @@ -2362,7 +2384,14 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
>  			num_pages++;
>  	}
>  
> -	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
> +	cmds = kmalloc_obj(*cmds);
> +	if (!cmds) {
> +		WARN_ONCE(1, "arm-smmu-v3: failed to allocate cmdq_batch, falling back to full TLB invalidation\n");
> +		arm_smmu_tlb_inv_context(smmu_domain);
> +		return;
> +	}
> +
> +	arm_smmu_cmdq_batch_init(smmu, cmds, cmd);
>  
>  	while (iova < end) {
>  		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> @@ -2391,10 +2420,11 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
>  		}
>  
>  		cmd->tlbi.addr = iova;
> -		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
> +		arm_smmu_cmdq_batch_add(smmu, cmds, cmd);
>  		iova += inv_range;
>  	}
> -	arm_smmu_cmdq_batch_submit(smmu, &cmds);
> +	arm_smmu_cmdq_batch_submit(smmu, cmds);
> +	kfree(cmds);
>  }
>  
>  static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
> -- 
> 2.48.1
> 
> 

