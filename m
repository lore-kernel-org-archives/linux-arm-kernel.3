Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5DCCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNVv9ooOdPt4gDQz9b3gx0JN5sbG1rJmvfll/bOWLP4=; b=3X7sjaTmLZKiAI2HvyerZG3s/3
	eKkH8E6SZ5doBSZcezpUQkrHyo8TKSsVXa+TZRjOpIsWys+ErLwjgxQB3IvrRTdjOiglmLwunqE9j
	pQmNcKddijfVAufWizYIFjZjh6U/lnqmclbY9SS2itUa1vj7qbEHTYf7lK/Uku4FO7JHF55aiYfl5
	AnB71+47kmH/Ifbgi30qC1qaE5z/lq0LEjdoMKGgJorY4t6Oj9E3iIBXpVCZUjJ2q7Jo/hcvFsl43
	5fiOJmamzLlQMRBqqHQ84dVUzv5dj9aVtgysuor1jj0H37vwOOuPDKBI3KxsEwAGGghdxGP8rXrYS
	rMJzGMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVNw-0000000FyUF-2gOn;
	Tue, 16 Jun 2026 15:07:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVNv-0000000FyU1-15nr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:07:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A356600AB;
	Tue, 16 Jun 2026 15:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274F61F000E9;
	Tue, 16 Jun 2026 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781622446;
	bh=KNVv9ooOdPt4gDQz9b3gx0JN5sbG1rJmvfll/bOWLP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aZG8JcDbtDdPMer8gahR3+Hxh/jL/eqiKUDl/uBBRl5RBJcFCSsjs4mh/e2mesDVt
	 CDfMQ6pquhUPGsno/0bwQr9n6y2w/V2YlH4gn0YW18R5Cu5SYMRcqRUrwK7Rr/xesZ
	 NOq0T+yyGkrUNX3LKXyvx4+8hIjiFFgnL5CdOEyM7agauR8r1aEB/K2fVFSdi6pa7p
	 sT+tcGyqSbVCHiR4AkOz8+ewHv4nCR0AvStJ3V/7sv9Hn0MbowuCkJwzMVsIvvqpHQ
	 WvHlogKq3i29sduKqEY+DEfFrgwHfOiwnyo/FeCYvhl6eQeoQ8TdtGpi+HD91NpLeP
	 NoHYYg3bvgLzA==
Date: Tue, 16 Jun 2026 08:07:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <elfring@users.sourceforge.net>, <haokexin@gmail.com>,
 <vadim.fedorenko@linux.dev>, <devnexen@gmail.com>, <horms@kernel.org>,
 <jacob.e.keller@intel.com>, <arnd@arndb.de>, <basharath@couthit.com>,
 <afd@ti.com>, <parvathi@couthit.com>, <vladimir.oltean@nxp.com>,
 <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <srk@ti.com>, <vigneshr@ti.com>
Subject: Re: [PATCH net-next v7 2/2] net: ti: icssg-prueth: Add ethtool ops
 for Frame Preemption MAC Merge
Message-ID: <20260616080724.0d838fd6@kernel.org>
In-Reply-To: <d0123269-b1e8-4fba-94b0-b94d3d9a5405@ti.com>
References: <20260610052511.781752-3-m-malladi@ti.com>
	<20260615231041.1007484-1-kuba@kernel.org>
	<20260615163932.50bb3df0@kernel.org>
	<d0123269-b1e8-4fba-94b0-b94d3d9a5405@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 16 Jun 2026 18:24:22 +0530 Meghana Malladi wrote:
> >> Could the firmware-register lookup table used by emac_get_stat_by_name()
> >> be separated from the ethtool -S string table, so the new preemption
> >> counters feed get_mm_stats without also showing up under ethtool -S?  
> > 
> > This -- not sure about the other complaints but this one looks legit.  
> 
> I agree that this is legit, but right now there is no other place holder 
> other than pa stats to put the mac merge firmware counters. I believe
> the effort needs to go in re-structuring the hardware and firmware stats 
> implementation to address this issue.

icssg_all_miig_stats has a true / false that looks like it's supposed
to serve the same purpose? Maybe I don't understand what you're trying
to say

