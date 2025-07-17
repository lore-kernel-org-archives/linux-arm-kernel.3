Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D0C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0oc2fjdy2DPcn6xM2nquYZDGFAAfViBxwGI/ZcnoTs=; b=Yet/kM98EEgK7bg1CKCFEaK+/l
	O8RcwsTLZN9PZOMXeYsz2ZAFmcwCDWWf1/JRR9G7aLaJ1tXRTOtyPrvcJ/yr6VrqqgFg3xEa0IV66
	nBkgs91vOOaidMJfuto5xvmDffmQPJ63M0utfWAEsT1UCMN5cbf+mQ6QWcUW7cEK5Ucs5f4qwCge1
	Sp3hit/M3+bEg9I4muj2YmipfD76xKrZuB7Rhb9aslBe9xNCsuhhc2Ac1HDl7gE5nE4KnrpmZnLA0
	aznP0cfqxjVaj0HPZfBUXntxfFBFuL7KO2Fc234ZbrSt0TWXoQyrwnoNFiB+MZ7sT1vPin0J2otBd
	D55otPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRhf-0000000AgNQ-0b9A;
	Thu, 17 Jul 2025 16:43:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR1F-0000000AZ3v-3FOf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53CEA416EE;
	Thu, 17 Jul 2025 15:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919DBC4CEE3;
	Thu, 17 Jul 2025 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752767977;
	bh=xYbmGWw/X0W19WImwBUpQNtK2/wEHkntORrxQ1rCIoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDuwe8UV3prs9hqoPpmpzKq1bWYkIuFQRMGF03QhNeXtb4cF4d+HMXbtILVfAtU5z
	 K11IT7u49uSc6WfPUpUnFhqQA4EFgLCiIeKv9kSspEdRvitnZv61/I3EURNuRMps/c
	 yzeoofO05+L3CCxT4xdcr2hehoh8SvJf72jYaJbE=
Date: Thu, 17 Jul 2025 17:59:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
Message-ID: <2025071747-icing-issuing-b62a@gregkh>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
 <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_085937_872678_22F1E604 
X-CRM114-Status: GOOD (  19.68  )
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

On Thu, Jul 17, 2025 at 11:49:37AM -0400, Sean Anderson wrote:
> On 7/16/25 01:09, Greg Kroah-Hartman wrote:
> > On Tue, Jul 15, 2025 at 08:01:07PM -0400, Sean Anderson wrote:
> >> Support creating auxiliary devices with the id included as part of the
> >> name. This allows for hexadecimal ids, which may be more appropriate for
> >> auxiliary devices created as children of memory-mapped devices. If an
> >> auxiliary device's id is set to AUXILIARY_DEVID_NONE, the name must
> >> be of the form "name.id".
> >> 
> >> With this patch, dmesg logs from an auxiliary device might look something
> >> like
> >> 
> >> [    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
> >> [   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
> >> [   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
> >> [   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
> >> [   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx
> >> 
> >> this is especially useful when compared to what might happen if there is
> >> an error before userspace has the chance to assign a name to the netdev:
> >> 
> >> [    4.947215] xilinx_emac.mac xilinx_emac.mac.1 (unnamed net_device) (uninitialized): incorrect link mode  for in-band status
> >> 
> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> >> ---
> >> 
> >> Changes in v2:
> >> - Add example log output to commit message
> > 
> > I rejected v1, why is this being sent again?
> 
> You asked for explanation, I provided it. I specifically pointed out why
> I wanted to do things this way. But I got no response. So here in v2.

Again, I said, "do not do that, this is not how ids work in the driver
model", and you tried to show lots of reasons why you wanted to do it
this way despite me saying so.

So again, no, sorry, this isn't ok.  Don't attempt to encode information
in a device id like you are trying to do here, that's not what a device
id is for at all.  I need to go dig up my old patch that made all device
ids random numbers just to see what foolish assumptions busses and
userspace tools are making....

thanks,

greg k-h

