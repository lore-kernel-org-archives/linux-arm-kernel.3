Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8085CD49C93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgUndOypNLu/9KFaBCQS1R11yWA4Ey0kMJOvTLtFBNU=; b=5AA5HZMMCjavLdz6ok6YQKzPfX
	SBfeW8zvgkiksDvBaQPXm28UvrHlb5wahb8h9JWLT+j954dXsVfEiPfOGmo+7Lhqr+F5p7bT6iJqB
	sKmSTbb+x6D+58vq5jwZrWFNbpm/VD6lH1mH78JJKnYOVw7YQlPjGjELoyEbZaThrP7aUM00+U9Gd
	z4/rYUIs0Y0ypDKR6Sud3ctLvDtdLbh4PKUjnm30H7NqTIS3LcvfbylhZUWqNPWfnQvVHF6VbbtUe
	cLiyYnhVo5eChMxWwbvxf00Fi7R9QIE5vveUBtgVe74LA74jId99tJLkR1n6F9qUw/FfmMFkZaCKK
	Vw8dgRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllTc-00000001Iaq-2bv2;
	Fri, 30 Jan 2026 10:11:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllTa-00000001Iac-3DA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 10:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CC0A6001A;
	Fri, 30 Jan 2026 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A36C4CEF7;
	Fri, 30 Jan 2026 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769767901;
	bh=9MLMNv6i/VETsajuHB63tIw1p1yq5Nm0ZcNMwIX7BuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DdFuT2+VHs6kZg8CD5iPcNfYkkCu0NIDtSMa4iYCb+f5bAx+3oS0UcEGevaYTYpUN
	 N3xhfjgdq5UoBg3emDII5zo6WtOq7OYzY+apggaXyNg856pBizL6BNjeHAxj9qqp5n
	 0yNfOhA0u3ynkPfzpGdiwZ+JBs12LKZGIIfSIVS+oTs3vxd+WtHuCZQ3ZrSba+mIdh
	 +rUhAe2Ragr0DoPnsHEiC7JMFbUt84yD6W3OLpgL6V0Avk0k013+UTpdz+mrXkIQPA
	 jbQcH8iliPqJzY+DPiciFor4gNQ5WsNvKWTrUwFh6iQoSfoyOGPRAFiOHF6NVGqAyA
	 wU0R9XQ1Z2yWg==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, peterz@infradead.org, luto@kernel.org,
 shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 kevin.brodsky@arm.com, deller@gmx.de, akpm@linux-foundation.org,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com,
 anshuman.khandual@arm.com, song@kernel.org, ryan.roberts@arm.com,
 thuth@redhat.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v11 01/14] entry: Remove unused syscall in
 syscall_trace_enter()
In-Reply-To: <20260128031934.3906955-2-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-2-ruanjinjie@huawei.com>
Date: Fri, 30 Jan 2026 11:11:37 +0100
Message-ID: <87tsw3l89y.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Jan 28 2026 at 11:19, Jinjie Ruan wrote:
> The 'syscall' argument in syscall_trace_enter() is immediately overwritten
> before any real use and serves only as a local variable, so drop
> the parameter.

This collides with the already queued time slice extension changes,
which rely on syscall to be handed in:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=sched/core&id=dd0a04606937af5810e9117d343ee3792635bd3d

Please drop this for now.

Thanks,

        tglx

