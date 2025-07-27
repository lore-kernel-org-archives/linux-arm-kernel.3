Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86C8C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0gH2b5avjWH+bSpYF5rphLD8SQ/r0QaDAAy63rPRQ0=; b=gU3mCQ/dEtmzQSILbBc6jq2Uui
	cSd4yUyPOlDDh03cqhiKpAE2y4jktyl6qenj0oSXLL0/jokhi1gHysP8LTVRr+CQN2oqamhICZhqE
	eM22gRzH0A+3EajN6EDTGiz7ztVNP5QPYFIZs1j5Rq6jPce06+VFkBKNCTo4dl6OUpRD05V3mGq+8
	7kjFwIkDuI0MOWBm2L0yMMtgRTtnx7yDZABN4q5FGY1wcxZ1UNMwH62q4woInUu55/eXze7dkOi4e
	TpJl5/F0+jjIcvg/MBTSgqRLB+UXzKo1LbLEbgBwONPHEsBI5osxijiBiyS9KfKX4KzKbqZhTMhiQ
	ykwNFaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufxEV-0000000CWo0-31o0;
	Sun, 27 Jul 2025 08:59:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufxBy-0000000CWYB-0Dxn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 08:57:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85370A5428E;
	Sun, 27 Jul 2025 08:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D20FC4CEEB;
	Sun, 27 Jul 2025 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753606632;
	bh=a4FwOdv2RcrEcz4bH44MhknPhjU1EIT8dbqsYLeIkNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rm0eDErI49pWQSAo1miOA8ZTT0xrXss2ye7yhbph/BYkZWXXKlY1SAyDci9FLRImC
	 kRlaogBQ88Ji0LFUVfiYFnJoJF0as8RbT0AG/vvT++X48xrvJKz4BIsssu5DSLyPwX
	 XHf0YPZ4TKIH1CMSvQr/+HaoHufL5RBilzUfODow=
Date: Sun, 27 Jul 2025 10:57:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
Message-ID: <2025072751-living-sheath-e601@gregkh>
References: <2025071736-viscous-entertain-ff6c@gregkh>
 <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
 <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
 <20250720081705.GE402218@unreal>
 <e4b5e4fa-45c4-4b67-b8f1-7d9ff9f8654f@linux.dev>
 <20250723081356.GM402218@unreal>
 <991cbb9a-a1b5-4ab8-9deb-9ecea203ce0f@linux.dev>
 <2025072543-senate-hush-573d@gregkh>
 <20250727080705.GY402218@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727080705.GY402218@unreal>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_015714_362126_246F6E71 
X-CRM114-Status: GOOD (  28.27  )
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

On Sun, Jul 27, 2025 at 11:07:05AM +0300, Leon Romanovsky wrote:
> On Fri, Jul 25, 2025 at 07:02:24AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jul 24, 2025 at 09:55:59AM -0400, Sean Anderson wrote:
> > > On 7/23/25 04:13, Leon Romanovsky wrote:
> > > > On Mon, Jul 21, 2025 at 10:29:32AM -0400, Sean Anderson wrote:
> > > >> On 7/20/25 04:17, Leon Romanovsky wrote:
> > > >> > On Thu, Jul 17, 2025 at 01:12:08PM -0400, Sean Anderson wrote:
> > > >> >> On 7/17/25 12:33, Greg Kroah-Hartman wrote:
> > > >> > 
> > > >> > <...>
> > > >> > 
> > > >> >> Anyway, if you really think ids should be random or whatever, why not
> > > >> >> just ida_alloc one in axiliary_device_init and ignore whatever's
> > > >> >> provided? I'd say around half the auxiliary drivers just use 0 (or some
> > > >> >> other constant), which is just as deterministic as using the device
> > > >> >> address.
> > > >> > 
> > > >> > I would say that auxiliary bus is not right fit for such devices. This
> > > >> > bus was introduced for more complex devices, like the one who has their
> > > >> > own ida_alloc logic.
> > > >> 
> > > >> I'd say that around 2/3 of the auxiliary drivers that have non-constant
> > > >> ids use ida_alloc solely for the auxiliary bus and for no other purpose.
> > > >> I don't think that's the kind of complexity you're referring to.
> > > >> 
> > > >> >> Another third use ida_alloc (or xa_alloc) so all that could be
> > > >> >> removed.
> > > >> > 
> > > >> > These ID numbers need to be per-device.
> > > >> 
> > > >> Why? They are arbitrary with no semantic meaning, right?
> > > > 
> > > > Yes, officially there is no meaning, and this is how we would like to
> > > > keep it.
> > > > 
> > > > Right now, they are very correlated with with their respective PCI function number.
> > > > Is it important? No, however it doesn't mean that we should proactively harm user
> > > > experience just because we can do it.
> > > > 
> > > > [leonro@c ~]$ l /sys/bus/auxiliary/devices/
> > > > ,,,
> > > > rwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.0 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
> > > > 8:00.0/mlx5_core.rdma.0
> > > > lrwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.1 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
> > > > 8:00.1/mlx5_core.rdma
> > > 
> > > Well, I would certainly like to have semantic meaning for ids. But apparently
> > > that is only allowed if you can sneak it past the review process.
> > 
> > Do I need to dust off my "make all ids random" patch again and actually
> > merge it just to prevent this from happening?
> 
> After weekend thoughts on it. IDs need to be removed from the driver
> access. Let's make them global at least.

Great, no objection from me, want to send a patch we can queue up for
6.18-rc1?

