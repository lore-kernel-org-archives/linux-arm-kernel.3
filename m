Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B2FC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6PtAekRL8MpBeMwMjhbRO1GXsGrTNOjB6g0XvyXDUY=; b=jiCUg8bsYFBRFBPkM/LGTZFULd
	zGgI2Jr8CckKCpA6GWoM7Ls3+65hhPwtGyE6kA5wipCQ8YM8azldWFdx6up3XOAaSTRjY0jqtVkZS
	QuGLbm+mhY4A2pfVamIjzqLJ3gXJZgAm9fMl99Oji7Dgp3wc0O8QlD4cEvMLB/xkP/bbU9yAwnedk
	5kP2Sj04NcdKCzYUjPcMF0mW1+VecLAYk9HwKHI1wCcDfwSt3QOl2REhTlVPZQiszv3NZ7nekglvr
	lCsyiibWGgFwmeh5Rc0z7gQKDbetjA1SOgZJ7Acfa2pSbKbGxEUIEwaohE4GFpTZXIPd5JCksJ0pu
	uPW2LFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVFT-00000008dTr-1LdX;
	Mon, 26 May 2025 10:40:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV6b-00000008cdh-2PdK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 10:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E12D42F;
	Mon, 26 May 2025 03:30:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2A163F5A1;
	Mon, 26 May 2025 03:30:50 -0700 (PDT)
Date: Mon, 26 May 2025 11:30:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kselftest/arm64: Fix check for setting new VLs in
 sve-ptrace
Message-ID: <aDRC2BJddPL8v8TD@J2N7QTR9R3>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
 <20250523-kselftest-arm64-ssve-fixups-v1-1-65069a263b21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-1-65069a263b21@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_033053_654547_189576EB 
X-CRM114-Status: GOOD (  17.08  )
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

On Fri, May 23, 2025 at 04:27:12PM +0100, Mark Brown wrote:
> The check that the new vector length we set was the expected one was typoed
> to an assignment statement which for some reason the compilers didn't spot,
> most likely due to the macros involved.
> 
> Fixes: 0dca276ac4d2 ("selftests: arm64: Add test for the SVE ptrace interface")

I don't think that fixes tag is correct. AFAICT, this code was
introduced in commit:

  a1d7111257cd ("selftests: arm64: More comprehensively test the SVE ptrace interface")

... and there wasn't something equivalent prior to that.

With that fixed:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/sve-ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> index 577b6e05e860..c499d5789dd5 100644
> --- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
> +++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> @@ -253,7 +253,7 @@ static void ptrace_set_get_vl(pid_t child, const struct vec_type *type,
>  		return;
>  	}
>  
> -	ksft_test_result(new_sve->vl = prctl_vl, "Set %s VL %u\n",
> +	ksft_test_result(new_sve->vl == prctl_vl, "Set %s VL %u\n",
>  			 type->name, vl);
>  
>  	free(new_sve);
> 
> -- 
> 2.39.5
> 

