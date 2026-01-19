Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6118DCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 06:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzEtYCi84yQH9JO79xyxedMMdape4n0UR2LMXPDOp28=; b=PjULGtEg6HX37gE/7VIUuF2Qum
	BoUubuT3fgaEI8TFjHa+Kqz/bY7idlXt1Bkupcb9xKb4Kl8D8zmj62MsxBtFbNPtuXxzbGVub6isI
	jGoWSZPb5k9hcjj9E7SVre7ZaFjK9OZwYnEkGi+bhNiDGmCttmZ3CweSsSKicxzTZEgpzlTi20DfO
	I/UERNjMV0Xego/fCh0kD8HXGhh7vfjkAKxh1EoxCImaUvuGDZusVP2tArp8I4epVtQvTEuZpKMij
	n6WhOOVuCkr2sEHGsyoECsJR77E0hIpH7XgpDQ/4uprlZVrCYukHTa54fF4imBZckMGr50/cnyqgA
	zeH3uCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhj7H-00000001R1m-39ye;
	Mon, 19 Jan 2026 06:51:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhj7F-00000001R1K-1VtT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 06:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768805516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzEtYCi84yQH9JO79xyxedMMdape4n0UR2LMXPDOp28=;
	b=fXHvfz3gmt20gGmhp0CbBehCQxjIF7glJKni5aeMpXdTpckuI1zGjDcpdGErapS390QxS+
	xm/KzhST8Ow8vXBu/Flwmf/RfpooxCsbw+Xy9gg3avZoSLCDicxjVJYsW7bXUjeL2wlUFA
	39FTtRcq3BGV0ob9kIDPaIBe1P6SthE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-tgPR5hCaN0yq0QXmAvxxUg-1; Mon, 19 Jan 2026 01:51:54 -0500
X-MC-Unique: tgPR5hCaN0yq0QXmAvxxUg-1
X-Mimecast-MFC-AGG-ID: tgPR5hCaN0yq0QXmAvxxUg_1768805514
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a8c465c1so30895195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 22:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768805514; x=1769410314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzEtYCi84yQH9JO79xyxedMMdape4n0UR2LMXPDOp28=;
        b=sDOW7d2ZCxneAAnemKyrNtCdfJ72BMHFP/zevK8BcIQaT4eDDn1//fFb/vnZYjLU+L
         3xJrwDjK2pHipIAs937K4SKaHpqcmD/zAHGbnlHETaV8CisKrfJC3YpLjy8NTLcMQY9n
         1yoWtNuSL8sZgKANqe0gRzPuQoX6NJyFqVHXSuviMMntzwejB/byzqHvwzevkKQNRT/c
         yihMB/25yu0ZgCf1PgGPbu5fgQ6x7CCmTo5Kp0GhwfAP3sl+4iQz4wFFl19aletd5jrU
         uejSQp+21NzXhjnOa6TpWesly/4BKCoUoIN/i6uukQzvRV9Ac7QSYeyo525WSV2ocsHx
         wtxw==
X-Forwarded-Encrypted: i=1; AJvYcCV/3gkFBxpiZOQ6NIyfzL0hMsxMc1JY4ywhEv/PQx1R6v1DAsOlwupWCbUVEv+AmebTDtuobxw6q+aoh27HrKCk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2FbS+0+8IpQYewJrrup+E6KoPX7ZNPTMc6k/e3wDGBecWcawE
	1Ge7mEjaROr1YPkRl+2/lHIJ0iiTAX2HjmNpG9fwZg7jsOWvgrEUZeEJO6mGIjVS9xeW6FsgVvW
	TUeobG1RXaOHTdHaMFhdMbOI7lfDVWT43AZ4SYUUNIKguieze0AWs0sppDXFRYVzLxIQmK/fpJ2
	Io
X-Gm-Gg: AZuq6aLXt0t478s1rLUA61ZCKc00SZGeUlSo8V6q0bAs4Qf2xMLl9fQmUTm5pMU/4Tb
	gcNgnm3+Wk20F1k49O7lwWm8xiPhXWqISDs11wLcyhJ27U0tCEy9SX06SUThpikcgo967ungYhZ
	mJusyW4HUXIEEW4DaM2tgVoIs/J26ExhGfkjwVpCdsjeTZFnwdgRnMzf72raWUOq3AjB6AZX2xl
	fqrLY56S0o3KcrjIdCw5nH3N7NGlvedC5UZ5h8H1d+7i/mkKDd5BHSmSBunlc5B3OJUoxQJCMja
	rReK5I5hcQrkh5TMBNd1+QulV+Fxw+ZVxjPYP5r+amqT/AuBLxKf97lPkH73W+edm+aqhHOJiyl
	qH2v/FZqt7Wk=
X-Received: by 2002:a17:902:e547:b0:299:daf0:e044 with SMTP id d9443c01a7336-2a7177daef5mr121119815ad.18.1768805513819;
        Sun, 18 Jan 2026 22:51:53 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:299:daf0:e044 with SMTP id d9443c01a7336-2a7177daef5mr121119555ad.18.1768805513371;
        Sun, 18 Jan 2026 22:51:53 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm85114355ad.38.2026.01.18.22.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 22:51:52 -0800 (PST)
Message-ID: <08172e9b-37d6-4e90-a5a9-b8a083a5a3c6@redhat.com>
Date: Mon, 19 Jan 2026 14:51:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/47] arm64: mpam: Initialise and context switch the
 MPAMSM_EL1 register
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-11-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-11-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O0FeBg0t5ykt5HHcR_3pXgdEcpEROAmzai-_2nKG2fM_1768805514
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_225157_476592_055EA4DD 
X-CRM114-Status: GOOD (  27.02  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> The MPAMSM_EL1 sets the MPAM labels, PMG and PARTID, for loads and stores
> generated by a shared SMCU. Disable the traps so the kernel can use it and
> set it to the same configuration as the per-EL cpu MPAM configuration.
> 
> If an SMCU is not shared with other cpus then it is implementation
> defined whether the configuration from MPAMSM_EL1 is used or that from
> the appropriate MPAMy_ELx. As we set the same, PMG_D and PARTID_D,
> configuration for MPAM0_EL1, MPAM1_EL1 and MPAMSM_EL1 the resulting
> configuration is the same regardless.
> 
> The range of valid configurations for the PARTID and PMG in MPAMSM_EL1 is
> not currently specified in Arm Architectural Reference Manual but the
> architect has confirmed that it is intended to be the same as that for the
> cpu configuration in the MPAMy_ELx registers.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> Mention PMG_D and PARTID_D specifically int he commit message
> Add paragraph in commit message on range of MPAMSM_EL1 fields
> ---
>   arch/arm64/include/asm/el2_setup.h | 3 ++-
>   arch/arm64/include/asm/mpam.h      | 2 ++
>   arch/arm64/kernel/cpufeature.c     | 2 ++
>   arch/arm64/kernel/mpam.c           | 3 +++
>   4 files changed, 9 insertions(+), 1 deletion(-)
> 

One nitpick below...

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index cacd20df1786..d37984c09799 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -504,7 +504,8 @@
>   	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
>   
>   .Linit_mpam_\@:
> -	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
> +	mov	x0, #MPAM2_EL2_EnMPAMSM_MASK
> +	msr_s	SYS_MPAM2_EL2, x0		// use the default partition,
>   						// and disable lower traps
>   	mrs_s	x0, SYS_MPAMIDR_EL1
>   	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@  // skip if no MPAMHCR reg
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index 14011e5970ce..7b3d3abad162 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -53,6 +53,8 @@ static inline void mpam_thread_switch(struct task_struct *tsk)
>   		return;
>   
>   	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	if (system_supports_sme())
> +		write_sysreg_s(regval & (MPAMSM_EL1_PARTID_D | MPAMSM_EL1_PMG_D), SYS_MPAMSM_EL1);
>   	isb();
>   
>   	/* Synchronising the EL0 write is left until the ERET to EL0 */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 0cdfb3728f43..2ede543b3eeb 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2491,6 +2491,8 @@ cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
>   		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>   
>   	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	if (system_supports_sme())
> +		write_sysreg_s(regval & (MPAMSM_EL1_PARTID_D | MPAMSM_EL1_PMG_D), SYS_MPAMSM_EL1);
>   	isb();
>   
>   	/* Synchronising the EL0 write is left until the ERET to EL0 */
> diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
> index dbe0a2d05abb..6ce4a36469ce 100644
> --- a/arch/arm64/kernel/mpam.c
> +++ b/arch/arm64/kernel/mpam.c
> @@ -28,6 +28,9 @@ static int mpam_pm_notifier(struct notifier_block *self,
>   		 */
>   		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>   		write_sysreg_s(regval, SYS_MPAM1_EL1);
> +		if (system_supports_sme())
> +			write_sysreg_s(regval & (MPAMSM_EL1_PARTID_D | MPAMSM_EL1_PMG_D),
> +				       SYS_MPAMSM_EL1);

{ } is missed here.

>   		isb();
>   
>   		write_sysreg_s(regval, SYS_MPAM0_EL1);

Thanks,
Gavin


