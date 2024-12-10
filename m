Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ED6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcKuJfhX/Ve5UPNSYYBlcC61G/qM8OOE7m7h/NqoP64=; b=4yhh75RNkfevqmtvUBFGJocTmR
	/hGZF/dWutFnUeJPSXEPsl+ZPT0cizh3uuqOQBSYlf+yNAX8GL7LPqVFU3v2GXRFCc5WlT6ITynta
	C9OEDj2ZNQDCEV95HpITbHh9/i9UPvBiFI1/zoo2DfNzODBtxj69Ym2AzHgfxKxLi2RbfbmGScykV
	Cv3B3+/2+dJ+OHZDQWtGZUIcvC6XyXqN765yLOBxspR5NgaK8cwVsmT4gHIZEdNZvQmPJLyk9hzhs
	YGXJq3Lun3veDhD1Zldk2jHDwcF1d2GYgZHUYQDxagwot65wksO8KZB2S+I77YP404FGb2Bv8WGnT
	DYN4RX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzYN-0000000BSUG-3FPn;
	Tue, 10 Dec 2024 12:41:27 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzXJ-0000000BSI6-0K32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:40:22 +0000
Date: Tue, 10 Dec 2024 07:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733834412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcKuJfhX/Ve5UPNSYYBlcC61G/qM8OOE7m7h/NqoP64=;
	b=tnMhpc6aviml/dMEm+3MILIlN8t8FtLRPRqyubeTu9IR05BO2GS/UrzKhjTreAYbpN9aKo
	Zg4QB9SiE9nr/lY3pthbYeF18JZAxW8TEZm5QIgxxacR59exy4RktwiF1O/TfBwceuz7GQ
	pwn59T8kkWD4LNAVEH4BA7IIzURY8vA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: arm64: stacktrace: unwind exception boundaries
Message-ID: <rxc57eg65sg4iayhj7gc7yl24w524lviedxnydl2mggqnatglq@iairj2ci7ioj>
References: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
 <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
 <Z1bWaGCvUrwrj2fZ@J2N7QTR9R3>
 <Z1gll87-TkAqFwUz@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1gll87-TkAqFwUz@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_044021_391368_E1F44D5C 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, Dec 10, 2024 at 11:27:19AM +0000, Mark Rutland wrote:
> On Mon, Dec 09, 2024 at 11:37:12AM +0000, Mark Rutland wrote:
> > Hi Kent,
> > 
> > On Thu, Dec 05, 2024 at 01:04:59PM -0500, Kent Overstreet wrote:
> > > On 6.13-rc1, I'm now seeing a ton of test failures due to this warning -
> > > what gives?
> > 
> > Sorry about this; I just sent what I *thought* was a fix for this:
> > 
> >   https://lore.kernel.org/linux-arm-kernel/20241209110351.1876804-1-mark.rutland@arm.com/
> > 
> > ... but re-reading the below I see you're actually hitting a different
> > issue.
> > 
> > > 00104 ========= TEST   generic/017
> > > 00104        run fstests generic/017 at 2024-12-05 11:47:43
> > > 00104 spectre-v4 mitigation disabled by command-line option
> > > 00106 bcachefs (vdc): starting version 1.13: inode_has_child_snapshots
> > > 00106 bcachefs (vdc): initializing new filesystem
> > > 00106 bcachefs (vdc): going read-write
> > > 00106 bcachefs (vdc): marking superblocks
> > > 00106 bcachefs (vdc): initializing freespace
> > > 00106 bcachefs (vdc): done initializing freespace
> > > 00106 bcachefs (vdc): reading snapshots table
> > > 00106 bcachefs (vdc): reading snapshots done
> > > 00106 bcachefs (vdc): done starting filesystem
> > > 00200 ------------[ cut here ]------------
> > > 00200 WARNING: CPU: 8 PID: 12571 at arch/arm64/kernel/stacktrace.c:223 arch_stack_walk+0x2c0/0x388
> > 
> > Looking at v6.13-rc1, that's the warning in
> > kunwind_next_frame_record_meta() for when the frame_record_meta::type is
> > not a valid value, which likely implies one of the following:
> > 
> > (a) The logic to identify a frame_record_meta is wrong.
> > 
> > (b) The entry logic has failed to initilialize pt_regs::stackframe::meta
> >     on an entry path somehow.
> > 
> > (c) The stack has been corrupted, and some frame record has been
> >     clobbered to look like a frame_record_meta.
> 
> Looking some more, I see that bch2_btree_transactions_read() is trying
> to unwind other tasks, and I believe what's happening here is that the
> unwindee isn't actually blocked for the duration of the unwind, leading
> to the unwinder encountering junk and consequently producing the
> warning.
> 
> As a test case, it's possible to trigger similar with a few parallel
> instances of:
> 
> 	while true; do cat /proc/*/stack > /dev/null
> 
> The only thing we can do on the arm64 side is remove the WARN_ON_ONCE(),
> which'll get rid of the splat. It seems we've never been unlucky enough
> to hit a stale fgraph entry, or that would've blown up also.
> 
> Regardless of the way arm64 behaves here, the unwind performed by
> bch2_btree_transactions_read() is going to contain garbage unless the
> task is pinned in a blocked state. AFAICT the way
> btree_trans::locking_wait::task is used is here is racy, and there's no
> guarantee that the unwindee is actually blocked.

Occasionally returning garbage is completely fine, as long as the
interface is otherwise safe. This is debug info; it's important that it
be available and we can't impose additional synchronization for it.

