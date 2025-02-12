Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AEBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ81znQZGEuoyNxZOXsZqvcJtEQBlpO8wgGvS5o+ydE=; b=3feDDZckowOgf80Bi7ycfiMkxZ
	X25c7KaSmz7h5vvl70ZUI8SIua5TsoJyRMDYrorvDPG/Gqvs7Pod5D645E/dEVcmevh4MQ8WoLy6d
	nm6U/aa5QL4uBSEhFRuLJ+CDeo+P9sC23njvh6YB/Et64v/tOIYOCKku6PyfWJ18nzzO7IvG86jb8
	Ab3dwwMsgHwjjdcVLbnbAlT9JnIfqgYZcAFvg/X7Qs/PM1/PAYRCMPQ3A9q6OVOEmZPkVkD6e4rb7
	dfcvULZFAAcm5qZt64mclg9H6WQlSgTFe9+TtJ3AzUk7+LPllpyG5YId6awX4/sk77pqZPeu4h04N
	1dK3xu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCU5-00000007RyQ-3Ide;
	Wed, 12 Feb 2025 13:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCSf-00000007Rbz-2MYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 13:07:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A18212FC;
	Wed, 12 Feb 2025 05:07:50 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDEE83F58B;
	Wed, 12 Feb 2025 05:07:26 -0800 (PST)
Date: Wed, 12 Feb 2025 13:07:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: BUG: debug_exception_enter() disables preemption and may call
 sleeping functions on aarch64 with RT
Message-ID: <Z6ydDD5uMMgLi2RO@J2N7QTR9R3>
References: <Z6YW_Kx4S2tmj2BP@uudg.org>
 <Z6n16cK85JMyowDq@J2N7QTR9R3>
 <Z6tf8iDhNriSGjeC@uudg.org>
 <Z6vs3IWxUxhIDBBO@uudg.org>
 <Z6yWwRcPvVGk2EyC@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6yWwRcPvVGk2EyC@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_050729_654707_2657EB8C 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Feb 12, 2025 at 12:40:33PM +0000, Mark Rutland wrote:

> * In entry-common.c, add new el{1,0}_step() functions. Each of
>   el1h_64_sync_handler(), el0t_64_sync_handler(), and
>   el0t_32_sync_handler() should be updated to call those rather than
>   el{1,0}_dbg() for the corresponding EC values.
> 
>   In el0_step() it shouldn't be necessary to disable preemption, and
>   that should be able to be:
> 
>   | static void noinstr el0_step(struct pt_regs *regs, unsigned long esr)
>   | {
>   |         enter_from_user_mode(regs);
>   |         local_daif_restore(DAIF_PROCCTX);
>   |         do_el0_step(regs, esr);
>   |         exit_to_user_mode(regs);
>   | }
> 
>   In el1_step(), I'm not *immediately sure* whether it's necessary to
>   disable preemption, nor whether we need to treat this and use
>   arm64_enter_el1_dbg() and arm64_exit_el1_dbg() rather than
>   entry_from_kenrel_mode() and exit_to_kernel_mode().

From another look, some care will need to be taken around
reinstall_suspended_bps(), which will also need to be reworked. That
definitely needs preemption disabled when poking the HW breakpoints, and
today those can't change under our feet between entry and handling, so
we'll need to think very hard about how that needs to work.

Note that care needs to be taken with *any* approach that doesn't
disable preemption.

Mark.

