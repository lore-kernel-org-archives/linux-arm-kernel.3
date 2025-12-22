Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F670E67803
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIJ8qnnIn2fAU6lPdevesO7Rmp1csv0a8O5Oc90bx5Y=; b=21HpFWKnxxNfJFEi//nwwVLt/5
	hE48EVIa0tt4yNHGpNECUwgmEhfp+XlJhRjOjvvvf+ZNO/zFAr11I6gMTflHjCHwtZx8KpYPdIb9U
	a4kvkqbrq/pUGX/UCwjrE8I+tUEh8nsZ0UVdfdKOGmpomj8RN2zR979RDwbTGc9P32DteKtc9W8Mg
	pdHAPfzuv3dLvunmALDHtBMvaSy48s261fHEIzXjvIxs5tJWqNXdXCbhYIWne33wFMJFkl43Ap9IO
	oMDC14ivr1BdpZ5BKa4EwWmKIbGFyDzMzUNsXQ1nzmqxZnjaOYedaWIx/BApfFGLIKJonOJEmeRQp
	UZ/3CV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkJM-0000000E30e-3m46;
	Mon, 22 Dec 2025 18:07:12 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkJI-0000000E2zc-375N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 18:07:11 +0000
Date: Mon, 22 Dec 2025 12:06:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766426825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIJ8qnnIn2fAU6lPdevesO7Rmp1csv0a8O5Oc90bx5Y=;
	b=v1H1biNDta8dBMhI6O/Lwni5MPUVNHO+eWiAh/FLiesVXT5NfJuW+moKjnH5LB+Hjcq1Ke
	cw/u755wlQsSv3+bRbviueiK6b1nj5+bJPE7d5sYKofjrS39wMquqoe4lteCj85/QGJJlB
	qs3oNq8NtL/n60dE5F2pqYCaJw0Phow=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org
Subject: Re: [PATCH v2 3/5] KVM: riscv: selftests: Fix incorrect rounding in
 page_align()
Message-ID: <20251222-67bdefbbd6f1687ffbcabf81@orel>
References: <20251215165155.3451819-1-tabba@google.com>
 <20251215165155.3451819-4-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215165155.3451819-4-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100708_949702_E7A0BA97 
X-CRM114-Status: GOOD (  17.43  )
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

On Mon, Dec 15, 2025 at 04:51:53PM +0000, Fuad Tabba wrote:
> The implementation of `page_align()` in `processor.c` calculates
> alignment incorrectly for values that are already aligned. Specifically,
> `(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
> boundary even if `v` is already page-aligned, potentially wasting a page
> of memory.
> 
> Fix the calculation to use standard alignment logic: `(v + vm->page_size
> - 1) & ~(vm->page_size - 1)`.
> 
> Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V 64-bit")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index 2eac7d4b59e9..d5e8747b5e69 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -28,7 +28,7 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
>  
>  static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>  {
> -	return (v + vm->page_size) & ~(vm->page_size - 1);
> +	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
>  }
>  
>  static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
> -- 
> 2.52.0.239.gd5f0c6e74e-goog

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

