Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB8EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY5IloWsNQwsLIRSq+Jk0RbLuNAFATBZvlKueff9YnQ=; b=tMEC9wS4AuyoWSe9giiqDt+s3l
	fGfIzJM4B2Ptw8YHuXID8nEWbHfY5BBOhOC1Yi9YBa3Ajs8kV8zdS2A90b9vJy4XXAQImqDJoqbtt
	Z1kmbuyiuVh7s0yJ9TzezpViEkt1WwdvissDwJG6QTd8PGuThu8o45HQkW1EbQiEpWKe6MGe6wpLK
	1Bdx5ILIzVyR2vEXeZkJb6PhlYQFLrX8ID0SmCzKENsdJnVS+xYXoSUx8sRQWjz5t3pwEcnsxedk7
	zwFx66q86pb8YQmt6V2PYHELM62y6tqAbpJN1mLI4tAImSBeH2AiYhETSXvIIqUP7Q6ajugxDh5kq
	4QWgN4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlCH-00000005G5f-0Xvc;
	Fri, 01 Aug 2025 08:33:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkuQ-00000005DqQ-3JWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:14:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24070ef9e2eso119555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754036073; x=1754640873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vY5IloWsNQwsLIRSq+Jk0RbLuNAFATBZvlKueff9YnQ=;
        b=VgxUrKlD7CMvCO2gqqzdEFrasnsUn50kthBaf3biWVqNKYBY41D1nqOL1H+DeYfxXj
         zlJGBPPBga1xIg/YMoD0x+kxyjS6ziOsL2JsEDC69AfmtjO46vzhrhurE60ELExgeLxH
         ErsUDkv6HjU5fOxgYUY+neSs45+/95v4eVMdfyY9j3yFLhS6FSUd+wdrHP1X6X33XbDe
         O376opFG0lSkwUEwCipQMCU+ou6BgIYbn29hRXeY/lGQSu6vf+uAsC5iy6xj8mLZaCkW
         hxhmjqIt48ujTcicHeaBNPqRVEglwCVSJg3uAshowq3r2XIMLcVXWmWOqtoikmembnnP
         Zppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036073; x=1754640873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vY5IloWsNQwsLIRSq+Jk0RbLuNAFATBZvlKueff9YnQ=;
        b=uGO/As7IovpsIRlJdjGcSUDi6ErBlCTnQsaY3ukVyTwHoLNlx9AR9qHUVTeyRqQUCX
         8wJXlbO3X8Bw/SbyuzXqRPCsDl9NRi/tT2X1PlaDfYhxtSWRU3TL/otdAiVXflrHpX8N
         crCdfmVohlu3Pka1FLDt9IcTUXbl6y0xrQBJ1V/vaFEZ9ZjcyCnFZV0Ma31had2ezlsB
         LTCd+/tqEq3MfbwxmViu9WQFwlZ6v4mzEqkzp9yKVgLJ2U7Bf5dghXrDFd9UuwUN3Nqa
         ZCzapquQZWDjDH7MHparXyKdqi1yRYqNVqBMQ9sJcwo0RUgpOr1Z4xjwhcMbX2crwjLw
         hgjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKKDlqtUZID33a9n5YaOfgoTunEfsq3DErKEExeYy/W1IgK6UBbwq/g7sXQp3ZEvEZSFmLQ9/sVCmyBntCsyJm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp97CRW5K0AZzAlkruoAt6wXF9K0dHPLqa/lTPCQJv9ewPB7oV
	yBD4ru0OiE1oMh9GNz2Efd+tN+q1VsLQNr38MGbAzckvP5DypWoIvqLSbRdBR4FDdA==
X-Gm-Gg: ASbGncty4TOcNejR6MrMC48L+ZTP+m2Wym/ZDN01mlxzy6HrsiDwZnNuEEQXQMtGCL5
	suTC11zdzvr6YoYtJzeNZF2aVzxIzDeHL7+QHSQMt+6JDdHj0pPjpCglo9+M6o4bVjO7zriPLR7
	+Ks+kPMzA2wqu3LUkGcWouWAnOl2YWScWbXIqdCZqikc4DZi3z5mJdYA8pdeSPYkymiYAL3KwKa
	S7BHl112QUSy53zasgz4b9W1V2hWnGNTjcbpiU83SZd7AFLtAZOtI1nHlkGZFkYQAlyUvpudfIs
	C4RjYmSTTgKgsgO3wTJ7CwkwiGY2CBWcL3pmx87KrV4m+tcVVcaC5obbYz6IY3k1jeu+gk3UN1q
	oSR/9PDAUb0u/hDDLnKbSQOSF1pjaqj/qcbjS9v/6tBRnzoqeFh5444FC
X-Google-Smtp-Source: AGHT+IGXJ0oDUg8x3lalK0qa+IS9YcsVUdYwosMrUSgYdRWE/44m5WMnRi51aRiN1cRnb1G5Gn4Zxw==
X-Received: by 2002:a17:902:d490:b0:240:48f4:40fd with SMTP id d9443c01a7336-2422a435a05mr2506505ad.19.1754036073034;
        Fri, 01 Aug 2025 01:14:33 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1efe8sm36422045ad.69.2025.08.01.01.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:14:32 -0700 (PDT)
Date: Fri, 1 Aug 2025 08:14:27 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Fix smmu_domain->nr_ats_masters
 decrement
Message-ID: <aIx3Y3qIstTceTC0@google.com>
References: <20250801030127.2006979-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801030127.2006979-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_011434_835445_147A7B7D 
X-CRM114-Status: GOOD (  23.11  )
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

On Thu, Jul 31, 2025 at 08:01:27PM -0700, Nicolin Chen wrote:
> The arm_smmu_attach_commit() updates master->ats_enabled before calling
> arm_smmu_remove_master_domain() that is supposed to clean up everything
> in the old domain, including the old domain's nr_ats_masters. So, it is
> supposed to use the old ats_enabled state of the device, not an updated
> state.
> 
> This isn't a problem if switching between two domains where:
>  - old ats_enabled = false; new ats_enabled = false
>  - old ats_enabled = true;  new ats_enabled = true
> but can fail cases where:
>  - old ats_enabled = false; new ats_enabled = true
>    (old domain should keep the counter but incorrectly decreased it)
>  - old ats_enabled = true;  new ats_enabled = false
>    (old domain needed to decrease the counter but incorrectly missed it)
> 
> Update master->ats_enabled after arm_smmu_remove_master_domain() to fix
> this.
> 
> Fixes: 7497f4211f4f ("iommu/arm-smmu-v3: Make changing domains be hitless for ATS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

arm_smmu_remove_master_domain() needs to see the old ats_enabled state
for the cleanup.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 312bc31d7e8eb..3c81139faecae 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2997,9 +2997,9 @@ void arm_smmu_attach_commit(struct arm_smmu_attach_state *state)
>  		/* ATS is being switched off, invalidate the entire ATC */
>  		arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
>  	}
> -	master->ats_enabled = state->ats_enabled;
>  
>  	arm_smmu_remove_master_domain(master, state->old_domain, state->ssid);
> +	master->ats_enabled = state->ats_enabled;
>  }
>  
>  static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> -- 
> 2.43.0
> 
> 

