Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48147EC1101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUkulhqd3j21MPEfBNgvIJ+c5xdGo3X/2WCE+4JMzlw=; b=rSw98lpfWUCRZcrUsIVH4m84UQ
	VMRWFt9qtTACxZIfI3WFDDDyEE907sRZTJM37vh/tfpyoSB0SgzNp5eUFcQf8vJvcbZJm18VK/WfD
	+Z4q8fhPcL/MKSpz9J44qPcAVANGnOYWnJyzsz0Ua4TSCxQ10OzMrHoCm22nnm9hWBzKd85NIi3pW
	Dqtg4ENFQe029m5TjiiUtzFByKszHoV98Gey2yzPel6GXY3W2ENPA7ORE+X6Q1duFcRURQwNHqZAV
	p0gHswaz060mf0U6mihPtB0ksuV2J7MFFhUd1tL/o4mLKmvtLp3toa8xrMQYqzDnl4Lf9ayna9Ipa
	ZVYevUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYUd-00000000dpP-0Q53;
	Mon, 23 Feb 2026 16:09:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYUb-00000000dpH-29pb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB17760097;
	Mon, 23 Feb 2026 16:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C5AC116C6;
	Mon, 23 Feb 2026 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862944;
	bh=U1f4VUWvlVoHVRzjSsvSj6+GTfFekKDeqZn6GrwXI0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l9pVaPN/cxEh/suCVhuWE9zKuRvobiCEGJ0txgkBo9PpXkl47x3YeBE24NtYlHPBp
	 Z9MvnO0WtjK2zPWfQ/IfIVLCZffKJlqemIihS/QeSLhwIJq8IdOPIU+1f9688A4XMp
	 gwlAn+/8UAVE4a0QW6Jp5dz96715FKWMWVIWgA0sngCXHv+7g87EwavNZvdprMhmg7
	 MahbRAl/A4ygOiEtD77hedrDSCJEvgQIk8RNwhzzo9fFOFuUA/+QEBobC2lco7cD/+
	 etfl/NJ7Xp0yiJtecEPjRZB5hFueUHK0rlemZus13jXbfPV+sMsHDxL+4n4NsgZMVR
	 B+47pl7GCN5cg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vuYUX-0000000D3Lu-3QOf;
	Mon, 23 Feb 2026 16:09:01 +0000
Date: Mon, 23 Feb 2026 16:09:01 +0000
Message-ID: <86jyw3a1cy.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,	LKML
 <linux-kernel@vger.kernel.org>,	Michal =?UTF-8?B?S291dG7DvQ==?=
 <mkoutny@suse.com>,	Andrew Morton <akpm@linux-foundation.org>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,	Eric Dumazet
 <edumazet@google.com>,	Gabriele Monaco <gmonaco@redhat.com>,	Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,	Jens Axboe <axboe@kernel.dk>,	Johannes
 Weiner <hannes@cmpxchg.org>,	Lai Jiangshan <jiangshanlai@gmail.com>,	Marco
 Crivellari <marco.crivellari@suse.com>,	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,	Paolo Abeni <pabeni@redhat.com>,	Peter
 Zijlstra <peterz@infradead.org>,	Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,	Roman Gushchin
 <roman.gushchin@linux.dev>,	Shakeel Butt <shakeel.butt@linux.dev>,	Simon
 Horman <horms@kernel.org>,	Tejun Heo <tj@kernel.org>,	Thomas Gleixner
 <tglx@linutronix.de>,	Vlastimil Babka <vbabka@suse.cz>,	Waiman Long
 <longman@redhat.com>,	Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,	linux-mm@kvack.org,	linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 04/33] mm: vmstat: Prepare to protect against concurrent isolated cpuset change
In-Reply-To: <47be2ff3-c25a-4aab-89fc-53921af8b0a9@baylibre.com>
References: <20260101221359.22298-1-frederic@kernel.org>
	<20260101221359.22298-5-frederic@kernel.org>
	<47be2ff3-c25a-4aab-89fc-53921af8b0a9@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dlechner@baylibre.com, frederic@kernel.org, linux-kernel@vger.kernel.org, mkoutny@suse.com, akpm@linux-foundation.org, bhelgaas@google.com, catalin.marinas@arm.com, chenridong@huawei.com, dakr@kernel.org, davem@davemloft.net, edumazet@google.com, gmonaco@redhat.com, gregkh@linuxfoundation.org, mingo@redhat.com, kuba@kernel.org, axboe@kernel.dk, hannes@cmpxchg.org, jiangshanlai@gmail.com, marco.crivellari@suse.com, mhocko@suse.com, muchun.song@linux.dev, pabeni@redhat.com, peterz@infradead.org, pauld@redhat.com, rafael@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, horms@kernel.org, tj@kernel.org, tglx@linutronix.de, vbabka@suse.cz, longman@redhat.com, will@kernel.org, cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 23 Feb 2026 16:01:03 +0000,
David Lechner <dlechner@baylibre.com> wrote:
> 
> On 1/1/26 4:13 PM, Frederic Weisbecker wrote:
> > The HK_TYPE_DOMAIN housekeeping cpumask will soon be made modifiable at
> > runtime. In order to synchronize against vmstat workqueue to make sure
> > that no asynchronous vmstat work is pending or executing on a newly made
> > isolated CPU, target and queue a vmstat work under the same RCU read
> > side critical section.
> > 
> > Whenever housekeeping will update the HK_TYPE_DOMAIN cpumask, a vmstat
> > workqueue flush will also be issued in a further change to make sure
> > that no work remains pending after a CPU has been made isolated.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> >  mm/vmstat.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/mm/vmstat.c b/mm/vmstat.c
> > index 65de88cdf40e..ed19c0d42de6 100644
> > --- a/mm/vmstat.c
> > +++ b/mm/vmstat.c
> > @@ -2144,11 +2144,13 @@ static void vmstat_shepherd(struct work_struct *w)
> >  		 * infrastructure ever noticing. Skip regular flushing from vmstat_shepherd
> >  		 * for all isolated CPUs to avoid interference with the isolated workload.
> >  		 */
> > -		if (cpu_is_isolated(cpu))
> > -			continue;
> > +		scoped_guard(rcu) {
> > +			if (cpu_is_isolated(cpu))
> > +				continue;
> 
> I think this might have introduced a bug - or at least an
> unintentional change in the program flow.
> 
> scoped_guard() is implemented using a for loop. Now this continue
> statement will only exit the scoped_guard() scope rather than
> continuing the outer for loop. This means that cond_resched() will
> be called when it previously was not.

Yup, I've been bitten by that once before. It lead to very subtle
breakage that took me a while to figure out. I've now mentally
banished the use of scoped_guard() inside any form of loop, but that's
a pretty brittle strategy...

	M.

-- 
Without deviation from the norm, progress is not possible.

