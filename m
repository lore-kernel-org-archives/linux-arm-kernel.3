Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEE8C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 19:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRZe+9S5dg0BtYOo3GIg32UC18KSU/5hzkKNtxOspF4=; b=vOLSjBHvPdaAPpS2kpm8lUZDOf
	ixMRe1NQnRG8HOlTSrTTGHAxNJlUx8tydPkthuZKWmAeNYx6dhE4iKIFQyvu/e4uAWUswsYe084wF
	zri3DBQus+TxwR5lshvUelgXSI//zgt9mFBxCbJUQ3rFxDwBEBob2lJ2mAJtA0ctLsEM67haTHHeg
	ESxt372+UPDH1rY7mx5d28c3+4eFFRA1qaL6KfRLLqvII+ORRqZHYWuNw7PQKqXQDxeDQ71KBlJaq
	ZkhHaB6BNauEM1WuQ9QNfSllW+x2Dji4J2lP+IIRBxhBllT2u3G0fZhiN8FRe78yldJOIIpYk/G2Y
	EbpIqJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyF45-0000000E9cv-44nq;
	Fri, 28 Mar 2025 19:08:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyF2M-0000000E9T1-1VhV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 19:06:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6642FEC;
	Fri, 28 Mar 2025 12:06:41 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D96A3F63F;
	Fri, 28 Mar 2025 12:06:36 -0700 (PDT)
Date: Fri, 28 Mar 2025 19:06:34 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Angelos Oikonomopoulos <angelos@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Message-ID: <Z-bzOrF-4lSykkgJ@arm.com>
References: <20250326133521.13637-1-angelos@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326133521.13637-1-angelos@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_120638_443292_280C5C4B 
X-CRM114-Status: GOOD (  14.87  )
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

On Wed, Mar 26, 2025 at 02:35:21PM +0100, Angelos Oikonomopoulos wrote:
> do_alignment_t32_to_handler only fixes up alignment faults for specific
> instructions; it returns NULL otherwise. When that's the case, signal to
> the caller that it needs to proceed with the regular alignment fault
> handling (i.e. SIGBUS).

Did you hit this in practice? Which instruction triggered the alignment
fault that was not handled by do_alignment_t32_to_handler()? Standard
LDR/STR should not trigger unaligned accesses unless you have some
device memory mapped in user space.

> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
> ---
>  arch/arm64/kernel/compat_alignment.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
> index deff21bfa680..76cf1c1b5bc6 100644
> --- a/arch/arm64/kernel/compat_alignment.c
> +++ b/arch/arm64/kernel/compat_alignment.c
> @@ -34,7 +34,7 @@
>  
>  #define REGMASK_BITS(i)	(i & 0xffff)
>  
> -#define BAD_INSTR 	0xdeadc0de
> +#define BAD_INSTR	0xdeadc0de

Unrelated change (white space I guess), please drop it, not worth
fixing.

-- 
Catalin

