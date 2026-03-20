Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B6010987A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DMysUyCKw0otyFT/nci6R5IeD3beJ0jMK2AHwZg6Js=; b=oX8ULa0z0pREl3A/zrI0BQMGOD
	6gshaBdHyaa9QsRkE2tkxLjvp/t+4V5kjEIrN+nPz1313RBt1grYFuDjmzQdmudX98jDdq3kBAovd
	5HJTNhqFipCczaYrFgPVlIpb4sTDecIlubiO8nVFKerzsp6wDrPoSabiOTrawpMaSLWccQI/W+zHA
	PYZCdv0RvcPzRYYbdZTM+vq/az8HMURI4y+hR+j146knAbSX1FMUDJ+w7SafNuLYxkvKruI6FVq3C
	r4K2fw1XvTbteSGjT0E87bZCIHlEFy5ODx2OPKwNiACpCOSNyFBWzEz41VOdB18KvfdAMc8yf0pfv
	Sutl8W2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cX6-0000000D6kx-2WPP;
	Fri, 20 Mar 2026 16:17:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cX2-0000000D6kW-2UCD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:17:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8C61165C;
	Fri, 20 Mar 2026 09:16:56 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 679433F7BD;
	Fri, 20 Mar 2026 09:17:01 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:16:59 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/2] arm64/entry: Fix involuntary preemption exception
 masking
Message-ID: <ab1y-51Ga2Hqa9EE@J2N7QTR9R3.cambridge.arm.com>
References: <20260320113026.3219620-1-mark.rutland@arm.com>
 <20260320113026.3219620-2-mark.rutland@arm.com>
 <20260320130433.GV3738786@noisy.programming.kicks-ass.net>
 <87h5qak2uv.ffs@tglx>
 <ab1gYcG_-EFNKALm@J2N7QTR9R3.cambridge.arm.com>
 <20260320153421.GM2872@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320153421.GM2872@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_091705_618746_3AC22F09 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, luto@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 04:34:21PM +0100, Peter Zijlstra wrote:
> On Fri, Mar 20, 2026 at 02:57:37PM +0000, Mark Rutland wrote:
> 
> > I know that arm64 currently uses exit_to_user_mode_prepare_legacy(), and
> > I want to go clean that up too. :)
> 
> This series; and this patch in particular:
> 
> https://lkml.kernel.org/r/20260320102620.1336796-10-ruanjinjie@huawei.com
> 
> seem to already take care of that.

Sure, and Jinjie's patch might be the right option.

I'd like to fix the irqentry stuff as a whle *before* we convert the
syscall stuff, so that we're not just creating more work for ourselves.

Mark.

