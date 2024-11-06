Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B88D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERnX6gxSZteIPqC92r/nu+Es4EvN8EnSZt33w8USAl8=; b=M7firOt61NZDc7c3HpEfZLZsAn
	Wg2ku6d+o6WxwvQ+bVIaPz9h0OMOIKNwTQ86BeizTGOZqWI47nhodGaxXI7sSw+FmEfX3SKvM4Z9Q
	d9H0v7+F8PFbfjY6FRr68YdOHRfys+BKwtgA3UeTJ0pELIXQqNj0A5t2Ujv0Rt1GkRxeffo+nRBjl
	5aOeH0nosHCv4g4e1PVW44r0YQFX2TGIT4Ie/YrFCJYwLO4nHOvwcqV16NPd0I3/O+Z2cHVD+dN71
	YzWIBL3Qft+3sSw18+bYeqLv2i+D17dwl+DH5aJ31ur8G2ndnQVuOvDcY6OeTund4U3lDgGsKyyiO
	cjsiFDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f7L-00000003BTz-20zS;
	Wed, 06 Nov 2024 12:26:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eEc-00000002vXv-1Tfa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:30:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6136F1063;
	Wed,  6 Nov 2024 03:30:31 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 164233F6A8;
	Wed,  6 Nov 2024 03:29:59 -0800 (PST)
Date: Wed, 6 Nov 2024 11:29:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] kselftest/arm64: Remove unused ADRs from irritator
 handlers
Message-ID: <ZytTNXaOGZkH6rME@J2N7QTR9R3>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <20241023-arm64-fp-stress-irritator-v1-2-a51af298d449@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-2-a51af298d449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_033002_573527_7F751FB3 
X-CRM114-Status: GOOD (  13.19  )
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

On Wed, Oct 23, 2024 at 09:38:30PM +0100, Mark Brown wrote:
> The irritator handlers for the fp-stress test programs all use ADR to load
> an address into x0 which is then not referenced. Remove these ADRs as they
> just cause confusion.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  tools/testing/selftests/arm64/fp/fpsimd-test.S | 1 -
>  tools/testing/selftests/arm64/fp/sve-test.S    | 1 -
>  tools/testing/selftests/arm64/fp/za-test.S     | 1 -
>  tools/testing/selftests/arm64/fp/zt-test.S     | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index bdfb7cf2e4ec175fda62c1c2f38c6ebb1a1c48bf..9977ffdd758a51a7af67cd607d019a6c54d3a6c6 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -142,7 +142,6 @@ function irritator_handler
>  	str	x0, [x2, #ucontext_regs + 8 * 23]
>  
>  	// Corrupt some random V-regs
> -	adr	x0, .text + (irritator_handler - .text) / 16 * 16
>  	movi	v0.8b, #7
>  	movi	v9.16b, #9
>  	movi	v31.8b, #31
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index e3c0d585684df29723a49265f3df6d23817498c7..f1fb9745c681786f686f1fafcb7e1154f3c8e1a3 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -299,7 +299,6 @@ function irritator_handler
>  	str	x0, [x2, #ucontext_regs + 8 * 23]
>  
>  	// Corrupt some random Z-regs
> -	adr	x0, .text + (irritator_handler - .text) / 16 * 16
>  	movi	v0.8b, #1
>  	movi	v9.16b, #2
>  	movi	v31.8b, #3
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 095b45531640966e685408057c08ada67e68998b..1ee0ec36766d2bef92aff50a002813e76e22963c 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -158,7 +158,6 @@ function irritator_handler
>  
>  	// Corrupt some random ZA data
>  #if 0
> -	adr	x0, .text + (irritator_handler - .text) / 16 * 16
>  	movi	v0.8b, #1
>  	movi	v9.16b, #2
>  	movi	v31.8b, #3
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index b5c81e81a37946c1bffe810568855939e9ceb08e..ade9c98abcdafc2755ef4796670566d99e919e5c 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -127,7 +127,6 @@ function irritator_handler
>  
>  	// Corrupt some random ZT data
>  #if 0
> -	adr	x0, .text + (irritator_handler - .text) / 16 * 16
>  	movi	v0.8b, #1
>  	movi	v9.16b, #2
>  	movi	v31.8b, #3
> 
> -- 
> 2.39.2
> 

