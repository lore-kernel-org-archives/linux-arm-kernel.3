Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA35FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 22:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHvDeM/lZF0wxsG+Zz22ZsDGsJzJ3rXR4soIc9D9uiI=; b=vyqQ2mCnOQN6a4L1apQi3weORM
	sphVmItJ5ss5s9fLbCcUCk48SxerDqGRoMX0MJfX2S6vyUUAeW6yrHyi7kVj2Zik4JYZ50/RldvcS
	cwrsy4vgOGbdVnUnWUx2tISQ16j340utMo96FseuRMl45cK6lrf6SfkbO7Pd5CdCwNNSpBaXaXPDW
	YFV1y/Ozw6brgInCN3IjVupzgKbtdCTCa38aQrPGYTNja7kr9ATAxRmC6ydBzBSj73ES0o7fbz02+
	ESIIs5NSextHAwwZ9+NPVE5ZT6SR2kXivSqkZlYwxB/RZ6uf3SZqYvQ1R0Y3pmkln6Dfp5EHmttrT
	Wa0O67fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7iOj-0000000CBZW-08mL;
	Wed, 23 Apr 2025 22:16:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7iMm-0000000CBO0-1LAl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 22:14:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3F306844C;
	Wed, 23 Apr 2025 22:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14146C4CEE2;
	Wed, 23 Apr 2025 22:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745446489;
	bh=yA5ENDOU6WR/6eoqizFm8BUxphmvVuGLV+xi0KRrHsc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=riwSNAm/IP7hpOveudhoxer5Kf/aotbjwxCXUtk3nzygYvgSsL6ONNw1BRs54fBDb
	 Yfe6SP7JqDLkwCMjTytT1pow9SxXz9vaO2aKzm8yShqTD9bkayFdWVmdJDO6+hFV5B
	 QGr8wGMsp+Blk+SaETw9oSmG47z9ithxfSLJI2DoieZGg0QFXF7ZMH8ocXhpyy12Jv
	 Cq5IFsSwbaEZFInLrNCnX0bm3FrKvXlRf6uny3iL0r80RC+Gk8vqTPZKoLiczx6s9f
	 52JzTTWyJw45ekwLLIjoIUzt2xfez0G/unjv0b3jivQQO+Dtn2oDk32xFQECWPEXKz
	 OADngvh80wKPQ==
Date: Wed, 23 Apr 2025 15:14:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Geetha
 sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 hariprasad <hkelam@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Taras Chornyi <taras.chornyi@plvision.eu>, Daniele Venzano
 <venza@brownhat.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Helge Deller
 <deller@gmx.de>, Ingo Molnar <mingo@kernel.org>, Simon Horman
 <horms@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Sabrina Dubroca
 <sd@queasysnail.net>, Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/8] net: octeontx2: Use pure PCI devres API
Message-ID: <20250423151448.15a4a13e@kernel.org>
In-Reply-To: <00189e0a036e1bc7af8f78cc9fa934f1ad23efba.camel@mailbox.org>
References: <20250416164407.127261-2-phasta@kernel.org>
	<20250416164407.127261-4-phasta@kernel.org>
	<20250422174914.43329f7f@kernel.org>
	<5e20b320cbbe492769c87ed60b591b22d5e8e264.camel@mailbox.org>
	<00189e0a036e1bc7af8f78cc9fa934f1ad23efba.camel@mailbox.org>
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

On Wed, 23 Apr 2025 10:38:01 +0200 Philipp Stanner wrote:
> > > This error path should be renamed. Could you also apply your
> > > conversion
> > > to drivers/net/ethernet/marvell/octeontx2/af/ ?  
> > 
> > Hm, those must have slipped me for some reason. Will reiterate with
> > them and the error path.  
> 
> Wait, false alarm. I actually did look at them and those in af/ don't
> seem to use the combination of pcim_enable_device() + pci_request_*
> 
> Only users of that combination have to be ported. Users of
> pci_enable_device() + pcim_* functions and pcim_enable_device() +
> pcim_* functions are fine.
> 
> Correct me if I missed the first mentioned combination up there.

I think you're right, there are apparently multiple but separate
drivers in that directory.

