Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E145DC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POVjIRygGGn5GuKVojhRpzvIR2EAd7bFPqyAp+BrAv8=; b=mpaOFe95ku7y19kijLIvCaFqRJ
	cNBUQsp9WtgI52wQGoNL4N7fq0EfOLHQ6JFFJTUvQsBZqkYuVvMTZm5V459Vfp1TXw/xJRohynhmI
	tgbYT+tfaq2AI0Ng3DNJvMrJP23aWF2gNyDPezgqyfeul/J6JY7vK43fs4OMGurt/1gRWUO2aIMKN
	JC3AYMMGdGkaINhgrCfPLZT/p9l1JiuS9thXiciMmCSa9B5+h+zIny1wmdA2yXaPlTp/5Ql5it8Ey
	Hz4S9bV9CuKI8pAARG4zfwhBpLJdmNVwWR5+TdYgLFU6WFHto3fW3cxdaudyCA3GoNG3ybOdX0TSN
	cB9kUELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufzlD-0000000CexZ-2Onu;
	Sun, 27 Jul 2025 11:41:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufzig-0000000Ceou-2PvK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 11:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71C97600AE;
	Sun, 27 Jul 2025 11:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70085C4CEEB;
	Sun, 27 Jul 2025 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753616348;
	bh=dCQ/5ACZXuFvlMS3yxQyTas5SeryViH4PPdHqfvtjHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KtQzsQCYYWW9nVqtBWrQZmQ8Uqd4RYBRQxDHRsuFD9brGCKYT/sVOgFe2LF3n3zB2
	 Jn8C9LCp7oAeyck6W2HGzrjPsHmLlAwrOQx1aHwWItIJ5g7M3YPSzIjOP2nL5cldzt
	 jePuMPrIqXb/nB3wpvCokAyoNxAaWzo7q2v+XLof7KEZMmecSvckApUgaACsIn+JyX
	 uNPAR08kmEe2zPnBTnn/LqEHwCmwubT+9hc6rDfZ/EgsPa0SInWiX8VLomd2Y8jO19
	 HVcA5xZYVaZRxEMYB6eCKuQF7WhV7FZ0w+F+8Qanbuls94Rq3T0CqxIQfly1UgUmR7
	 Hm0oaltBPfrAA==
Date: Sun, 27 Jul 2025 14:39:03 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
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
Message-ID: <20250727113903.GA402218@unreal>
References: <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
 <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
 <20250720081705.GE402218@unreal>
 <e4b5e4fa-45c4-4b67-b8f1-7d9ff9f8654f@linux.dev>
 <20250723081356.GM402218@unreal>
 <991cbb9a-a1b5-4ab8-9deb-9ecea203ce0f@linux.dev>
 <2025072543-senate-hush-573d@gregkh>
 <20250727080705.GY402218@unreal>
 <2025072751-living-sheath-e601@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025072751-living-sheath-e601@gregkh>
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

On Sun, Jul 27, 2025 at 10:57:09AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Jul 27, 2025 at 11:07:05AM +0300, Leon Romanovsky wrote:
> > On Fri, Jul 25, 2025 at 07:02:24AM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Jul 24, 2025 at 09:55:59AM -0400, Sean Anderson wrote:
> > > > On 7/23/25 04:13, Leon Romanovsky wrote:
> > > > > On Mon, Jul 21, 2025 at 10:29:32AM -0400, Sean Anderson wrote:
> > > > >> On 7/20/25 04:17, Leon Romanovsky wrote:
> > > > >> > On Thu, Jul 17, 2025 at 01:12:08PM -0400, Sean Anderson wrote:
> > > > >> >> On 7/17/25 12:33, Greg Kroah-Hartman wrote:
> > > > >> > 
> > > > >> > <...>
> > > > >> > 
> > > > >> >> Anyway, if you really think ids should be random or whatever, why not
> > > > >> >> just ida_alloc one in axiliary_device_init and ignore whatever's
> > > > >> >> provided? I'd say around half the auxiliary drivers just use 0 (or some
> > > > >> >> other constant), which is just as deterministic as using the device
> > > > >> >> address.
> > > > >> > 
> > > > >> > I would say that auxiliary bus is not right fit for such devices. This
> > > > >> > bus was introduced for more complex devices, like the one who has their
> > > > >> > own ida_alloc logic.
> > > > >> 
> > > > >> I'd say that around 2/3 of the auxiliary drivers that have non-constant
> > > > >> ids use ida_alloc solely for the auxiliary bus and for no other purpose.
> > > > >> I don't think that's the kind of complexity you're referring to.
> > > > >> 
> > > > >> >> Another third use ida_alloc (or xa_alloc) so all that could be
> > > > >> >> removed.
> > > > >> > 
> > > > >> > These ID numbers need to be per-device.
> > > > >> 
> > > > >> Why? They are arbitrary with no semantic meaning, right?
> > > > > 
> > > > > Yes, officially there is no meaning, and this is how we would like to
> > > > > keep it.
> > > > > 
> > > > > Right now, they are very correlated with with their respective PCI function number.
> > > > > Is it important? No, however it doesn't mean that we should proactively harm user
> > > > > experience just because we can do it.
> > > > > 
> > > > > [leonro@c ~]$ l /sys/bus/auxiliary/devices/
> > > > > ,,,
> > > > > rwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.0 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
> > > > > 8:00.0/mlx5_core.rdma.0
> > > > > lrwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.1 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
> > > > > 8:00.1/mlx5_core.rdma
> > > > 
> > > > Well, I would certainly like to have semantic meaning for ids. But apparently
> > > > that is only allowed if you can sneak it past the review process.
> > > 
> > > Do I need to dust off my "make all ids random" patch again and actually
> > > merge it just to prevent this from happening?
> > 
> > After weekend thoughts on it. IDs need to be removed from the driver
> > access. Let's make them global at least.
> 
> Great, no objection from me, want to send a patch we can queue up for
> 6.18-rc1?

Sean proposed the initial idea to move IDs to aux core. Let's wait for him
to see if he wants to do such patch. If not, I'll send.

Thanks


