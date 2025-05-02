Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77A9C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RIHaS4NyUQQQxjQHFXWDvTVPnEdyMnbBligI3FDoBY=; b=EnSjwBpTNS4UyK7ifGlzzAN4lu
	nQwFSM7DQxTKU+TLOUAlGHp7TDKysOfibezekINuNpuEhvA3l/dg64yieqdqLZ32u5LvWf9VIs7RL
	3jP5Fyv20TRH/Lj3Uhyt5FCUumdfVfYqCacUNUYElhEFpaIuUbPkaoaw6Nf7LC8EBeif60jLXXcVE
	F7nMrTnkmOaUNdubBhDUtGpqknffGJGQas12Duru1FOM0QGEUAWIYajAWCYGp94amOZM2mx2sXyWS
	PcI/4zM4s8YN5GphYzrV/cUpJPplSOShJQZDXtGihdirjgd/L6ck9EBFrx4+cV/NyU57gbb4rUGfW
	O+pxi6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm9f-00000001FN2-4C7Z;
	Fri, 02 May 2025 08:54:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm5f-00000001EW7-0CPP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 08:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/RIHaS4NyUQQQxjQHFXWDvTVPnEdyMnbBligI3FDoBY=; b=u7QyzeB7TVJNCTciytPo75z74P
	WQtTb70VEpejxT7DVcvOg6ZZOdu6n02EpKo6V7uLwUhwktxLMMft13Bv35EI7Bp3HL+PRu3hR0rR1
	UTjboJVNv7RCfbqx9F6DCUTOH7+Vn8fQtz9h6PfpFF/rJOLBHOH+eLzry3JP/GaNQsQgPPhaifVXd
	qZvZWuN7PKe1qMxaas3Lpckh8vWUsOa5EY2zirXz4/x9vlBuh9DKGguelIB+MogyFTlu0pRYZwWHb
	v3iZLc2EH9JvIvKWi6gCQswYItaRisDb3JX6dIuFQLkBZqYU0PBo1rmikHgT0cxvT28wz5SjlasLl
	lV/4w/jg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAm4g-0000000B7ur-3a56;
	Fri, 02 May 2025 08:48:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0F40F3001D4; Fri,  2 May 2025 10:48:45 +0200 (CEST)
Date: Fri, 2 May 2025 10:48:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Prundeanu, Cristian" <cpru@amazon.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	"Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
	"Saidi, Ali" <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"Blake, Geoff" <blakgeof@amazon.com>,
	"Csoma, Csaba" <csabac@amazon.com>,
	"Doebel, Bjoern" <doebel@amazon.de>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: EEVDF regression still exists
Message-ID: <20250502084844.GT4198@noisy.programming.kicks-ass.net>
References: <20250429213817.65651-1-cpru@amazon.com>
 <20250429215604.GE4439@noisy.programming.kicks-ass.net>
 <82DC7187-7CED-4285-85FC-7181688CD873@amazon.com>
 <f241b773-fca8-4be2-8a84-5d3a6903d837@amd.com>
 <CFA24C6D-8BC4-490D-A166-03BDF3C3E16C@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CFA24C6D-8BC4-490D-A166-03BDF3C3E16C@amazon.com>
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

On Thu, May 01, 2025 at 04:16:07PM +0000, Prundeanu, Cristian wrote:

> (Please keep in mind that the target isn't to get SCHED_BATCH to the same
> level as 6.5-default; it's to resolve the regression from 6.5-default to
> 6.6+ default, and from 6.5-SCHED_BATCH to 6.6+ SCHED_BATCH).

No, the target definitely is not to make 6.6+ default match 6.5 default.

The target very much is getting you performance similar to the 6.5
default that you were happy with with knobs we can live with.

