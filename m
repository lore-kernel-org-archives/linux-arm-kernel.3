Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F16E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/FJ/BWMcAeSqIEo73tjEOakYKuswlMcLnlIzYTAvbU=; b=BrRi48RgjceA0Di2HfrtmKQC8K
	dz+Hg1Ipz045c/VS+yAwz3J12s98K1L5opNyn7ocsdO/ZbDOMfCykIZCziR5+H58Sxntq6lnWFKVG
	TuOcl+m6wN/AmWNNQivvS2KAnZPjnsEQMq1r0M+fy6MPMUBZYZPfvm60UXUXWTLibZek3qL4DFAgP
	OUhVSrvLrMdvU9aZHJCs6UI/scEk5GeZlxad5ne6D9jRS/n3O0YXOCNU+4HusrHRs9Bn7MCFnyb3O
	y/j8YfyCq9Fb2DnJhprMPaDAtUJDorNm1pZLMJjny5w35Mz2yzyt8w2Jh+d8dsBqEtqq1zML3eYbR
	OmxVCVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgkl-00000005dAg-47Lx;
	Fri, 20 Dec 2024 17:25:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeiA-00000005Hom-0gB0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:14:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso1548300f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 07:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734707680; x=1735312480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/FJ/BWMcAeSqIEo73tjEOakYKuswlMcLnlIzYTAvbU=;
        b=am5K1dyRyL7Tx1tw7WKid5PeaRRDBYQjNjQ275syRJ5FGrAJzrrMsIQvsq5TQTg8kr
         Vru3KYXo7nvJrXHrS/2yloNjWuK6Xylsnk754xJbfsf9xcj4gT1NDK0VOEg4gnKV1WzB
         7S6srg3f0QFCkoejXlCrDbW7JFy93+kbLMMhu7nhjWg1U0Y6WSSHOYMX+LqPzz86S4Zg
         yna1BH+Kuq/GYaadDrdycT1ejyJyWEaMx+/P6jcVmMkLDJTtS5ZlpCSUBlG+uDywqhLg
         Pnv5tXdodsOjm90sD6WWXV4j0n0BkGJiuLoiAN8u/NS2u1i4964RRN0uhc5fg1+Pmc/a
         1djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707680; x=1735312480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/FJ/BWMcAeSqIEo73tjEOakYKuswlMcLnlIzYTAvbU=;
        b=T9O/wAb12K4jVIqNUhfekI68nqZ6YtfZ9xYeDULu8Ct0xsxd7+HZOgnp0QvNs0XDFQ
         Dz1r30n2VgMZ7TwbshShi+P9wTS5F8k2X/Mqf4IkM0Xvcpeeh4dcnWSLTW0F8Uex3KIy
         x5DGxJSignveSfOQLiEuJZH/oXyx7ULqM7iUVOhHiEhCJyMkkbFF/2tlaE2zj7nT3h/h
         I1RjKCs9HTzTex0DLLPzxkz6W7SmLCORt7RILwjUwNFTddS9BsoegqlCBB9GnFOmXnEQ
         hr1MafMdGbcSuPuu0ftY+PccFG/PXmC/3gjPwsAIblSdph6zxnso3LyO30Xhj9+x1cm6
         v8gg==
X-Forwarded-Encrypted: i=1; AJvYcCUV+rEJnw3ad+UQbH2keK+KqyvYDaY30SFg0v0/ufF2dip8iwIsP6SXfCxtvKV+cXKWgDTqvsgKZzGb+5RZHy5h@lists.infradead.org
X-Gm-Message-State: AOJu0YwHP9J8DY5/Zes7rduJjhCaWHjXudI7U/PQ5PTedxNODojw0kgQ
	4uk+hgDOB0FH5M5cj8i4icHsMJiLl6YnDnpS6bfXqq9O72hNRdV/cqvqFnjcOw==
X-Gm-Gg: ASbGncuyH5+4ed49LjfrBLV2TV+HPIWqJUQ5FxdXQIIT3m358/SS9LLnmqib+FYLm0z
	0wBFS7wNl6RWXmivxeKu9FHNjLG2ZEeM7Sx5UGWhv2bbeojx92aaz5qp0zt7QLeesraxNMTEse3
	+JrAiTs7Vy+OToDTihlLmK7N3AbupitcAYiBRkB71hi3Qh/Rq+hF+MUqRES/1VDdzTlRJShtRQo
	xiEw3B893L9aVG9pqlg+uPqYo6RRSFMv5DAbmRRcK8ugIhJGlTw6zR390Voe8x+O9A+tX/cCYqv
	ZnKFLEjmuj5vCjg=
X-Google-Smtp-Source: AGHT+IEG5BXn0iGAPBX0qNzaXa7+CoRYPQ9C8lBuFf1IDtIo1tsZXMYQwfRblUjictWqaHhz0sRuhA==
X-Received: by 2002:a05:6000:4a12:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-38a221fa0cdmr2976447f8f.32.1734707679558;
        Fri, 20 Dec 2024 07:14:39 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f05fd7csm185283966b.172.2024.12.20.07.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:14:39 -0800 (PST)
Date: Fri, 20 Dec 2024 15:14:36 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Selftest for pKVM transitions
Message-ID: <Z2WJ3F0qiqvV3qTw@google.com>
References: <20241129125800.992468-1-qperret@google.com>
 <20241220141321.GA26794@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220141321.GA26794@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_071442_202963_CCD87B48 
X-CRM114-Status: GOOD (  28.71  )
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

On Friday 20 Dec 2024 at 14:13:22 (+0000), Will Deacon wrote:
> On Fri, Nov 29, 2024 at 12:58:00PM +0000, Quentin Perret wrote:
> > We have recently found a bug [1] in the pKVM memory ownership
> > transitions by code inspection, but it could have been caught with a
> > test.
> > 
> > Introduce a boot-time selftest exercising all the known pKVM memory
> > transitions and importantly checks the rejection of illegal transitions.
> 
> Thanks for doing this!
> 
> > 
> > The new test is hidden behind a new Kconfig option separate from
> > CONFIG_EL2_NVHE_DEBUG on purpose as that has side effects on the
> > transition checks ([1] doesn't reproduce with EL2 debug enabled).
> 
> Hmm. What does a test failure look like without CONFIG_EL2_NVHE_DEBUG
> enabled? Do we still get file:line information?

Nope, sadly we don't, but if you get a failure after turning on that
config then you can at least be confident there is a problem with your
code :-)

As discussed in the other thread, once we get the hyp state into the
vmemmap (I've got patches that do exactly that, happy to send them out)
we could just plain remove the 'skip_pgtable_check()' logic, and then
I'm not opposed to merging CONFIG_PKVM_SELFTESTS and CONFIG_EL2_NVHE_DEBUG
together as the latter won't have the same side effects.

> > +void pkvm_ownership_selftest(void)
> > +{
> > +	void *virt = hyp_alloc_pages(&host_s2_pool, 0);
> > +	u64 phys, size, pfn;
> > +
> > +	WARN_ON(!virt);
> > +	selftest_page = hyp_virt_to_page(virt);
> > +	selftest_page->refcount = 0;
> > +
> > +	size = PAGE_SIZE << selftest_page->order;
> > +	phys = hyp_virt_to_phys(virt);
> > +	pfn = hyp_phys_to_pfn(phys);
> > +
> > +	selftest_state.host = PKVM_NOPAGE;
> > +	selftest_state.hyp = PKVM_PAGE_OWNED;
> > +	assert_page_state();
> > +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
> > +	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
> > +
> > +	selftest_state.host = PKVM_PAGE_OWNED;
> > +	selftest_state.hyp = PKVM_NOPAGE;
> > +	assert_transition_res(0,	__pkvm_hyp_donate_host, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> > +	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
> 
> Should we recheck the unshare transitions here?

Yep, sounds like a good idea.

> > +	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
> > +	selftest_state.hyp = PKVM_PAGE_SHARED_BORROWED;
> > +	assert_transition_res(0,	__pkvm_host_share_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> 
> We could check unshare_ffa here.

Sadly no, unshare_ffa() isn't super smart, it'll only check that a
page is SHARED_OWNED from the host's PoV and turn it to PAGE_OWNED. So
we'd break the state in this case :/

> > +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> > +
> > +	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
> 
> Is it worth trying an extra pin + unpin?

You mean doing pin > pin > unpin > sanity checks > unpin ?

I guess that would test that we can indeed stack the pins, so sounds
like a good idea too.

> > +	WARN_ON(!hyp_page_count(virt));
> 
> Can we assert an exact value (e.g. count == 1)?

Sure.

> > +	assert_transition_res(-EBUSY,	__pkvm_host_unshare_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> 
> unshare_ffa again here.

Same as above.

> > +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> > +
> > +	hyp_unpin_shared_mem(virt, virt + size);
> > +	assert_page_state();
> > +	WARN_ON(hyp_page_count(virt));
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> 
> Is this block actually testing anything new? Once we've asserted the page
> state and checked the refcount, the transitions seem redundant to me.

The idea was to check if the previous transitions had other sad effects
not visible through the <state, refcount> pair that would cause
problems. But I guess that is a bit far fetched so happy to remove that
part.

> > +	selftest_state.host = PKVM_PAGE_OWNED;
> > +	selftest_state.hyp = PKVM_NOPAGE;
> > +	assert_transition_res(0,	__pkvm_host_unshare_hyp, pfn);
> > +
> > +	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
> > +	selftest_state.hyp = PKVM_NOPAGE;
> > +	assert_transition_res(0,	__pkvm_host_share_ffa, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
> > +	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
> > +	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
> > +	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
> > +
> > +	selftest_state.host = PKVM_PAGE_OWNED;
> > +	selftest_state.hyp = PKVM_NOPAGE;
> > +	assert_transition_res(0,	__pkvm_host_unshare_ffa, pfn, 1);
> 
> Try it twice?

Sg.

Thanks!
Quentin

