Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D6CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVg1tKxhR7TlchS1K8aXBpOPhxMyq+E+boeHYf7ACBU=; b=l2vIeFpsxMlz3g
	dfpqR0caZP0r62CIJU5a5Pnl/AijTYmJIqlkCv/wejuWJ7dDMbwXyhvQloFzoQ6NIpeJ7VegJt7m7
	omGcb99F0TEmET/sInBRa5lINisLYv7N2cvNGhuZNzemq/ktkD9j+idF6z68VaqEtpJEho+1d2NNN
	vCgo2Wb8y3PYLRdRSrcf32vPyWYwiJf0BoRE7x/zMZ+8KGqKpzJwJfqB1nb7Of/02c9i3avB+ZbaQ
	j3lMC3X6URqOnhOI+Xcyk0QgALUqTDMcLVnj6Lq46LAyVsOo1JEfGLg+W6sLeKvKGzacou6SzLJ6h
	dE7zeQUrCSyUYGVxlIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNtH-00000007qIZ-0b6b;
	Wed, 24 Jun 2026 13:43:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNtE-00000007qIB-2hPI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:43:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9839D263D;
	Wed, 24 Jun 2026 06:43:34 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5140D3F905;
	Wed, 24 Jun 2026 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782308619; bh=bjymW0o4mMAwwsEwrh9O9s4aXugkRn2RvVRAAj4UCY8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=RK5RURKfdVfWwVYxx8VSUezom3WlWBNUldjJ7TlTqnkDk9Y68d4podFfPoIo7ls62
	 8xghgKOjYnQHMI8R9OFmed8qZVNZqbFKWBIN4BvQoKHuJpsJXiuFhWY2BADk6glDoi
	 +k3FHaFsk76K/0rPyslqV7txO5WsIDFYSzaetL20=
Message-ID: <af2f23cc-331a-4145-abdd-eaa8fe4039d6@arm.com>
Date: Wed, 24 Jun 2026 14:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 04/11] arm64/ptrace: Expand secure_computing() in
 place
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-5-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064340_735913_20110258 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/05/2026 10:20, Jinjie Ruan wrote:
> Refactor syscall_trace_enter() by open-coding the seccomp check
> to align with the generic entry framework.
>
> [Background]
> The generic entry implementation expands the seccomp check in-place
> instead of using the secure_computing() wrapper. It directly tests
> SYSCALL_WORK_SECCOMP and calls the underlying __secure_computing()
> function to handle syscall filtering.
>
> [Changes]
> 1. Open-code seccomp check:
>     - Instead of calling the secure_computing() wrapper, explicitly check
>       the 'flags' parameter for _TIF_SECCOMP.
>     - Call __secure_computing() directly if the flag is set.
>
> [Why this matters]
> - Aligns the arm64 syscall path with the generic entry implementation,
>    simplifying future migration to the generic entry framework.
> - No functional changes are intended; seccomp behavior remains identical.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

