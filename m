Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384E7CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wisdgT2ZOYem5uIq/nA7wrsdqI+W8TyUewhJA2rZF8=; b=CgQWnD6ZJ1bWHJEnNERT7igbTL
	LkzuvMwHD+FPuCKMCTL3fp1scmZfdWtsWAO6p2vA87YSj1S46MVav1V8ma19DHIN2KApIfp4kfDMW
	31lfxtg5VwpPZtjwxDrgw32nuFwLWmT/FfjcOSPLRn8SJHtL7EngKQYum/TyypQ4W4zuusX+7RB7q
	IT6i8lRSZy1OgCRGyiwA35bHObkhBJLMMZaFzWx+U06jjCOwCDJLAIwe+43qRxJeIELO7TREPhI56
	CSTxGUeahzdC2Fxefotq3iwcSRb3bZR3A89/q4SBZXr6iht7BTgx1vqWHdtH+7G8TeCGjO1BkDhA3
	fY3hHzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0ij-0000000FHbP-2QX3;
	Wed, 17 Sep 2025 22:33:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0ih-0000000FHaB-3Qn4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D641760008;
	Wed, 17 Sep 2025 22:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7A8C4CEE7;
	Wed, 17 Sep 2025 22:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758148426;
	bh=AeEOjTrTrYWvH72UFkbwWuavt/5qgvpD1SHmR09SsvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gLbGShqM98jOqHm37oS4ubwyuBbGytiQBlkfN3FynWD6yumF43D+pnm2kKZ7pCclt
	 L3+yryrCXLitIEL+LQQzQXcg0zncYegJFkrruDRnkAm56i6RUvUxq3OX2OdjMCQP1q
	 /TIU3srcNNwYP0vjJL8m4KMlX2ZhavisMnYA0jfP/Gg8UxSO88nGulQ1K+f+2N0Ilf
	 6rYYWhRTBPb5vaauZvJj4yyxrKUuzoYsdBIHlCbiPcCnebtEyLgELq2ZSQ7KxsO81j
	 4Qlesy9hz/aaOiRKnTJqsm2ZCw/v1xB6klS1LNPXYQKW2rzoa1Zz2oby/gXP4ZSo2I
	 JQBJizKO/7Ssg==
Date: Wed, 17 Sep 2025 15:33:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Cc: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v2] net: stmmac: est: Drop frames causing HLBS
 error
Message-ID: <20250917153345.27598d55@kernel.org>
In-Reply-To: <20250915-hlbs_2-v2-1-27266b2afdd9@altera.com>
References: <20250915-hlbs_2-v2-1-27266b2afdd9@altera.com>
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

On Mon, 15 Sep 2025 16:22:14 +0800 Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Drop those frames causing HLBS error to avoid HLBS interrupt
> flooding and netdev watchdog timeouts due to blocked packets.
> Also add HLBS frame drops to taprio stats.

I think these should be two separate commits.

Also are the HLBS and DFBS acronyms obvious to everyone who works 
on TSN? 
-- 
pw-bot: cr

