Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C282DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vulSNQv1hb76RwwsFOazZY/x62wg1wkkVUuQTFmOC4=; b=ghlfdG3Znz+2e8RoTGAGB1khr3
	5SPOMvKsA2nBykMAvGvXonQQ1Lnb0jSUNErl1SqyNUkyn8khyFvYMtFgalRvmtBH7CLhsmukFFAkS
	kaE2uKkEugxqBNZEU20JxlFHowFGqiLBRpXTHov1DB/T9uSsF+8RmYalWrqnJtrMtr4H84PXU1LLO
	u9Yl05EDNG7PbloiLYqVz2/Lg4beJ58i1HQq8y+oBTNaQQJVlYIEkCFItAeBd87iSZZkcjlWqy5qo
	RveOhQA7LBYLZbRwpFBXDIvHUMu/JJvrP5RXKyg6nfPQST5xoql2XMxWOofDuS0ftuGf9ndCcPiOx
	fCb5QkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2qs-0000000FvOK-38Fq;
	Thu, 06 Nov 2025 16:28:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2qo-0000000FvNX-25bw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:28:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70F561477;
	Thu,  6 Nov 2025 08:28:33 -0800 (PST)
Received: from [10.57.71.244] (unknown [10.57.71.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0333F66E;
	Thu,  6 Nov 2025 08:28:39 -0800 (PST)
Message-ID: <48fc6886-be29-4c7f-a08a-a218bf9579b4@arm.com>
Date: Thu, 6 Nov 2025 16:28:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] KVM: arm64: Fix Trace Buffer trapping for
 protected VMs
Content-Language: en-GB
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
 joey.gouly@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 vladimir.murzin@arm.com
References: <20251106144418.2847443-1-tabba@google.com>
 <20251106144418.2847443-2-tabba@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251106144418.2847443-2-tabba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_082842_589170_2A1F37CF 
X-CRM114-Status: GOOD (  13.61  )
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

On 06/11/2025 14:44, Fuad Tabba wrote:
> For protected VMs in pKVM, the hypervisor should trap accesses to trace
> buffer system registers if Trace Buffer isn't supported by the VM.
> However, the current code only traps if Trace Buffer External Mode isn't
> supported.
> 
> Fix this by checking for FEAT_TRBE (Trace Buffer) rather than
> FEAT_TRBE_EXT.
> 
> Fixes: 9d5261269098 ("KVM: arm64: Trap external trace for protected VMs")
> Reported-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 43bde061b65d..8d06a246dfd1 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -117,7 +117,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>   	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
>   		val |= MDCR_EL2_TTRF;
>   
> -	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
> +	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
>   		val |= MDCR_EL2_E2TB_MASK;


Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


