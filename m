Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4ECCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C6o2+gSZ7eQN7FQmmglEjFOqubdsY6GVquhxGt09nY=; b=zUAnBWiiWw06MzpUc3QsZwuiEv
	hrMukt/0x34mFmnK8b+fMxZiXRcBaru+RccVZr2ZboLngbFciWdGIfv6tUOQ7lQ1NM3ma6ybhdaAu
	2YCMbm3+ik+v8v/5Ug4kppRtByharHW2EL4QAeGkzAZnRj5LltM9xCF4VrJ2K27oBcC+mgN9UtZCB
	0fSfEO/E8b/uqEfUZUvnzWXtWiMm/KStcNvZ3vXI9kkIEm2TxXyX/HxA0mfofJ7j4EjLR1jLMF33H
	MrbVoJb0aIRTECn0qY6mO6MWitlsTuEFrvVFtOKR4FGhIXnifLIbLZ36PlaFHVf6b7ygTy7D3SXOf
	C/UeJVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEr4t-00000006JsR-3U3j;
	Fri, 31 Oct 2025 15:30:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEr4r-00000006JrD-0w8P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 15:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06DFD43F89;
	Fri, 31 Oct 2025 15:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CA2C4CEE7;
	Fri, 31 Oct 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761924606;
	bh=YN9mFpyOirMJG3gxerIW77pECs9cukfzbQfkHOAQpHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qc8FbJqrkdCIX64uhcGh/3sGHjyZ/kg6c299TYuVaR/EIJqJe7VvR4brCH0bIYjIm
	 ccsiXGVZz9k3yUOR3gfrmQ4kIjoms18UgykNgu+1CPsw1KuPLyFPYP/ri0CslMVeUb
	 vNzzDSei9y78K6SkntbzS3NuE/nOFh03zqzWcjMyZqDmbWPbmwfVj9iGHSmvPPXwPc
	 bLnL/UODhTrwTO/5oR0zP4Ffx/OwNa3rxctvcB2Auk1OYMjRRkNvJeY9CtHVN3Bugi
	 cKqrp5O5IQGjZsNXoECmy3q447y0cXLwfHpdovDId8J2RkKvC1IhxGiQRqQ+t06oEy
	 OmO8wkiAp0STQ==
Date: Fri, 31 Oct 2025 16:30:04 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aQTV_F-p4tGjdBEq@localhost.localdomain>
References: <20251013203146.10162-2-frederic@kernel.org>
 <20251014205313.GA906793@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014205313.GA906793@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_083009_279871_227C18AF 
X-CRM114-Status: GOOD (  14.20  )
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

Le Tue, Oct 14, 2025 at 03:53:13PM -0500, Bjorn Helgaas a écrit :
> On Mon, Oct 13, 2025 at 10:31:14PM +0200, Frederic Weisbecker wrote:
> > HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> > therefore be made modifyable at runtime. Synchronize against the cpumask
> > update using RCU.
> > 
> > The RCU locked section includes both the housekeeping CPU target
> > election for the PCI probe work and the work enqueue.
> > 
> > This way the housekeeping update side will simply need to flush the
> > pending related works after updating the housekeeping mask in order to
> > make sure that no PCI work ever executes on an isolated CPU. This part
> > will be handled in a subsequent patch.
> 
> s/modifyable/modifiable/ (also in several other commit logs)

Languages are hard.

Fixing the set, thanks!

-- 
Frederic Weisbecker
SUSE Labs

