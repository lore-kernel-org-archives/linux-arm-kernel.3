Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277DECA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFZ9jBeBQzRwzmxMbU1s7iIP9yd2k9p2S/TZnV1/io4=; b=PKU3QdVlPU52JNznRR7W4Chv1u
	eqpHwJdoICxFqklkQs9el8orknjPF68K6i1mYIBCwPW7rJk1wNjC9oELLKMKGhOiFLSeQ4/hGM7ql
	uh2Oo72aOj7c3N59juYnirUpmjpbv4+555zh26KTg7kAYDvJsWbPwqgJ1JvDU4zeIljnPFTeS6uK4
	roWS+ojBVGvWIGMM27LBic2Ov2ZTiOCq3jtxfAMfR4zeFLrlIe6mvRWoFdsPpdYW+ZFmALCdwg2rM
	3meJSR/RkT3hcz6uUwlQuAb1Ou5NGcqSYPgCw29x/+dW2+fDfWuz0KP5u/cGxo+mfBwLJ3d1bqQO8
	JKHf2VBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Q5-000000066Ci-3gN8;
	Fri, 29 Aug 2025 14:49:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw4U-00000005GrL-2tJZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:11:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB06F1758;
	Fri, 29 Aug 2025 03:10:53 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 725AE3F694;
	Fri, 29 Aug 2025 03:10:49 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:10:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v3 2/3] arm64: sysreg: Correct sign definitions for EIESB
 and DoubleLock
Message-ID: <aLF8pU4k5chetsDy@J2N7QTR9R3>
References: <20250829095143.123476-1-tabba@google.com>
 <20250829095143.123476-3-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829095143.123476-3-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031102_767328_0AB5E623 
X-CRM114-Status: GOOD (  17.14  )
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

On Fri, Aug 29, 2025 at 10:51:42AM +0100, Fuad Tabba wrote:
> The `ID_AA64MMFR4_EL1.EIESB` field, is an unsigned enumeration, but was
> incorrectly defined as a `SignedEnum` when introduced in commit
> cfc680bb04c5 ("arm64: sysreg: Add layout for ID_AA64MMFR4_EL1"). This is
> corrected to `UnsignedEnum`.
> 
> Conversely, the `ID_AA64DFR0_EL1.DoubleLock` field, is a signed
> enumeration, but was incorrectly defined as an `UnsignedEnum`. This is
> corrected to `SignedEnum`, which wasn't correctly set when annotated as
> such in commit ad16d4cf0b4f ("arm64/sysreg: Initial unsigned annotations
> for ID registers").
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
> Note: No active users in the kernel for these two fields yet. pKVM
> checks DoubleLock, but only for protected VMs, which aren't enabled
> upstream yet. Hence no Fixes tag.

I have no strong feelings either way on that, so FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/tools/sysreg | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index f1a012ee0db6..d396fa587ec1 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1693,7 +1693,7 @@ UnsignedEnum	43:40	TraceFilt
>  	0b0000	NI
>  	0b0001	IMP
>  EndEnum
> -UnsignedEnum	39:36	DoubleLock
> +SignedEnum	39:36	DoubleLock
>  	0b0000	IMP
>  	0b1111	NI
>  EndEnum
> @@ -2409,7 +2409,7 @@ UnsignedEnum	11:8	ASID2
>  	0b0000	NI
>  	0b0001	IMP
>  EndEnum
> -SignedEnum	7:4	EIESB
> +UnsignedEnum	7:4	EIESB
>  	0b0000	NI
>  	0b0001	ToEL3
>  	0b0010	ToELx
> -- 
> 2.51.0.338.gd7d06c2dae-goog
> 
> 

