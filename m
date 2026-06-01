Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D29CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2qKexwHvz3KRPtLvli9oqJZOU4toPFHhWC4yeROzbw=; b=fsAZr0FJ0Tt2NNBK65RZZrgOmD
	StvrwD/Xa8rmhbGYPNvjahlUB1peWX5dLR92bG9Sg9b9Df702ZTHO+FfveIF83V8+5MOaXEXWM37C
	NesavYG6ehT/z/NDxxGQDePciXrU8GPmfwMWfgB4NTzwK49MSGPCNdd6ScfEi9JmvAlvR5VKI4Kt6
	rCUhDyl88Yd1r/NcU4I1TxZ850Z/SBUwQR5cz60Yxy//Cj1V4RQYpTo1faIW2t9TdWyAKozh9igZ9
	miQXrh8cg1G1JfZGhPxXnOVKWKCwB0ZThy6lrOf/WcpZJuhx2Z3JAsL6LL9Pn1l2j0w30yMlMgbcD
	lCfc8uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB56-0000000Bw7Z-2JSm;
	Mon, 01 Jun 2026 22:26:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB54-0000000Bw7B-0ItO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:25:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37FCE44576;
	Mon,  1 Jun 2026 22:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1BE1F00893;
	Mon,  1 Jun 2026 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780352756;
	bh=O2qKexwHvz3KRPtLvli9oqJZOU4toPFHhWC4yeROzbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gX1jJ9z91LC+/qmrlP8VPboWqw8SsdjZktFpR99yh5czC27sSEqQ68cUslcSwG13b
	 BC2298F3sEps6D/HmGxaR7tc8J+24iEeDY2jd3faxV/fKM1VXzMWrVp88zYzPMJQ9Q
	 tAd5fi5JCxIOGU51f8hcYDLA7myI9yh70R4in3HTua2s1nwLtx/U/D6wAZCrsuMbw6
	 GYhjM83oUEYn3u3WGjFW9KVBv2fib1fqri0AMcTk0906OnqEvnC4KgpN0bYCPZ8vP7
	 qeKjIHcIVx/pytLeKSV/RR95JDuM3s1FzE93jI+FUAugg+QDJI5WeHSSc3ZlhwqpHD
	 je+ci9vVbbOeA==
Date: Mon, 1 Jun 2026 15:25:55 -0700
From: Oliver Upton <oupton@kernel.org>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 15/26] s390: Add functions to query arm guest time
Message-ID: <ah4G847iT_pPRuQm@kernel.org>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-16-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529155601.2927240-16-seiden@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_152558_176316_3A7E02B9 
X-CRM114-Status: GOOD (  24.74  )
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

On Fri, May 29, 2026 at 05:55:48PM +0200, Steffen Eiden wrote:
> Add functions to convert between ARM guest time (LSB0) and s390 host
> time (MSB0) using new ptff function codes.
> 
> Co-developed-by: Nico Boehr <nrb@linux.ibm.com>
> Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> ---
>  arch/s390/include/asm/timex.h | 49 +++++++++++++++++++++++++++++++++++
>  arch/s390/kernel/time.c       |  1 +
>  arch/s390/kvm/arm64/arm.c     |  9 ++++++-
>  3 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/s390/include/asm/timex.h b/arch/s390/include/asm/timex.h
> index 49447b40f038..9ec22a28bbda 100644
> --- a/arch/s390/include/asm/timex.h
> +++ b/arch/s390/include/asm/timex.h
> @@ -99,6 +99,8 @@ extern unsigned char ptff_function_mask[16];
>  #define PTFF_QSI	0x02	/* query steering information */
>  #define PTFF_QPT	0x03	/* query physical clock */
>  #define PTFF_QUI	0x04	/* query UTC information */
> +#define PTFF_QAGTO	0x10	/* query arm guest time offset */
> +#define PTFF_QAGPT	0x11	/* query arm guest physical time offset */

Are these analogous to CNTVOFF_EL2 and CNTPOFF_EL2?

Thanks,
Oliver 

>  #define PTFF_ATO	0x40	/* adjust tod offset */
>  #define PTFF_STO	0x41	/* set tod offset */
>  #define PTFF_SFS	0x42	/* set fine steering rate */
> @@ -136,6 +138,17 @@ struct ptff_qui {
>  	unsigned int pad_0x5c[41];
>  } __packed;
>  
> +/*
> + * Query Arm Guest Time
> + * used for:
> + *	- Query Arm Guest Time Offset
> + *	- Query Arm Guest Physical Time
> + */
> +struct ptff_qagt {
> +	u64 in;
> +	u64 out;
> +};
> +
>  /*
>   * ptff - Perform timing facility function
>   * @ptff_block: Pointer to ptff parameter block
> @@ -286,4 +299,40 @@ static inline int tod_after_eq(unsigned long a, unsigned long b)
>  	return a >= b;
>  }
>  
> +/*
> + * ptff_qagto() -  Query Arm Guest Time Offset
> + *
> + * @physical_time: Arm guest physical time in MSb 0
> + *
> + * Converts Arm guest physical time in MSb 0 bit ordering
> + * into the Arm guest offset in LSb 0 bit ordering.
> + *
> + * Return: Arm guest time offset in LSb 0
> + */
> +static inline u64 ptff_qagto(u64 physical_time)
> +{
> +	struct ptff_qagt qagto = { .in = physical_time };
> +
> +	ptff(&qagto, sizeof(qagto), PTFF_QAGTO);
> +	return qagto.out;
> +}
> +
> +/*
> + * ptff_qagpt() - Query Arm Guest Physical Time
> + *
> + * @guest_time_offset: Arm guest time offset in MSb 0
> + *
> + * Converts Arm guest offset in MSb 0 bit ordering
> + * into the Arm guest physical time in LSb 0 bit ordering.
> + *
> + * Return: Arm guest physical time in LSb 0
> + * */
> +static inline u64 ptff_qagpt(u64 guest_time_offset)
> +{
> +	struct ptff_qagt qagpt = { .in = guest_time_offset };
> +
> +	ptff(&qagpt, sizeof(qagpt), PTFF_QAGPT);
> +	return qagpt.out;
> +}
> +
>  #endif
> diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
> index bd0df61d1907..2b989bebd220 100644
> --- a/arch/s390/kernel/time.c
> +++ b/arch/s390/kernel/time.c
> @@ -65,6 +65,7 @@ ATOMIC_NOTIFIER_HEAD(s390_epoch_delta_notifier);
>  EXPORT_SYMBOL(s390_epoch_delta_notifier);
>  
>  unsigned char ptff_function_mask[16];
> +EXPORT_SYMBOL(ptff_function_mask);
>  
>  static unsigned long lpar_offset;
>  static unsigned long initial_leap_seconds;
> diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
> index bf0866659421..636bbeda98a8 100644
> --- a/arch/s390/kvm/arm64/arm.c
> +++ b/arch/s390/kvm/arm64/arm.c
> @@ -692,8 +692,15 @@ long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
>  
>  static int __init kvm_s390_arm64_init(void)
>  {
> -	if (!sclp.has_aef)
> +	if (!sclp.has_aef) {
> +		pr_info("SAE is not available\n");
>  		return -ENXIO;
> +	}
> +
> +	if (!(ptff_query(PTFF_QAGTO) && ptff_query(PTFF_QAGPT))) {
> +		pr_info("PTFF for arm on s390 is not available\n");
> +		return -ENXIO;
> +	}
>  
>  	return kvm_init_with_dev(sizeof(struct kvm_vcpu), 0, THIS_MODULE,
>  				 KVM_DEV_NAME, MISC_DYNAMIC_MINOR);
> -- 
> 2.53.0
> 

