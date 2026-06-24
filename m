Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715D8CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oA6wZjbHNuBs3YUsSuPciAzSckCSWyOtrSzRhAiMkj4=; b=izJkqiJA/9JxtPa+2xOXWih2Sc
	NYi9Mn1UUMC2j+R544aS5OAMNqsND6DJyH/Yua/WntkDOmUnXXDEMGeajJW+kCyzMQK2vgORtOWO4
	OTIIGTHlW2xPzTVzsO22VDd6tfYcl3HLxt8odofZ+/FT6o6IB+jc9SA9fRbhd8kLStD+fL010bXYx
	xcp/wSxmfwdUzQhpDDp8VO+7Q1rGqSv/+LGIxS3UbpRCm481mp9q0Wovvm6v+tI8FdlsJ1eTeZryE
	cgjstXNkl0yfs4R12MxXQn+Tc1Eg3N/fR3v1owXLqliQBuAx8vEmLXa1OfsJhWQ2N8pDEuyCgdRA5
	C679ypDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRUm-00000008AwO-3vlZ;
	Wed, 24 Jun 2026 17:34:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRUm-00000008AwI-1SU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 17:34:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73A78600C3;
	Wed, 24 Jun 2026 17:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E891F000E9;
	Wed, 24 Jun 2026 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782322479;
	bh=oA6wZjbHNuBs3YUsSuPciAzSckCSWyOtrSzRhAiMkj4=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=VvLtPgNjR72rxyp1YaL4PbTZu5mEarYNke2LP8vmzpc69QnB51kgOKRBboqTFdE4u
	 HDWZVlhbRiBuIHNQOe80E+zfML/92LjHbAZMi6agyH+0d/AKq6r94zJ62P9G1WQDD/
	 /i7dVAp5OL3SrnnGAE2YvKRKemVm3tC80M+iUEWDcPY7Xq0GtD+YJ7Xlshd4+rKCBU
	 LORScmwbjejcDxU+fADkdv03jDed2yb0yxxDWxEPyB4ewzM3/bKS0QPvXH8DGLMwaD
	 O7UONfxvm4UnfE1YI12VY3z1GxoHX1pJL9mPJcLSNGbXX4DE8ZjkcEarWn0aTWGvSy
	 etuIaZqXz1W9g==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, peterz@infradead.org, luto@kernel.org,
 kees@kernel.org, wad@chromium.org, ruanjinjie@huawei.com,
 mark.rutland@arm.com, yeoreum.yun@arm.com, linusw@kernel.org,
 kevin.brodsky@arm.com, ldv@strace.io, thuth@redhat.com,
 james.morse@arm.com, song@kernel.org, ada.coupriediaz@arm.com,
 anshuman.khandual@arm.com, broonie@kernel.org, ryan.roberts@arm.com,
 pengcan@kylinos.cn, liqiang01@kylinos.cn,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 01/11] entry: Fix potential syscall truncation in
 syscall_trace_enter()
In-Reply-To: <20260511092103.1974980-2-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-2-ruanjinjie@huawei.com>
Date: Wed, 24 Jun 2026 19:34:35 +0200
Message-ID: <874iirlu50.ffs@fw13>
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

On Mon, May 11 2026 at 17:20, Jinjie Ruan wrote:
> In syscall_trace_enter(), the current logic returns "ret ? : syscall".
> While __secure_computing() currently only returns 0 (allow) or -1 (kill),
> this "ret ? : syscall" pattern is conceptually flawed.
>
> If __secure_computing() were to return a non-zero value that isn't -1, it
> would unintentionally override the actual system call number. This logic
> is redundant because if seccomp denies the syscall, the execution path
> should already be handled by the caller based on the error return, rather
> than conflating the return code with the syscall number.
>
> Fix it by explicitly returning the syscall number. This ensures
> the syscall register remains untainted by the trace return values and
> aligns with the expectation that seccomp-related interceptions are
> handled via the -1 return status.
>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Fixes: 142781e108b1 ("entry: Provide generic syscall entry functionality")

What's fixed here?

A potential future change of the __secure_computing() return value
requires that _ALL_ callsites of that function have to be audited
and fixed up, no?

So the change is not a fix it's an optimization to get rid of the extra
conditional.

If you really want to sanitize this, then change the
__secure_computing() return type to boolean (true = allow, false =
fail) and fixup the two dozen or so call sites.

Thanks,

        tglx

