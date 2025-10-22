Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19150CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMy1RVx5Qy0vPfZy8HmPzaiGS+prOdh9j7/eJWslVtk=; b=MfkO76lYkoy9RdUMg3yWZAMvCG
	y6pQaWpCLGt8i+OvV1kVIOKiSrcu+nRpd55Z9lYUPJCUBa3mSPWnAl043+va5qchaBUgwk/Ose80P
	EzYpsnIoGy2/ZPi8M+5Lyj4lsh4Q+Y1NbRaMWRE2McRTm8iC81KxMr2pEZLXcj4TaI2OIgtKGq+uS
	609CFdpQZ0u8n2DYe9Ua/NJD6Vl7Pg+mkMaFpjLjCF3ExVUh6/BElYR9F3UDblqM7D8JyCIkmogED
	1YneCuin3EZ9Y5lVU0XFx2FEckRJH82fr3iuP5Fe+JTkOhSXynblYet22mqf+2Bh0L7p1xG2uXC7/
	JJj+Rr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRNK-00000001X0a-1vzN;
	Wed, 22 Oct 2025 05:27:06 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRNH-00000001X0E-4AjM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 05:27:05 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b62e55af64aso214445a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 22:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761110823; x=1761715623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMy1RVx5Qy0vPfZy8HmPzaiGS+prOdh9j7/eJWslVtk=;
        b=K6f0QLk25Q2Wa5BSdb2uyiFWVGPBhNtR/TwgWxE64GshT9Ip56OJUzgrBNX3XK0Ky9
         pHb/1Mznjkl5x3Eob6orby/8WpODYWN8yQvZwrjOSQ29XXt2C3ZXxwa8jWbGvr3ztyib
         zu9cmm20KBZOBrNKDZcOb7i4oup4IEWCjeQr9A81KjIrL06p1hGXm4POZSf0xSNgQMtT
         dvZv5PcgZYbXB9M4LggqR963TbhF5T2T2YY4uzUiFcILB4KtTkVY6KTd+q2WlJYNQvo/
         cJ7FGhG1LdpwhWkSdkpi5lOPHBzVwWyYLXb4b+zn0NUZwp08D7fTd3XsHCSRQfc+lXo2
         pxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761110823; x=1761715623;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMy1RVx5Qy0vPfZy8HmPzaiGS+prOdh9j7/eJWslVtk=;
        b=ZuYloGe87Nc+RHEBLuDrkj7ZR14ySXTUCII3j/5Xmx2j6PxMBHtZSO3DRp+02Isb94
         3KKTjk9QM8s93z0stsO6NyXHreMqcqqt/SNbIw8KVq1jpJy7xDwqNfc3zgIOUpXbs8M4
         TClYqEhwBGyt7vixEiuLsRiXOXRyDuIp4Svp6iTP68GuyuxizFI+g1HJturP8wBln75Q
         AQKHadRLSKB9bWiquymZWdyJ8imZsyk/95Sr1w6IMyto72FmpZcYPv2zm7JuJW7W9HiD
         aoKECv1sHZaj646LFCwAu6Ias41A9hkcTq2okndhSFPy7jjvksvi7pFVbrZMqtt571cg
         u4SA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Xkmt4Anxp6cOoV4sEFVcJ+CpuPKYsfSOHYzuemwqn524F20a1Hk785lrHKjZspy1cDSTcQ8Yml0J6k3NUP5+@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqIOom8phFTLRHephoOREP+TDTHziKXzCDZXxBzoT+OLzcmaF
	/cugpvY8x4T1BpjuMooZay8PmOqsDtuYvqJ2VWfhG8OXaLTicXB6SbBF
X-Gm-Gg: ASbGnctlMXgK4ACiwFO1f2XsGQaMD3e18XiZhbhDp0tz1SP/U/7Nzqz5Nk41kiUSVcP
	g0yuadFIq7c7QYUH5wtDnIri0AsS9cFVKK6gGCoq/+i6kBfdctAU+6/6QIHlrT+QzJYO9YDMx7f
	6llpzABi6zjmsxY1WaY0jCKpyT/IfNmNkVGoPX85UQN8RtGJKcaHArfx7LfmIbMAOze6XsoJT/2
	6/Q1MLEdUYVSMUoQMvYLNWiJJNDi9l6qkDHgLb1hY9olFLhsB69O1NvfCshmLKS88UL7rYt+TbY
	FixuRuX36GRbxdIlWcFb/CHGn8+rqEkS8Zav+3V74ZV4wig+s5bnJj7hphKGv0cClUwbVq6KgHF
	q+5bgDMPtcnDu8ii6LK6nvo3ZAjDT0oY+TyrLxL2uWVD5j4/YC+uoLyNMav6w8yamfTcEpyh4fW
	7zabQSAaFcGTDpl+Rq
X-Google-Smtp-Source: AGHT+IGhGdOmH2B7aouX3Oqkd7p74ev3sL8pZK6NfUPz74y/pmwymDvftWw11uDanLvIHrYSspqiBA==
X-Received: by 2002:a05:6a00:23d6:b0:77e:543e:3f3d with SMTP id d2e1a72fcca58-7a2572e9cc8mr3676024b3a.5.1761110822910;
        Tue, 21 Oct 2025 22:27:02 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.181.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm13188175b3a.70.2025.10.21.22.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 22:27:02 -0700 (PDT)
Message-ID: <1ad9d43b-fd1f-4a66-b67b-14f0b3217aec@gmail.com>
Date: Wed, 22 Oct 2025 13:26:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses
 to IMPDEF regs
To: Liao Chang <liaochang1@huawei.com>, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com, mingo@kernel.org,
 bp@alien8.de, kees@kernel.org, arnd@arndb.de, fvdl@google.com,
 maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
 yeoreum.yun@arm.com, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io
References: <20251021115428.557084-1-liaochang1@huawei.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <20251021115428.557084-1-liaochang1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_222704_068771_E2809BD4 
X-CRM114-Status: GOOD (  23.67  )
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

On 2025/10/21 19:54, Liao Chang wrote:
> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
> regregisters and instructions without trapping to EL1/EL2. Since trap
> overhead will compromises benefits, and it's even worse in
> virtualization on CPU where certain IMPDEF registers and instructions
> are designed for EL0 performance use.
>
> More early discussion could be found from link below.
>
> Link: https://lore.kernel.org/all/24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com/
> Tested-by: Xinyu Zheng <zhengxinyu6@huawei.com>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
>  arch/arm64/kernel/cpufeature.c                  | 14 +++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 5a7a83c411e9..11ffa9f7b972 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -326,6 +326,15 @@
>  			See Documentation/arch/arm64/asymmetric-32bit.rst for more
>  			information.
>  
> +	no_trap_el0_impdef [Arm64,EARLY]
> +			Allow system-wide EL0 access to IMPDEF system registers
> +			and instructions without trapping to EL1/EL2.
> +			Since trap overhead compromises benefits, and it's even
> +			worse in virtualization on CPU where certain IMPDEF
> +			registers and instructions are designed for EL0
> +			performance use. This assumes the kernel adds the
> +			support for Armv8.8 extension FEAT_TIDCP1.
> +
>  	amd_iommu=	[HW,X86-64]
>  			Pass parameters to the AMD IOMMU driver in the system.
>  			Possible values are:
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index ef269a5a37e1..d12e35d799ee 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2459,9 +2459,21 @@ static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, in
>  }
>  #endif /* CONFIG_KVM */
>  
> +static bool no_trap_el0_impdef;
> +
> +static int __init parse_no_trap_el0_impdef(char *p)
> +{
> +	no_trap_el0_impdef = true;
> +	return 0;
> +}
> +early_param("no_trap_el0_impdef", parse_no_trap_el0_impdef);
> +
>  static void cpu_trap_el0_impdef(const struct arm64_cpu_capabilities *__unused)
>  {
> -	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
> +	if (no_trap_el0_impdef)
> +		sysreg_clear_set(sctlr_el1, SCTLR_EL1_TIDCP, 0);
> +	else
> +		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
An id override for TIDCP1 seems simpler rather than an early param, and consistent to how we disable other 
certain features through boot option like arm64.nosve or arm64.nompam. I see Catalin also suggested in that
way in [1],any reason we cannot do it in that way?

[1] https://lore.kernel.org/all/aHqamaqueuk18NyS@arm.com/

Thanks.
>  }
>  
>  static void cpu_enable_dit(const struct arm64_cpu_capabilities *__unused)

