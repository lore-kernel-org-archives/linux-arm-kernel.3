Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F70C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns2wn/4Pa9DdbhCKyDH7C3BeFWDCDXNPx/6x2vMgBU8=; b=jvaoiQThuKTGYXxjhPi7RFPlCd
	xwR7SFMlw2z3XuelSror4K0dFTwSWSZXr6aWPodpVkQiATy4HNnHMyk+7RN9U+Jn6gSl7qIQhgkBP
	U95IvQ17wOS7B0LlV/FIoUvowRFkiHCJEX+zgez15Uc77ypO/qic4ij+7TtxJBMGXsAnH8LJ9Y0FR
	gW5cXNGG2BXjEu7Rgs2xQ+TUqBYaHDgU9fgStE9f1ywlYKPcZ7eN1yKnImA8UWeC+AS0XNbyJr1rd
	DSJEWaWTd9eAw+//Tb0eOuwuC1N/Jmvg7lt8bvjAfWI9XkeSHKSWIhmEEXebk29Yb6uJjEgxMxcAp
	wZ7xZa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mgy-0000000A4to-3Qdq;
	Tue, 29 Apr 2025 15:16:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ki5-00000009jlP-1vl9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:09:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AF5C1515;
	Tue, 29 Apr 2025 06:09:10 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A5673F673;
	Tue, 29 Apr 2025 06:09:15 -0700 (PDT)
Message-ID: <b956142a-b759-4f5a-b1a9-d8142a622f21@arm.com>
Date: Tue, 29 Apr 2025 14:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 41/42] KVM: arm64: Add FGT descriptors for FEAT_FGT2
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-42-maz@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250426122836.3341523-42-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_060917_571977_C6CA09B6 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Marc,

On 4/26/25 13:28, Marc Zyngier wrote:
> Bulk addition of all the FGT2 traps reported with EC == 0x18,
> as described in the 2025-03 JSON drop.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/kvm/emulate-nested.c | 83 +++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 9c7ecfccbd6e9..f7678af272bbb 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
[...]
>   	/*
>   	 * HDFGWTR_EL2
>   	 *
> @@ -1896,12 +1972,19 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
>   	 * read-side mappings, and only the write-side mappings that
>   	 * differ from the read side, and the trap handler will pick
>   	 * the correct shadow register based on the access type.
> +	 *
> +	 * Same model applies to the FEAT_FGT2 registers.
>   	 */
>   	SR_FGT(SYS_TRFCR_EL1,		HDFGWTR, TRFCR_EL1, 1),
>   	SR_FGT(SYS_TRCOSLAR,		HDFGWTR, TRCOSLAR, 1),
>   	SR_FGT(SYS_PMCR_EL0,		HDFGWTR, PMCR_EL0, 1),
>   	SR_FGT(SYS_PMSWINC_EL0,		HDFGWTR, PMSWINC_EL0, 1),
>   	SR_FGT(SYS_OSLAR_EL1,		HDFGWTR, OSLAR_EL1, 1),
> +
> +	/* HDFGWTR_EL2 */
A missing 2. HDFGWTR_EL2 should be HDFGWTR2_EL2.
> +	SR_FGT(SYS_PMZR_EL0,		HDFGWTR2, nPMZR_EL0, 0),
> +	SR_FGT(SYS_SPMZR_EL0,		HDFGWTR2, nSPMEVCNTRn_EL0, 0),
> +
>   	/*
>   	 * HAFGRTR_EL2
>   	 */

Thanks,

Ben


