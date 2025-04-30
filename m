Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB75EC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnpd3q5WOijzfJQLTLp3KY3bMqG+b+asGNrhRbSKFUs=; b=1zWaF0J88VmKT/+FyK2xgQyPdB
	6pjYdO/O+ysseUEgkYS/SIc/FTi0lCcLJXuec784eCg+XeGxQCKtijWi95rt2HuXlkcnfX+Uwahja
	FbikqG/K5jv78lgAe09G0ZWCNVJW25NMqUqNVKj3WFGxNPee8FXqX8KDg721WfgaJChj+kG7X6Qc0
	fxOQx5VVVRfsW3jp/tQSxiJs02kNAE1yQrveB08i5k9uxz4oAxtbmhZ8Vx9trujpf96dtTcLlr4h3
	GW3SRhFhGC5zmXJRuyjfwl0jLHxkQ3/Iegc6ADEJCZJYRtKlebN1xfOFO4tb846yxGuNJYKrcpeia
	hsNGDCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA60Q-0000000Cjqn-1Ala;
	Wed, 30 Apr 2025 11:53:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4HP-0000000CSzD-2n5P
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 10:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wnpd3q5WOijzfJQLTLp3KY3bMqG+b+asGNrhRbSKFUs=; b=iPP1cP0bFtD3Rv3xLAGyffUDiZ
	KKZU3/5OI9Imh0rKeKe7yM+m7wFhp2kvOPllhKaxzyJTuWhpIdA6tb1oowm84bawgx8wd02qNu6cR
	4EVMvZn1Fl9QCCzoXuYLo5HmbJXplPthuBzppxOog5bkXxNqG2qm5JL0IR+YGf/ReBl+vKg4vFE8z
	txEh+QdtASPET3fCX8boA2V+WUmWH98O1aUY9MjhQiznUoXd7uN0/1jMZwL5U77RpDfQUlDvMCxPS
	aSXYdFnpcc9NRg4FrtWUS3zd7PmwgClqpdOZBHmZd8MbUJoWrv1ezKD8UMB+DLyw7Up7nvGUb/0Tw
	y0KgRDMw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA4HL-0000000DlSm-2vRX;
	Wed, 30 Apr 2025 10:03:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3A8AB300642; Wed, 30 Apr 2025 12:02:59 +0200 (CEST)
Date: Wed, 30 Apr 2025 12:02:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Cristian Prundeanu <cpru@amazon.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Geoff Blake <blakgeof@amazon.com>, Csaba Csoma <csabac@amazon.com>,
	Bjoern Doebel <doebel@amazon.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: EEVDF regression still exists
Message-ID: <20250430100259.GK4439@noisy.programming.kicks-ass.net>
References: <20250429213817.65651-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429213817.65651-1-cpru@amazon.com>
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

On Tue, Apr 29, 2025 at 04:38:17PM -0500, Cristian Prundeanu wrote:

> [1] https://github.com/aws/repro-collection/blob/main/repros/repro-mysql-EEVDF-regression/results/20250428/README.md

That 'perf sched stats diff' output is completely broken -- probably
trying to diff two different schedstat versions isn't working.

Anyway, looking at the two individual reports side by side:

 - schedule() left the processor idle             -- is up

vs.

 - pull_task() count on cpu newly idle            -- is down
 - load_balance() success count on cpu newly idle -- is down

Which seem related and would suggest we look at newidle balance. One of
the things we've seen before is that newidle was affected by the shorter
slice of EEVDF. But it is also quite possible something changed in the
load-balancer here.

Also of note is that .15 seems to have a lower number of 'ttwu() was
called to wake up on the local cpu' -- which I'm not quite sure how to
rhyme with the previous observation. The newidle thing seems to suggest
not enough migrations, while this would suggest too many migrations.



