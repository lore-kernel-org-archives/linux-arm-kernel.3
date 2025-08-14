Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0BBCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 05:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Osk0lFoMFHs+pX8PfG6dApBDJVjGjgFKhDJFZWmJ+sQ=; b=va04nNjZHmR2uUtEJdlO9jB0NP
	RP3/KmjQu2kuSK/4RHictmucm5LU9peWBk0ctTdyf9awdwQVgFAT/WO3pUjor77SMxWGQHf0ArJ6R
	TbbLbyU0rxE8lm75hUo6ZWkeNCyXpTetvprTSfle8BfOr4SmQ8EKd0hZfIs7oYWvoGGf47q3t6z/2
	Zw8SgxxE8PHZYUwWKzLURk1bOXmL42M+93ZEPayagRzmtbDLftyznV5oJ0hcR+txfPQQZPXo1Ipm9
	nzm2XgAXd8jgEIbJ6SCNVbjbSCm9Ky/ZbiCZF1EouTv8Tl/sizhTHJJqhM8ccZWEL12TapoVcvRFU
	chvx1XBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQrF-0000000FrcD-0U5T;
	Thu, 14 Aug 2025 05:50:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQoe-0000000FrGj-1SvG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 05:47:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 874851691;
	Wed, 13 Aug 2025 22:47:47 -0700 (PDT)
Received: from [10.163.65.190] (unknown [10.163.65.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D2E23F63F;
	Wed, 13 Aug 2025 22:47:52 -0700 (PDT)
Message-ID: <7f01a3c7-818d-43cf-bdba-03409f85ccc5@arm.com>
Date: Thu, 14 Aug 2025 11:17:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: arm64: Fix -Waddress warning in tpidr2 test
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 shuah@kernel.org, broonie@kernel.org, yeoreum.yun@arm.com
References: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com>
 <20250807114247.5915-1-reddybalavignesh9979@gmail.com>
 <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224756_435506_A9F68934 
X-CRM114-Status: GOOD (  12.76  )
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

On 07/08/25 5:12 PM, Bala-Vignesh-Reddy wrote:
> Resolve compiler warning about always true condition in ksft_test_result
> in tpidr2, passing actual function.
> 
> This silences -Waddress warning while maintaining test functionality.
> 
> Fixes compiler warning (similar for other functions):
> warning: the address of 'write_read' will always evaluate as
> 'true' [-Waddress]
> 
> Fixes: 6d80cb73131d ("kselftest/arm64: Convert tpidr2 test to use kselftest.h")
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
>  		ksft_print_msg("SME support not present\n");

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

