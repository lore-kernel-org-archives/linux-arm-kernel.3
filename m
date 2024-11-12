Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FA3D32D9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dve47PPywbzmC71DwIokR5Livc7p7GDoL0DU0ts/bK8=; b=4ThqtcVRjC4ikRxLxNO37A3y/y
	h3JqNitmGKoxdt62jIdfhhlYOWiR5gatdgAnPvf8FswKyNMsHi6k+ewcZL4AG60pYilam4yM0NSEv
	KnHqqszsoO9Eba3iM0s+FR03fQgjMmVgn/giHuQzz2jIQQsCu4+0rnpV9WtkK9IWCX385XE3M6zic
	st9Z0IX80BcNWw7wDDJnZzmxVzMKugUpmKbG0hZBTvUQmLcACcehsoo4hUwMYPyp4gmsar7Jr2Fqj
	g+H7QaQzydTI2E4R2NQbqYtfUg2qc+22RRAJ9iRVtBHWKArOo5+pf3sS2XOQsJ4HvntJtYUuC+JZ4
	iX55i1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApib-00000003Lap-3xrm;
	Tue, 12 Nov 2024 12:10:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp6B-00000003EGb-2S84
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D72E5C2C81
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 11:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A035C4CECD;
	Tue, 12 Nov 2024 11:30:17 +0000 (UTC)
Date: Tue, 12 Nov 2024 11:30:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Check that SVCR is 0 in signal handlers
Message-ID: <ZzM8RrD248eSW5bG@arm.com>
References: <20241106-arm64-fpmr-signal-test-v1-1-31fa34ce58fe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-arm64-fpmr-signal-test-v1-1-31fa34ce58fe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_033019_685687_11FAF786 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Nov 06, 2024 at 05:07:51PM +0000, Mark Brown wrote:
> diff --git a/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c b/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c
> index 6dbe48cf8b09ed8b7a5ab47690bd87e39e18e1e6..3dee68fa36d1cf2716f54d5f328b3f4077493c3b 100644
> --- a/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c
> +++ b/tools/testing/selftests/arm64/signal/testcases/ssve_regs.c
> @@ -85,6 +85,11 @@ static int do_one_sme_vl(struct tdescr *td, siginfo_t *si, ucontext_t *uc,
>  	fprintf(stderr, "Got expected size %u and VL %d\n",
>  		head->size, ssve->vl);
>  
> +	if (get_svcr() != 0) {
> +		fprintf(stderr, "Unexpected SVCR %llx\n", get_svcr());
> +		return 1;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/tools/testing/selftests/arm64/signal/testcases/za_regs.c b/tools/testing/selftests/arm64/signal/testcases/za_regs.c
> index b9e13f27f1f9aaf55db2a5e391f360993561d0b7..9fff4c50030414d06157e0da0c29fd794f707309 100644
> --- a/tools/testing/selftests/arm64/signal/testcases/za_regs.c
> +++ b/tools/testing/selftests/arm64/signal/testcases/za_regs.c
> @@ -91,6 +91,11 @@ static int do_one_sme_vl(struct tdescr *td, siginfo_t *si, ucontext_t *uc,
>  		return 1;
>  	}
>  
> +	if (get_svcr() != 0) {
> +		fprintf(stderr, "Unexpected SVCR %llx\n", get_svcr());
> +		return 1;
> +	}

I think I'll change both printf specifiers to %lx here since in the libc
I have installed, uin64_t is an unsigned long (the kernel defines it as
unsigned long long). Both gcc and clang complain but the compiler
shouldn't matter since the headers come with glibc.

-- 
Catalin

