Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C63ECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcCXnVQiTv87c83uMCOhKpmcG132oZ4yEroQZJRE6Vg=; b=emfHCXCRk6NQrisY8itVfJDw4x
	XlSAkTuRjcOBTxms3SZWMOvX73/WwDxr88G7MfMGKvoM0qEG8MZfdhH4vsiVRW0zUwx2M++ksKO6i
	ixGE5vB6Lw51zK9Tmg7+jVq1H2X98qFQpDVdmoculMagqNGjJa/sD9Qd0L++063dBKs8ei51g0Pls
	NN0Jy1gn/uPzt5fmuY4rIxQaelmdlwRRC06BSS5FuQhHFcRa3wdXF4EQk78qKmh97LBf8X79g8pKs
	nz93fY5hbWO0ArGbA8L991JKw3bJKuMoLmq+LKGTYfqQmIKiNqZ431ezbrbx0ob9DlrgYOkNeSBJ2
	wiJ1gEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EQX-000000043kC-1BRk;
	Fri, 26 Sep 2025 19:48:21 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EQS-000000043g7-3y4F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 19:48:20 +0000
Date: Fri, 26 Sep 2025 12:48:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758916091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rcCXnVQiTv87c83uMCOhKpmcG132oZ4yEroQZJRE6Vg=;
	b=POPEo2iWzU5R2kWw/ncMdbf9yl2uLwd2e9r5U6pnAGChPPq6PZs1NcZGeRxWAl+8DRN/My
	q3Q95t4QPprtpr0KydCef0v3wVWevF52BW+M5j8NeEsSxLTlOdu5ng5tl2QfEJd8ET60ha
	vj4JjTdWTTwNi9evL0zS3/X82YQ9iMM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: Re: [PATCH] KVM: selftests: Track width of arm64's timer counter as
 "int", not "uint64_t"
Message-ID: <aNbt9NH2iVLPeIDX@linux.dev>
References: <20250926155838.2612205-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926155838.2612205-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_124817_422368_52DC6821 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 26, 2025 at 08:58:38AM -0700, Sean Christopherson wrote:
> Store the width of arm64's timer counter as an "int", not a "uint64_t".
> ilog2() returns an "int", and more importantly using what is an "unsigned
> long" under the hood makes clang unhappy due to a type mismatch when
> clamping the width to a sane value.
> 
>   arm64/arch_timer_edge_cases.c:1032:10: error: comparison of distinct pointer types
>      ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *'))
>      [-Werror,-Wcompare-distinct-pointer-types]
>    1032 |         width = clamp(width, 56, 64);
>         |                 ^~~~~~~~~~~~~~~~~~~~
>   tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
>      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
>         |                                                  ^~~~~~~~~~~~
>   tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
>      33 |         (void) (&_max1 == &_max2);              \
>         |                 ~~~~~~ ^  ~~~~~~
>   tools/include/linux/kernel.h:39:9: note: expanded from macro 'min'
>      39 |         typeof(x) _min1 = (x);                  \
>         |                ^
> 
> Fixes: fad4cf944839 ("KVM: arm64: selftests: Determine effective counter width in arch_timer_edge_cases")
> Cc: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

In the absence of a __careless_clamp() :)

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

