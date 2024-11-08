Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C85D5C0C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDQPLTGJ3gtEMBlj7t33wN3FDrn4W77dLAe1anMtmNo=; b=gTsD9D/tSGzBQahrcdVI5GywHL
	zNl5FeKtyTLhJ14cmH8jULe2uJ6UmsGzrIeYdQ/sArXwybOGr+rhv6gcl+jIWsjexTsE1wwpDOQaf
	ZcTAtlfdR88xYyraFATY0KojG/qjBabxK9E+tQiFnMInSiJRQ/wXVmU3zKrv3p8xTV1gkXzd36V8m
	HdDAcbl2AKxiuZyyD2uOf7I4GDcUX5/xIg5DjHNgNDPCgPoMLIfLRzeDk2P9PUqeSwu0/BHgGHfKx
	6dbUwlMztHSwisaV9QK+hIyn5yq28Jpm1h3vu6UpvYzRK8bC+U/LEGPvgzia+JKKa7M4v71/QbcCi
	wwZIUIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Oou-0000000Adbd-0HwO;
	Fri, 08 Nov 2024 13:14:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Omb-0000000AdLY-3Bnv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:12:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DF47497;
	Fri,  8 Nov 2024 05:12:43 -0800 (PST)
Received: from [10.57.79.154] (unknown [10.57.79.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B2D13F7D8;
	Fri,  8 Nov 2024 05:12:11 -0800 (PST)
Message-ID: <d3db93f4-679f-43f7-93b2-9eb33f53f855@arm.com>
Date: Fri, 8 Nov 2024 14:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Fix unused function warning for
 aarch64_write_signal_pkey()
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Joey Gouly <joey.gouly@arm.com>
References: <20241108110549.1185923-1-catalin.marinas@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241108110549.1185923-1-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_051213_863852_5E6BD0F0 
X-CRM114-Status: GOOD (  17.57  )
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

On 08/11/2024 12:05, Catalin Marinas wrote:
> Since commit 49f59573e9e0 ("selftests/mm: Enable pkey_sighandler_tests
> on arm64"), pkey_sighandler_tests.c (which includes pkey-arm64.h via
> pkey-helpers.h) ends up compiled for arm64. Since it doesn't use
> aarch64_write_signal_pkey(), the compiler warns:
>
> In file included from pkey-helpers.h:106,
>                  from pkey_sighandler_tests.c:31:
> pkey-arm64.h:130:13: warning: ‘aarch64_write_signal_pkey’ defined but not used [-Wunused-function]
>   130 | static void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Make the aarch64_write_signal_pkey() a 'static inline void' function to
> avoid the compiler warning.
>
> Fixes: f5b5ea51f78f ("selftests: mm: make protection_keys test work on arm64")
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

I've got this diff locally, didn't realise it was my patches that
revealed the issue otherwise I'd have posted it earlier. Either way:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

> ---
>
> I'll add this on top of the arm64 for-next/pkey-signal branch together with
> Kevin's other patches.
>
>  tools/testing/selftests/mm/pkey-arm64.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
> index d57fbeace38f..d9d2100eafc0 100644
> --- a/tools/testing/selftests/mm/pkey-arm64.h
> +++ b/tools/testing/selftests/mm/pkey-arm64.h
> @@ -127,7 +127,7 @@ static inline u64 get_pkey_bits(u64 reg, int pkey)
>  	return 0;
>  }
>  
> -static void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
> +static inline void aarch64_write_signal_pkey(ucontext_t *uctxt, u64 pkey)
>  {
>  	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uctxt);
>  	struct poe_context *poe_ctx =


