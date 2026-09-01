Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097DEC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9GxEc7XssMRAghG8DyBdsxTfLc1nEoVFJVs0vitzQY=; b=LU2qYpnejeARO0hw7GC9FaJpbW
	I+XIyGZ92+255UewcKECw2fGoisQK3vPGp4WU1s4uuY+aUvg1YSEKqu949yVtwaqzTyUWzAHR5tBQ
	9aYOBeZMaOlOf1KBI06kn5giLRCsHMV0CaE8doUgl6vRLVNDsPJ+CKgyL78FI7nLKXsNHJr2jm4kt
	NGUYUVRK6lHgpxTXZl7DsYxn9mII3h6jBsfBzDU+6cYLKe6bP7WpgMQpG0v7jWsT0ovIMDNXiSSHX
	6E7r8LNrqUM6KFSUoP8Ydslhkxw6XcyJ61oJjR1W48UHE0r9AD5d0Gfbd1GeJwMxvoial8OSMkThS
	Ds46j3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pn3-0000000CNwe-1Jbx;
	Tue, 01 Sep 2026 14:48:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pn0-0000000CNwI-2JAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 283171756;
	Tue,  1 Sep 2026 07:48:37 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AFB33F882;
	Tue,  1 Sep 2026 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788274120; bh=5GY+SQc88euWmJgqoN2XFz/ZgVOv0qHEWYmDyZeK5BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEltKYEX2C5ZZ/qepJmekcgZuDMHGo871Mo2hrh8BH4KmIGGofzXJ6IGQtgJXDhPp
	 zKBCcEQPeq+Gu3WEP8GTg8CE3pXDpUyOQkTV05I4itu+glLuCCh7BuPty9T7FfTbkD
	 rDKNjPsACVDZtvgM45KURU6FeTlEBy96apb3J4g8=
Date: Tue, 1 Sep 2026 20:18:37 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 05/25] arm64: Implement asm/kpkeys.h using POE
Message-ID: <apblxUah9EcQox-Y@a079125.arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-5-743ad31b2c8f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-kpkeys-v9-5-743ad31b2c8f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_074842_679830_A8E906C1 
X-CRM114-Status: GOOD (  23.70  )
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

Kevin,

On Tue, Aug 18, 2026 at 03:08:47PM +0100, Kevin Brodsky wrote:
> Implement the kpkeys interface if CONFIG_ARM64_POE is enabled.
> The permissions for pkey 0 are set to RWX as this pkey is also used
> for code mappings. POR_EL1 is left untouched if we have already
> entered the requested context.
> 
> To allow <asm/kpkeys.h> to be included from assembly, also add
> appropriate #ifdef's to <asm/por.h>.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/kpkeys.h       | 67 +++++++++++++++++++++++++++++++++++
>  arch/arm64/include/asm/kpkeys_types.h | 15 ++++++++
>  arch/arm64/include/asm/por.h          |  4 +++
>  3 files changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
> new file mode 100644
> index 000000000000..09fd5a849cb0
> --- /dev/null
> +++ b/arch/arm64/include/asm/kpkeys.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_KPKEYS_H
> +#define __ASM_KPKEYS_H
> +
> +#include <linux/kpkeys_types.h>
> +
> +#include <asm/barrier.h>
> +#include <asm/cpufeature.h>
> +#include <asm/por.h>
> +
> +/*
> + * Equivalent to por_set_kpkeys_context(0, KPKEYS_CTX_DEFAULT), but can also be
> + * used in assembly.
> + */
> +#define POR_EL1_INIT	POR_ELx_PERM_PREP(0, POE_RWX)

IMHO, moving this macro defintion to "arm64: Enable kpkeys" , would be better as
this patch is about implementing arch helpers. 

> +
> +#ifndef __ASSEMBLY__
> +
> +static inline bool arch_supports_kpkeys(void)
> +{
> +	return system_supports_poe();
> +}
> +
> +#ifdef CONFIG_ARM64_POE
> +
> +static inline u64 por_set_kpkeys_context(u64 por, enum kpkeys_ctx ctx)
> +{
> +	por = por_elx_set_pkey_perms(por, 0, POE_RWX);

Guess, we would want to set the pkey index 0 only when,
ctx == KPKEYS_CTX_DEFAULT and it need to be set only once.
IIUC, we wouldnt want to deal with that every time we set a new
context. ie. update only what is relevant. 

--
Linu Cherian
 

