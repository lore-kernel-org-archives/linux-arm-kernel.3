Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3AACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx9lswogNRQ0TZt9WL0Qi02NOUSoFXBUIWfnFP8NGzs=; b=VkRN/k9NXJGzOGUF6r8kdXjEhN
	8D95wAZ9VIxmH4Pdkq4s1XVBGfBdVYZ3MU2R4yeyU+yYLZ88kD1AgKF3M7hK3RxmeF71qeWl+iH4Z
	0uRSdPACDTpPbQ9Chxx0YopDtzAujtUdAnW5kZgqYzcCY5FTV+suitqUu5o+uk2YkaipQfyu7AD5U
	5tAQrbnOi3JDcmGNJpqYH0OC+1PRCr2heMXyL0/aCg7QU5pf8j9axMV+IHWJNVo+Gjuf9UuhqfvSg
	ose6sXrgcz/4WtAF42mXOSy9oHhUyFpD9rBo2NqgDGCR6rTocygzKdN4ch4IMS+j+xhXAzRtoodQv
	yOmre+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgMq-0000000E4Li-0zBy;
	Wed, 05 Nov 2025 16:28:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgMo-0000000E4Lc-006Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 026AA60207;
	Wed,  5 Nov 2025 16:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33848C4CEF8;
	Wed,  5 Nov 2025 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762360092;
	bh=XZsR+JyD+p+0AmVN0UT/SExpbSqoB4WWhXwZyYv1juM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVPncHIh/EOqGFCdREjl+2w+VGlqkjCAARlMMggMBvZaXK8WL0I7nOF5N4aUy12Cq
	 1MSijhgS4t1291bQKTZV13FU2rRXBsTAO6sw3VIanGxLl45tXeypLZpfH9cBgrprC5
	 fM1xwVaxJiZq6874ZxPd6vM4+G2lil3Imv1yectPVArs+70jgStj+MFd3Ah71oFg6O
	 zr7opLT5qYj/5SwzNxTtzqY28hyfZ5N9A4zxq7eSVVstrYiRaE1amTmjR9YabuZCi8
	 h9RLNiMmdI08k8CXbIE1EcfMEPVNt1U4TNNFRL6y1/AssFAz50F6+TmhCRxSGER9yX
	 s9v6wleyskP0A==
Date: Wed, 5 Nov 2025 17:28:10 +0100
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
Subject: Re: [PATCH 16/33] PCI: Flush PCI probe workqueue on cpuset isolated
 partition change
Message-ID: <aQt7Gg3XJ7fVdD3W@localhost.localdomain>
References: <20251013203146.10162-17-frederic@kernel.org>
 <20251014205034.GA906667@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014205034.GA906667@bhelgaas>
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

Le Tue, Oct 14, 2025 at 03:50:34PM -0500, Bjorn Helgaas a écrit :
> On Mon, Oct 13, 2025 at 10:31:29PM +0200, Frederic Weisbecker wrote:
> > The HK_TYPE_DOMAIN housekeeping cpumask is now modifyable at runtime. In
> > order to synchronize against PCI probe works and make sure that no
> > asynchronous probing is still pending or executing on a newly made
> > isolated CPU, the housekeeping susbsystem must flush the PCI probe
> > works.
> > 
> > However the PCI probe works can't be flushed easily since they are
> > queued to the main per-CPU workqueue pool.
> > 
> > Solve this with creating a PCI probe specific pool and provide and use
> > the appropriate flushing API.
> 
> s/modifyable/modifiable/
> s/newly made isolated/newly isolated/
> s/susbsystem/subsystem/
> s/PCI probe specific pool/PCI probe-specific pool/

All fixed! Thanks.


-- 
Frederic Weisbecker
SUSE Labs

