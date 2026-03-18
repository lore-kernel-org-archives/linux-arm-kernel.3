Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24CD1088E46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgCo+QdBEzYu64dfbbuZmZSFyktt/VUBtt9/3GWYYAU=; b=SaKK1uCXXAmsJE+vnU2jkG0Pcc
	5WiwcwUI6hy0gnxK6y/BjpISatl139/iKL9Ldm9daXaJXfCtZWAMrU6C5ny6nStoNVY4EOeKaVmDA
	l37Fjsv9OzOVyKvDBNihlPg7M+zEi+XK8Z7Z3+4BIddvGFIK5S/n8Kk85cV5an5tmm1U3c7+R2vXt
	uD7i8M/4KQ5qyvpelRftENp/6XZNIqM/6+I8V71E6Prfs+fM1gme/O8vUKa/hABEJ32vqtbN7YmEk
	U2PtPTZR1GjkLLEBYUaS8Qs7Qmn1xnTJ8qnvgig3WAOj0kHRCeGAB/i6rm/Z0Q8KW68Ayvq2Sn8MC
	aKsw6kIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2z6n-00000009Poy-0czQ;
	Wed, 18 Mar 2026 22:11:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2z6l-00000009Por-23WL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 22:11:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CEE860121;
	Wed, 18 Mar 2026 22:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A33C19421;
	Wed, 18 Mar 2026 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773871878;
	bh=OVSmFm1cxnMXBULW+h02G6KqeZnD/e7FBfBURnvLEiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b4duqbzZ6dPyvqlo96pGqHMcKTr8KBAq0gc8VHiZQrSmaV5QlSyvVe1W3icpB12Ll
	 wkEOH0te/x7TGwFhJo62xaw2nNqRWV1l3rjzq7KIvnMSNpEB3lsA8xT8WAgAo7nCkB
	 wzgilKy/kmD+EITG2iwlynV6p1spl3SEpb/sT4/u+PNk0EGhjNaKpVb1X6RvqOFHp5
	 mU7GKduQrpI6PPsMvT5SW7y9uWFyJgfKeKFs63K7qeAyXaTNKgi5juJEm2oJjwOjYo
	 2V6p7TsL1NkawDAmNpPzhBjcZRV67X2Bettj6X+eM0TnIVup/bnWGNjFgrRmZLh9rS
	 jo9JmwcKhD1yg==
Date: Wed, 18 Mar 2026 15:11:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <rmk+kernel@armlinux.org.uk>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] stmmac crash/stall fixes when under memory pressure
Message-ID: <20260318151116.665400cb@kernel.org>
In-Reply-To: <CAH5Ym4iaBkFsAH6e9UgHbxOEs8D6-Tcq9so0HJ24GFfmnQiUiA@mail.gmail.com>
References: <20260316021009.262358-1-CFSworks@gmail.com>
	<20260317202718.3a5433c4@kernel.org>
	<CAH5Ym4iaBkFsAH6e9UgHbxOEs8D6-Tcq9so0HJ24GFfmnQiUiA@mail.gmail.com>
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

On Tue, 17 Mar 2026 20:46:00 -0700 Sam Edwards wrote:
> > Please have a critical look at the commit messages.
> > They are very bloviated and not slop looking.  
> 
> Thank you for saying my messages aren't slop. :)

Typo, of course. Are you saying you haven't use an LLM at all to write
these patches or commit messages?

> I'll try to dial back the verbosity, though. What kind of bloviation
> do I have? Should I be leaving off more context, or should I focus
> more on preserving the same detail but using fewer words?

IDK, writing is hard. I read the commit message for patch 1 and I felt
like I understood less than when I started :S Try to imagine you don't
know the code very well and think what information is crucial to
understanding the change.

