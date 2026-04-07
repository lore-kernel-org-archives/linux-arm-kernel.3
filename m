Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8579FEEF55
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EutJzCH5y+/uj+HeBlqKAV6Z3BuYlSwoWrpFxuQWcuc=; b=4FFj2X1Cq5Wh5n/f5Ng/H+gW6u
	fiZpUw+CkRD/HxBq1viZP0y7pKIKrzPJEl+0NffUzStDZLdblxoPZ4QL2S0WUvz5nEzTYod8WajNz
	9yXRaxxQtYZbfY4DK+eghSy0qMgZgoTFC59qrrT8thtEX6y+zTRvExW9NxOYt+cUAi/mtXD3uh9z1
	WjWb+3hELPuPjrUy7ZjAxoMWExz5WV7yZukpEjG2blVqasgVZLkL04E0EkpjawLF+4uxPUNRcbrdn
	2YHGEI5Pw7x2eHqJidXbUhPMdK1qZ6au1TkFmj4K/WVy3pPYFZDx/a6ddSYaezjLOyw4xO2eQ0F0B
	7TNUfmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADfA-00000007vVw-21hR;
	Tue, 07 Apr 2026 21:08:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADf8-00000007vVa-0Vxk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 21:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68B7341875;
	Tue,  7 Apr 2026 21:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFEFC116C6;
	Tue,  7 Apr 2026 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775596120;
	bh=gIIaaUV+7chBOO2TykQwm8KJUrCM1gtVUozq7g5UYi4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m0mxOE+P0p15xy5t+yMoKAbZL+g5VoESh66ptbVCBGkRr+88h2L8SrGP5dntdWWZl
	 LfcjYKbo1NjpG4vFL8a1HhrowjPzYAI8JCYqELuune0oBSXwh2c/IIuYlAYpgEmLkz
	 6tnqGy5OB5JsAuDqQUlt4UoE/f7qXEQ3pgtimExTBvyCvjDJA/pssKjus1s6QDvD0h
	 VusIAoOeuvq/2jQt3PL6rM4+8ly+FQHr3b28OLbtYuojG24F2eSkd6CgdLZbRPSFpJ
	 g4mHEu7BFzSY74iY+0M97H2dTvhZjD32T+qVQXj6MFOYJGofcfllp2oC3SERO1HlIw
	 Ta6HfAxRV7t4A==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra
 <peterz@infradead.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/10] arm64/entry:
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
Date: Tue, 07 Apr 2026 23:08:36 +0200
Message-ID: <87cy0a4gx7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_140842_191478_7C1E8B0E 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: mark.rutland@arm.com, ruanjinjie@huawei.com, vladimir.murzin@arm.com, linux-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Apr 07 2026 at 14:16, Mark Rutland wrote:
> I've split the series into a prefix of changes for generic irqentry,
> followed by changes to the arm64 code. I'm hoping that we can queue the
> generic irqentry patches onto a stable branch, or take those via arm64.
> The patches are as follows:
>
> * Patches 1 and 2 are cleanup to the generic irqentry code. These have no
>   functional impact, and I think these can be taken regardless of the
>   rest of the series.
>
> * Patches 3 to 5 refactor the generic irqentry code as described above,
>   providing separate irqentry_{enter,exit}() functions and providing a
>   split form of irqentry_exit_to_kernel_mode() similar to what exists
>   for irqentry_exit_to_user_mode(). These patches alone should have no
>   functional impact.

I looked through them and I can't find any problem with them. I queued
them localy and added the missing kernel doc as I promised you on IRC.

As I have quite a conflict pending in the tip tree with other changes
related to the generic entry code, I suggest that I queue 1-5, tag them
for arm64 consumption and merge them into the conflicting branch to
avoid trouble with pull request ordering and headaches for the -next
people.

Does that work for you?

Thanks,

        tglx

