Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5ABD690E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjeMdtNt1+e4a2TwpMF2rrs8wuHFTMYgg8Pn0QLiQhM=; b=m6i8voMk2gBBmAi2pa3QgWFBGu
	x8LusViW4o7RInwjLz4NBV7D7+4WnhFS6gUwhR4gy2vh1LPrU7hv5zvA3GycwOVWRSI8t6+9BG0jE
	O9KdcqGG7B9gxeDQcO1mhemdr+kQGlJXJynwTxFXOgtCUfQ11WbmjQWY/WPyAhyU8AfSTywLlYzp3
	5PoKPmN4YKq++cSSojjnOXCugDDdh/nbCLYtFx6aTskUGZkl9ufNOzsD2yiochOnDAin8w8n9kasC
	wh+C7m+DKGda3YR0V4QAk59Y8iNjGZGbcXCsL4w7cfTVIOXIJkNajx8TZlyJ/xUROmhrXqIbJiBMF
	oAVwWXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZh3-0000000ExlU-1aSP;
	Thu, 28 Nov 2024 08:16:09 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZg3-0000000Exey-3JL0;
	Thu, 28 Nov 2024 08:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1732781694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IX5730+8nKj3sLJJvh7RomX2Bs+xolk30lhON7oLa00kJidON75pXFhsTmEGgcAW9b2qnIjoddSqWlEG0ut7tGzImbDmYZjCFgDfUNhl6/6t+7+EPzcPFhYgOrxs8JDejMJ04f7MRdujQsl7VzotuCRZXdML8iQneCaqdGpiBsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732781694; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QjeMdtNt1+e4a2TwpMF2rrs8wuHFTMYgg8Pn0QLiQhM=; 
	b=c0bO1NJUGND8z0Y4gLrSaYaGMfxAbPVQZVA1BZdg4iE6Pi3TqeuXPaphf7tAMGd952CUnr4ZswDBy/l6mZAxgZh/I2iGaYYwVL1LJOGzmHdTsP2B3oX/rWqKMsmBDXkBwuCUg3EhzCyKkaPhdMJVxbZ8aVdoOpnjb6T+wvmoHaQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732781694;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QjeMdtNt1+e4a2TwpMF2rrs8wuHFTMYgg8Pn0QLiQhM=;
	b=eClgEsKbSxmj5sTOLfyh5NKXzEfPT9e7i7v9Tl02dzQ6xGxjxaTk1hHxvZTtbnaZ
	dQ73cjyu/pfAZJfTvOezFTgeELmmmwGEhg71PrNe72w6ACQZ7dh69Yq6MGFSHqVTDsE
	ziYsaq6zsfdCO0SLThzs/u60o3OeJ2VKpcIMgeyE=
Received: by mx.zohomail.com with SMTPS id 1732781693505946.223322327641;
	Thu, 28 Nov 2024 00:14:53 -0800 (PST)
Message-ID: <4431aa18-c518-4396-87e8-04176eabdd49@collabora.com>
Date: Thu, 28 Nov 2024 13:14:50 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>,
 James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v4 01/16] KVM: Move KVM_REG_SIZE() definition to common
 uAPI header
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20241128005547.4077116-1-seanjc@google.com>
 <20241128005547.4077116-2-seanjc@google.com>
Content-Language: en-US
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
In-Reply-To: <20241128005547.4077116-2-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_001508_739500_FC0F15AE 
X-CRM114-Status: GOOD (  13.62  )
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

On 11/28/24 5:55 AM, Sean Christopherson wrote:
> Define KVM_REG_SIZE() in the common kvm.h header, and delete the arm64 and
> RISC-V versions.  As evidenced by the surrounding definitions, all aspects
> of the register size encoding are generic, i.e. RISC-V should have moved
> arm64's definition to common code instead of copy+pasting.
> 
> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  arch/arm64/include/uapi/asm/kvm.h | 3 ---
>  arch/riscv/include/uapi/asm/kvm.h | 3 ---
>  include/uapi/linux/kvm.h          | 4 ++++
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 66736ff04011..568bf858f319 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -43,9 +43,6 @@
>  #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
>  #define KVM_DIRTY_LOG_PAGE_OFFSET 64
>  
> -#define KVM_REG_SIZE(id)						\
> -	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> -
>  struct kvm_regs {
>  	struct user_pt_regs regs;	/* sp = sp_el0 */
>  
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 3482c9a73d1b..9f60d6185077 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -211,9 +211,6 @@ struct kvm_riscv_sbi_sta {
>  #define KVM_RISCV_TIMER_STATE_OFF	0
>  #define KVM_RISCV_TIMER_STATE_ON	1
>  
> -#define KVM_REG_SIZE(id)		\
> -	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> -
>  /* If you need to interpret the index values, here is the key: */
>  #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
>  #define KVM_REG_RISCV_TYPE_SHIFT	24
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 502ea63b5d2e..343de0a51797 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1070,6 +1070,10 @@ struct kvm_dirty_tlb {
>  
>  #define KVM_REG_SIZE_SHIFT	52
>  #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
> +
> +#define KVM_REG_SIZE(id)		\
> +	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> +
>  #define KVM_REG_SIZE_U8		0x0000000000000000ULL
>  #define KVM_REG_SIZE_U16	0x0010000000000000ULL
>  #define KVM_REG_SIZE_U32	0x0020000000000000ULL


-- 
BR,
Muhammad Usama Anjum

