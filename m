Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DB8FEFB6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5rzViaQXwEbukXEcCy+omVQ9a9j49vurXkvPIX/tbc=; b=vO07SRPF3uMnzPJbtvSMamNzHs
	5T/oIrTZe87Zyw5OZUz+zKSD5gzNNDtCDrLYQD1m/ECJWL8r7dNQkGM5vFoyp8umlv9pkGWeR8hP0
	t/tVxmrCpZsDnek5gr15paiHOZmZRS8vcvmmY6kuYkWvWUNBlHyNDKMWdFUG2C/SGO3KUzdWQp1Q2
	DJ1iiKTMYNBOFkJ/8nQXY37AbifcYpUIFjnEsqjyU59ORnr96EjOHfSk68x//i6ePsv8qO1lbR9UW
	Q7FoGvtUhVfb9PkjWUlsCtc85h4sqcDcAXuxIvnNQxupuFEM734aCEkrEvOmjZzpEJeFXrkqvrtoc
	ERqtzsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0n8-00000008jrR-22lc;
	Fri, 27 Feb 2026 16:34:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0n4-00000008jr5-2wwy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 16:34:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4EA614BF;
	Fri, 27 Feb 2026 08:34:01 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 305C43F73B;
	Fri, 27 Feb 2026 08:34:07 -0800 (PST)
Date: Fri, 27 Feb 2026 16:34:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: runtime-const: save one instruction when
 ARM64_VA_BITS <= 48
Message-ID: <aaHHfCL4hdV4z9Uo@arm.com>
References: <20260225144613.30846-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225144613.30846-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_083410_779539_0EEA1910 
X-CRM114-Status: GOOD (  16.14  )
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

On Wed, Feb 25, 2026 at 10:46:13PM +0800, Jisheng Zhang wrote:
> Currently, the runtime_const_ptr() uses 4 instructions to move a long
> imm to GP, but when ARM64_VA_BITS <= 48(which is true for android and
> armbian), the top 8bits of runtime cont ptr is all '1', so we can make
                    ^^^^^
                    8 or 16?

> use of the movn instruction to construct the imm's top 8bits and lower
> 16bits at the same time, thus save one instruction.

This works as long as KASAN_{SW,HW}_TAGS is disabled, otherwise the top
byte of a pointer is not guaranteed to be 0xff. I think both
filename_init() and dcache_init() can pass tagged pointers.

> diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
> index be5915669d23..6797dd37d690 100644
> --- a/arch/arm64/include/asm/runtime-const.h
> +++ b/arch/arm64/include/asm/runtime-const.h
> @@ -7,6 +7,8 @@
>  /* Sigh. You can still run arm64 in BE mode */
>  #include <asm/byteorder.h>
>  
> +#if CONFIG_ARM64_VA_BITS > 48

You could use VA_BITS, it's shorter, though if you add the KASAN checks
it's a pretty long #if to copy all over the place. We could untag the
pointer but it kind of defeats the purpose of enabling KASAN in the
first place.

Given that Android enables KASAN_HW_TAGS by default, not sure we should
bother with this change. Do you have any perf data to show that it's
worth it?

-- 
Catalin

