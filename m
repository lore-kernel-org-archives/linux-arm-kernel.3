Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB7AC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqxj/eepLmz0SworevJOv47dbEIhrDyW3LDmDGWSlk0=; b=3Yzhpz1upC5S4vnBqgrJ0/9MxZ
	qJwCyj1FNGbfl428N1Nukgl4U61MkoT8Fnm52ppMYQRIx4GNzUpkgfhRP7Vh2t2lNR5oA6tJ7Ixc3
	xJes3aA7cXoFd/29UoQ3Uh7+m69HevISgIDFSyjG5rR8NZMqFscrMYqd0whMqJ2ZJz42RvNKEHI/z
	j+GJzwKu2iGYihKl6Yvuht3KOiIJMtcE6JUx4VZG8JH+7YEnOS+XyOvM5Ej5cOZBZf+HGcfAFfICu
	RDFgq5r4ZzF5d2sQUIdTq9Gtb5Q8Y2AwlADDLdOxa6i/a68Pdn1PA1q8VgZUNtnTLwQ9BUBEOIIPb
	DjhiJYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVMC-00000008e5e-1l1e;
	Mon, 26 May 2025 10:47:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVK2-00000008dp7-3EBf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 10:44:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D39991007;
	Mon, 26 May 2025 03:44:28 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFD693F5A1;
	Mon, 26 May 2025 03:44:42 -0700 (PDT)
Date: Mon, 26 May 2025 11:44:40 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kselftest/arm64: Fix test for streaming FPSIMD write
 in sve-ptrace
Message-ID: <aDRGGDgQtlh8sew6@J2N7QTR9R3>
References: <20250523-kselftest-arm64-ssve-fixups-v1-0-65069a263b21@kernel.org>
 <20250523-kselftest-arm64-ssve-fixups-v1-2-65069a263b21@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-kselftest-arm64-ssve-fixups-v1-2-65069a263b21@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_034446_861116_6BCC5C37 
X-CRM114-Status: GOOD (  18.09  )
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

On Fri, May 23, 2025 at 04:27:13PM +0100, Mark Brown wrote:
> Since f916dd32a943 ("arm64/fpsimd: ptrace: Mandate SVE payload for
> streaming-mode state") we do not support writing FPSIMD payload data when
> writing NT_ARM_SSVE but the sve-ptrace test has an explicit test for
> this being supported which was not updated to reflect the new behaviour.
> Fix the test to expect a failure when writing FPSIMD data to the
> streaming mode register set.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/sve-ptrace.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> index c499d5789dd5..7e259907805b 100644
> --- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
> +++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> @@ -301,8 +301,10 @@ static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
>  			p[j] = j;
>  	}
>  
> +	/* This should only succeed for SVE */
>  	ret = set_sve(child, type, sve);
> -	ksft_test_result(ret == 0, "%s FPSIMD set via SVE: %d\n",
> +	ksft_test_result((type->regset == NT_ARM_SVE) == (ret == 0),
> +			 "%s FPSIMD set via SVE: %d\n",
>  			 type->name, ret);
>  	if (ret)
>  		goto out;
> 
> -- 
> 2.39.5
> 

