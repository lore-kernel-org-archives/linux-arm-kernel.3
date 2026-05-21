Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4ACCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 21:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEpxywtKvyKc8pR0UbQITNwH/Hn/3Ki68Ju72Ok+Xeo=; b=PvaL1d2amd8xjLMGda5y2g6WkJ
	MchxZ1n61z4jWjY1bZpa52Z/hbUt8mLnA4LGSvtkcuy/1cCp3OGFAHcNnMZFG1o0bsAJfAKGxn2q3
	/fD9+BZCs0jpsfXRBvpLwdBPuiIcpxYQt2hwUMF7Qkoc6iDjm2sNUkKfQhskvkobvXFGN7gdnbLhC
	qIE4PqKNmPSlys53TVLHL/GpkW84wpK37GCRJtyQ95j3Ioe0BXuNlq9gLkT0V9m2rDJ7xwxNaavKx
	8aWfg3A0CZSKwTtbnUYjap11MEst1sfN4nEe86ny5VKI0CRFc8Drq6zq7EpPBaKo9d+XeaZRN2Pwa
	V/Gg1Cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBDv-000000099q6-0Iu8;
	Thu, 21 May 2026 21:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBDs-000000099pL-2U6q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 21:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AB4D43E1B;
	Thu, 21 May 2026 21:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF031F000E9;
	Thu, 21 May 2026 21:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779399991;
	bh=qEpxywtKvyKc8pR0UbQITNwH/Hn/3Ki68Ju72Ok+Xeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KsYqTJ5zyrMd5A1ExmmDtQPu9yHezpY0U/H9UjN/u+a2IHt308AbfEh8k6kDioADF
	 RtCRqizHjDZU5gcWhZhCBkTOQxscLp8rono5FninvrJX74DZUaq1PP4y0QpG917uPa
	 iTdvlO/afgA7iKclb8Ltp9gRFnqX76vvfBTh8iD4=
Date: Thu, 21 May 2026 14:46:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-next@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
 catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org,
 mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, ast@kernel.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com,
 zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 david.laight.linux@gmail.com, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, ashok.bhat@arm.com,
 Boqun Feng <boqun.feng@gmail.com>, Boqun Feng <boqun@kernel.org>, Christoph
 Lameter <cl@linux.com>, Ingo Molnar <mingo@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v11 1/2] kunit: add tests for smp_cond_load_*_timeout()
Message-Id: <20260521144629.11ee1e2ff88c5387a589f54a@linux-foundation.org>
In-Reply-To: <20260521083038.134260-1-ankur.a.arora@oracle.com>
References: <20260408122538.3610871-15-ankur.a.arora@oracle.com>
	<20260521083038.134260-1-ankur.a.arora@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_144632_661801_500B0D82 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, 21 May 2026 01:30:37 -0700 Ankur Arora <ankur.a.arora@oracle.com> wrote:

> Add success and failure case tests for smp_cond_load_*_timeout().
> 
> All of the test cases wait on some state in smp_cond_load_*_timeout().
> In the success case we spawn a kthread that pokes the bit.
> 
> Success or failure cases depend on the expected bit being set (or not).
> Additionally in failure cases smp_cond_load_*_timeout() cannot return
> before timeout.

Your title "kunit: ..." implies that this is a kunit patchset.  ie, and
to my mind, this implies that the patchset makes changes to kunit
infrastructure.  This isn't the case, of course.

>
> ...
>  
> +config BARRIER_TIMEOUT_TEST
> +	tristate "KUnit tests for smp_cond_load_relaxed_timeout()"

The patchset which attempted to add smp_cond_load_relaxed_timeout() was
titled "barrier: ...", which is a more appropriate identifier for this
patchset.

Anyway, I removed the series "barrier: Add
smp_cond_load_{relaxed,acquire}_timeout()" from mm.git on May 19 for
forgotten reasons.  So I suggest that the series be respun and resent,
with these two test patches included.

Again, I'm really not the guy to be handling these patches.  But a 4-6%
performance improvement in real world workloads is not to be ignored.

Not by me, anyway.


