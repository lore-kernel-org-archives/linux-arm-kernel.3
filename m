Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80814D232C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+6JxC3+3n7TuboudkoCggSuoiX+eEunMj6hPzucA8I=; b=Ncpe1kMNhnnA3JD/M5OLOVwO4A
	1c+CKro5DynQ0oE7+r+UAmlWnrLlUpQE990anZSsIu3Q7qdr1ePhnL6wZzMfSpPdbrLEiS65uofBi
	GbeONzprNm3agEh6RgUFHJoov+iekSJe3Sn1kBrHqcANlkTiRDSNoo+vpzNHNLN10a8XOX16KeHG3
	ncWr5C5ddyYQ9PAi3DV+lBPz7jnjmGZf6Mj5IMaN6E13GbLy1bX1RrfVVFx5SLgZJW0iVxS9OOXQW
	CPgrN7zFKon3pZRNefBLOC10vr/2Q00Q77z1L1bdgDyORRmqHfC3Y7uJcoGKyk3ZiPHkeI9Jm+4rq
	fEvaP3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyEH-00000000w9L-0JJ6;
	Thu, 08 Jan 2026 22:11:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyEE-00000000w8v-1FuF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 22:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8129143DAA;
	Thu,  8 Jan 2026 22:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8687DC116C6;
	Thu,  8 Jan 2026 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767910297;
	bh=OzHtw4j1Hs0u/sB/+AK8QyJAGm8BaIB2L3o2cUocQfY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i0utsSnhzOYxUmd3u04lOOehC9ehc0ewEP7S0C5qBxZgTMySISjx6VuMguuOlEW61
	 1Jrtd2roEkaqN7G5DPTxJX9dluOoD3pxzw7ghgl3oGv2pYMbWcxefr5j4/rxPaao63
	 ZJdkTartSJ/Md2NME2wrvFgoz8nt2u6LLnlGHw9m3ITqO0CY3kZI2eh6kbUvsvO6+9
	 MY4xemfwU6N90+5h2II+ny+THvkgaUTdUfsZZKuDlxPUt3oRL9s5LoqJpZPHmzlalN
	 DTFWs3Nz7dCdE8MqbaBZC/ady7yOsHTO+NMrwDrioCNo2Q6efIu5fwqprJVwWNIgDa
	 3Nw3c/kgZHWuQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Waiman Long <longman@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
In-Reply-To: <864iowmrx6.wl-maz@kernel.org>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org>
Date: Thu, 08 Jan 2026 23:11:33 +0100
Message-ID: <87ms2nsqju.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_141138_392877_068E4A52 
X-CRM114-Status: GOOD (  16.28  )
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

On Thu, Jan 08 2026 at 08:26, Marc Zyngier wrote:
> Err, no. That's horrible. I can see three ways to address this in a
> more appealing way:
>
> - you give RT a generic allocator that works for (small) atomic
>   allocations. I appreciate that's not easy, and even probably
>   contrary to the RT goals. But I'm also pretty sure that the GIC code
>   is not the only pile of crap being caught doing that.
>
> - you pre-compute upfront how many cpumasks you are going to require,
>   based on the actual GIC topology. You do that on CPU0, outside of
>   the hotplug constraints, and allocate what you need. This is
>   difficult as you need to ensure the RD<->CPU matching without the
>   CPUs having booted, which means wading through the DT/ACPI gunk to
>   try and guess what you have.
>
> - you delay the allocation of L1 tables to a context where you can
>   perform allocations, and before we have a chance of running a guest
>   on this CPU. That's probably the simplest option (though dealing
>   with late onlining while guests are already running could be
>   interesting...).

At the point where a CPU is brought up, the topology should be known
already, which means this can be allocated on the control CPU _before_
the new CPU comes up, no?

Thanks,

        tglx

