Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95FACA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8/ka+J/ZNQmE2G5JtUp2jlHYt7CIUXWsqK/1+vFYBc=; b=ubwkYFpQ0oAfLkXrRBlouLOMic
	pLFyFUuiyU/2XmJHREjgQFsV0Cnxfp0N6IuAz4qAWCyspoS/xnJBnEWH1+ksN+wYlE3ym7Bfr7wJc
	ejIDPZ3k0f2zgZQHTWo2IAFSF3hzAeoKFe+IFu7UF6oHNTbWXIeCalqr6BRQLmdJUbGzcffDoKx0n
	UaS1NTvVNN4mslt0g7v0fKDBrE+U7OAOYqR74tUJFHJAR6AsPwk8XKJTDKOE2rCQ6Fxal09atFGiE
	kmbtUrZc54bBgRmUmXMpT/3VAN7QLT9keKmq8dwg+idSS5icQnCdo+LkBNC4LxpYVQxaATQKuaMWb
	fuOUypWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwDv-00000006VTG-1Fte;
	Wed, 30 Sep 2026 15:27:59 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwDT-00000006VNn-3srz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:27:33 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e028ed54dso240089066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790782050; x=1791386850; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8/ka+J/ZNQmE2G5JtUp2jlHYt7CIUXWsqK/1+vFYBc=;
        b=DMXZo64nqd3+IxTWkuv2moO4fio9Td5QsX3T6wYGoi+sssQUQRAlbbmDAkQ56zIYEW
         plPZNFacm8a7usjiWE3uM3+nV5niQFfPoSp0p1muL23IXShxUeQ6CcjHmDjynUdBIQbt
         HUgER0Wao41D/Tk61/NPFDOAe7K646nsHaky2OPt2qo3ptEQaBnX/0N9ecG2Z8/AhCGs
         GWvTtqr5wBgU8cD7oA0qeFJ1k93E/2tBsVz0372kkHGhJZ5XAqqYjkTFvvY+RfoSFTzR
         cvky1Yx+x86vnLpmG/X2pGGHo7aEw2/ne4w1UOPz2MhNzPXM4uq0J2QFVxsyCXgW2A0V
         +y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782050; x=1791386850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8/ka+J/ZNQmE2G5JtUp2jlHYt7CIUXWsqK/1+vFYBc=;
        b=SoAMSRmsPR31dlhnm/P/wegEXzTo4j6Ra8x1WVzXt6r6TBnak/HFLi55ZIBlQRmcfZ
         cYQcAYdknLdiyYzBTkhGhzMRyT1wyguyrX6vs7KxhYsH2419rU5cRhov74303uysBkc0
         6jQlLQH7PtRItzY6aL9zBaqK2eIMbrPxjrHhOvKGgqeFpcI6YvRAXRwM/xc0WQ+XPqJO
         9iHOX83Z3hgDVM8uN/kMGARWquusMCGZHyl1sZzYwJ3VshA6WS9pSSFZSVNFa0FQIpqv
         b/nRZ4Yv17SeYk9d/LE0fMBu7pHlVffXucXQOHRNciYQY0FxXpshsfj27/4xhPL5rm1o
         0NsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQZEGuIUPIV/QF3Lxmb8I2U1Lb2MCzpj9fAArUtG/TPJQVmpsdp6wayOF+3SZPdp/jbEvK/ePRiu0Yu6TJSnSH@lists.infradead.org
X-Gm-Message-State: AFuF++mH/KcchlRIkeHcQwMgJU3fkz3YXNJWnvxMNNfXdsHfPgAEO+ur
	YZcbe611hA5TDOWiapOPy6/mTrvmziAr/QQhz+wRS1uQILzUZEeDVa63Pprp45OvNwI=
X-Gm-Gg: AYBFou0JoyU46jzpAGpDvmNrgWeZhrgj+OY1wp12v37q2z2mFqD0qDMqwV0LhtsaP3J
	7p8qBGuKYu8rX3oovQPl5Oqi88D6cOLM7FIJpQjdj3MYN5lnujIbN0jIWunm1h8hBo2X+2pcigB
	A1DxudNyGpYkSFUsalHINMvgzP5Z53UnzQTuhuCwC3ErCPu2fPYHJVzUWYoeENwXHRvGHLvmBbz
	lkLbgYSFMl779OGTKwRwVzXBc1RSOhiUuAVuyruIZRqL+CniR8/VtechaPoGYLIOgmsTTwfalXg
	2FeQ0mVinG3WK7hhDbS/v/k8E7u9N54f5iYSCRqAlzGbX8wZJq5Yhwr+9I662+LRAYBBXPRGycl
	LRjUvA9aVX+8wXB2DMzZzSJ3AIeFQso3eLvmyonI+jJxe97JwEowaYnCINOzd1vjm1CeAOJApOQ
	ifuEhEztE4HCWaZvdIlyPbtX+dLhMIEWcwN0LxnZri0ggx2wZB5yHIHCLoyQEEP0PqcHWvXuJo0
	SQ=
X-Received: by 2002:a17:907:e002:20b0:c2d:ca32:2176 with SMTP id a640c23a62f3a-c2e23be61f9mr114745266b.8.1790782049863;
        Wed, 30 Sep 2026 08:27:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3eb32sm28640766b.3.2026.09.30.08.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:27:29 -0700 (PDT)
Message-ID: <56d86280-fcea-4d2d-b6b9-b47449f3408d@linaro.org>
Date: Wed, 30 Sep 2026 16:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 20/22] KVM: arm64: Add vCPU device attr to partition
 the PMU
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Zide Chen <zide.chen@intel.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Mingwei Zhang <mizhang@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924172928.2110956-21-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260924172928.2110956-21-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_082732_039500_77163580 
X-CRM114-Status: GOOD (  23.73  )
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



On 24/09/2026 18:29, Colton Lewis wrote:
> Add the KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION vCPU device attribute to
> enable a Partitioned PMU for a VM where PMUv3 and VHE are supported.
> 
> When partitioning is enabled (tracked via
> KVM_ARCH_FLAG_PARTITION_PMU_ENABLED), userspace must explicitly
> configure the number of guest event counters via
> KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS with a value strictly less than the
> maximum number of general-purpose counters implemented by the PMU (or
> 0 only when FEAT_HPMN0 is supported), leaving at least one
> general-purpose counter reserved for host profiling prior to calling
> KVM_ARM_VCPU_PMU_V3_INIT.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   Documentation/virt/kvm/devices/vcpu.rst | 42 ++++++++++++++-
>   arch/arm64/include/asm/kvm_host.h       |  1 +
>   arch/arm64/include/uapi/asm/kvm.h       |  2 +
>   arch/arm64/kvm/pmu.c                    | 71 ++++++++++++++++++++++++-
>   arch/arm64/kvm/sys_regs.c               |  5 +-
>   5 files changed, 118 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index deb5c51bc00c8..fb5921ed9dea2 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -57,6 +57,9 @@ Returns:
>                     hardware PMU, or interrupt number not set (non-GICv5
>                     guests, only)
>   	 -EBUSY   PMUv3 already initialized
> +	 -EINVAL  Partitioning enabled without explicitly configuring
> +		  fewer than max_counters via
> +		  KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS
>   	 =======  ======================================================
>   
>   Request the initialization of the PMUv3.  If using the PMUv3 with an in-kernel
> @@ -162,7 +165,8 @@ the cpu field to the processor id.
>   	 -EFAULT  Error accessing the value pointed to by addr
>   	 -ENODEV  PMUv3 not supported or GIC not initialized
>   	 -EINVAL  No PMUv3 explicitly selected, or value of N out of
> -	 	  range
> +	 	  range (or N >= max_counters when partitioning is
> +		  enabled)

"No PMUv3 explicitly selected, or value of N > max_counters, or N > 
max_counters - 1 when partitioning is enabled".

That might be clearer, otherwise it seems like max_counters being 
relevant to "out of range" only applies to when partitioning is enabled, 
not that it's max_counters all the time but one is -1.


