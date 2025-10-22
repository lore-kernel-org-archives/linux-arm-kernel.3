Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CC3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvcenKsgZMzYl+VycmeKBfTwKhJWtnezcECNx2hwtSg=; b=1oLFxtJV+3YQTbrzx/+XbvZ5i/
	Lbnmbk6gF+QK25pgBjZtr0mhiGj6rEfrWoeKOtQ7RZPGOlHlCMfAV3NwVDZ5rWQ49HscTybjLvzBD
	9XISgrZeSLZB+tgLVGB6IX5TCxxPUVW+nyFsokRCim+rb+cOXwnr67oXZrXx8bqmjvRZnwWHy26tM
	vsy2cAu+CQ2jkC++JViUXUREkNeiNAsikSVq+jj3GXxXCOBjFCIVXemnYmQ/FFCROMfeDJYRMvL1f
	Vwdl/dZ0Ul7C5BaQysSN6xTrd5UHz9GJj7pvU+pKqiBA1n6F0ML5L9lS2+yazciIZj0p82nf3bVqR
	ggxEtQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVsg-00000002RYj-486i;
	Wed, 22 Oct 2025 10:15:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVsc-00000002RXq-29Zn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:15:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-789b93e9971so673912b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761128142; x=1761732942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvcenKsgZMzYl+VycmeKBfTwKhJWtnezcECNx2hwtSg=;
        b=msVWGmLm0d/zuvpRraa31eNHMuD3bmg2EhAtlDQ7J41kBhHWshGPUC2xJuiMJUJLRl
         f2hT0wGwpCgI6lgn9EiLALlpwJMsF7b/RKNs6o4aQbawBM7R6+vuM0tcJrg1csGGHxyn
         R3VfdiH5woCnxuaUp5m1tnuuBYPRJS9Rdo6Uth73h8RO/WwupABd/dGT4dq/qmqVDWwu
         /g9TKMRV1Rluwa2dBs79VXkgOB/XRHh57Lnmjr4z6PD72Ibm+muV2eQTfc9WjQPt6Xuy
         u64nymwGgZ7vSORJQq9qKl2fvBrwiY1SoD0R/JbUGEx1fHNWczOghg1yNnK5NiJTNEH5
         5Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128142; x=1761732942;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvcenKsgZMzYl+VycmeKBfTwKhJWtnezcECNx2hwtSg=;
        b=FWVppGThG7lYNer06K0RBoiZQUZMXqSXJUxZ0KbKg7VpeiQcgTqbqMJWPABgZq7Zx+
         28DUjk+lBNPwrH6Vz+0HEezq2YU7Pjo7MQ53IlE+lb/ZAVfyZwXn2RjeL3HZO5voINYS
         n4aVmdR51SYfR8bKW3sjbq1vCUKraE/cUDhPcJWCJyM/08RnoxcQeN35R1AMT+6xPygN
         e1XBICxD8grsYuXyDy/2J6DOdRMucAIA6X81ULxwCgklFguSQ5IMRxSF78yS08KRlKae
         AGOoCMqMFvrn9W7XX0ZnIwOrbaoX4zAy2kZDlBmtDqHbLDS7d4xgAQ5rYT7MFyEi76+e
         ObZA==
X-Forwarded-Encrypted: i=1; AJvYcCVNb6bBDdw9vzbBI8QW3+BXr6VnIu5x4VnFn3yZSwztoMVZB+3SXawiJV3RWfgdVplYyZrLyH6Y4rt2ub/oehkC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx243Dk7b1TUTWoWXX9u9qdXbkSNsCpGSJfwBTJfr9cupfYju3h
	JGnwfKQgyvuK2LLmoR1Yu9VScoTBSsi2IChLQxZnmI4N6GnZsGZ4Fi/4
X-Gm-Gg: ASbGnctlJR7rziQxc36hZst7hQM03fYVguJHVLM3IC+JF31ahktvHQt7QEC/G5Oww4+
	TAlx1kkCLPUoX8YyJd76ydI/IX21UAnTXPfZ4OpdysTzL2I36if3icFf2bc0rkOgM1PEeHxbsMy
	wzlktRUVAfhbPOFKKhj/FrBibb+gAO0Zia0biPM8IXHyVF1ZkaC2TlD1hpNYAwGeTYInBPNMRTL
	egHOm0My2vzm4NA6NwQHZuSfqmPkXdTvecXr69F7A6/3dIcIzGA9Nx8OcGO2S/9/FHbenhBWcwu
	XriSX6ns3CjvF3+r004Pef+fWOc27+ISeMYsLspIPIk7LtyuTAT8OPbta8BGMQOi2A6z+DAc5gX
	ueye1qNJ8LLafIcQvr8I0wJ2HWtQHwRCz9VGVma9eYGJRQlP1H486j8AJxCvGpGwh1nSbyf/U2w
	Mv45V5lC4VWDTBQIjy5vSMmvmOdN4CSDxa
X-Google-Smtp-Source: AGHT+IFpnOvJJQR2OJ1DVFdDdw/vCuwAtRRJ5/FcdtkXTsQQy2/ztS8oGEFmref9mDQ9jgu8/MffSQ==
X-Received: by 2002:a17:903:234d:b0:290:8d7b:4041 with SMTP id d9443c01a7336-290cc7d4ac9mr124602835ad.10.1761128141590;
        Wed, 22 Oct 2025 03:15:41 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcdefsm134940515ad.16.2025.10.22.03.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:15:41 -0700 (PDT)
Message-ID: <9951e03a-06c8-4ca5-a585-f4d190550649@gmail.com>
Date: Wed, 22 Oct 2025 18:15:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses
 to IMPDEF regs
To: "Liao, Chang" <liaochang1@huawei.com>, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com, mingo@kernel.org,
 bp@alien8.de, kees@kernel.org, arnd@arndb.de, fvdl@google.com,
 maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
 yeoreum.yun@arm.com, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io
References: <20251021115428.557084-1-liaochang1@huawei.com>
 <1ad9d43b-fd1f-4a66-b67b-14f0b3217aec@gmail.com>
 <de4f09aa-3216-4ac5-8d76-899a685e05f5@huawei.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <de4f09aa-3216-4ac5-8d76-899a685e05f5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_031542_694032_E92D7C07 
X-CRM114-Status: GOOD (  21.37  )
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

On 2025/10/22 17:25, Liao, Chang wrote:
> Hi, Yicong
>
> 在 2025/10/22 13:26, Yicong Yang 写道:
>> On 2025/10/21 19:54, Liao Chang wrote:
>>> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
>>> regregisters and instructions without trapping to EL1/EL2. Since trap
>>> overhead will compromises benefits, and it's even worse in
>>> virtualization on CPU where certain IMPDEF registers and instructions
>>> are designed for EL0 performance use.
>>>
>>> More early discussion could be found from link below.
>>>
>>> Link: https://lore.kernel.org/all/24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com/
>>> Tested-by: Xinyu Zheng <zhengxinyu6@huawei.com>
>>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
>>>  arch/arm64/kernel/cpufeature.c                  | 14 +++++++++++++-
>>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index 5a7a83c411e9..11ffa9f7b972 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -326,6 +326,15 @@
>>>  			See Documentation/arch/arm64/asymmetric-32bit.rst for more
>>>  			information.
>>>  
>>> +	no_trap_el0_impdef [Arm64,EARLY]
>>> +			Allow system-wide EL0 access to IMPDEF system registers
>>> +			and instructions without trapping to EL1/EL2.
>>> +			Since trap overhead compromises benefits, and it's even
>>> +			worse in virtualization on CPU where certain IMPDEF
>>> +			registers and instructions are designed for EL0
>>> +			performance use. This assumes the kernel adds the
>>> +			support for Armv8.8 extension FEAT_TIDCP1.
>>> +
>>>  	amd_iommu=	[HW,X86-64]
>>>  			Pass parameters to the AMD IOMMU driver in the system.
>>>  			Possible values are:
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index ef269a5a37e1..d12e35d799ee 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -2459,9 +2459,21 @@ static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, in
>>>  }
>>>  #endif /* CONFIG_KVM */
>>>  
>>> +static bool no_trap_el0_impdef;
>>> +
>>> +static int __init parse_no_trap_el0_impdef(char *p)
>>> +{
>>> +	no_trap_el0_impdef = true;
>>> +	return 0;
>>> +}
>>> +early_param("no_trap_el0_impdef", parse_no_trap_el0_impdef);
>>> +
>>>  static void cpu_trap_el0_impdef(const struct arm64_cpu_capabilities *__unused)
>>>  {
>>> -	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
>>> +	if (no_trap_el0_impdef)
>>> +		sysreg_clear_set(sctlr_el1, SCTLR_EL1_TIDCP, 0);
>>> +	else
>>> +		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
>> An id override for TIDCP1 seems simpler rather than an early param, and consistent to how we disable other 
>> certain features through boot option like arm64.nosve or arm64.nompam. I see Catalin also suggested in that
>> way in [1],any reason we cannot do it in that way?
> Thanks for reminding me of that.
>
> But the problem is on warm reset, SCTLR_ELx.tidcp resets to an unknown value.
> This means using id_aa64mmfr1.tidcp1=0 override for TIDCP1 only skips setting
> SCTLR_ELx.TIDCP to 1, it still can not guarantee the SCTLR_Ex.TIDCP is cleared.

it seems impossible to me. the sctlr_elx is initialized to INIT_SCTLR_EL1_MMU_ON and other bits are set
according to the feature detected. sctlr_elx is saved/restored in cpu_do_{suspend,resume} in CPU
suspend/resume so it won't be changed. so sctlr_elx.tidcp1 will remain 0 if TIDCP1 is not detected by
id_aa64mmfr1.tidcp1.



