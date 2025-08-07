Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB29C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 05:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mc6dkFaoYGSfxbPBZHtywwuiESeYzEMPRY2x/iQrWZE=; b=lgidbMAWL/MVVZYhY26bhQi9uU
	lRu0R4kSpl/zIY4o9ZXZGDJV9gKO7Onj89H0XOoa5YGl3dChpe5gjosSqQgMJSTC1JBN6OeC6mbji
	I2j2JaY/dAu/QfImsUmnY/go2kFouQQy+MWR6HB0j5KdpCttAPL0b9EYrbUMJRPrZ1g56LlnZVJgN
	2bHcagMqrWCv1eDMj1mya2DXEv8gjczLDdmS54ZkpB0g+EJZ1E4GUQLxiR1wmxygKFXjCjjBActFR
	ngqx+RG+gFKHM/4+4xxdRqATwMJ6AWb35pPx3xceNqKkgqNwLX4aRoT4vNaYKOIimUqOaGThwzE29
	tvw81zQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujsoh-0000000HHcz-368m;
	Thu, 07 Aug 2025 05:05:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujsmA-0000000HHSk-3w4l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 05:02:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC082236D;
	Wed,  6 Aug 2025 22:02:39 -0700 (PDT)
Received: from [10.163.95.35] (unknown [10.163.95.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0945A3F673;
	Wed,  6 Aug 2025 22:02:44 -0700 (PDT)
Message-ID: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com>
Date: Thu, 7 Aug 2025 10:32:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: arm64: Fix -Waddress warning in tpidr2 test
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>
References: <20250806203928.168365-1-reddybalavignesh9979@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250806203928.168365-1-reddybalavignesh9979@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_220251_031537_58475E00 
X-CRM114-Status: GOOD (  12.74  )
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

On 07/08/25 2:09 AM, Bala-Vignesh-Reddy wrote:
> Resolve compiler warning about always true condition in ksft_test_result
> in tpidr2, passing actual function.
> 
> This silences -Waddress warning while maintaining test functionality.

Might be better to just add the compiler warning in the commit message.
Also does it need a Fixes: tag for the relevant commit as well ?

6d80cb73131d ("kselftest/arm64: Convert tpidr2 test to use kselftest.h")

> 
> Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
> ---
>  tools/testing/selftests/arm64/abi/tpidr2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
> index f58a9f89b952..4c89ab0f1010 100644
> --- a/tools/testing/selftests/arm64/abi/tpidr2.c
> +++ b/tools/testing/selftests/arm64/abi/tpidr2.c
> @@ -227,10 +227,10 @@ int main(int argc, char **argv)
>  	ret = open("/proc/sys/abi/sme_default_vector_length", O_RDONLY, 0);
>  	if (ret >= 0) {
>  		ksft_test_result(default_value(), "default_value\n");
> -		ksft_test_result(write_read, "write_read\n");
> -		ksft_test_result(write_sleep_read, "write_sleep_read\n");
> -		ksft_test_result(write_fork_read, "write_fork_read\n");
> -		ksft_test_result(write_clone_read, "write_clone_read\n");
> +		ksft_test_result(write_read(), "write_read\n");
> +		ksft_test_result(write_sleep_read(), "write_sleep_read\n");
> +		ksft_test_result(write_fork_read(), "write_fork_read\n");
> +		ksft_test_result(write_clone_read(), "write_clone_read\n");
>  
>  	} else {
>  		ksft_print_msg("SME support not present\n");Otherwise LGTM.

