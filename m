Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3CDC9EC97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbowfVWNa2Au1b9LVtRl2O++sYwdt45+MJPUUDwH0nM=; b=L1CgfOrveVmINuzSMQ6+Weh6+o
	nWA6IjDR2wZSrrRHaqMvAKdsC8cKtzPOaFrmb4yp2Dm3OMpoydhz7M7DAWpsbZew8DtJK2U1Dd6qm
	W3rfd+hhj6DAB0wtWEEsno5fcvARFyOupIjQhOoH5pbum6gmOfnQUvSIOw6WBQVbV6dJTZlYina7Y
	lvbyDo+2HSlvHFTOtZw7OzmwLcv0bbwaiIRmP6qDo1m02SZ3EtDBirC0x3qwC/xvHZAgGbBMMCYJz
	vJyPyR4Pfp+zzV/Vlegqk+txAMhIMdRovnqGu4Q1SaTV13O88GRwCN1SUZZHIcXHWTz9T4nk6L82S
	og3k8hpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJYJ-00000005c2z-2N8U;
	Mon, 12 Jan 2026 15:09:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJYI-00000005c2r-1tm2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 846406000A;
	Mon, 12 Jan 2026 15:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D25EC16AAE;
	Mon, 12 Jan 2026 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768230593;
	bh=SLLkOQ5pxC+Xfk84C/8GnkXcwep/asaQqw3bn0kNW0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PoQG3MNbzDflVzcD8PDZTq+p3TS6E4HKQMo/CnosiFbQgC6ToFRKjRh8W7BtW1j+/
	 F2KSeN0J1sO74fQ6WkQnw0BiRv8ROqBrIMdIVWheMozYjHI6Fe88+8sx/2B4fjbaEf
	 qwwfikKji8Hb4ug0YcpLbYkxhd+xDKj4aQOIMDihcCD9TpwkHW+9v50MVZDVewZ8py
	 tLJpx9mPsIE40lEtYy7JM+1OddpQsyjn+/uYdmku45XRrt1GqFs9NaqLWTwUAFxO1g
	 MsR87UOq+cSoYZl4w4cqDqfrBLgz3QhzeiBzadvBXCglJC47OiLn7KCxgO1fpGac3d
	 8tVNRQMSYv0KA==
From: Thomas Gleixner <tglx@kernel.org>
To: Waiman Long <llong@redhat.com>, Marc Zyngier <maz@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
In-Reply-To: <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
 <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com>
Date: Mon, 12 Jan 2026 16:09:49 +0100
Message-ID: <87cy3eg94y.ffs@tglx>
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

On Sun, Jan 11 2026 at 18:02, Waiman Long wrote:
> On 1/11/26 5:38 AM, Marc Zyngier wrote:
>>> Also that patch seems to be incomplete because there is another
>>> allocation further down in allocate_vpe_l1_table()....
>> Yeah, I wondered why page allocation wasn't affected by this issue,
>> but didn't try to find out.
>
> The use of GFP_ATOMIC flag in the page allocation request may help it to 
> dip into the reserved area and avoid taking any spinlock. In my own 
> test, just removing the kzalloc() call is enough to avoid any invalid 
> context warning. In the page allocation code, there is a zone lock and a 
> per_cpu_pages lock. They were not acquired in my particular test case, 
> though further investigation may be needed to make sure it is really safe.

They might be acquired though. Only alloc_pages_nolock() guarantees that
no lock is taken IIRC.


