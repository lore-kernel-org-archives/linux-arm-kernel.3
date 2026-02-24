Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29863E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjEIQusiMpllNiS/DCJM+W+sXMq5H3Qd6XeWyYTGjy4=; b=zPxDH0O8c2FRv/uyHY9visTjjo
	00kItlnTQcmKK6vTL/k2UdjhA3HhnvwVYbDjliowqW2fniGxPbkvuEq9yAM/obSABbwFLv+Ht/GN1
	lvr4h1jKIB7zdn/Mzt5bHXyu7ikmv9g6DRPYLLyZJmo9TfMHMKyBs2dC6vqsl0iFve+sOtHJtyZ9Q
	81y9XK93CRWcvvzjlYp42VqkPYzcsEPp6Za1RM1+EEVoYik0E6F6oQlluW19Ad5WfjppBlRmZEjzD
	umcLhbPfZaP1ebyXlMBtZz/cahEHVsIWcePTbnvbNJLWCf1Z0+Rs/7q+rX1EOs2Oe2lvFTrtrKN0U
	Ck/sRApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqbz-00000001zGX-36Iz;
	Tue, 24 Feb 2026 11:29:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqbx-00000001zGR-49BR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C20E6132D;
	Tue, 24 Feb 2026 11:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736CBC116D0;
	Tue, 24 Feb 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771932592;
	bh=qae+KiV0H06twWryyZRy7nDOgPhLMz/Ho0BGykyklJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDh5Dx0EpWIZ64bcRaZ27qvAnJXequ/LMJZm4dN0Hcri0QTx6R3nsCe/hglXvzRlr
	 WsV9QiFJFmNxwfDwP+P9MdJWbU/RbK+hH2+Ajz+kDBw5bG1foZM5utHkfNHuIdEzYZ
	 j1hxzKVTMDL19wu+McDjN2CYQ7kIPaf9m2E+UDGxMj6e1fcWAMkfNFBu6kqG0QKInx
	 u2mOO18OtXEeSGxB2iFubpjCXq4Sf1Epo+TT75cKEoVtuInl1p6SJqZJv5aeFuTlCz
	 QI5xiYYfC3bo/CXqbw/m+pJrOJohUKOS8BVi6dS3dGbypYKAfAjFi9hrKN/ZUDuX5r
	 EiSqkp9FOe2aw==
Date: Tue, 24 Feb 2026 11:29:48 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: ptp: limit n_per_out
Message-ID: <aZ2LrDLPTR61TfQP@horms.kernel.org>
References: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
 <aZ1uxX_fddwO7UYD@horms.kernel.org>
 <aZ13Gjav_5PYNGEN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ13Gjav_5PYNGEN@shell.armlinux.org.uk>
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

On Tue, Feb 24, 2026 at 10:02:02AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 24, 2026 at 09:26:29AM +0000, Simon Horman wrote:
> > On Mon, Feb 23, 2026 at 12:20:47PM +0000, Russell King (Oracle) wrote:

...

> > > This could be a user exploitable bug (although one has to be root
> > > so the gun is already pointing at one's foot.) This is the commit
> > > which introduced the problem:
> > 
> > Hi Russell,
> > 
> > From the description I assumed that for this problem to manifest
> > out-of-range values would need to be turned by hardware.
> > But maybe I misunderstand things.
> > 
> > Could you elaborate on the vector you have in mind?

...

> Either code should care about values > 4, or it shouldn't. The current
> code cares about it in one place but then ignores it in all other
> places where the index is under userspace control, allowing the
> potential for array overrun.

Hi Russell,

Thanks for the clarification.

Personally I think it would be best if the Kernel took a robust approach
and assumed that hw may provide out of range values. But in my experience
this is generally not the approach taken by drivers. And it's not a hill I
which to spend too much time occupying.

IOW, I don't think the current practice is to treat such cases as bugs.

On the other hand, I agree that the code should be consistent.
And I would lean towards verifying rather than not, although again,
I don't think that one can find plenty of cases where the Kernel
doesn't do that.

Which is to say that I agree with the approach taken by your patch.
But I lean towards it not being a fix.

Reviewed-by: Simon Horman <horms@kernel.org>


