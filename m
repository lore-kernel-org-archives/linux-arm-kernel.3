Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A727AC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlKAgjUTz3ha6QiVsjTkpfhGgkJKIWWW6C4R7gJRz7k=; b=vym1G9GAdOx3APzhyPiKGCslzJ
	SOnUK/f4yUtH/ZHgj6HmtzGRIcNKh03xxNRymIlw5qxjdFxAI9NYlFNRwudZAkDLfpICq2MUYqMGv
	W9l0iJQSvBc2kMjvaeO+pKAhz9DRuuDIdJsB6nimW40tm7ZMiH4meTQME3YiFEw/svdaFlEy8K8N3
	e+FF3gouKR57/mzwLV60/aVr9JhtaPciZUazDFaOjR7cLYZ1MuGzUk63juVe9pLSyCCTHaxq5IqHM
	Fvx4QRXgaqf0xF96CUEexl/4FBDZNELxhcmXLa3CBCVA+YSgpQ7SCM6s7/GjVdloAbdBjPgFyvShn
	XAjIeYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWVJ-0000000BoQx-1lhh;
	Wed, 22 Jul 2026 12:56:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWVF-0000000BoPQ-28MR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:56:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FB4D1595;
	Wed, 22 Jul 2026 05:56:44 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A4473F66F;
	Wed, 22 Jul 2026 05:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784725008; bh=+OzFfXYisrdBCYz9wTiLahc6tNmP4ymseQrwjwWbniU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPXnYbWYKD2kvgXSw+92UavvQueC0EluSQteIq1a4JNgIFbe5JpwvQTV+/M+DXNzz
	 0ls1Rs23zKUfWSrIfG7hYvRBC+UoXoZEmROFC5U0pMsRGbcMdSMFvIlfIwEk4O2a8f
	 UZEz6mPNlpPL+8uLA63M7s/KbJHUMCYTsrw+3oZU=
Date: Wed, 22 Jul 2026 13:56:44 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/2] arm64/debug: clean up some HW BP edge cases
Message-ID: <amC-DMTrqvAFSpe5@J2N7QTR9R3>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
 <amCp2vHU0XKhC6xT@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amCp2vHU0XKhC6xT@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_055649_588853_F0352F32 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2026 at 12:30:34PM +0100, Will Deacon wrote:
> On Wed, May 27, 2026 at 05:15:51PM +0100, Ada Couprie Diaz wrote:
> > This is a small series focused on fixing some unsoundess and edge case
> > related to hardware breakpoints and watchpoints.
> > 
> > It is motivated in part by the recent discussion on the
> > FEAT_Debugv8p6 series[0][1] regarding unclear guarantees on interruptions.
> > 
> > It doesn't address the issue of instrumentation, as NO_KPROBE is not
> > sufficient to prevent it (specifically ftrace) and would require a pass
> > over the whole debug handling code.
> > 
> > The bugs themselves are very much of the self-inflicted
> > "you should not be doing this" kind and not urgent, but it does solve
> > some of the questions on the FEAT_Dbugv8p6 series.
> > 
> > Most of the raw additions are comments trying to give more context to
> > understand `hw_breakpoint_thread_switch()`.
> 
> Hmm. From what I can tell, these patches are trying to handle various
> cases where we take a debug exception while executing the hw_breakpoint
> code itself. Even with these two fixes, is perf expecting to handle that
> sort of thing? I think it would be a lot more robust if we just prevented
> this from happening in the first place, similarly to the discussion from
> the other day around kprobes [2].

Since [2] mentions noinstr, it's worth noting that noinstr alone isn't
sufficient. Watchpoints also use this path, and we can't practically
filter watchpoint addresses to avoid hitting a watchpoint here.

I assume you'd be happy with masking debug exceptions entirely?

Mark.

> Will
> 
> [2] https://lore.kernel.org/all/alpuL10h7-OK2hFb@willie-the-truck/

