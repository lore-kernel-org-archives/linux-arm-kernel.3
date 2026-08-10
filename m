Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B59C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uZwkHPhKce8IirCrRsgZVUYno7hF2WlFdjhvdb1K5o=; b=wo4f7Q34lwdsNVFaaYlvZA4NgH
	9j6+khZ3JOkDRLfsdZp3fUOeWmKTqD3z+ExrYu14vW9ASD0DsVApBVsAQzawzN/X55ZDrrpAiafjv
	sL4Mnavfl2uNt+AaJcbQYCQjYmyO7lnzxkX/v0XitZ8eS875VhMQse/zQq5bdcqFTiGbQBju9tl9s
	9YR9ZYpD/2ZPGV4lKqlX2eVg9tXtm9u20X+zjSU9qdmWGpf0/oIV0UXdu2alKfDP2zd8X/Ivlqhpu
	Eg9ymZIIs6Qyp1UdWr6DTmYdui6MhF7JbK9vYFGhy2lF7tjkBDGUWjL2e7RxeL3G34IS9H+ywBdwx
	eGJ9ETpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPbq-0000000BqjP-2v3z;
	Mon, 10 Aug 2026 13:00:06 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPbo-0000000Bqih-0E4c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/uZwkHPhKce8IirCrRsgZVUYno7hF2WlFdjhvdb1K5o=; b=dlKn8FG4LNItQDxFo2zEU4yymZ
	1QFN0RTbUvkhrysjO+nK0Go0UwbydLCMSHN18A1pdGYzx4tUhcXQ9evT8FVDKFN/ffK+kiFE7UDm7
	9yzXvsUGHx4tQjvtaV215Hmt0GTSbRnWAR06JplP+cULNbpAV2rZy/7QiWn2NZk0si4mx171sPbHF
	hrlwiJgm6j8XeAwMU2lLfXvJ5VwWOjKaApGUpiaWzw//CMwQOze+Fz+VT99It+yYNRDXKtzNu2BQg
	NzJqZgcdzMCcWugfxmGk9tZ/izvJkC/pYkgBamjJf6lHRQ7qndYyXn21AQo0OzvGTk1B71EN4hmsq
	ytgbiiZQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wtPbd-002lfX-2N;
	Mon, 10 Aug 2026 12:59:53 +0000
Date: Mon, 10 Aug 2026 05:59:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
Message-ID: <annJFhJU5XVE8NKm@gmail.com>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3>
 <anXqMsJ14r3BAbMG@gmail.com>
 <anYHjvJ1_4dDjuzw@gmail.com>
 <anm5T9FazACqOWXF@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anm5T9FazACqOWXF@willie-the-truck>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_060004_095167_2B7CE416 
X-CRM114-Status: GOOD (  15.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Aug 10, 2026 at 12:43:11PM +0100, Will Deacon wrote:
> On Fri, Aug 07, 2026 at 09:29:12AM -0700, Breno Leitao wrote:
> > On Fri, Aug 07, 2026 at 07:58:21AM -0700, Breno Leitao wrote:
> > > Meanwhile, I will try to ftrace the writes to PMR and regs->pmr to get
> > > a better grasp of the states machine we are in (probably on Monday).
> > 
> > It seems LLM found a very easy to reproduce this:
> > 
> > 	bash-5.1# dmesg
> > 
> > 	bash-5.1#  cd /sys/kernel/tracing
> > 	echo 'r:pmr vfs_read bad=+0($retval):u64' >> kprobe_events
> > 	echo 1 > events/kprobes/pmr/enable
> 
> Nice, that triggers straightforwardly in QEMU for me. The diff below
> (which implements my suggestion from [1]) seems to fix the issue, but
> it would be good to hear feedback from one of the Arm folks.

I've tested the patch on my machines, and it fixes all the cases I've
got.

If it is useful:
  Tested-by: Breno Leitao <leitao@debian.org>

Thanks for looking at it,
--breno

