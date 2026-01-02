Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B7FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMbovm/gG/7jubGENqfjP/9rxqSn/HJfGYv99VNhtHo=; b=d9fDhQhUAD3HiLx4XT9aOc14uq
	RvAsnQZQBw7nkMQtPpiIP+J98I0n5AGynYpf6c91Xf37zcoic0gg9/1CI4Cyifc15cfmP0C+o68ZQ
	+Ui7zfBmntlAUqY6LYaRu2UxNes5IBBRyogZQXq4jPiBcgbubIhPDoEnH51bgCwaPyibSKhbTUiI0
	+EiBPju2XrFZPXBWeq4E0rLdGxNSTuoQhkPt8Lsvw31yfR5wUdLdDFXii2eIHHRvE1cdOsO0hEntn
	o701AjBKXEA3YJi29l5Dckx4mUM5/eKci/ECBbRvXQm1FFLwwajRRO1AkKxD9vZ6DTCbgFabSckUg
	GE13GihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiZT-00000008XW4-0aEb;
	Fri, 02 Jan 2026 17:04:15 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiZO-00000008XU9-0xGf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:04:12 +0000
Date: Fri, 2 Jan 2026 17:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767373448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kMbovm/gG/7jubGENqfjP/9rxqSn/HJfGYv99VNhtHo=;
	b=gcjMVEgM+r9x0LCC9CNLWmc8hkGGczkEUcOS+ZUDjiXsI5+UDN+fVo4JgvC0Tz39SlTk4g
	ELNQYbp1SMiKD6mZDD6hUF/Hhz55lFxsvuTSq/b7fV9ZYQJLtryImwzf0g3U06LT2LmP7D
	6arYDRy1xXoqqsfCF4lTg1hx123J1j8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/21] KVM: selftests: Add a stage-2 MMU instance to
 kvm_vm
Message-ID: <3kuuj6toya5xlv74yrl4wg74b52wsvfqv3gigdbsdaqs7eibt5@th3b5x3dik7y>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-13-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230230150.4150236-13-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090411_380207_B3639BEC 
X-CRM114-Status: GOOD (  17.93  )
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

On Tue, Dec 30, 2025 at 03:01:41PM -0800, Sean Christopherson wrote:
> Add a stage-2 MMU instance so that architectures that support nested
> virtualization (more specifically, nested stage-2 page tables) can create
> and track stage-2 page tables for running L2 guests.  Plumb the structure
> into common code to avoid cyclical dependencies, and to provide some line
> of sight to having common APIs for creating stage-2 mappings.
> 
> As a bonus, putting the member in common code justifies using stage2_mmu
> instead of tdp_mmu for x86.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index c1497515fa6a..371d55e0366e 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -116,7 +116,12 @@ struct kvm_vm {
>  	uint32_t dirty_ring_size;
>  	uint64_t gpa_tag_mask;
>  
> +	/*
> +	 * "mmu" is the guest's stage-1, with a short name because the vast
> +	 * majority of tests only care about the stage-1 MMU.
> +	 */
>  	struct kvm_mmu mmu;
> +	struct kvm_mmu stage2_mmu;
>  
>  	struct kvm_vm_arch arch;
>  
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

