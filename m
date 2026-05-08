Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0BDCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TI/RPl3Hg34kw3CTOvuA/w8S/bd5TVv8Y9GL2bltAt8=; b=HKjI/2FmHF/57vgW6bPg2Bfq7U
	Lm+LexDEfj5ENfbNFahNXS1mOtjjuWwlbWKx5Z5eXYfVn6enQuxgv6iNO9R+shjl4a47SVd34Ouv6
	e6a1IRnphTu79hR00CuEkdUcYGmmgX3sVHSG2R6Q/TwldNFQ1cUfyErlB2yjrpbnNLh0QUnGqaL1a
	AG1a3xg1hE/X3E+h+TfaVPcNsoHopI8B/CQv63ia4l4KrMObf8nb9ZFLx2OsiOJDs41vqUpaptlqx
	baYiz75NzFxq3G/Ooa8YWcOdf8ctJGiAj0ZVNI3Mu/RkXCuvlQWUafba0+OZJTK/9Wlhuhs/gUe80
	zfaoWK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGYb-00000005zts-16e2;
	Fri, 08 May 2026 08:27:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGYY-00000005zsr-1iTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:27:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so58255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778228853; x=1778833653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TI/RPl3Hg34kw3CTOvuA/w8S/bd5TVv8Y9GL2bltAt8=;
        b=Yi5rXNgpf8ERfRrI0TIcXcu4zwmuik41WGln3hE25DmlI14g5I/e9CF3JQGj8EbYC/
         vnqGt7F8GnkaMA+1JYqwPnRqLa6PoQ0drBonogu2QWV+K/AvhCpZz+wKw6rYWPnSf6q2
         n/ry2oPpoBPPApTyMI25Z0WAgDYQHoWaxxQF467VqnOy2o8J6pNQXwgCHcqlaSe8rkae
         g3pHPYnL/Cutoj0hQB4vBYAUqYAQP+65+WdFBzTCTaRtJJscXYqprHwRvuoHpGvfZQfz
         rtGyjK27W9N1nT0p505w8Yi2FjavParNNmiGiU9tOsflqOYufv8rBraZJ2+0l1RL9KiF
         V2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228853; x=1778833653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI/RPl3Hg34kw3CTOvuA/w8S/bd5TVv8Y9GL2bltAt8=;
        b=N0uVb/XMtijqcqH81UDEoJa0Ul4l5JkVminThdE+MZjtGU0HHLuIrOXT3fhFaFWCog
         CTCzihgrIxxoNXle65XLq7yzq6bshQe3n2WgqwhAu4M6b/HZSfrABAseplRX+gbv+Se4
         88UHbKX9Y8dVqRtzA7za4kFZDswWCm7nKBMdac/Ro7PRyJRzHXN07XIhMOYVT3Dw3MeD
         QxMMp1xLbgYTj+anHxRs/hHdTCc++UgEpk/q8Hphstj+NsJHvwDF1CsDWsNrgxB61e1+
         R+dXlSPJWaBp8mESjicZXiUdETkb6fQgGiWLmhI9b97f/CBSjlYoF2TvfxrL2mLL92Gr
         mlcw==
X-Forwarded-Encrypted: i=1; AFNElJ8Tp/P356RpuedlRjhMbCHW1x1Je8nLIpnbgrAWTTlOJxoLtbCYdFFIhf3Vgyi6xtN5mZ/4+EG1vx6DgDvV3oh0@lists.infradead.org
X-Gm-Message-State: AOJu0YwsiABc3z2gXrmExEznPL+YmdXpFTjM+xlkqvKRk4mCQ+/Pb03k
	BT62avBirRMdqHXd4lA05DoptZRLuxTw4VVfrc8IcmT3/VBlS01Q1gF2zak6M/79jJIWHyDPxUb
	LiEr11Q==
X-Gm-Gg: Acq92OF3aUNTz/y7IoCxKQ/55hrKCz7P7eP5ORoCULIjwqo9D54UxngC6jfLRB2o39f
	/+2VME+DFlPf3Is9qlegm2c+n8DnWnnuxeVn1figFsF9l5S3LS5+VGPTSL0Xtj+bMHXmxU329kI
	Knoc3s9QI/7DMxLYs2iaSg4Cn278jCcKWZwI/6gAxswrP97nUWxcyUZqupZ4yuqa1CJtdwYyhc4
	r1yCDgiqj/W7cBd/W9824d6oQlV1Vkuyyf6WmTDj18PqJkQqgJH9lwestcfvg2vEo7VBVYNIWEB
	tCISqTuMfdveNGglyywJOj2NiiDIrnYOcwOwIyOulI392kkodT936PYVxihzcVY/ONUSl751YLj
	zJYpPLxlD7RcvirqHNXbrLFHxXmQ7nMXd8v+qlYXcqLROxkHJukz7Mt3cOkzCpLJ4Pn5GbNXwxn
	SBP77lcSAFple678JRPX21Zobr9xpQjW7gZEb3TKRFZeyZjXM6XGIs6U/807scFIqfHuON
X-Received: by 2002:a17:903:94d:b0:2ba:3b89:c3a5 with SMTP id d9443c01a7336-2bae9e68555mr3019705ad.12.1778228852902;
        Fri, 08 May 2026 01:27:32 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm14480765ad.71.2026.05.08.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:27:32 -0700 (PDT)
Date: Fri, 8 May 2026 08:27:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 submission functions
Message-ID: <af2ebtfgOPzJMXFK@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_012734_454252_09C341EE 
X-CRM114-Status: GOOD (  17.10  )
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

On Fri, May 01, 2026 at 11:29:12AM -0300, Jason Gunthorpe wrote:
> Continue removing struct arm_smmu_cmdq_ent in favour of the HW based
> struct arm_smmu_cmd. Switch the lower level issue commands to work on
> the native struct by lifting arm_smmu_cmdq_build_cmd() into all the
> callers.
> 
> Following patches will revise each of the arm_smmu_cmdq_build_cmd()
> call sites to replace it with the HW struct.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 53 ++++++++++++---------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 

[----- >8 ------]

>  /* Should be installed after arm_smmu_install_ste_for_dev() */
> @@ -4823,7 +4826,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  	u32 reg, enables;
> -	struct arm_smmu_cmdq_ent cmd;
> +	struct arm_smmu_cmdq_ent ent;

This shouldn't be uninitialized, we only seem to be setting ent.opcode
later in the function. Since arm_smmu_cmdq_build_cmd reads other fields
of ent to build the cmd, we are potentially sending stack garbage in ent

At all other places we're correctly initializing ent. So, I believe only
in device_reset we must change it to struct arm_smmu_cmdq_ent ent = {};

> +	struct arm_smmu_cmd cmd;
>  
>  	/* Clear CR0 and sync (disables SMMU and queue processing) */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
> @@ -4870,16 +4874,19 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* Invalidate any cached configuration */
> -	cmd.opcode = CMDQ_OP_CFGI_ALL;
> +	ent.opcode = CMDQ_OP_CFGI_ALL;
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Invalidate any stale TLB entries */
>  	if (smmu->features & ARM_SMMU_FEAT_HYP) {
> -		cmd.opcode = CMDQ_OP_TLBI_EL2_ALL;
> +		ent.opcode = CMDQ_OP_TLBI_EL2_ALL;
> +		arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  	}
>  
> -	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> +	ent.opcode = CMDQ_OP_TLBI_NSNH_ALL;
> +	arm_smmu_cmdq_build_cmd(cmd.data, &ent);
>  	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  
>  	/* Event queue */

With ent initialization in device_reset addressed. 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

