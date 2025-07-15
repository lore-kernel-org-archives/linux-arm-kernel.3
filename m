Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C4C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2hZRf50S1JhhbQv+jMrRq2KAayPtm+hwxAelN6yg5E=; b=VJ7oMh+/kaFD2h3lrJA5gXh6ZR
	l+jz3kgEozfsUnPX0xo5NMu8T4uEkDUf0FWtdODLDc6R5SjnahpC2tbyQkZfp7klaOlS9iu7n5+Yk
	pHgeQLPBvD66uwRuMtKh8bTOGiNxGWbjnAIjBQUrg0ZlVutRDfAv5/ckFYSD/65V73SBbRGtKzBs0
	vIjuT7CVYxWYqE1haMZbHquPkTOkE0naAMxeIaHKKTTYNRc8U6NYdAJNVDmm7AEEB0FNj9lBjIFvl
	X53VNzDhUwOxCafcrHfLFGP0Q3YUaqAxgZKQkcAac3yk6sF2wA5Q5V/MqW72Tj+NcIvmdP58dvwsQ
	nxfuBirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcyg-00000004qSy-2cvH;
	Tue, 15 Jul 2025 10:33:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcuz-00000004pxs-25ki
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 10:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0377A56F69;
	Tue, 15 Jul 2025 10:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1DEC4CEE3;
	Tue, 15 Jul 2025 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752575388;
	bh=3aFKmLvJV73jrRTWvkPEDT+E5ohdcZ4PTEwPUee1yYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7ur0yzLo75Zh5bH8PrEOM5HipEOrZz8M14+bYILfExsKyNiUVwKvFEnjm3tVPYkK
	 JasfYEyfwjpRCCnPyRmbsIt3bzsMAWoAlmGZG8hjdcTM8Xzpc/LBDhyd5yY/voBQf0
	 D317EUTCMV8Dzka9bc/9diUWOV1wZr0YI+ooLZegPumJ6SZnMbsL/cKWjB030PfmHB
	 4UN9rLS9F2RiTQFVP91TlI6FSSDhpDEdP2msPvHD6Mzcv/QLj9dDVQ6wqvJMM+bdSi
	 gLFuH59LP8cNnyriIgoES5KnlGvcqpZmm3/y1P3x+bk/4caS07exdomLzwPuOLOWAE
	 Hwhrm/iiKDpNw==
Date: Tue, 15 Jul 2025 11:29:43 +0100
From: Simon Horman <horms@kernel.org>
To: "MITTAL, HIMANSHU" <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	m-malladi@ti.com, pratheesh@ti.com, prajith@ti.com
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
Message-ID: <20250715102943.GU721198@horms.kernel.org>
References: <20250710131250.1294278-1-h-mittal1@ti.com>
 <20250711144323.GV721198@horms.kernel.org>
 <b626dc40-e05b-40e0-b300-45ced82d2f97@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b626dc40-e05b-40e0-b300-45ced82d2f97@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_032949_666389_E439A811 
X-CRM114-Status: GOOD (  22.92  )
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

On Tue, Jul 15, 2025 at 12:37:45PM +0530, MITTAL, HIMANSHU wrote:

...

> > > +-----+-----------------------------------------------+
> > > |     |       SLICE 0       |        SLICE 1          |
> > > |     +------------+----------+------------+----------+
> > > |     | Start addr | End addr | Start addr | End addr |
> > > +-----+------------+----------+------------+----------+
> > > | EXP | 70024000   | 70028000 | 7002C000   | 70030000 | <-- Overlapping
> > Thanks for the detailed explanation with these tables.
> > It is very helpful. I follow both the existing and new mappings
> > with their help. Except for one thing.
> > 
> > It's not clear how EXP was set to the values on the line above.
> > Probably I'm missing something very obvious.
> > Could you help me out here?
> 
> The root cause for this issue is that, buffer configuration for Express
> Frames
> in function: prueth_fw_offload_buffer_setup() is missing.
> 
> 
> Details:
> The driver implements two distinct buffer configuration functions that are
> invoked
> based on the driver state and ICSSG firmware:-
> prueth_fw_offload_buffer_setup()
> - prueth_emac_buffer_setup()
> 
> During initialization, the driver creates standard network interfaces
> (netdevs) and
> configures buffers via prueth_emac_buffer_setup(). This function properly
> allocates
> and configures all required memory regions including:
> - LI buffers
> - Express packet buffers
> - Preemptible packet buffers
> 
> However, when the driver transitions to an offload mode (switch/HSR/PRP),
> buffer reconfiguration is handled by prueth_fw_offload_buffer_setup().
> This function does not reconfigure the buffer regions required for Express
> packets,
> leading to incorrect buffer allocation.

Thanks for your patience, I see that now :)

I'm sorry to drag this out, but I do think it would be useful to add
information above the lines of the above to the patch description.

> > > | PRE | 70030000   | 70033800 | 70034000   | 70037800 |
> > > +-----+------------+----------+------------+----------+
> > > 
> > > +---------------------+----------+----------+
> > > |                     | SLICE 0  |  SLICE 1 |
> > > +---------------------+----------+----------+
> > > | Default Drop Offset | 00000000 | 00000000 |     <-- Field not configured
> > > +---------------------+----------+----------+
> > ...

-- 
pw-bot: changes-requested

