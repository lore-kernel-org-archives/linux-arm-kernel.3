Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD9EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTiupyMcHhqzGfFRi2yCgW/66f0WiYflJTMes6I6iFc=; b=g2YIuE03h7TUuVhCvHsObwEx3/
	GM3iQ3WcfslVbogPZWyFVr125LwiE17STumUbLVpBbgFBk3+zh3vUfYwueqcrPxO9f2o/HFnsBHS0
	C47pA4ezxZ/wqMFnkf3sEQZFwKY1+J7tV+EIdINrfOLBGM03tqSiQTWdtjmy1kjfua4Ith3I9KgHx
	ftxu2UH+RwLvYrv2YS56hTddRS51QtBbF1yeF8JIKAe9djDx4RoR9Y+dFAJYR1Z8LrOD2Om2STUl7
	Q+r39c6lnOwKokw/QlmfdB5CG7vuXPq0Aq2xnTtDDY7sJ73O0hEy0J83mlfklEWrQgJqDoXFLawA9
	OaZr+iTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdn4-0000000579S-3Mor;
	Fri, 20 Dec 2024 14:15:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdku-000000056sD-3OWR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FECE5C5C31;
	Fri, 20 Dec 2024 14:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14334C4CECD;
	Fri, 20 Dec 2024 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734704007;
	bh=IfxXl6UuG4j5BIYEfkssc862+8tnobUWp4ToirmrRTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClQHk595OanK3NzR1jRz96i5ng2jJw5jsvAlQtROFDF0mMP6HpYkOOjk7gpcozy1M
	 09nrL57Tv17Tqe2GScMn4nbdj22MAQ6yha3SDW77160RWKR5OTsMfGpEe99PR8sshe
	 5FT05wI5eAKBNyFmp0apHsR+qWtlOcPemRveYpuRHW4BTgJx1UwUMkHjVuZqljA+On
	 7c2/IBZQ7YxXR/CIFQfk+DoowDh37N7VkgpeHcilbyvbtT9350TR+B+Rn/iYoBsfxX
	 n7GD738cBWuy00SH9W3PxmYEaUPzk2tcvvghNnB6z1Z2fEDeAuF5E3svfU79yO853Y
	 w5XZBuLZuYU6A==
Date: Fri, 20 Dec 2024 14:13:22 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Selftest for pKVM transitions
Message-ID: <20241220141321.GA26794@willie-the-truck>
References: <20241129125800.992468-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129125800.992468-1-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_061328_938372_E79D041C 
X-CRM114-Status: GOOD (  14.49  )
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

On Fri, Nov 29, 2024 at 12:58:00PM +0000, Quentin Perret wrote:
> We have recently found a bug [1] in the pKVM memory ownership
> transitions by code inspection, but it could have been caught with a
> test.
> 
> Introduce a boot-time selftest exercising all the known pKVM memory
> transitions and importantly checks the rejection of illegal transitions.

Thanks for doing this!

> 
> The new test is hidden behind a new Kconfig option separate from
> CONFIG_EL2_NVHE_DEBUG on purpose as that has side effects on the
> transition checks ([1] doesn't reproduce with EL2 debug enabled).

Hmm. What does a test failure look like without CONFIG_EL2_NVHE_DEBUG
enabled? Do we still get file:line information?

[...]

> +void pkvm_ownership_selftest(void)
> +{
> +	void *virt = hyp_alloc_pages(&host_s2_pool, 0);
> +	u64 phys, size, pfn;
> +
> +	WARN_ON(!virt);
> +	selftest_page = hyp_virt_to_page(virt);
> +	selftest_page->refcount = 0;
> +
> +	size = PAGE_SIZE << selftest_page->order;
> +	phys = hyp_virt_to_phys(virt);
> +	pfn = hyp_phys_to_pfn(phys);
> +
> +	selftest_state.host = PKVM_NOPAGE;
> +	selftest_state.hyp = PKVM_PAGE_OWNED;
> +	assert_page_state();
> +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
> +	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
> +
> +	selftest_state.host = PKVM_PAGE_OWNED;
> +	selftest_state.hyp = PKVM_NOPAGE;
> +	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> +	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);

Should we recheck the unshare transitions here?

> +	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
> +	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
> +	assert_transition_res(0,	__pkvm_host_share_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);

We could check unshare_ffa here.

> +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> +
> +	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);

Is it worth trying an extra pin + unpin?

> +	WARN_ON(!hyp_page_count(virt));

Can we assert an exact value (e.g. count == 1)?

> +	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);

unshare_ffa again here.

> +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> +
> +	hyp_unpin_shared_mem(virt, virt + size);
> +	assert_page_state();
> +	WARN_ON(hyp_page_count(virt));
> +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);

Is this block actually testing anything new? Once we've asserted the page
state and checked the refcount, the transitions seem redundant to me.

> +	selftest_state.host = PKVM_PAGE_OWNED;
> +	selftest_state.hyp = PKVM_NOPAGE;
> +	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn);
> +
> +	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
> +	selftest_state.hyp = PKVM_NOPAGE;
> +	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
> +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> +	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
> +
> +	selftest_state.host = PKVM_PAGE_OWNED;
> +	selftest_state.hyp = PKVM_NOPAGE;
> +	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, 1);

Try it twice?

Will

