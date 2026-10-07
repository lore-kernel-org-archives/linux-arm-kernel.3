Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DE8CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 01:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74b5fbEAIa4ZR39VRG/iTMgUBsDcbZMPv3K1PI+Hn7U=; b=Xwplfo4KlqFgoGaOy4om4nwLQ3
	2pj1gFQFcq91uDXLQ0V30Fm8aXryyJtljL3R2cuavQJw884NTPRvanE0ytHPnjbWIrLwbl8IMI5c/
	0UVktI51gdiPieMoVXxmZVl0tmRa+rWA1MvocMdUo8jw29dZFHD88/Blh9TA6kTnqOCjYiNnjxRia
	h6O3L2gIOWvyWaOqrGEz71Tgr7DPc9W+opcM81dmgFvKWxVzmHvzpPqjK4TNSLjcK7wzBkCTCnmZ8
	+7iQF+YAG4z+3D5WFrQnCK0SpZfFFJHKUH3t81M44xbX24UOJpbRPSyN/7y10jsQbRVS0mD7dVgbL
	2HkINXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEGAe-00000001Z8E-49NI;
	Wed, 07 Oct 2026 01:10:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEGAd-00000001Z82-3Kx7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 01:10:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A23543EB1;
	Wed,  7 Oct 2026 01:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD081F0089C;
	Wed,  7 Oct 2026 01:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791335411;
	bh=74b5fbEAIa4ZR39VRG/iTMgUBsDcbZMPv3K1PI+Hn7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BLi7npim/kWoNScJTpdEj/6A8XXQf8BBwBlw6fcB0DfulqlB4/q+zve7r3B43deuX
	 m2fhWv8JRuXxAGIlmg5y/EUHPjobvbLI/iP9FhK3rLKKqzRbpXeNgFLiwx20KmjXUe
	 5vaqZBGk0+TLEMsyPDVFbLSrLMN2Zkjy4vQqguvn+u/WwPIlIfsKHAJ35yvmDXeeMa
	 B49GJx7afCkW8I+MAZoQ04NVA4TcrLDDFQOXkLscFuAq9AQQU1zvUD4B1rRCuWdv8H
	 HDsG8sG69N7Zq9Rl0QUdnoO49dZU1XEr3kb3WqfnhsoxS3afImILWtBRBmKOlcrlPS
	 jzTI8vThUNdNw==
Date: Tue, 6 Oct 2026 18:10:09 -0700
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
Message-ID: <20261006181009.5c4fe5b5@kernel.org>
In-Reply-To: <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
	<179127056620.2231598.8882282421523696709@kernel.org>
	<CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
	<20261006155214.63c5cb5b@kernel.org>
	<CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
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

On Tue, 6 Oct 2026 17:17:20 -0600 James Hilliard wrote:
> > Please make sure you read this paragraph, to the end.  
> 
> How much detail should I be including? I had previously been told to try
> and keep commit message more terse[0] and this info didn't seem particularly
> useful.

Not sure how to answer this. Just think for a second -
if the information was not particularly useful, would we be asking 
for it over and over?

> Should I put this info below the --- separator so it doesn't end up in the
> final commit or something like that?

In the commit message, please, it will also be very useful
to people backporting from upstream to various downstream kernels.

