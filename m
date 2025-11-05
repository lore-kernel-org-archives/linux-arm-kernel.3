Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49622CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lghsdtJqQPkyeqPZcgsEqUxzm/bu72iLJp6V770hM8=; b=N8IIdTAZ4+zFt8oTSmHNE0LPPO
	p88RMpNo7kx4Ce7Ua1MjGbDE+PA6pW7I1jhaJ8pxgnv8OGr0WgF/c3dqaOsML8vg/BbFMkbN1/Mjr
	j2eVHA3DPAtXy6c5q3kWFtoZlp3aWwjTMh5Szbn9fEDF8+zmc+vnoZmuWQTba2nUnT26QEyS2UnBf
	hcCExSICrDSzQRkna4ZZDP6cju75Hs/XfNIBnHF5nR4QSkDIIEq1ynPaZ+oRr8kziUQwM4Nw8iP4E
	3U6de6cri5Xm7yDoyxo5GQ8ehRekJEXOZRzERGSYQSLPjWJSpd2M0P6uzURbnpoFng/iUv0O/2xGQ
	Vtwu4xng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhHO-0000000EA8C-3VDc;
	Wed, 05 Nov 2025 17:26:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhHM-0000000EA7h-2PT3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31D7A41A7D;
	Wed,  5 Nov 2025 17:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92223C4CEF8;
	Wed,  5 Nov 2025 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762363600;
	bh=YFkDJLxlVgB8fCGfrzLzPiyZl67TcHqa4QAD1eCk1n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OParZvIIPyLR/7+d2Nc6dNNHFfgvciQYcDXNfvWRUfLM3ALdZr2Qma8M0FObiSEDX
	 4yAZaB4HMBbFQrVX9l1Nc5Mz9Akx6GYVPeFSxJauPuNjV+cvXZHiYCJny752RKPXaZ
	 nb6HFbh2rTIqP1/GSHtyqu5D4fAirasFidCHLVTYcLZQRPj1LLeRYNMtTIBUkecGZD
	 NUQfI4i1crcBXLrqQ3YrkVWcmSf4kYDrq048l6zq2V/zPjyDvLarmgFinhmBNoPsqB
	 5DP9Yf37WOYWdxdZegji5DJs83/ZGNy27MtOeueRr7A8jum6leEhur43LN6wcOt6ld
	 1Fax28SwoFeww==
Date: Wed, 5 Nov 2025 18:26:37 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 30/33] kthread: Add API to update preferred affinity on
 kthread runtime
Message-ID: <aQuIzQo3tDbwoytv@localhost.localdomain>
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-31-frederic@kernel.org>
 <aO5Dn2AwQWn0SQKQ@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aO5Dn2AwQWn0SQKQ@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092640_633398_DEA5472F 
X-CRM114-Status: GOOD (  13.84  )
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

Le Tue, Oct 14, 2025 at 01:35:43PM +0100, Simon Horman a écrit :
> On Mon, Oct 13, 2025 at 10:31:43PM +0200, Frederic Weisbecker wrote:
> 
> ...
> 
> > @@ -900,6 +899,46 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
> >  }
> >  EXPORT_SYMBOL_GPL(kthread_affine_preferred);
> >  
> > +/**
> > + * kthread_affine_preferred_update - update a kthread's preferred affinity
> > + * @p: thread created by kthread_create().
> > + * @cpumask: new mask of CPUs (might not be online, must be possible) for @k
> > + *           to run on.
> 
> nit: @mask: ...

Thanks! I'm dropping the current patch anyway but...

> 
> Likewise for the documentation of kthread_affine_preferred()
> in a subsequent patch in this series.

...fixing it to that patch.

-- 
Frederic Weisbecker
SUSE Labs

