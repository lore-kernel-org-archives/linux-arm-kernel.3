Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wAdWeV28;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lJySD+DX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JYxKhJ5Nqkl6cTQISRdnvK/P3JV5rSsFOheg672wUag=; b=wAdWeV28exksYJYkLvKIFJI/jw
	ZwSwkjtrwM9YWGSB/WYomvj6UK9PiAVBwaxPpmWtHz5t3/DL0OXhispRnebYZTGYtCcX3mu75kq3b
	Y4DC+CMYyct6CKLRaSG5/ja6zpfwr3IhBojEKdH6l6wRbCZRrpWQv7KeiT7gef9PvS9eHpB2KOipc
	HESpmQPCBBWs7ZMFBh+vr5lMqpVWCj6/e0Y6SIkj4PkGE4OiGvmkvUfEDoFqP6h+mtIfksVgs2Fof
	Aezmz9sRskfW15TbT43hzUmRMIrnP/8CQThA5lbAhGySCIBgP4s7NqoCVHK9ZsF3aV7NKzETYwb24
	3ffPdpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYCG-0000000ASHL-3sNP;
	Thu, 29 Oct 2026 22:02:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYCE-0000000ASGv-0lsW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:02:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82D115A1;
	Thu, 29 Oct 2026 15:02:00 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42E73F59E;
	Thu, 29 Oct 2026 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311323; bh=JTrK1XlB+5p23F0LNcaqj0VtA4gzIX+/IaVVmpuGrl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJySD+DXukQaaFPs6Wft5kbYJLMizH8HdgBLh4ByuYeQJrehaf5/st9zCdP6UBi7W
	 Lg37Jqt+mfkQGHfkp4C9a2WJMk+TA9g0DmVWhrFD2+sAlxUu2RQJiV3/IOJcSLg2aK
	 9ulhF40slKJxrq2eEaEeZB1DvqUZxUlc2EzRYxus=
Date: Thu, 29 Oct 2026 22:01:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
Message-ID: <auPCV6VdMEz4uZkK@arm.com>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
 <20261021110700.493315-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021110700.493315-3-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_150206_348594_95BCC66C 
X-CRM114-Status: GOOD (  24.35  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:06:58PM +0100, Fuad Tabba wrote:
> When KVM_ARM_MTE_COPY_TAGS copies tags into a page, it marks the page as
> tagged. For a hugetlb folio the flag covers every page in the folio. If
> the folio wasn't tagged yet, its other pages are marked as tagged with
> their previous owner's tags still in place. The stage-2 fault path then
> maps them into the guest without clearing them. The ioctl's read side
> also copies them out to the VMM.
> 
> Clear the whole folio on its first tagging, before copying in this
> page's tags.
> 
> Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/guest.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..cda655fbff657 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1012,6 +1012,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		void *maddr;
>  		unsigned long num_tags;
>  		struct folio *folio;
> +		unsigned long i;
>  
>  		if (!page) {
>  			ret = -EFAULT;
> @@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  			/*
>  			 * Only locking to serialise with a concurrent
>  			 * __set_ptes() in the VMM but still overriding the
> -			 * tags, hence ignoring the return value.
> +			 * tags. A hugetlb folio is marked tagged as a whole,
> +			 * so its first tagging clears every page.
>  			 */
> -			if (folio_test_hugetlb(folio))
> -				folio_try_hugetlb_mte_tagging(folio);
> -			else
> +			if (!folio_test_hugetlb(folio))
>  				try_page_mte_tagging(page);
> +			else if (folio_try_hugetlb_mte_tagging(folio))
> +				for (i = 0; i < folio_nr_pages(folio); i++)
> +					mte_clear_page_tags(page_address(folio_page(folio, i)));

I guess we could have skipped the actual page we are going to copy into
but not worth it.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

>  			num_tags = mte_copy_tags_from_user(maddr, tags,
>  							MTE_GRANULES_PER_PAGE);

Something Claude spotted and unrelated to your patch. A malicious VMM
using memfd (not guest_memfd) and MAP_SHARED could construct some
mapping so that the VM slot is !PROT_MTE while the same page is mapped
in the VMM with PROT_MTE. try_page_mte_tagging() (or the folio one)
above set PG_mte_lock but a subsequent fault on the uaccess to VMM
memory will attempt to zero the tags and wait (forever) on the page
lock. Not tested to prove it.

If you get bored and want to fix it, I guess a copy_from_user() into a
local buffer and then setting the page tags.

-- 
Catalin

