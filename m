Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4710BD1D492
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwq273udHL84MC93sFKE2b+YO778RBmqz0tqmApt9d4=; b=Y5ql09PKrFNtCfSXJiDGDcuVss
	Hob/TD1FxMK2d62ynQaMapogmWnApOWjW3MpNW6AdaiciQlL7k7wK0xGL+pK6fY1bVdWOIcGHrTD+
	GH8Ct6NmWrwubvuebG2nW4xAOItkW8XqhClJs6wS7clCfgSk6GBAGz5RNF8XjScPlRh3pZLk/HNlQ
	wWx+oNQ8Hub26fj0X92ZfjDpqCpXtotE7W5eu2eI7rIwtD0ogrRMqg5pFO9bNwd5Sc4PVfD1CC5ZA
	IBTKVBNAM0PLqzujOnoN8MuE3QOc+mvkaJGmP1nK/rjOSHR4EnP6zl+bp4SNRKJxLMTH5MnI5w04v
	I3Kees8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwaV-00000000p6d-0WNb;
	Thu, 08 Jan 2026 20:26:31 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwaR-00000000p4t-3JgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:26:29 +0000
Date: Thu, 8 Jan 2026 20:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767903975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fwq273udHL84MC93sFKE2b+YO778RBmqz0tqmApt9d4=;
	b=PMw7fKitVdHrjyge5ljK6/L68v7R+4+vzO9D7MrAm90dsGbLRrjsBC9NHx8c3OlKqAGUK9
	RQOIL7n4eXlANPwfoUtyWD4bE7eFC4rCNTurJe+s9+e85FwgZizfMWhqRDh9j0WIuoS6J7
	lSSYP0wZh7tUajkrEiLaovdXVyWWH7s=
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
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
Message-ID: <kivowzryb3mbntaoud4kmhxjbix3usqjiy7phwihjc7p4rp4gk@ppilefrxpu35>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
 <aV_cLAlz4v1VOkDt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV_cLAlz4v1VOkDt@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_122628_164756_9C463122 
X-CRM114-Status: GOOD (  19.34  )
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

On Thu, Jan 08, 2026 at 08:32:44AM -0800, Sean Christopherson wrote:
[..]
> @@ -106,12 +139,66 @@ static void l1_guest_code(void *data)
>  		l1_svm_code(data);
>  }
>  
> +static void test_handle_ucall_sync(struct kvm_vm *vm, u64 arg,
> +				   unsigned long *bmap)
> +{
> +	vm_vaddr_t gva = arg & ~(PAGE_SIZE - 1);
> +	int page_nr, i;
> +
> +	/*
> +	 * Extract the page number of underlying physical page, which is also
> +	 * the _L1_ page number.  The dirty bitmap _must_ be updated based on
> +	 * the L1 GPA, not L2 GPA, i.e. whether or not L2 used an aliased GPA
> +	 * (i.e. if TDP enabled for L2) is irrelevant with respect to the dirty
> +	 * bitmap and which underlying physical page is accessed.
> +	 *
> +	 * Note, gva will be '0' if there was no access, i.e. if the purpose of
> +	 * the sync is to verify all pages are clean.
> +	 */
> +	if (!gva)
> +		page_nr = 0;
> +	else if (gva >= TEST_MEM_ALIAS_BASE)
> +		page_nr = (gva - TEST_MEM_ALIAS_BASE) >> PAGE_SHIFT;
> +	else
> +		page_nr = (gva - TEST_MEM_BASE) >> PAGE_SHIFT;
> +	TEST_ASSERT(page_nr == 0 || page_nr == 1,
> +		    "Test bug, unexpected frame number '%u' for arg = %lx", page_nr, arg);
> +	TEST_ASSERT(gva || (arg & TEST_SYNC_NO_FAULT),
> +		    "Test bug, gva must be valid if a fault is expected");
> +
> +	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
> +
> +	/*
> +	 * Check all pages to verify the correct physical page was modified (or
> +	 * not), and that all pages are clean/dirty as expected.
> +	 *
> +	 * If a fault of any kind is expected, the target page should be dirty
> +	 * as the Dirty bit is set in the gPTE.  KVM should create a writable
> +	 * SPTE even on a read fault, *and* KVM must mark the GFN as dirty
> +	 * when doing so.
> +	 */
> +	for (i = 0; i < TEST_MEM_PAGES; i++) {
> +		if (i == page_nr && arg & TEST_SYNC_WRITE_FAULT)

Micro nit: I think this is slightly clearer:
		if (i == page_nr && (arg & TEST_SYNC_WRITE_FAULT))


