Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58886C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPNRLEqmFYVJhFqAZgqb1VPzblwmO4FUKXzQtvkjyrU=; b=Dr+UgtyLb/U7mFvhXNw5pxRxXb
	FtqitqUaiuYpqpKelHYtsVRIN13BeEa6vDKvhRPDpLlOlGMitLI0A2IqGYBmeg7uYn3OVtoM2VAoz
	e3M2PXMj71RfArjCgZWx/uH4vbCoB3YiUT02C1oQ21gec9uXUUYAgng1Q/2bsp9ZHNKtSu8EHIX+A
	vO1qe6rsXfg+/GHFwLnd3QaDFd8vhND+Z4VEjB5sM+o3a0kaIfKp+XCuRSJfTklRt1RnKDM4xonFo
	WImDlTJniU3gKDGiz1HytVFBbq+cL6a9uCgwwhD+UDgmRk4QaMEnLSBcJmQNion5zZNibJegB1Vtd
	Z/u8Y7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVLU-00000000ExY-2ZU6;
	Mon, 10 Feb 2025 15:05:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVK5-00000000EgY-0jro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83AFC5C5871;
	Mon, 10 Feb 2025 15:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2074FC4CED1;
	Mon, 10 Feb 2025 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739199822;
	bh=8CYs7UScYRbBksTKxuHuJ5vtjzDxeXmV0V9sf77Qyko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOBvXMGPHI4ya+tqEL+XKcedObEId9kWSttOpm3xA6UyBw1V7zRmuXQlNq1l1zK8C
	 UGov5mvt6xPA8quHY7T/3l0QWr21cbPhkJ/bQPIXLP74FSdZVhiXalSXG6eUfiqcvC
	 DwztCKLuy4pMlbXh6nuOHWT8JdN2RF9otjc5eXvimJadcPUUoqO6Ns6qNWiHsI3XDi
	 /8ib3EjUDrECUZGXcUWwHDdQTsQhdrxUydyPGZu80PojMqvPgtcKoP3WAKzq1Nw63e
	 /8aKs6x6qqgSIjSAfbTC0zlaw/1m+UXXhGr5GWtUKA+am9izmCvUAZ5l7LsgrnCVJP
	 BcQ4FdTDBGZ1w==
Date: Mon, 10 Feb 2025 15:03:36 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/9] arm64: Rely on generic printing of preemption
 model.
Message-ID: <20250210150336.GA7568@willie-the-truck>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-5-bigeasy@linutronix.de>
 <20250210120522.VvikzMr_@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210120522.VvikzMr_@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070345_254853_CFE03C0D 
X-CRM114-Status: GOOD (  10.50  )
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

On Mon, Feb 10, 2025 at 01:05:22PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-02-03 15:16:27 [+0100], To linux-kernel@vger.kernel.org wrote:
> > __die() invokes later show_regs() -> show_regs_print_info() which prints
> > the current preemption model.
> > Remove it from the initial line.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Is it okay, to route this via the sched tree?

Fine by me:

Acked-by: Will Deacon <will@kernel.org>

Will

