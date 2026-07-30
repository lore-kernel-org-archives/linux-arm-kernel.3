Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFE3C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNnfaLFnN+805UtJd9AT6cUB0d/UX4ZIy2ylzvPCYyQ=; b=cDGkpG9gKdC3DL+jrpj7U+8VwJ
	zsppAd6ijlHNGHcCWFVfzyLfKLlJ39G9uNVb7wSHTqpQtdwi4ern3s1H5nqxc0Gy9gL9+hDzrSCIj
	4ZZow1akjHEKfocH8mf38cuX+k8lyaRC+BeFCP9mBtLIqUXsAyf2zZTz8UiYJR7p4bsnbDqbSBc/E
	FwM6qpuMP4D+ml2TfzPVn8c8AY82R8ybmrUTsDqAtDHtZRfNu/6OBg6qvd4/Msdoggpym7pdjSJ3d
	OHKKbe8Y6aZ4EMYo8gnwqyo2kmbnP2qAHbNKbmxk9MipBdYAurKe/kYTqahbGj+rTUKlvwzZBNOTk
	SYczQZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOTm-0000000AHrR-31Sc;
	Thu, 30 Jul 2026 10:59:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOTj-0000000AHqJ-338p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:59:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50F3D1688;
	Thu, 30 Jul 2026 03:59:02 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE8BA3F86F;
	Thu, 30 Jul 2026 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785409146; bh=lpE2LRafRIuhPDmo0bGZrzEu19vDPtV4zcnqOziyOlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NuxZ3Q32tEnauQVlxcyfMHdRsALV9PHFrXekVnE8oaQZeqlPONGuBBOGj2IXIRM3A
	 uFSpDLuWffwkUty60dF7IDniHMZ3AXX08ss8xEyKbyXYt299u2F/0V0k6wZqfWOowr
	 xVyWZ5Jo3EFC0Li/LTFuxeMtLHjts+lOjnMUWMSk=
Date: Thu, 30 Jul 2026 11:59:02 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <amsudrskKg6uOUSf@J2N7QTR9R3.cambridge.arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <ea269924-b563-44b9-bdf3-31072ec93375@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea269924-b563-44b9-bdf3-31072ec93375@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_035907_815507_2AFCB908 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2026 at 03:25:52PM +0100, Vladimir Murzin wrote:
> On 7/28/26 13:38, Mark Rutland wrote:
> > +#define __VAL_PCPU_GPRS(pcp, off, addr)				\
> > +	"("							\
> > +		"(.L__gpr_num_" pcp  " << 0) | "		\
> > +		"(.L__gpr_num_" off  " << 5) | "		\
> > +		"(.L__gpr_num_" addr " << 10)"			\
> > +	")"
> 
> Later in the patch, there is a comment stating that these registers
> are not expected to overlap. I can also see that early-clobber
> constraints are applied to the output registers later in the patch
> series, so the code is correct.
> 
> However, would it be possible to add assertions that detect register
> overlap, perhaps something like:
> 
> ".if (.L__gpr_num_" pcp "== .L__gpr_num_" off ") ||"	\
> "    (.L__gpr_num_" pcp "== .L__gpr_num_" addr ") ||"	\
> "    (.L__gpr_num_" off "== .L__gpr_num_" addr")"	\
> ".error "inline asm registers overlap"			\
> ".endif"						\

That's a good idea. I've added the following:

| #define __ASSERT_PCPU_GPRS_UNIQUE(pcp, off, addr)                       \
|         ".if ("                                                         \
|                 "(.L__gpr_num_" pcp " == .L__gpr_num_" off ") || "      \
|                 "(.L__gpr_num_" pcp " == .L__gpr_num_" addr ") || "     \
|                 "(.L__gpr_num_" off " == .L__gpr_num_" addr")"          \
|         "    )\n"                                                       \
|         ".error \"PCPU GPRS overlap: {" pcp "," off "," addr "}\"\n"    \
|         ".endif\n"
| 
| #define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)                       \
|         __DEFINE_ASM_GPR_NUMS                                           \
|         __DEFINE_ASM_GPR_ALIASES                                        \
|         __ASSERT_PCPU_GPRS_UNIQUE(pcp, off, addr)                       \
|         "       mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"   \
|         "       strh    w" off ", " gprs "\n"                           \
|         __KERN_ASM_CPU_OFFSET(off) "\n"

With that, we have enough ".L__gpr_num_" string concatenation that we
should probably have:

| #define __GPR_NUM(r)		"(.L__gpr_num_" r ")"

... so I'll go add a preparatory patches adding that and cleaning up
existing usage.

Mark.

