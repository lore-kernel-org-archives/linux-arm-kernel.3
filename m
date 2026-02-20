Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00DAC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30uoeH+AlPDCZ37LMEKC4PrR1UY78Hb2TT9vay3KZ/8=; b=KxqJZ2QQIqRz/IQSiwmnvTn8Vz
	ASM/faIWiy3vppqoHNSvqCvDxepnYijig1Fj/wMW74Nfn39PvKtlOWu/c6kmgHjl4vfOT1O2Gbh4P
	5ZALy4aY1j6M2/q8JzsBluCxmbw+Ec+8CPZx1hSFlIyXZtwbk8POaDCovb+XAP9X9+tM3sPklmI6X
	o5ZXz/MH+DxvQ0gECl5TDlqt4bChf+GFLX90FQCM65InYJjYsdw+XQGLXKbBmqwf8M7PkFq2PYcTX
	E4a2eI/InnBhETGu9py/mt03WlImeUxqhZCl2trJqHgTW45ICGBIq0+V5zxusjhjnD/SuZDHrNjsW
	R1d5+Itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZuo-0000000Fgq7-3KlM;
	Fri, 20 Feb 2026 23:28:06 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtZuj-0000000Fgpe-2LGF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 23:28:03 +0000
Date: Fri, 20 Feb 2026 15:27:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771630075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=30uoeH+AlPDCZ37LMEKC4PrR1UY78Hb2TT9vay3KZ/8=;
	b=DQCaS+6/TRNwPYaxpUB+jukGRHtrwuC89qQ6d+q5RrmNF6SUeknsJxWBfB5Jwa4wwu/xBa
	lm502pGaTPLJv6A8xbLMlXrHFf7klFS+dTmoRfG8fAlQzdoz/dNluAMgpkzryi3jR8AwCm
	7DxJsoycODfPEpSLlEo1klONvHQ4Pv8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZjiHt7h2z3Ye81_@linux.dev>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZY30X9bpsV-nPsm@linux.dev>
 <aZf9RsIUh8ARg_RP@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZf9RsIUh8ARg_RP@xhacker>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_152801_756698_27CDAAE5 
X-CRM114-Status: GOOD (  16.55  )
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

On Fri, Feb 20, 2026 at 02:20:54PM +0800, Jisheng Zhang wrote:
> On Wed, Feb 18, 2026 at 02:07:57PM -0800, Shakeel Butt wrote:
> > On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> > > It turns out the generic disable/enable irq this_cpu_cmpxchg
> > > implementation is faster than LL/SC or lse implementation. Remove
> > > HAVE_CMPXCHG_LOCAL for better performance on arm64.
> > > 
> > > Tested on Quad 1.9GHZ CA55 platform:
> > > average mod_node_page_state() cost decreases from 167ns to 103ns
> > > the spawn (30 duration) benchmark in unixbench is improved
> > > from 147494 lps to 150561 lps, improved by 2.1%
> > > 
> > > Tested on Quad 2.1GHZ CA73 platform:
> > > average mod_node_page_state() cost decreases from 113ns to 85ns
> > > the spawn (30 duration) benchmark in unixbench is improved
> > > from 209844 lps to 212581 lps, improved by 1.3%
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Please note that mod_node_page_state() can be called in NMI context and
> > generic disable/enable irq are not safe against NMIs (newer arm arch supports
> > NMI).
> 
> hmm, interesting...
> 
> fgrep HAVE_NMI arch/*/Kconfig
> then
> fgrep HAVE_CMPXCHG_LOCAL arch/*/Kconfig
> 
> shows that only x86, arm64, s390 and loongarch are safe, while arm,
> powerpc and mips enable HAVE_NMI but missing HAVE_CMPXCHG_LOCAL, so
> they rely on generic generic disable/enable irq version, so you imply
> that these three arch are not safe considering mod_node_page_state()
> in NMI context.

Yes it seems like it. For memcg stats, we use ARCH_HAVE_NMI_SAFE_CMPXCHG and
ARCH_HAS_NMI_SAFE_THIS_CPU_OPS config options to correctly handle the updates
from NMI context. Maybe we need something similar for vmstat as well.

So arm, powerpc and mips does not have ARCH_HAS_NMI_SAFE_THIS_CPU_OPS but
powerpc does have ARCH_HAVE_NMI_SAFE_CMPXCHG and arm has
it for CPU_V7, CPU_V7M & CPU_V6K models.

I wonder if we need to add complexity for these archs.

