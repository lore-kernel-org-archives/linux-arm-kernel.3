Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2F9C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFdg28cjkK57y5Nms1NhKpYwFl6OCJWFse4hVSZd8CY=; b=dAhq1NnRctWHZM3NXv5d7k/ktn
	DA54vPQ38fiYRasyYFzDchetgED1z95LA4AhdvsXCc4xzowk+Ds1TSx5kvDaAoLmofx7JA7j9F+o9
	kVu2X4dq8OHXrBrk+YDM9S0+Kork1fSi00YVhuzToGmZURvdXZigjnF6X7v5Ag7aNqmdiYaX589wK
	K8HqZcRmh39eAwKrDhuzwY/5Wt6pSBaS5lAyufMH/nLQ2fccFkq5774shFLr4422/2C5uejF52uto
	0JyfQlXTKo0C/gGWdt+NeUbjc2u/M1QG8VSBcSFpuQ/rJDFbU56ce3puuvGZfXpOfV+WD2WHhiCUY
	Am+xG8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsvH-0000000GfS9-0rko;
	Sun, 27 Sep 2026 17:44:23 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAsvF-0000000GfRn-1mBv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:44:22 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1825541f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531059; x=1791135859; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFdg28cjkK57y5Nms1NhKpYwFl6OCJWFse4hVSZd8CY=;
        b=XJd+TGzjoQ0KEXU0ekRkGL0Q9oFiDBo8DqWlMugdrYkIQCqIDXqBIW1Qw9XoIB1OCS
         ijq1g6fi1BfpcMCVkuHkJi6j2Pyl/kkeX+LkPbxfg54oc88YxcOp75ekj52f7ft7At6c
         Qvvbqbid8/Y9YlFv/iv7MeSX1hKr0OHweFbxFkZpzpTxIPq/0iV35DIpuCS/RJHQhfjF
         miTEHm+t+EVIwU6cy5+g5CHPTQZn/rLhXrZQB5VtosTG+UcnoTcUQh2qqpCo7RCFIe59
         drxReorswra6DflpSOdbJbfPaGAvLJiqmpcT6lh8xjwxEwW/mxsSJdMj1dX2EDb79QLj
         MDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531059; x=1791135859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFdg28cjkK57y5Nms1NhKpYwFl6OCJWFse4hVSZd8CY=;
        b=u94Vq9e5QNmg41DV45r0Fqrl36E3zNbGfwZNlojTbAjfc3Jc+B+ReFFnWscdo3oTps
         FZ+SI1EqPrsE65INKP4T0bi2qccvGXqIwyD2qIIPEkZYzWx5tSNb39NTaiGhziRGpQBY
         +6OL+QG57wwJAQbiqWq+O/S/RopLr6SqUmkt3CLoapu08c8FgAlCl545QF7O2ipdqSbO
         LX2rOD0y4+kl+gVRXKf1DAW4+4SsDXGSqIVJATZ4NO13rwtzMiXrxXK1M4eX/mel31zh
         unqvUDVmmCW4t0EWT2HWIUKn0JegryNcWLlIsqvm8mwN+ddARlvW1t8SMT7HlQPurUd7
         bSFw==
X-Forwarded-Encrypted: i=1; AKwUvBykGig7vhImaVG5TBBIgf8MwW0faoL4l+m/A/I9NiimrOXlF2UZiKJKmmU96YCmJaEIx+9YQ19UFBTBsgaHX3Ke@lists.infradead.org
X-Gm-Message-State: AFq9FYIqY9S+FM64fMumK3uKHboo0NiVli8soOM078MMsWRkPRXYjc1G
	Y47XK368xoB+F7f1WA7I57lN8VW1vP0YL6I0exVPoAycLMsb2N2fFhNE
X-Gm-Gg: AYBFou0q7ZwU6/ej7WjIa5IO4bG1I7DncRfXQ/PrGH7HIUREfkNpTXkQmpHQZc5eacy
	AgLPkZkZa0EHQiyRnkUiEdQZK5iav6/H6slYDaJE30DsyOffV0OdDB94bJGmfP2zuQLd9++f2Oa
	y22uUsvQZ/mdTASxvEE8EqvEGwmaHUX5U9xXmH4P9+sQHO3qFwMlwO+Eyoi5lYk/ZkPhD96buD6
	nLHbpZORVHlEcVHwwHrjxJMHth6lfNlbemZiU2u9QflSFVwjlxdeSk5ZLv6bB1FEtuIYKEx7+Hg
	3Rx7jvRcE7q6+k10Fdr6jT/auBbW62IHOc9SFlrnBBvkXGoazyfX0XzwA6i/a/hJrmnqbkDCSyC
	BCMKb/Zf5Dk18ujOmVE+Bzh8RMCCeD7+NF5S+L7DNAGgyXJFBJEAZIiefOQfoWhVLQNR6lbETzi
	nzpj0NFS9KYNXnzubIGpyh3ef8cQBojbzad6Wq/FK07VhD25fDjiSHXGLf7zyHOe77FGsU5ZGlM
	gJHWjDgK8c58ax+cYueAopNdlMrzIFm4uI=
X-Received: by 2002:a05:6000:3105:b0:488:8192:c768 with SMTP id ffacd0b85a97d-4888192c8f5mr13570954f8f.30.1790531059310;
        Sun, 27 Sep 2026 10:44:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a4e9sm18464590f8f.11.2026.09.27.10.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:44:18 -0700 (PDT)
Date: Sun, 27 Sep 2026 18:44:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Biggers
 <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Marco
 Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20260927184414.6c0c8867@pumpkin>
In-Reply-To: <20260927131838.6774-1-demyansh@gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_104421_487632_4532C604 
X-CRM114-Status: GOOD (  20.41  )
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

On Sun, 27 Sep 2026 15:17:56 +0200
Demian Shulhan <demyansh@gmail.com> wrote:

> arm64 currently uses the generic csum_partial_copy_nocheck(), which
> performs memcpy() followed by a second pass for csum_partial(). This
> double pass exerts unnecessary pressure on the L1 cache.

Which workload actually needs this?
Most modern ethernet MAC support checksum setting on transmit and
checking on receive.
So the software checksum shouldn't be needed very often.

IIRC there is also code to defer UDP checksum validation until the
copy_to_user().
I'd bet (a few pints of beer) that the complication this adds isn't
actually worth while.
Even Linus can't remember why it was done, my guess is it improved the
performance of the userspace NFS (over UDP) daemon that would be
doing 8k UDP send/receive (fragmented by IP).

There is certainly still code to checksum data during copy_from_user()
in send().
Last time I looked I couldn't see why send on TCP sockets didn't go through it.
On x86 (in particular) copies can be done far faster than ones that
include a checksum.

David

> 
> Replace it with a single-pass implementation. The new implementation
> provides a general-purpose register path for short buffers and atomic
> contexts, and a kernel-mode NEON path for lengths >= 1024 bytes.
> 
> Measured in-kernel on an Ampere Altra (Neoverse-N1):
> - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
>   4096 bytes.
> On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> 1.6-2.4x above. No length or alignment regresses on either
> microarchitecture.
> 
> Patch 1 implements the fused routines and the dispatcher.
> Patch 2 adds KUnit test coverage for the new API and internal paths.
> 
> Tested: in-kernel benchmark module on Neoverse-N1 with both
> implementations cross-checked (0 mismatches); KUnit suite under QEMU
> (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> testing of both routines against a naive reference with PROT_NONE guard
> pages, gcc 13 and clang 18 W=1 builds, checkpatch --strict.
> 
> Demian Shulhan (2):
>   arm64: csum: Add fused copy and Internet checksum
>   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> 
>  arch/arm64/include/asm/checksum.h |   3 +
>  arch/arm64/lib/Makefile           |   7 +-
>  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
>  arch/arm64/lib/csum-copy.c        | 108 +++++++
>  arch/arm64/lib/csum-copy.h        |  84 ++++++
>  arch/arm64/lib/csum.c             |  54 ++++
>  lib/Kconfig.debug                 |  10 +
>  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
>  8 files changed, 896 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/lib/csum-copy-neon.c
>  create mode 100644 arch/arm64/lib/csum-copy.c
>  create mode 100644 arch/arm64/lib/csum-copy.h
> 
> 
> base-commit: 93f51579e7df248780214094418f205253383cc5


