Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C078CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/0wAm6mwf+xx0gp44Kb3h1fQJN2+oekj+V8ngaLLkk=; b=dxmFKNTJWMaEKYu8K4wdpoG2z2
	vY9zK9OM/X7qWLxsZdMeDzI8Iemq9YHByshNtQ9fUd0B2ziR8fOyZc+z54JmJQgkTX/0qb3ooZuvB
	ZFPju1S3Ot8JytTXBpzR9Y6bFxhbAGZFCjBsr25Lq0Is0Hu7XbFwWqlzpVpHD0In9e6QdrXq/5vu5
	xtuCA5cAt7rjDkM9xlFVEZVO7r8TCbPg+UZqvunbHLQPg4nwUmama1X8mAwYrLLyZ7pKDrOdX4xBM
	muNwMJRCeIWBqCRSfKzYUw4d6lLCbp6z+L11bJ8pBEWeh0V+aOCddy29SLabct6JMKkVSSqi5lDcZ
	BL1Ih2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGIt-0000000H4WP-1mzN;
	Thu, 05 Dec 2024 18:10:19 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGDp-0000000H3eJ-3Bit
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:05:07 +0000
Date: Thu, 5 Dec 2024 13:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733421903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C/0wAm6mwf+xx0gp44Kb3h1fQJN2+oekj+V8ngaLLkk=;
	b=DTncR6Y5mA5Y7j8JEDZCiuaVLQqxXdm6EI5UZvAiaW6dRKVGrQgzRI55HKE5UDTl/I/80w
	anM2v6U54fYUgOn9SDwik2PN/YKiTOQHOsPzHp/5gx9c3fB3sTEpm1AgfRWwegc/cOY8Ps
	fq2GrnvkH/uFuQUsJuv8IyHLYe4sIfI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: arm64: stacktrace: unwind exception boundaries
Message-ID: <zbwbgkuvvciezpmigcp6gaahfxwm7cwhpzus7gtbfnbzsjb2n3@kfbdppbd74o4>
References: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36kx57aw46vwykgckr5cm4fafhw54tjuj4cqljrdnpfwvjl7if@a7znuhpfu54o>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100506_089909_146169A9 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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

On 6.13-rc1, I'm now seeing a ton of test failures due to this warning -
what gives?

00104 ========= TEST   generic/017
00104        run fstests generic/017 at 2024-12-05 11:47:43
00104 spectre-v4 mitigation disabled by command-line option
00106 bcachefs (vdc): starting version 1.13: inode_has_child_snapshots
00106 bcachefs (vdc): initializing new filesystem
00106 bcachefs (vdc): going read-write
00106 bcachefs (vdc): marking superblocks
00106 bcachefs (vdc): initializing freespace
00106 bcachefs (vdc): done initializing freespace
00106 bcachefs (vdc): reading snapshots table
00106 bcachefs (vdc): reading snapshots done
00106 bcachefs (vdc): done starting filesystem
00200 ------------[ cut here ]------------
00200 WARNING: CPU: 8 PID: 12571 at arch/arm64/kernel/stacktrace.c:223 arch_stack_walk+0x2c0/0x388
00200 Modules linked in:
00200 CPU: 8 UID: 0 PID: 12571 Comm: cat Not tainted 6.13.0-rc1-ktest-gdf1fce23d033 #10877
00200 Hardware name: linux,dummy-virt (DT)
00200 pstate: 80001005 (Nzcv daif -PAN -UAO -TCO -DIT +SSBS BTYPE=--)
00200 pc : arch_stack_walk+0x2c0/0x388
00200 lr : arch_stack_walk+0x1f4/0x388
00200 sp : ffffff80ca757b00
00200 x29: ffffff80ca757b00 x28: ffffff80d6783758 x27: 000000000000036f
00200 x26: ffffff80d6783780 x25: ffffff80c19de180 x24: ffffff80c273ee40
00200 x23: ffffffc080022708 x22: ffffffc080025828 x21: ffffff80ca757be8
00200 x20: ffffffc0800c98c8 x19: ffffff80d8533d10 x18: ffffffffffffffff
00200 x17: 0000000000000000 x16: 0000000000000000 x15: ffffffffffffffff
00200 x14: 0000000000000000 x13: ffffff80d6c92000 x12: 0000000000000000
00200 x11: 0000000000000000 x10: 000000000000000a x9 : ffffffc08086beec
00200 x8 : ffffff80ca757bc0 x7 : 0000000000000000 x6 : ffffff80d8533d28
00200 x5 : ffffff80ca757b60 x4 : ffffff80d8534000 x3 : ffffff80ca757b40
00200 x2 : 0000000000000018 x1 : ffffff80d8533d10 x0 : 0000000000000000
00200 Call trace:
00200  arch_stack_walk+0x2c0/0x388 (P)
00200  arch_stack_walk+0x1f4/0x388 (L)
00200  stack_trace_save_tsk+0x90/0xd8
00200  bch2_save_backtrace+0x68/0x160
00200  bch2_prt_task_backtrace+0x30/0xb8
00200  bch2_btree_transactions_read+0xe0/0x1f0
00200  full_proxy_read+0x60/0xd0
00200  vfs_read+0x80/0x2d8
00200  ksys_read+0x5c/0xf0
00200  __arm64_sys_read+0x20/0x30
00200  invoke_syscall.constprop.0+0x54/0xe8
00200  do_el0_svc+0x44/0xc8
00200  el0_svc+0x18/0x58
00200  el0t_64_sync_handler+0x104/0x130
00200  el0t_64_sync+0x154/0x158
00200 ---[ end trace 0000000000000000 ]---
00233 hrtimer: interrupt took 49506640 ns
00493 bcachefs (vdb): shutting down
00493 bcachefs (vdb): going read-only
00493 bcachefs (vdb): finished waiting for writes to stop
00493 bcachefs (vdb): flushing journal and stopping allocators, journal seq 18
00493 bcachefs (vdb): flushing journal and stopping allocators complete, journal seq 18
00493 bcachefs (vdb): clean shutdown complete, journal seq 19
00493 bcachefs (vdb): marking filesystem clean
00493 bcachefs (vdb): shutdown complete
00493 bcachefs (vdc): shutting down
00493 bcachefs (vdc): going read-only
00493 bcachefs (vdc): finished waiting for writes to stop
00493 bcachefs (vdc): flushing journal and stopping allocators, journal seq 41457
00493 bcachefs (vdc): flushing journal and stopping allocators complete, journal seq 41459
00493 bcachefs (vdc): clean shutdown complete, journal seq 41460
00493 bcachefs (vdc): marking filesystem clean
00493 bcachefs (vdc): shutdown complete
00495 bcachefs (vdc): starting version 1.13: inode_has_child_snapshots
00495 bcachefs (vdc): recovering from clean shutdown, journal seq 41460
00495 bcachefs (vdc): accounting_read... done
00495 bcachefs (vdc): alloc_read... done
00495 bcachefs (vdc): stripes_read... done
00495 bcachefs (vdc): snapshots_read... done
00495 bcachefs (vdc): going read-write
00495 bcachefs (vdc): journal_replay... done
00495 bcachefs (vdc): resume_logged_ops... done
00495 bcachefs (vdc): delete_dead_inodes... done
00495 bcachefs (vdc): done starting filesystem
00495 bcachefs (vdc): shutting down
00495 bcachefs (vdc): going read-only
00495 bcachefs (vdc): finished waiting for writes to stop
00495 bcachefs (vdc): flushing journal and stopping allocators, journal seq 41460
00495 bcachefs (vdc): flushing journal and stopping allocators complete, journal seq 41460
00495 bcachefs (vdc): clean shutdown complete, journal seq 41461
00495 bcachefs (vdc): marking filesystem clean
00495 bcachefs (vdc): shutdown complete
00495 _check_dmesg: something found in dmesg (see /ktest-out/xfstests/generic/017.dmesg)
00496 
00496 /ktest-out/xfstests/generic/017.full:
00496 cat: /ktest-out/xfstests/generic/017.full: No such file or directory
00496 ========= FAILED generic/017 in 391s, exit status 0


