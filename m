Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB38C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SwfYKxG7EvP9f3lroJoZY2o1spLI3mFbUIC93fIdV8=; b=U4STn9Bez9S1/s81nvSyTVhsNi
	ogbqXjuFbUu0nDz6bZJtV8LOdpQRpTjq2Vrg0JK56JwHDviKu6tnvVp6KzSC7buPsWA2pnegzLB4C
	CGHK/nLlxgzlyHvKCqhFOf02cYzz/RsFexqVZqeQKoUTRgnsTxiLQHV4rCE2cLHIKbmR9ozIwpRla
	0VlxRJHlfqan89N4VMMX7akvMttfYIc2ScUzJLZu0kO4Tl8o69H6jH5BtBZYCmwbpppve0mtRBB/Y
	Sj1QdyTZi8LKq40CHdXSsHESAtQ4gkdLUvFNzGGIRqbFq1+ltybH7I9XyXg/4SXfwfjltf7HZVqXi
	2iraPpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHs3-00000003goP-11EP;
	Fri, 21 Feb 2025 01:30:27 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHm1-00000003fH1-1656
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF2166834C;
	Fri, 21 Feb 2025 01:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E6BC4CED1;
	Fri, 21 Feb 2025 01:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740101052;
	bh=hqZKFDLTOMrzQKtspknBKj50AVQN8SLJSCfgLLS1bhA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ytz5Y/vaKiaWJWtkOz5WPtfXI3knJ7sGHTkebOBBaLTdJ/kuHdOtMY5GR6BuGW7lq
	 f0rHGa299dbPrjPdl+kvFWN1leqgr4vmeGXpkBkNWngY8ZfG8Wl9rqFTSYZ/oPiSU/
	 i0GerMOy9hcDybtOisT1pVPNZjD0VhQ0qRtdlbMdhAWMezRQ+fVAqyYA7zvtXBE2CA
	 ckj1RuYI95Q22GCf1P7izCJ1QU4JOim8nzyJNtnlNUMXfS1lFvZCWbtw5TgapCzU4B
	 ui2vpZM08BV3C6hx1xpwCfnKvVGwDoxUSzO7Q7qW7Xd5wkE56Qk9owcT1F6JjCJFLJ
	 lspqA357FcTnQ==
Date: Thu, 20 Feb 2025 17:24:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>, <lokeshvutla@ti.com>,
 <vigneshr@ti.com>, <javier.carrasco.cruz@gmail.com>,
 <diogo.ivo@siemens.com>, <horms@kernel.org>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net v2 0/2] Fixes for perout configuration in IEP driver
Message-ID: <20250220172410.025b96d6@kernel.org>
In-Reply-To: <415f755d-18a6-4c81-a1a7-b75d54a5886a@intel.com>
References: <20250219062701.995955-1-m-malladi@ti.com>
	<415f755d-18a6-4c81-a1a7-b75d54a5886a@intel.com>
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

On Wed, 19 Feb 2025 15:37:16 -0800 Jacob Keller wrote:
> On 2/18/2025 10:26 PM, Meghana Malladi wrote:
> > IEP driver supports both pps and perout signal generation using testptp
> > application. Currently the driver is missing to incorporate the perout
> > signal configuration. This series introduces fixes in the driver to
> > configure perout signal based on the arguments passed by the perout
> > request.
> >   
> 
> This could be interpreted as a feature implementation rather than a fix.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Agreed, ideally we should get a patch for net which rejects
all currently (as in - in Linus's tree) unsupported settings.
That would be a fix.

Then once that's merged add support for the new settings in net-next.

Hope that makes sense?
-- 
pw-bot: cr

