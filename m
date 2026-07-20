Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500BFC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrlTUmgBAy0MeYhpd3XQX/F4/MLL4uJLkkm9uFPxeGY=; b=CBr7HElRjyIUgYKal6AjgQKx3A
	L5e4CMCV82N/VFXwEoLdwGipwuBxm+MX4bM2atxlTh3RXLJ2WzJPLQqpmJrEvtvPl1LBwv4CO9jaI
	3XDXF9zdWyCvsx1zf19JqFy69BuwkdHbT0T5yI3jFy1P2UzrYwWZEt6sWbH5MTKYiTHKWvwcP7iGw
	3loXuCWFTYQjmHCe4jGkaOjbkFjFHpG/bfjC3HeOtakA6TNUzU6Clb1fTH7QgTcXBd2nF3Ds0Unf2
	0TDdZmcMqJv1FK+yxx2agWCmt5tFqJQVnZ90gNg9qomCYZMuu9DiBxuqEhgF9v3pd7GP2CwxmoLBj
	E9kwYvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljkt-00000006FKE-1zxB;
	Mon, 20 Jul 2026 08:53:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljks-00000006FJg-00fV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 08:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LrlTUmgBAy0MeYhpd3XQX/F4/MLL4uJLkkm9uFPxeGY=; b=PBnSQc7nIDmchg2XcmkYUkiYwL
	ddbwyCZEAhJrfjen1cIAZCSioYOuH8MSw5RMPpvd8PniDsYk93HrFdT5A5fdZ1xz9/5PUKHYVeIVn
	+0I99cuVVUWQvCgPJxUJheHOprsOh8MItZAwQ2QZKA3HkyVFb2IVJ+JGZAH+icO9RXpjhTPnXK0YO
	4cTwoWHOXRMvlvMieLpIn0A4UpfVRDf6En+BYDMk+kV2bw8bHw3z6ak8KkbT68xe39rFkGwoi4M52
	W2dFUFrhr+dLKGY0OeAAt6K8NxlIazkUgue4AkgJ9p4uCloLtuf0csPrKXLnDZ8ZRlXkSvAbU2lgf
	xF4fWCgg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wljko-0000000GPKb-1vZV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:53:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC9C42B;
	Mon, 20 Jul 2026 01:53:31 -0700 (PDT)
Received: from [10.164.19.57] (unknown [10.164.19.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D49D03FB82;
	Mon, 20 Jul 2026 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784537615; bh=GPcoRiOabqZcrKhtCc+010r/lyLlvM0NRgvjbYmd7Ls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a3p+arOH4IgRk1UdjlpkNlL7fdOacQQheCQ+AEjtvgt29y2yTQ+2P3ZI+RRoC88+z
	 2+C/Ph2/U6oUkMdI01CqAqixS5bJMyrn5sMtdEGWCGqEQ62x6ZOeL5haE9cSZKnn1q
	 dzBpzHaZ2684ZHWnVMEbh9AcXc8LV6TcaGy/jANI=
Message-ID: <ad52d1ee-04cb-42d7-b50c-dfb3d28db5df@arm.com>
Date: Mon, 20 Jul 2026 14:23:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: ptdump: Flush the last region
To: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Sebastian Ene <sebastianene@google.com>,
 Vincent Donnefort <vdonnefort@google.com>
References: <20260717231233.2299068-1-weilin.chang@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260717231233.2299068-1-weilin.chang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095338_994928_5D2AF3B4 
X-CRM114-Status: GOOD (  25.61  )
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



On 18/07/26 4:42 am, Wei-Lin Chang wrote:
> Currently the stage-2 ptdump calls note_page() at each leaf entry visit.
> This simply misses the output of the last region, because note_page()
> only dumps output when it detects a change in level/prot, or when the
> walk enters a next marker section. The last region in the guest IPA
> space with the same level/prot is not dumped since there is no change
> after it.
> 
> To dump the final region, manually issue a note_page() call with address
> BIT(ia_bits) (end of guest IPA space) and level == -1 to trigger a level
> change after the last region. Additionally treat level == -1 as a last
> flushing note_page() call and avoid dumping the name of the next marker
> for this case.
> 
> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>  arch/arm64/kvm/ptdump.c | 8 +++++---
>  arch/arm64/mm/ptdump.c  | 5 +++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index c9140e22abcf..4096e4a92fae 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -155,11 +155,13 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
>  		.seq		= m,
>  	};
>  
> -	write_lock(&kvm->mmu_lock);
> +	guard(write_lock)(&kvm->mmu_lock);

The guard clause change has nothing to do with the fix I think? Although the change
is small and the fix is for a recent commit so maybe we don't care having this
in the same patch - not sure how strict kvm reviewers are about this : )


>  	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
> -	write_unlock(&kvm->mmu_lock);
> +	if (ret)
> +		return ret;
> +	note_page(&st->parser_state.ptdump, BIT(mmu->pgt->ia_bits), -1, 0);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index ab9899ca1e5f..fed4e4407e0e 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -194,6 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>  	struct ptdump_pg_level *pg_level = st->pg_level;
>  	static const char units[] = "KMGTPE";
> +	bool flush = level == -1;

Can we do something similar to what S1 ptdump does (note_page_flush in ptdump_walk_pgd).


>  	ptdesc_t prot = 0;
>  
>  	/* check if the current level has been folded dynamically */
> @@ -234,7 +235,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  				  pg_level[st->level].num);
>  		pt_dump_seq_puts(st->seq, "\n");
>  
> -		if (addr >= st->marker[1].start_address) {
> +		if (addr >= st->marker[1].start_address && !flush) {
>  			st->marker++;
>  			pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
>  		}
> @@ -244,7 +245,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  		st->level = level;
>  	}
>  
> -	if (addr >= st->marker[1].start_address) {
> +	if (addr >= st->marker[1].start_address && !flush) {
>  		st->marker++;
>  		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
>  	}


