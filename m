Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74982D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpLTGl9Ig93rHsyzM4wM1Y9hKu2EFOGS9QzZWWHwW7I=; b=HForkGZP3ygu6CCHEvmcTWWRvD
	3oklGeNCg0frvW4/F6K4PNHFcOVo5hpnwEBh4l4BDdY/NGBTZlNMeNKG99gvR9r/Qr7txQJtRiVfc
	JjknhY4Diz344njkyFvLqEPi22sk3FUu7sxIi37ZxiDpYBUeRPBnxALrka0ChrwqPNNvSQEQMmPNS
	kwIIe4yJXChH6Z7iaDG2RJe7WRiAtlfdVDrIgepcPifLlEHBvGHShh70EBFsTf3vRciKpYqXiIBzh
	2cK8+O++n2yWwdovj4yH0xxSf2I2Rd48mq2ya5aMWIvdtwBq+t79EpebVJa6QokfsYRyctYcqqpyv
	Lk4lUYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veruk-000000044SW-09zU;
	Sun, 11 Jan 2026 09:39:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1verui-000000044SO-2g68
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 09:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3ED960010;
	Sun, 11 Jan 2026 09:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C72C4CEF7;
	Sun, 11 Jan 2026 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768124351;
	bh=aW0CKm78TXJY3BMiQ9I1oxayXIOYf/OmUdlBeqOFtnk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cho7HjziD8w7WwL8AxcEbVjRqlZee/4T7QpW9RCc9XbE9uFowp3c67CfKFmedvKsd
	 R6o3Wx1Nb1D9Kfhb2YC2nETOPZaT1bJ0e/pwNjVJ9dZs2QMZpB19y15C7+z16FzyJi
	 LsmOq7rnqVQxoTSxE+TX3rFuyVLyLLFOt10gva6QvFzGGO2paBN8+ykP7IGmHcVIhR
	 d68mDvkxhN110U0zXkIV7eMAzQLEfoB7sTqh0qP4eDkA+KKzhQupgF/ec97cJ3Qoil
	 4DzOteFEOO8Dumbi6x2yP128Zmorob8Rwl6LZItHmjrIC5UnpkCjGkh0g5ES9Z2HNv
	 NRPSov4m3Srlg==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
In-Reply-To: <86wm1qlq7l.wl-maz@kernel.org>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org>
Date: Sun, 11 Jan 2026 10:39:07 +0100
Message-ID: <87ecnwij44.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Jan 09 2026 at 16:13, Marc Zyngier wrote:
> On Thu, 08 Jan 2026 22:11:33 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> At the point where a CPU is brought up, the topology should be known
>> already, which means this can be allocated on the control CPU _before_
>> the new CPU comes up, no?
>
> No. Each CPU finds *itself* in the forest of redistributors, and from
> there tries to find whether it has some shared resource with a CPU
> that has booted before it. That's because firmware is absolutely awful
> and can't present a consistent view of the system.

Groan....

> Anyway, I expect it could be solved by moving this part of the init to
> an ONLINE HP callback.

Which needs to be before CPUHP_AP_IRQ_AFFINITY_ONLINE, but even that
might be to late because there are callbacks in the STARTING section,
i.e. timer, perf, which might rely on interrupts being accessible.

Also that patch seems to be incomplete because there is another
allocation further down in allocate_vpe_l1_table()....

Thanks,

        tglx

