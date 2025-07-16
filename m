Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E733FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1g4jITHnFei2Mjmg2sEOpzBbodlQQ5N9QKNHFg1dyeI=; b=G6HgJ2UG5bgCbfPtYcEaPfpXP7
	CUwD+w6XgEN6m/Sn5KDlCq6JGp79F2827I+shl1lbYI3yKAlBPNX9JyQELR5DDj7i5+IYKwslVJBk
	tNiBqvpp37Jj6ZaBWiM3Pk5eCnjiWmmuxvIDsGohLZjWKbrjFgubMNe4kqSbLI3Glu2fVL1WwJo//
	VmTrSo1FPpJDosJLScHlln7TY0FrYJrpheHOPgYU4xBc+w5MeOzarftpoaTYPfvzmUiRid38759v7
	3tzJkmKwfo8/lUmHnJu+bQHjluCrCe/WLIrW1GixKholBBkTuBkQM4OeCdlTgkPuFs7Il9yItGdhx
	1d3bGdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuRV-00000006m0Y-0UL6;
	Wed, 16 Jul 2025 05:12:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuP1-00000006lZL-3l29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 05:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 240585C59AB;
	Wed, 16 Jul 2025 05:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5A9C4CEF0;
	Wed, 16 Jul 2025 05:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752642598;
	bh=cOqdqIUO7fxmsC4oJLZT5RjBxfuL037AGc3yeM3iP/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6wJDG2qJ9PFcVAuQRvzw4syFpfe12yzoyafiri8z/8PLrxjmgN5PWVZN9zrFFwFU
	 qsAn2LaSYuEw5pbSn4RLfMv0isxRHjK4cep5eBorAgYFkvTTRQ0XrB6zCMCaS5RnYE
	 axk7qMx/nxk7a8zcUGh7uVTJxDRtHvU+jRCX+8Dc=
Date: Wed, 16 Jul 2025 07:09:55 +0200
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
Message-ID: <2025071637-doubling-subject-25de@gregkh>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716000110.2267189-2-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_220959_976393_F5F9B85D 
X-CRM114-Status: GOOD (  14.19  )
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

On Tue, Jul 15, 2025 at 08:01:07PM -0400, Sean Anderson wrote:
> Support creating auxiliary devices with the id included as part of the
> name. This allows for hexadecimal ids, which may be more appropriate for
> auxiliary devices created as children of memory-mapped devices. If an
> auxiliary device's id is set to AUXILIARY_DEVID_NONE, the name must
> be of the form "name.id".
> 
> With this patch, dmesg logs from an auxiliary device might look something
> like
> 
> [    4.781268] xilinx_axienet 80200000.ethernet: autodetected 64-bit DMA range
> [   21.889563] xilinx_emac.mac xilinx_emac.mac.80200000 net4: renamed from eth0
> [   32.296965] xilinx_emac.mac xilinx_emac.mac.80200000 net4: PHY [axienet-80200000:05] driver [RTL8211F Gigabit Ethernet] (irq=70)
> [   32.313456] xilinx_emac.mac xilinx_emac.mac.80200000 net4: configuring for inband/sgmii link mode
> [   65.095419] xilinx_emac.mac xilinx_emac.mac.80200000 net4: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> this is especially useful when compared to what might happen if there is
> an error before userspace has the chance to assign a name to the netdev:
> 
> [    4.947215] xilinx_emac.mac xilinx_emac.mac.1 (unnamed net_device) (uninitialized): incorrect link mode  for in-band status
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - Add example log output to commit message

I rejected v1, why is this being sent again?

confused,

greg k-h

