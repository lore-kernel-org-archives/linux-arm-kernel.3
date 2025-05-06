Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C8C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np31GT5x8wgm7/sKQHFUJ4Rm2JmmDAX9KCDSS5Rzjf4=; b=q5+LU+M9NFoHXfdYPea6DbzxqP
	2SWoJ3USpjJUGeQCR4r2SqcWvQSjopypTZgKfM0OjHYTXmusDdimz8VwqT9VMdlW9lHjxmFTF+Pmn
	2FoJ3FbySVNN8ATTr2j8Yldcm7WfEhcGDlBgAVPSWLohDzhME42zRo6/+rEQRvmR/Z247Nxyq9bKk
	rjOZFzGIiMCoKLOJrK2TFBtUFHsMPhcU8d+AzohcsSpK/AR9JQXl/9cr/Ft14YiHiKoZFaGkQN8U7
	E9X2JkTxZNFn8NwMYVZ7ZEQboq6We7VXhANx8+H2GNJqDLdH8W7Tp+p7UvHOX1AlGVNTUb6w6Yt/k
	2xGI57Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH6J-0000000Bqnq-0vOa;
	Tue, 06 May 2025 12:08:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFFg-0000000BWSa-3R9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:10:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso36395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746526214; x=1747131014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Np31GT5x8wgm7/sKQHFUJ4Rm2JmmDAX9KCDSS5Rzjf4=;
        b=NNVf/dfGlSRPFBKLd7l7loCh39c0YHpaK6Sh1lmhp2HAyHFzEQx5ssxzmwMBDUo2cj
         4bQwB4M/pZcbPFABO/tU9N4SBaSddo0RItaWfNO6ZFZZa/Dyl8UaVQawRaPSSnS5SiTC
         zl0q8xOIKZMdY79mhhZLcycpWb4yv/ALu/v0bUUHuD3BiQRuLrg6P65T25x/YNUfCdby
         DAegmtUZ83MDRRqeDTu2SlMi4J92+y+cPNaIk38cI2ftPhik/zNmfS4cGTiXIq9wt021
         TBLZV659fnUv7O5LUlplKRbT6C657avBjsVmNxHaD7no8c1/WdMuPjieDp1E/ArzeXS8
         rgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526214; x=1747131014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np31GT5x8wgm7/sKQHFUJ4Rm2JmmDAX9KCDSS5Rzjf4=;
        b=Srw5JHXB09EcxLDYoIFGPIw5n8WevOQInn5VvyBtezXQi5iAo+0VlBVYkIKBEOQjlU
         WbzhUTDL3w87X+awAlgZGzGj4B2b44EiyYqc9Xg7t4eOlWInofO/q+7scAEYV22/Cw2g
         2Mran4KxQg2gl3xHHSrU81vxJQXnPO36XRKd/pLVc06WTatHaCGCIpPhD91Tht4ogQ8n
         uteJm0XP/NRuctv4nWRbx2t5u3wa7JF+zPUgdA/g4WeF1eTpShO+dqh1Z37nXmg6gwej
         MLdSunuETnEOAghAcqwyQQsW5oujrtGNnK9KIg2dFKEGFImQMN3QLA2XaciAqP9EvT0f
         xQdA==
X-Forwarded-Encrypted: i=1; AJvYcCWiL/oOg6NX63FBjUHqqAMwoW5/Ifj+jS3E6DKW3zkbWeCJQG4aon+nbW7Etqa5OhE+49IkqNd/RKkD4S650w1h@lists.infradead.org
X-Gm-Message-State: AOJu0YxNijms3Hhpexcjc3UHwr8Bj3EZVqlCsKgHqPZLozt0c/6sBup0
	0GVUxMa7El///GWqVf5o8m1fU4vI5hN4a7n76kKfpvVl5p/Lj+1xxyMOM314rA==
X-Gm-Gg: ASbGncsl/38V6dv8DuhnwaVjE9UohTM8DxATzm1Dpw660j9xMMQAWoylTSIRE1569ar
	Qbz1O+ZK55fn5EF/8x7m3AwKjIJBYKTdm2wm4Y5b0cWQn1xYaRZ487gvXftWutvX89VLPa5Zuya
	vSXJ8aH6qKYnlVRzZeYV8eAc1gUP3VUcnNzi2YNSQ3wGVg4xFbMDVWOKLAmFX34W7eRNHUGpotP
	NSpgcOYl7Pwf0fFFa/By22CShoBkd5J6slb7cQfe9QyQv54tgSzzM93zUqd+4Am5sprdfMOShR9
	+6kRd2GAkEeVTE2BpacA+Xk6bY1ycnjP5C5rbjC4EywGCf0D57Hv/NmwD1P6JNI6LcZFOmAvonO
	8WT1+Zg==
X-Google-Smtp-Source: AGHT+IGtRPKB/+Q9Ge4udRxLhd2o6sZguJW0tmzy+145XL5MDm4emH9nCDY7KueOSoFmJsSuDoU+rg==
X-Received: by 2002:a05:600c:2111:b0:43b:c396:7405 with SMTP id 5b1f17b1804b1-441d123f7cdmr702955e9.7.1746526214349;
        Tue, 06 May 2025 03:10:14 -0700 (PDT)
Received: from google.com (207.57.78.34.bc.googleusercontent.com. [34.78.57.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20a70sm211382205e9.31.2025.05.06.03.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:10:13 -0700 (PDT)
Date: Tue, 6 May 2025 10:10:08 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Per Larsen <perl@immunant.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	james.morse@arm.com, jean-philippe@linaro.org,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	qwandor@google.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com,
	armellel@google.com, arve@android.com, ahomescu@google.com,
	Per Larsen <perlarsen@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Message-ID: <aBngABDE-wtpM9o6@google.com>
References: <20250502092108.3224341-1-perl@immunant.com>
 <20250502092108.3224341-2-perl@immunant.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502092108.3224341-2-perl@immunant.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031016_879519_7DBC92B9 
X-CRM114-Status: GOOD (  28.34  )
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

On Fri, May 02, 2025 at 02:21:06AM -0700, Per Larsen wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A implementations with the same major version must interoperate with
> earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
> broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not

The wording here is a bit hard to follow. Why don't we re-write to
something as simple as:

"Prevent the host from re-negotiating a smaller version with the
hypervisor. Once the hypervisor negotiates a version, that should
remain locked in. Fix the current behaviour by returning NOT_SUPPORTED
to avoid the FF-A ineroperability rules with ealier minor versions which
allows the host version to downgrade."

> backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> 
> If we return the negotiated hypervisor version when the host requests a
> lesser minor version, the host will rely on the FF-A interoperability
> rules. Since the hypervisor does not currently have the necessary
> compatibility paths (e.g. to handle breaking changes to the SMC calling
> convention), return NOT_SUPPORTED.



> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> Signed-off-by: Per Larsen <perl@immunant.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 3369dd0c4009..10e88207b78e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,
>  
>  	hyp_spin_lock(&version_lock);
>  	if (has_version_negotiated) {
> -		res->a0 = hyp_ffa_version;
> +		/*
> +		 * FF-A implementations with the same major version must
> +		 * interoperate with earlier minor versions per DEN0077A 1.2
> +		 * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
> +		 * structures and 1.2 relies on SMCCC 1.2 is not backwards
> +		 * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> +		 *
> +		 * If we return the negotiated hypervisor version when the host
> +		 * requests a lesser minor version, the host will rely on the
> +		 * aforementioned FF-A interoperability rules. Since the
> +		 * hypervisor does not currently have the necessary compatibility
> +		 * paths (e.g. to paper over the above-mentioned calling
> +		 * convention changes), return NOT_SUPPORTED.
> +		 */

I would drop this comment as the commit message should be pretty
descriptive.

> +		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
> +			res->a0 = FFA_RET_NOT_SUPPORTED;
> +		else
> +			res->a0 = hyp_ffa_version;
>  		goto unlock;
>  	}
>  
> -- 
> 2.49.0
> 

Thanks,
Seb

