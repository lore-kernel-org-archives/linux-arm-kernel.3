Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 20:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=elgpkSHi7oRAKLl42GPYSQRGs0aJD3woXeve17j9/bk=; b=3ACna08Akr7Wjp
	EFJCxPKNNK20AMULsFKTFYG7dpMgsl/CzcbncKfQ5Mr6izCB6PVYxqKYv6+K+rF046Btfnt0iM20o
	mc3tDvPTMl0EakMxhr+RESTOaOrPravUvs8WAsobHZYyGuthGFAfxi0n4J169QfqkYBOiXR4tCpHk
	LmNopodBr06gy9ErZUzgCBZm5ZFF+E2JB5H174W+kUYVwcUqFPLTnr1Z94Rx0KEA6hK5sEa3CVThs
	Q3HXCzSlxzMf3Pys1i1umwn6EqlU87HnzvTL92bLFRXmmtGxjFcl8dmURQ/1vjzUgx2a3rHsAw5Yh
	fK8MbHHPOnzQ0u5MMJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8m1G-0000000HOb5-0r4r;
	Tue, 14 Oct 2025 20:53:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8m1E-0000000HOaX-1Lmu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 20:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA70623FC;
	Tue, 14 Oct 2025 20:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21D6C4CEF9;
	Tue, 14 Oct 2025 20:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760475195;
	bh=n/LR/VOVuEOFCI8XhFHTE8VhAsveYLysbT1xUiVBRoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=swyR28pypyBnRwl4m3DigwMj3bUrxOd00mzjuGD5aTN0FjLn8NZloGgLtoSm4EWF6
	 U+OQrImhcyFW1VE+1XOf7gsl+Z6u33VL59B3ZFGSMdhSCKfE10SSPf7PmGdnejwJFG
	 4W7sgMSd47UsSs4bbQQC0m2b54v2j6riWSO3ueU6abtrZ6v3Z1APYa4Dz7eg+oMj1c
	 E6GAg/xVIOaSHdCbI1G5jNYk9cUVlMAQIS1+cIiZKnhohliyM8TIACP4GiEgzG7+ha
	 7oSYLyFf2hw0TAj9/uWSaVineqdRxAJldC0oB4sXW5a4J7HK8JAuGF/KcmG4Gk36Tb
	 fkRsty8PnFzAw==
Date: Tue, 14 Oct 2025 15:53:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
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
Message-ID: <20251014205313.GA906793@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013203146.10162-2-frederic@kernel.org>
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

On Mon, Oct 13, 2025 at 10:31:14PM +0200, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> therefore be made modifyable at runtime. Synchronize against the cpumask
> update using RCU.
> 
> The RCU locked section includes both the housekeeping CPU target
> election for the PCI probe work and the work enqueue.
> 
> This way the housekeeping update side will simply need to flush the
> pending related works after updating the housekeeping mask in order to
> make sure that no PCI work ever executes on an isolated CPU. This part
> will be handled in a subsequent patch.

s/modifyable/modifiable/ (also in several other commit logs)

