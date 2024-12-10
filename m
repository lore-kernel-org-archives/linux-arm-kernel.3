Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C639E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfP4FpWhYYSf9wFGSYYb7s10f0ypAiHtH76FSCJhkAc=; b=qr1FWOjEjrPGI/u6Uv9oVY+0gc
	4zRWjULO4K8yzeiImLRp+NBpGHsam27k59s2nlAuGxDzWKrZaQXsCtLJXc2aI8iP/0gPxm5uIjJEN
	qhKLmGDxTDm1IOckpqlTcMjuJlwz4n//ZiBulsljOyOcaIBisV53w9hNplhIzgAx/gQrGwMAoOtG8
	Xx5rK/ds/ypwoY1sDlglyslv7RBt6lqnOWaXmn/lLQffgvnINJ9sEdVB5eokG1eS5lCdh7gcQ5e2/
	H0MSsCSk1kyFctDUgUKnTz25t88fg/63ejwEIZQUIYrr/MqO51HZnQNTCEBhAal9PWUTr+1mhHkMw
	CI16hY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyPs-0000000BJUX-24ZM;
	Tue, 10 Dec 2024 11:28:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyOo-0000000BJJA-3ujN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:27:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1667113E;
	Tue, 10 Dec 2024 03:27:55 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC0F3F5A1;
	Tue, 10 Dec 2024 03:27:26 -0800 (PST)
Date: Tue, 10 Dec 2024 11:27:19 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: arm64: stacktrace: unwind exception boundaries
Message-ID: <Z1gll87-TkAqFwUz@J2N7QTR9R3>
References: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
 <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
 <Z1bWaGCvUrwrj2fZ@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1bWaGCvUrwrj2fZ@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_032731_017477_72E36798 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Dec 09, 2024 at 11:37:12AM +0000, Mark Rutland wrote:
> Hi Kent,
> 
> On Thu, Dec 05, 2024 at 01:04:59PM -0500, Kent Overstreet wrote:
> > On 6.13-rc1, I'm now seeing a ton of test failures due to this warning -
> > what gives?
> 
> Sorry about this; I just sent what I *thought* was a fix for this:
> 
>   https://lore.kernel.org/linux-arm-kernel/20241209110351.1876804-1-mark.rutland@arm.com/
> 
> ... but re-reading the below I see you're actually hitting a different
> issue.
> 
> > 00104 ========= TEST   generic/017
> > 00104        run fstests generic/017 at 2024-12-05 11:47:43
> > 00104 spectre-v4 mitigation disabled by command-line option
> > 00106 bcachefs (vdc): starting version 1.13: inode_has_child_snapshots
> > 00106 bcachefs (vdc): initializing new filesystem
> > 00106 bcachefs (vdc): going read-write
> > 00106 bcachefs (vdc): marking superblocks
> > 00106 bcachefs (vdc): initializing freespace
> > 00106 bcachefs (vdc): done initializing freespace
> > 00106 bcachefs (vdc): reading snapshots table
> > 00106 bcachefs (vdc): reading snapshots done
> > 00106 bcachefs (vdc): done starting filesystem
> > 00200 ------------[ cut here ]------------
> > 00200 WARNING: CPU: 8 PID: 12571 at arch/arm64/kernel/stacktrace.c:223 arch_stack_walk+0x2c0/0x388
> 
> Looking at v6.13-rc1, that's the warning in
> kunwind_next_frame_record_meta() for when the frame_record_meta::type is
> not a valid value, which likely implies one of the following:
> 
> (a) The logic to identify a frame_record_meta is wrong.
> 
> (b) The entry logic has failed to initilialize pt_regs::stackframe::meta
>     on an entry path somehow.
> 
> (c) The stack has been corrupted, and some frame record has been
>     clobbered to look like a frame_record_meta.

Looking some more, I see that bch2_btree_transactions_read() is trying
to unwind other tasks, and I believe what's happening here is that the
unwindee isn't actually blocked for the duration of the unwind, leading
to the unwinder encountering junk and consequently producing the
warning.

As a test case, it's possible to trigger similar with a few parallel
instances of:

	while true; do cat /proc/*/stack > /dev/null

The only thing we can do on the arm64 side is remove the WARN_ON_ONCE(),
which'll get rid of the splat. It seems we've never been unlucky enough
to hit a stale fgraph entry, or that would've blown up also.

Regardless of the way arm64 behaves here, the unwind performed by
bch2_btree_transactions_read() is going to contain garbage unless the
task is pinned in a blocked state. AFAICT the way
btree_trans::locking_wait::task is used is here is racy, and there's no
guarantee that the unwindee is actually blocked.

Mark.

