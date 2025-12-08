Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B15D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPXwGwvEAAx1QdhY0az6JjqaxPOleQ46LMOtvOvZTJE=; b=b8TuY+Qm5tCZrbhAxPoXgb/Sek
	2DZbBI2H4hu4WvCZfk/bTPWSj4W4dCbBUprM5ZPuT0h4Efxzt2XRoergErC+StEga40D9a1JjVIPc
	KPfOa/7SiWZ22zsJbItDiry79tT+pMfLxcGou2aZnZStpAq0dp+go+WGU6wX26yR0QFmX6uA9LoYs
	ow5vhGxbl23SXfb/ITnDjH1E84tEI3Pi+0tTg6Ph/G2FUrEEAOBSHaNkAIXi8lI9FTEVOqWyQwfql
	QRnI/KX1NfmTUEymL9MReYMHBGILFCRBRIQy5uzT8/Tn0kwpKlQQJowmiKSWBV6y1g+xST9HO0l6B
	+Fv5LktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZmd-0000000D1nC-06mv;
	Mon, 08 Dec 2025 11:52:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZmb-0000000D1mo-1527;
	Mon, 08 Dec 2025 11:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iPXwGwvEAAx1QdhY0az6JjqaxPOleQ46LMOtvOvZTJE=; b=oZb0VXakegLWXQ5mbsFuowE7GM
	DV34MR9DukwCZjUTx8pB/UtWn7yzdSsZgCfI8rfgihkL7mKaA5tuiBmo0kHZPfq/dZnSFY0+kEqUe
	cAU+NExfBqZ3SLOaQJDsBd6kgaHEESbSKU0TPNvPiH3GDJohzU9/m0PDPAJNrujeN0rF4ZmLFAgL4
	O0rhb5HB06eAuj11P/DfJQ9tH1k3SPKG9S6ZfQUHHo41QlumJOsPf6iWl1NCDUFvGfYVaQzogMQAM
	q+J+KTnlnUaPGrJ0IJhvALjg9pQPoLk/z4TcES7CdMXs3ExRkhx9iI2dyI5Nj9+GcqpObncERbfnL
	s8qIDapg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZmX-00000009jjc-1PBF;
	Mon, 08 Dec 2025 11:51:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6040D30301A; Mon, 08 Dec 2025 12:51:56 +0100 (CET)
Date: Mon, 8 Dec 2025 12:51:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Mingwei Zhang <mizhang@google.com>,
	Xudong Hao <xudong.hao@intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Xiong Zhang <xiong.y.zhang@linux.intel.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH v6 04/44] perf: Add APIs to create/release mediated guest
 vPMUs
Message-ID: <20251208115156.GE3707891@noisy.programming.kicks-ass.net>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-5-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206001720.468579-5-seanjc@google.com>
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

On Fri, Dec 05, 2025 at 04:16:40PM -0800, Sean Christopherson wrote:

> +static atomic_t nr_include_guest_events __read_mostly;
> +
> +static atomic_t nr_mediated_pmu_vms __read_mostly;
> +static DEFINE_MUTEX(perf_mediated_pmu_mutex);

> +static int mediated_pmu_account_event(struct perf_event *event)
> +{
> +	if (!is_include_guest_event(event))
> +		return 0;
> +
> +	guard(mutex)(&perf_mediated_pmu_mutex);
> +
> +	if (atomic_read(&nr_mediated_pmu_vms))
> +		return -EOPNOTSUPP;
> +
> +	atomic_inc(&nr_include_guest_events);
> +	return 0;
> +}
> +
> +static void mediated_pmu_unaccount_event(struct perf_event *event)
> +{
> +	if (!is_include_guest_event(event))
> +		return;
> +
> +	atomic_dec(&nr_include_guest_events);
> +}

> +int perf_create_mediated_pmu(void)
> +{
> +	guard(mutex)(&perf_mediated_pmu_mutex);
> +	if (atomic_inc_not_zero(&nr_mediated_pmu_vms))
> +		return 0;
> +
> +	if (atomic_read(&nr_include_guest_events))
> +		return -EBUSY;
> +
> +	atomic_inc(&nr_mediated_pmu_vms);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(perf_create_mediated_pmu);
> +
> +void perf_release_mediated_pmu(void)
> +{
> +	if (WARN_ON_ONCE(!atomic_read(&nr_mediated_pmu_vms)))
> +		return;
> +
> +	atomic_dec(&nr_mediated_pmu_vms);
> +}
> +EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);

These two things are supposed to be symmetric, but are implemented
differently; what gives?

That is, should not both have the general shape:

	if (atomic_inc_not_zero(&A))
		return 0;

	guard(mutex)(&lock);

	if (atomic_read(&B))
		return -EBUSY;

	atomic_inc(&A);
	return 0;

Similarly, I would imagine both release variants to have the underflow
warn on like:

	if (WARN_ON_ONCE(!atomic_read(&A)))
		return;

	atomic_dec(&A);

Hmm?

Also, EXPORT_SYMBOL_FOR_KVM() ?

I can make these edits when applying, if/when we get to applying. Let me
continue reading.


