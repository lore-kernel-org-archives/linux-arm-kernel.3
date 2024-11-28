Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54392D70DE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iII7uuf9TZj9VNCNY4gdmMB2ol1JIZlZLSXfQuGrzNY=; b=vMEb3yJsGU0/kr0auOP8tBF8bt
	JZEWd99OYchXn2mEuptJBongGkYgShf1B+kPYMQv+HpQJEmI5I03Mj/5s/Axtpg+9DZ0cymzOzrvr
	wd7gfwlTVaP1YShMZuG+eYVvFRE/396sZCdf9incPj1pK6MOu24COSWqpDdyik9J+/IgUyofD3pYM
	9sr85/EkLujb2Xl/sCnacV9wM34qr2+lxnBpRF/jrrzFzKmUm6C2+0bvnBn9QoQ8SDj1s1r86i96x
	N8DtIPNAvqLOXxpNhTBK/cFFjWIHOBi5ftEvNt8uaxcrzWvjH+27LNPXJNhyxUPBIYUiAMMxCXi7J
	pI5vFM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhRx-0000000G0TZ-0Jxo;
	Thu, 28 Nov 2024 16:33:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGhQy-0000000G0Oo-0ylx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 16:32:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so1036976a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732811522; x=1733416322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iII7uuf9TZj9VNCNY4gdmMB2ol1JIZlZLSXfQuGrzNY=;
        b=AD2aZ6QB2DC51WaMwHZWsItXol3KWP0uNYM6DlyA+oCJ9EzMYAuaVqGGlEwLtvmK0u
         2tgnc/zMq3RhyfqkaRJThsIY62s8AwTBEa/XgDGgS4LvWlBcY0Bs+IHpZGAicy43D+3j
         iksEDSeug1AmaOPOrY9GD6gBS8O5nPPcIKxpnK3zhC2CpTp7YHFgV0cHNT81Qt6QngyY
         WdfDndgEygQju44BzVpI5IKaAuGys8NI+aMGc4jHnkOjl7L1MV8CdW47hL1DxepGS6zW
         kU+WzgmlDQXUlJGS3AXL1rWoj4q+qDEqds12GYuQyRaf+CZLD89b/cDoIMGs1jlTkh6p
         9EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732811522; x=1733416322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iII7uuf9TZj9VNCNY4gdmMB2ol1JIZlZLSXfQuGrzNY=;
        b=GxQczgHg41AOvZSRmFkEghXiRmb1fb8C4nXOlAToCNebPk/gYI609XXlB4epPcvQPM
         rG1BCT/h914901Oho8kpphywfIroUlmkipRQRtOtiFi1RyKAh+uy4LdOguP8a43Osqhl
         RMb+6ynOXgv/81tSNZ+Xdv8jzYx60D9Ggbcta7eyBzb7Z6DNKmTeS3IoFni6GE3U3rHm
         t6rHTN1Sif5hC8IB11jwvW1hyvTS9EeRv/chLoByCaqZ4HOrLQnFs8ZWV7+o+wZEODIT
         RBmMz2zdr1IV9rhdcPY5a9eAftmlMWzjzLe/ZmHv7dcZCkZw9UtOq2IxHtTNxP4GPgot
         WKug==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4IBzRxtWv6qR+eBoe994y8cfBoa9Aa6BSJ+bFEIeT4Olafkigbm0yJuIn9tOp1NnfQ4jgF1sYGt95O40Jupl@lists.infradead.org
X-Gm-Message-State: AOJu0YxpPuBctR9k7xnv0tWgydG8GKtJT7ImgeC1nEJ8xtGyk11F0b5s
	ziaa4pnukYdRj3S8bd6OaSxK8CNUVuwn05J5jCMrcPcZzQ7a7pOy2YhX2A7gyHU=
X-Gm-Gg: ASbGncvYtuTT9maXnGZGMsXeZPKf8S6oqTYREALHA+F3fI7PYOpg/XqBxCaL8okHrjJ
	60XbYJv4Tlrjv0yHN+p49gG3kGb0FGFjnxFLHMaA7Y9YtocrlhEbdkg1inbFw8az3yn0QBg28j3
	1wTmUkojMTnc1uFr9KLrLIDQs7ctzZ31TpR8S6SP1U9KZCKAJOyciDUaTOWvs46EuJqo4qPOmc6
	E2lfVF1LSTtsGy06i6kIDXkUpGNwE31EvGVaxibWEE7dCoPu3Kt/MDgynQX
X-Google-Smtp-Source: AGHT+IEueCSQe9pvckxqEsEWD3Nr65/94BTKV5/aVQ9y/9c4r7CKM/zYJ76EPGcECgL3+BEaIzTWmg==
X-Received: by 2002:a05:6402:401d:b0:5d0:840d:ed02 with SMTP id 4fb4d7f45d1cf-5d0950fb3d9mr4136529a12.4.1732811520883;
        Thu, 28 Nov 2024 08:32:00 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8dc66sm873841a12.71.2024.11.28.08.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 08:31:59 -0800 (PST)
Message-ID: <910320d4-4c72-4962-8d74-1963a74a0c27@linaro.org>
Date: Thu, 28 Nov 2024 16:31:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] KVM: arm64: Rework guest VM fixed feature
 handling and trapping in pKVM
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com,
 kristina.martsenko@arm.com
References: <20241128123515.1709777-1-tabba@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_083204_287630_B6EF75F8 
X-CRM114-Status: GOOD (  22.47  )
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



On 28/11/2024 12:35 pm, Fuad Tabba wrote:
> Changes from v2 (Marc):
> - Added three patches that remove the per-vcpu flags of PtrAuth
> and SVE being enabled for guests, in favor of them being per VM
> - Tidying up
> 
> This patch series redoes how fixed features for protected guests
> are specified in pKVM, as well as how trapping is handled based
> on the features available for the VM. It also fixes a couple of
> existing bugs in the process.
> 
> For protected VMs, some features should be trapped if the guest
> tries to use them because they are not supported (e.g., SME), or
> if they are not enabled for the particular VM (e.g., SVE).
> 
> Initially, pKVM took the approach of specifying these features
> using macros and grouping their handling by feature id register.
> This proved to be difficult to maintain and bug prone. Moreover,
> since the nested virt work there is a framework in KVM for
> storing feature id register values per vm, as well as how to
> handle traps based on these values.
> 
> This patch series uses the vm's feature id registers to track the
> supported features, a framework similar to nested virt to set the
> trap values, and removes the need to store cptr_el2 per vcpu in
> favor of setting its value when traps are activated, as VHE mode
> does.
> 
> The changes should not affect the behavior of non-protected VMs
> nor the behavior of VMs outside of protected mode in general.
> 
> This series is based on kvmarm/next (60ad25e14ab5), since it
> requires the patches from the series that fixes initialization of
> trap register values in pKVM [2].
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20241122110622.3010118-1-tabba@google.com/
> [2] https://lore.kernel.org/all/20241018074833.2563674-1-tabba@google.com/
> 
> Fuad Tabba (15):
>    KVM: arm64: Consolidate allowed and restricted VM feature checks
>    KVM: arm64: Group setting traps for protected VMs by control register
>    KVM: arm64: Move checking protected vcpu features to a separate
>      function
>    KVM: arm64: Use KVM extension checks for allowed protected VM
>      capabilities
>    KVM: arm64: Initialize feature id registers for protected VMs
>    KVM: arm64: Set protected VM traps based on its view of feature
>      registers
>    KVM: arm64: Rework specifying restricted features for protected VMs
>    KVM: arm64: Remove fixed_config.h header
>    KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
>    KVM: arm64: Calculate cptr_el2 traps on activating traps
>    KVM: arm64: Refactor kvm_reset_cptr_el2()
>    KVM: arm64: Fix the value of the CPTR_EL2 RES1 bitmask for nVHE
>    KVM: arm64: Remove PtrAuth guest vcpu flag
>    KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
>    KVM: arm64: Renumber remaining vcpu guest configuration flags
> 
>   arch/arm64/include/asm/kvm_arm.h              |   2 +-
>   arch/arm64/include/asm/kvm_emulate.h          |  23 +-
>   arch/arm64/include/asm/kvm_host.h             |  21 +-
>   arch/arm64/include/asm/kvm_pkvm.h             |  25 ++
>   arch/arm64/kvm/arm.c                          |  30 +-
>   arch/arm64/kvm/hyp/include/hyp/switch.h       |   2 +-
>   .../arm64/kvm/hyp/include/nvhe/fixed_config.h | 223 ----------
>   arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   5 +
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   2 +-
>   arch/arm64/kvm/hyp/nvhe/pkvm.c                | 335 +++++----------
>   arch/arm64/kvm/hyp/nvhe/setup.c               |   1 -
>   arch/arm64/kvm/hyp/nvhe/switch.c              |  56 ++-
>   arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 402 ++++++++++--------
>   arch/arm64/kvm/hyp/vhe/switch.c               |   2 +-
>   arch/arm64/kvm/reset.c                        |   6 +-
>   15 files changed, 430 insertions(+), 705 deletions(-)
>   delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> 
> 
> base-commit: 60ad25e14ab5a4e56c8bf7f7d6846eacb9cd53df


Tested-by: James Clark <james.clark@linaro.org>


