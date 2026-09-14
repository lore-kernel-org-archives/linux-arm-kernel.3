Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE4CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVuOluateM9gRYGX8buJx3P4hkz/hhI4JcPoc/rvqoY=; b=gA8B+eof6rgqWlpcrk2HCVwHIM
	d+pp+jEjsVJLdCsm34SnVzifCfIIjyUdyNEvIOHGs/lMaLras1hRZPO1RvGeyHHiyrhvbzttEjsxx
	evJ+2Ffck5qNmFYMm5NN0cy5pcCLklvJs3s6b8n6Sw/pJeBxCUXSAFms1jDFrzrDb6Ip8b2fAYysj
	TYNikTKhRdo9g/2lgWhSk+iwG/HFvOs+EHOzG0cYqOUKLqJV9LLW0E5x75/ruX2kIY4L6b5LpBGMv
	qtb2k7lFOYV4NPi7jD9xlfqlNr5H+T7zDOxdIYJFRrOCpFTM9VAxL+iraxAxBI+T6ud0Hicun52Nr
	e8Xh0ZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63DH-000000030QQ-3gSJ;
	Mon, 14 Sep 2026 09:42:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63DG-000000030PY-0ITH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:42:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D230152B;
	Mon, 14 Sep 2026 02:42:53 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6831F3F59E;
	Mon, 14 Sep 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789378977; bh=Xg4bUL7yzEXMUEjQqIolCpCM3xjY/H/uXxIijcBMiTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BgTCe4zeLwNWaya0LVmV+TiodXsEebvsIa8e9wyJC/d5MUM3UYdPN0S5TN2XlTVOZ
	 WfPOHyz2V2YkVR5SUDRxLNS19QDHeDRnfnD4UeE3/9mgpwOKsW5nCVrMo4sebjEOaJ
	 DFEY9QOAilgH359pCY5ZZnd4hKEW2KvjJfCbFzIk=
Message-ID: <979a2e1a-eebb-46c2-9cb4-d65428ebaeb8@arm.com>
Date: Mon, 14 Sep 2026 10:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Don't WARN on an unknown VM ioctl in
 protected mode
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260914093838.1082637-1-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260914093838.1082637-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_024258_161378_9065470C 
X-CRM114-Status: GOOD (  15.24  )
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

On 14/09/2026 10:38, Fuad Tabba wrote:
> kvm_pkvm_ioctl_allowed() WARNs when kvm_get_cap_for_kvm_ioctl() doesn't
> find the ioctl number in vm_ioctl_caps[], and kvm_arch_vm_ioctl() calls
> it for every number the generic code doesn't handle, so
> ioctl(vm_fd, 0xdeadbeef) from userspace taints a pKVM host and panics it
> under panic_on_warn. The lookup is fed userspace input: return false,
> and userspace gets the -EINVAL kvm_arch_vm_ioctl() returns for that
> number on a host without pKVM.
> 
> Fixes: b12b3b04f6ba0 ("KVM: arm64: Check whether a VM IOCTL is allowed in pKVM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

I hit this myself ;-) and had a patch in my series. Thanks for posting
this

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   arch/arm64/include/asm/kvm_pkvm.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index beea00e693a0a..cad60569f0619 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -65,8 +65,7 @@ static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
>   	int r;
>   
>   	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> -
> -	if (WARN_ON_ONCE(r < 0))
> +	if (r < 0)
>   		return false;
>   
>   	return kvm_pkvm_ext_allowed(kvm, ext);


