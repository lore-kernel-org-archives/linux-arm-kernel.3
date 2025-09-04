Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C47CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKGdY7RmH5cAzEkh5vkCldeRjcibzV04dgx9oeEZxdg=; b=fAvGPd+yDCZU3jf9AUxEMwMywx
	M2eVBb/pZFFE77opqaFs4UuztZsrqJmuCm4DZzm57Cyl45EuhgYhaR01jlgdbVDTFvD5LJt9T7inR
	olqb6L/ApAavJIooimizEjtzp6qUfgjpb76ktphz0r8WoK7dp/M1lty3EUfUG8cVMvaTGPQQtodxf
	9J619y+TDdnxx4uSDs+xFKiv9hWu3kgxPG8SMzzd1KUHBHNy6xh0mqXMSv8R06gXtE1os6Vuy799Q
	eZJnJtqNDHVmu6v7rO4EYzTipu7hkPST1cuUvmVKGl3asdjTqoWrzoR+1PDUo6Oc3zWL0tjx68kbT
	Ln0oLBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzC-0000000E0rA-2XFZ;
	Thu, 04 Sep 2025 19:51:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA9y-0000000BwLF-3qxE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:37:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A651C44BFB;
	Thu,  4 Sep 2025 13:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D530CC4CEF0;
	Thu,  4 Sep 2025 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756993074;
	bh=IZYPvmhp4Lu67EYKMyAIk7sdK71xXGH4/n1ufrRtfgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NLmzmxUPhrUNM/sfjImKJAHD31D8b9GHAc1ioUIZLX12iEeXiOAZOHok9OBF3Fxiq
	 /atb96duOLqQMAa7f/7zFPzpRTmGmiYC5mv8uI4IW7lJMKvFu0BTqDW55qhDwkg842
	 kCjXJrDGNNKTKwUX9NMf6XtG43LxmCYvSgk6U+Q+YUf6mNYWGC0h7glxQkPJ20LbxP
	 YCM5nR0eS7r0XI1J4AtBkwyGsLQkYDWg+NSuzU5bmsmAgu9WqjYgMC+GHpcE5BoI1F
	 8zGtHZHYCtWwbBGd+12NQqWYZIk4Y5GJwFJwntobpugQuXr9tfN2Mt8uV/7LjNXzh6
	 ii9GmFTlCfbQg==
Date: Thu, 4 Sep 2025 06:37:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: Wei Fang <wei.fang@nxp.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
 <pabeni@redhat.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>, "Y.B. Lu"
 <yangbo.lu@nxp.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <20250904063752.3183d523@kernel.org>
In-Reply-To: <aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
	<aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
	<PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
	<aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_063754_984460_10EB6BDB 
X-CRM114-Status: GOOD (  11.33  )
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

On Thu, 4 Sep 2025 06:05:02 -0700 Richard Cochran wrote:
> On Thu, Sep 04, 2025 at 01:55:43AM +0000, Wei Fang wrote:
> > Vladimir helped explain its purpose in the thread, do you still think
> > it is pointless?  
> 
> Vladimir gave practical examples for the use case, so no objection
> from my side.  I just wanted to understand how this is useful.
> 
> Next time, it would be helpful to have that info in the cover letter.

+1, let's get it reposted with updated cover letter.

I'm tempted to ask for a description under Documentation/, tho, 
I'm not 100% clear whether authors expect users or driver developers
to exercise the loop. Maybe such distinction doesn't even makes sense
for embedded devices..

