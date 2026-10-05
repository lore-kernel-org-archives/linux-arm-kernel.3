Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9441ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXAyPFGuOfJvky6xwcn7tskfN6n5dL/Z9O3DSglTcqs=; b=U+ceWh7qc+om6QE6ldkk2lRn1Q
	3uq6OttC18S+OhYrQcdKgoIRdCzKzTiOWYpLT1FwHwtOBGtwjn7LabliskAHr+72T6IMszDL4rKmg
	Ebi+3YUsDVwZhVxrxjfjbdy2JDmoKvYBM2BR2EkBZNMo60RX+uO/gRem4P2XoiMam6E88Z6eTv7IW
	uQ1b40+BOQQQ2RF1DfilwjKEfCDte8ykWYGe/rkDbGaY5xszdgTSTYXBbLLrT7qruLmYhCIt1F0mW
	6DVm+rrKX7gmHtMHEn4FglHJxC1ldfh/1ClyNV9pwfudlf7rTPylvSOKByo4UxJ+oHRXMRvO8gRrO
	ud9vveew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjUv-0000000GcSr-0iqN;
	Mon, 05 Oct 2026 14:16:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjUs-0000000GcSC-1atL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 14:16:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1826F152B;
	Mon,  5 Oct 2026 07:16:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7F253F66F;
	Mon,  5 Oct 2026 07:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791209813; bh=g/PvErAkWqPLLMhfdp6s6oupiEeHn6mW6CPEnvMmZuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgzHUU6flQh4WV6N8wrHBOjkrnfRN1RjtIvlMsJTgnfprNOTNrWuI3ZbDwgLxQR6u
	 v7S8MV4n/CktpjfTJ9ZhjsMfIcAKAAGxPtN1AqraVPnHJIKph8wN59edTO4IJ6CtLR
	 dvUlUakISZh2+PUjuHQ8j7SIV0IRr3EekSiHKrfE=
Date: Mon, 5 Oct 2026 15:16:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)" <bpf@vger.kernel.org>,
	"open list:MEMORY MANAGEMENT - CORE" <linux-mm@kvack.org>
Subject: Re: [PATCH 0/7] arm64: Batch PSTATE.TCO handling in kernel nofault
 loops
Message-ID: <asOxRkayznzX-K4c@arm.com>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824160523.3907021-1-usama.anjum@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_071654_494515_9D2ECF2F 
X-CRM114-Status: GOOD (  14.27  )
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

On Mon, Aug 24, 2026 at 05:04:45PM +0100, Muhammad Usama Anjum wrote:
> With Hardware Tag-Based KASAN in asynchronous or asymmetric mode, kernel
> nofault loops currently set and clear PSTATE.TCO around every access.
> 
> Introduce bare nofault accessors, batching hooks, and an internal scope
> guard. Convert maccess page-fault cleanup to scoped form. Skip
> page-fault setup for zero-sized kernel nofault copies and zero-length
> BPF string operations. Then use bare primitives in the maccess and BPF
> loops. For non-empty operations, this reduces the code-derived dynamic
> MSR TCO execution count from 2N to 2. Two-string BPF comparisons fall
> from 4N to 2.
> 
> The BPF changes and an earlier maccess implementation with explicit
> cleanup were tested with QEMU arm64 using Hardware Tag-Based KASAN in
> synchronous, asynchronous, and asymmetric modes. All nine arm64 MTE
> kselftests passed in each mode, as did the 138 focused BPF string_kfuncs
> and varlen subtests. The focused BPF tests also passed with the default
> non-MTE arm64 CPU model. Both final maccess scoped-guard patches were
> arm64 cross-built. Runtime tests have not been rerun after that
> conversion.

TBH, I fail to see the benefit. There's a reduction in the number of
MSR instructions executed in async/asymm mode but does it result in any
improved benchmark numbers? Which workload hits these loops often enough
to matter? They are mostly used by tracing and debug code.

AFAIK, most people wanting to use KASAN in a non-debug environment want
to go for sync mode, where there is no MSR and this series only saves a
few NOPs. We might as well go for a config option to force sync mode (or
off) and remove the unnecessary NOPs, *if* you can show any performance
improvement.

-- 
Catalin

