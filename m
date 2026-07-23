Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE1EC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gl83NMyq+s3gbl2Tp74bU9xdnH6nJ4JMTF1QkNTBKrk=; b=UGCXnBtDPPtjAGJdk5hJN2fnDf
	bAe2R1r3vjTE1tr0sgF/31AUd69O8mQHH4T9SmDfz2xgJVT03C/2y5C6LTwRYprO+CZrxaubmwFaZ
	WeTrmIdAFQ+6IMWvV29dEzhDWcrYK0rAA90ADvWJqTDqT5vRXafO/Z/wW9URh8DZ4mFICwQ12KBqE
	trUiOREFMTcBHUnsgevmps9bfc7hZxN9jBilEURXWT9MVZ9jeF02WVbfBszNnvxjT6RVomDgz7dQT
	mx5WGrYD6HJIDOwMbkvDOj7jEKXt4p/Y6aCNJaCqJ0xYC8/sN+AwK+HwM+vuCE2QO/AUCe80Mwb9m
	Vjzs3i8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwJp-0000000EjCs-1X6N;
	Thu, 23 Jul 2026 16:30:45 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwJm-0000000EjC6-3mjy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:30:44 +0000
X-Forwarded-Encrypted: i=1; AHgh+Ro9j70MRyuqgCR7lwbXkUfamulL87bNYxhE0+RpwyrJlhsHh9qoRgrtIM2zA2UMhFckXeoOykq5Hd339y9emirx@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784824239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gl83NMyq+s3gbl2Tp74bU9xdnH6nJ4JMTF1QkNTBKrk=;
	b=djgjXJQ19tLbP4tC/GvUwtACVqR2ndse5CBrDohxA8NB8sCjDgwTJmLzSkQanChE8/ZoHv
	0Zdj1oCti7wXdoNGq4yDofSRKyKGMXLp4n9D1RUgJ5Wz5ca1Eqx7qUqUjTuu3MjTenXEY7
	HkyOjfrT3bMSoRM/U1A9g1AgLuZd1Gk=
X-Gm-Message-State: AOJu0YxzNlDuzBLO4+553kvghYC9OJO2etl13nQzPBdxlmQm0iBZKq2W
	00xFpNa3122lNmWhalWtqMLNo6Sub4spKM188cvXrTGy6CtVn2UfH0+ZVugeq3M6NfyITi4K7d5
	XSMi/cmm3f9ok6BLvdi25VC+TJ1AXIWRt/J4mG8pN
X-Received: by 2002:a05:622a:134c:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-5283d81a915mr9160761cf.13.1784824207475; Thu, 23 Jul 2026
 09:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260723162002.3848054-1-smostafa@google.com>
In-Reply-To: <20260723162002.3848054-1-smostafa@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 23 Jul 2026 17:29:30 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx0fU8uL0pop=faUv7PW9=8dS1CHbn0DdMQdHcCwxOefw@mail.gmail.com>
X-Gm-Features: AUfX_mxA_nKRECz2-8RwfmQfgOzLkEwARqpAv0FN4JNQqX6QCq1Eo0mlzwuphto
Message-ID: <CA+EHjTx0fU8uL0pop=faUv7PW9=8dS1CHbn0DdMQdHcCwxOefw@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Optimize protected mode with FWB and DIC
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_093043_091716_5A674BCB 
X-CRM114-Status: GOOD (  18.19  )
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

On Thu, 23 Jul 2026 at 17:20, Mostafa Saleh <smostafa@google.com> wrote:
>
> KVM opportunistically enables FWB if supported by the system for guest
> VMs, which allows it to elude cache maintenance for data as they are
> forced to be cacheable from stage-2.
> In that case, __clean_dcache_guest_page() will immediately return.
> However in protected mode, before calling __clean_dcache_guest_page()
> it loops over the range and fix_map/unmap it, issuing TLB
> invalidations, dsb() and isb() unnecessarily.
>
> This can be optimized by returning early if FWB is supported,
> kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
> functions issue dsb() for the unmap path.
>
> Similarly for DIC, we can omit the call in
> invalidate_icache_guest_page()
>
> No isb() needed as ERET is context synchronization event.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 4e329e39a695..39aa8911f62c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -261,11 +261,18 @@ static void __apply_guest_page(void *va, size_t size,
>
>  static void clean_dcache_guest_page(void *va, size_t size)
>  {
> +       /* See comment in __clean_dcache_guest_page() */
> +       if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> +               return;
> +
>         __apply_guest_page(va, size, __clean_dcache_guest_page);
>  }
>
>  static void invalidate_icache_guest_page(void *va, size_t size)
>  {
> +       if (alternative_has_cap_unlikely(ARM64_HAS_CACHE_DIC))
> +               return;
> +
>         __apply_guest_page(va, size, __invalidate_icache_guest_page);
>  }
>
> --
> 2.55.0.229.g6434b31f56-goog
>

