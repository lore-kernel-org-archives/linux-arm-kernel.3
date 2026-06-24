Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2834CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM/m6QUx+7HmbzlJxUPHx4TvQOgm3V9jyXvmAIwwqI4=; b=COJJY8J9xJQy4e
	ymLn8HkxpEqTwS2wQrLQCbjme+Qt/lbzrrH9s/4gUhCKp5qpPInmVfjPWmfdu5ryK7feVDlCzst49
	iZghXXgibPqGtZJ4Cu6RT4vL+uw1110nI9b9jFL2+S0QwgjMm1r1cvEC2Aw4r0aybrIEFZIl1z2EY
	hqu58QKPx92SygDmyXaieE50nSTFykFU96Etoe5wnJV+Xr8DIFCEKyugvcPqjf2Tdt7y6kq0txYQZ
	dC/uEERrCPlFnPBL/eEbdCa+c+5103xQJmeAk0jlwQ6vSLSXAES+pbC4CqytB5hC6mtg83JGaMwWf
	G5KyTx8aL/aueP+5dSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNkP-00000007pW4-3rdV;
	Wed, 24 Jun 2026 13:34:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNkN-00000007pVT-3azQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:34:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3732008;
	Wed, 24 Jun 2026 06:34:22 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E81773F632;
	Wed, 24 Jun 2026 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782308066; bh=AM/m6QUx+7HmbzlJxUPHx4TvQOgm3V9jyXvmAIwwqI4=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Th7r1J3uAsKYc2dcNvUt3pcSlTWu0LFbMoJVOxJKVHUmBXGW1ky0aS/6JLwwrtcRt
	 jcGgtNO1re/hQ7QWO9Ch04913KtFC85ujJ6e6GbZ6T0TpMOCTVvv0ZSgKbWRZWVfYD
	 CGiNI6HJrNWxscZlxJZMIfwLkjzDxSNEH+zooJaA=
Message-ID: <a19d6e1e-d513-4683-b672-71fe2868cf29@arm.com>
Date: Wed, 24 Jun 2026 14:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 01/11] entry: Fix potential syscall truncation in
 syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-2-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_063432_031785_CC14C64C 
X-CRM114-Status: GOOD (  10.93  )
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
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

