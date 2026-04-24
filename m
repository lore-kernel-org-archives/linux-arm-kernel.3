Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E28DFED3CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ll/7QDQptcL0pa2z87xfVtB+Id23gnpjFd9LIew100=; b=VERlqZfNIN+waFNBCI3rmwyLtm
	MlpUDiIcd/kZyMJZmxJcqkBhdPcVSdykHsRK0amPTOR8S4ppEqNpSGzZWTD4C+EyFl0+vt8TvQB8K
	U5J2ftNaKVaCczXWnE1mptB/BT0ChiZJiqVylNO48keRis7Vy8pOfd8lIOzRnjfIFh5FZpv18LHSx
	CektQZJOdkYkfeI/J4vGjpP3rDgHXJdLQ1dlNUJ+DN6zjgoPaqOp3CZi7XrelW4ih9k8gBHWgfdWh
	DxCrDy7krv6fGD28rWmny0vuyMEuB89ZonOL25+p7x2xhF10+ujZcuK4MnTy18DpVhUKI67Lu8MAB
	QsqdLuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHWW-0000000DKXZ-0WFe;
	Fri, 24 Apr 2026 14:28:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHWV-0000000DKXT-2N24
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 14:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A4DD6001A;
	Fri, 24 Apr 2026 14:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C434C19425;
	Fri, 24 Apr 2026 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777040927;
	bh=JOLAjUJZxkORvwjV4KMyJPPQMlPzeGI+Xzat5mLfNAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O/Y3cojLauCIDvWwjW8Rm82ldPv3YcF1tPNTv5blC/JP9MAXmk+S1E/ixk8QGUnSZ
	 uNi6C8iJUYmCjyfO1nsdEVAGvuO8qVfAIFXa6DJd354zWaVct5od0w3QdENXrPAFNb
	 ad9f0JF2uEcsiwTOBisrjCjaT8bU4mViiybAgp7U=
Date: Fri, 24 Apr 2026 07:28:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com,
 will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 david.laight.linux@gmail.com, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, ashok.bhat@arm.com
Subject: Re: [PATCH v11 00/14] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-Id: <20260424072845.5eba94c2d732204f143b8629@linux-foundation.org>
In-Reply-To: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
References: <20260408122538.3610871-1-ankur.a.arora@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed,  8 Apr 2026 17:55:24 +0530 Ankur Arora <ankur.a.arora@oracle.com> wrote:

> The core kernel often uses smp_cond_load_{relaxed,acquire}() to spin
> on condition variables with architectural primitives used to avoid
> hammering the relevant cachelines.
> 
> ...
> 
> Accordingly add two interfaces (with their generic and arm64 specific
> implementations):
> 
>    smp_cond_load_relaxed_timeout(ptr, cond_expr, time_expr, timeout)
>    smp_cond_load_acquire_timeout(ptr, cond_expr, time_expr, timeout)
> 
> Also add tif_need_resched_relaxed_wait() which wraps the polling
> pattern and its scheduler specific details in poll_idle().
> In addition add atomic_cond_read_*_timeout(),
> atomic64_cond_read_*_timeout(), and atomic_long wrappers.

AI review has been busy:
	https://sashiko.dev/#/patchset/20260408122538.3610871-1-ankur.a.arora@oracle.com

