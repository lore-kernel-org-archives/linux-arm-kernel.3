Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48BDCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLALOZmXVKC/7v6S/3QtsQXA+nJltuNJa18BiD2mBk4=; b=GPXVlLdE1AM6pCUKQATQxLIGvQ
	Qo6p3TBWZtb1kYzin0yeUv4758XBVIJmh/ZD6DTwzU0du0M6uWM91woraCd2q9GiKfWa28UfaGmZz
	wUfvulUm3NDyOyjdAGUKjQkUT5oH3AJB2lFpeWno65BKVjNy2E35GT3uMBMZxH2R+gQGGAMIKDGSd
	+cSF5E+ZiBjdk7C9XpvOrfItV8+UtaXJeM3aPzh1kETMgE4yTsxH9n/uucx7n8zmC/ayVCA6OZszQ
	NwalDszho8etkXWR2X+ZmxRmK1oX9RwRsSYNzIW+ahPdr5sAstMtpgX3M9ieMhcR5U9shH1qESRho
	m+8jobnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE1D-00000001T4D-0TSH;
	Tue, 06 Oct 2026 22:52:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE1B-00000001T43-03h3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:52:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9781640D94;
	Tue,  6 Oct 2026 22:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E03F1F0089B;
	Tue,  6 Oct 2026 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791327135;
	bh=hLALOZmXVKC/7v6S/3QtsQXA+nJltuNJa18BiD2mBk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=c86XRavdi6mixAcbFn60iQqJKDNxvlC3R4NG1MoXRR1iUrisAwx77o5A5KU3tVk5r
	 CIkd5H8KxVw5MZeoxLUiWWPwEblA+YnA/3wUM4gTRWfPB/xKNQlfyD4bWQdO7Yg28k
	 XU0c14TSLwvXjMhU70PI4CjxPlwxuswuTm+c4i7bRXtrqAhIX1YCCkngZogcUOo+AR
	 r6WazXMScCoJKzNeUnlpFYjjz8nHhiEcYSDcEgY28sZ08dgq85U5RrcPZ754GIw6T9
	 qsYlBOpZCFK+Ho4QQL/HHtV4TRU7Zey7t320/IkWT4nVttQtQuWxoKhviIUGMhKx9u
	 4hPoKnz/kq3LQ==
Date: Tue, 6 Oct 2026 15:52:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety
 IRQ request failure
Message-ID: <20261006155214.63c5cb5b@kernel.org>
In-Reply-To: <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
	<179127056620.2231598.8882282421523696709@kernel.org>
	<CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
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

On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.

Please make sure you read this paragraph, to the end.

