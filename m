Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C268CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX2CapgG7ihv8dBxWqH9xetZippIqdIYGic0aAlkl5U=; b=kav6e+Bku0xP+4IUwKgDo78vxO
	ouNPUoS55mm5q3FfHSmjnny/9y3XlKC2bybHbinR4ou6PusBWrp+ZdWt7FyadvtZ+a47LyFZTFgZ7
	b8Ks6ZwmxawNllSTx1QEA/DVZrpE/ReOTp+JXCCeTs9zODgdoCfNeLqhOWUPt7DI2SAfY+C54jr4D
	mITn+P7i1LCFHSz8vyBK2z665ZxwZE9xDz4RlqTHk62wAvlW/ZwmRK++pWJyi9lLhZRGhaA8Jceri
	tLNw1MSypz4hkXN4wt1IRmxhjVO93xrPul0khNKYnUgC40f2hh/3GNRDyrOHvpx7JN7m3BRZf0XVP
	eS+AKP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueV0M-00000004OWO-3oQX;
	Wed, 23 Jul 2025 08:39:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUbz-00000004LXR-0Zjt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F853601D5;
	Wed, 23 Jul 2025 08:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FFFC4CEE7;
	Wed, 23 Jul 2025 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753258441;
	bh=qeKqZqAhMV1fB+a75jUMSKcJMpZvyxlRjnCdZh1vOuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYilHJs3hXC/SulBh6ytsuj620LusH3SCvPIZqWdTUzNUppiytZyTyQUWLZT/H0ma
	 bGcQvgsrUVrRlPtyBdb+Xv16p+S0KaupUr8GuTBNhkKuR3Wfe7/Z8lcqhVuwhq2mtE
	 s9RXvHI3210SU0aN8kmBpqYBDUkOaPNg40V/7HWlT8wla9PsxZzT46fdWaeuJ8dHlv
	 VR4hsfO5yetBNuyWVSjVGvOf5Ah4IfvC6GLyMQhIt7GQocAQGMasXfJXJWDaC0BitP
	 eRN7JOPssACXeV4q0Vd7pQy7wTuHxiNZUyZit8S0ViXvTWkcVqYDJ6XQBH867ndzFq
	 G0JYH7soBw0tA==
Date: Wed, 23 Jul 2025 11:13:56 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20250723081356.GM402218@unreal>
References: <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
 <2025071747-icing-issuing-b62a@gregkh>
 <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
 <2025071736-viscous-entertain-ff6c@gregkh>
 <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
 <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
 <20250720081705.GE402218@unreal>
 <e4b5e4fa-45c4-4b67-b8f1-7d9ff9f8654f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4b5e4fa-45c4-4b67-b8f1-7d9ff9f8654f@linux.dev>
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

On Mon, Jul 21, 2025 at 10:29:32AM -0400, Sean Anderson wrote:
> On 7/20/25 04:17, Leon Romanovsky wrote:
> > On Thu, Jul 17, 2025 at 01:12:08PM -0400, Sean Anderson wrote:
> >> On 7/17/25 12:33, Greg Kroah-Hartman wrote:
> > 
> > <...>
> > 
> >> Anyway, if you really think ids should be random or whatever, why not
> >> just ida_alloc one in axiliary_device_init and ignore whatever's
> >> provided? I'd say around half the auxiliary drivers just use 0 (or some
> >> other constant), which is just as deterministic as using the device
> >> address.
> > 
> > I would say that auxiliary bus is not right fit for such devices. This
> > bus was introduced for more complex devices, like the one who has their
> > own ida_alloc logic.
> 
> I'd say that around 2/3 of the auxiliary drivers that have non-constant
> ids use ida_alloc solely for the auxiliary bus and for no other purpose.
> I don't think that's the kind of complexity you're referring to.
> 
> >> Another third use ida_alloc (or xa_alloc) so all that could be
> >> removed.
> > 
> > These ID numbers need to be per-device.
> 
> Why? They are arbitrary with no semantic meaning, right?

Yes, officially there is no meaning, and this is how we would like to
keep it.

Right now, they are very correlated with with their respective PCI function number.
Is it important? No, however it doesn't mean that we should proactively harm user
experience just because we can do it.

[leonro@c ~]$ l /sys/bus/auxiliary/devices/
,,,
rwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.0 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
8:00.0/mlx5_core.rdma.0
lrwxrwxrwx 1 root root 0 Jul 21 15:25 mlx5_core.rdma.1 -> ../../../devices/pci0000:00/0000:00:02.7/0000:0
8:00.1/mlx5_core.rdma
...

Thanks

> 
> --Sean
> 

