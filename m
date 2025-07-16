Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F94C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 02:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPRrCb3kamR6x0ErPCGsJVGKIRY2RRMDww8SEuFPAuY=; b=uPJsmotA1CCR7EYsSi4To8K3mc
	8N0/UXsVdnrfx1Xb5QicelBrh9c5NmmCf6TmFddtEpzDp1KBbtmvqvTXvPUlIWxwWfEAUzltfZCD3
	LCQJlndwCRpvRVrUWL9RT2Gjw73bHTIGKgRr4zLDVXGqkf3VI3+UhAiR9u0BL738gJoXvB+6dUXR7
	W4T6J39CR4UmUZKDg7d0BtvwRor+fuJ7uM7uiukjN5qnVT5cGatBUpvJiDpiSRDguLWBgX+TSKHmb
	hJkz5gJavRlgTZJKqnVnTXCy4LcDeY8AXzsLLmLb3rqe/1bP3fOY6CRa23AePoXmchcVpClvUYTb8
	5D9Jk2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubs1U-00000006c5e-2ogy;
	Wed, 16 Jul 2025 02:37:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubrz2-00000006c04-3O9f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 02:35:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61E3112FC;
	Tue, 15 Jul 2025 19:34:51 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8080D3F6A8;
	Tue, 15 Jul 2025 19:34:57 -0700 (PDT)
Message-ID: <a717d6ee-3b24-47de-a1fc-90a4ad0a020d@arm.com>
Date: Wed, 16 Jul 2025 08:04:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest/arm4: Provide local defines for AT_HWCAP3
To: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250715-arm64-selftest-bodge-hwcap3-v1-1-541b54bc43bb@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250715-arm64-selftest-bodge-hwcap3-v1-1-541b54bc43bb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_193500_896985_3AFD41C4 
X-CRM114-Status: GOOD (  18.56  )
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



On 16/07/25 2:41 AM, Mark Brown wrote:
> Some build environments for the selftests are not picking up the newly
> added AT_HWCAP3 when using the libc headers, even with headers_install
> (which we require already for the arm64 selftests).  As a quick fix add
> local definitions of the constant to tools use it, while auxvec.h is
> installed with some toolchains it needs some persuasion to get picked up.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/abi/hwcap.c       | 4 ++++
>  tools/testing/selftests/arm64/mte/check_prctl.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> index 35f521e5f41c..aa902408facd 100644
> --- a/tools/testing/selftests/arm64/abi/hwcap.c
> +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> @@ -21,6 +21,10 @@
>  
>  #define TESTS_PER_HWCAP 3
>  
> +#ifndef AT_HWCAP3
> +#define AT_HWCAP3 29

Just wondering - would it be better to add a comment that this is a
temporary construct till libc headers pick up AT_HWCAP3 definitions.


> +#endif
> +
>  /*
>   * Function expected to generate exception when the feature is not
>   * supported and return when it is supported. If the specific exception
> diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
> index 4c89e9538ca0..c36c4c49ff95 100644
> --- a/tools/testing/selftests/arm64/mte/check_prctl.c
> +++ b/tools/testing/selftests/arm64/mte/check_prctl.c
> @@ -12,6 +12,10 @@
>  
>  #include "kselftest.h"
>  
> +#ifndef AT_HWCAP3
> +#define AT_HWCAP3 29
> +#endif
> +
>  static int set_tagged_addr_ctrl(int val)
>  {
>  	int ret;
> 
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250710-arm64-selftest-bodge-hwcap3-b6ab30ab69cd
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 
> 


