Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A496CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt3tseJjycqq+91W06SzoBlKRR5su31bUW3zAc7vzWY=; b=cqjbO9s7XN8GgOfiw/kWIm8auq
	ZvDOGf5mwa4kYN9QWIzaHlzgBoppV26Dx8iEfJHsULitTDjX2l3MBpiY1itai4vv3pWja04pwtQvN
	w1CeigfFdGaU/oWs3kiuvmGWyDv+jgqc9z3shqQi3ranslwR1frrFqEwvJjaHVV7ktBXkzXMUKfEu
	AOrgwCbDm+GRvz6zDZpna2BYK2+8QtowPGAnIRrR5S6eaDaMTs5J8vOHCoHtx393bn6KKIkcgbSnM
	oRhwgLPk9FP+q7qNaH0Z3gDI8WqnMIQu7BY2LCP5/MSz9MuogpMPJg037xugzQ7YSnmxwJC4xopvt
	up77Lm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXir-0000000C6Hx-0CE5;
	Wed, 20 Aug 2025 01:34:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXVC-0000000C4bb-0IWn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B66C5C578C;
	Wed, 20 Aug 2025 01:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A1DC4CEF1;
	Wed, 20 Aug 2025 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652833;
	bh=Mt3tseJjycqq+91W06SzoBlKRR5su31bUW3zAc7vzWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HG2aM9mgicAGjOvLZDbZfHKUAi9cNYbGj4HLb/kIR4spjkfhmeEqbz8R5OZecCN40
	 DQj+zgYEHuZMtlJo4dppMQgsQDopEZ0gZvoY5ha5HCZuezwR24gZVf9hWSV7FUWWW2
	 oXRjm8WIx3SLQ6n1/lRMu3hM+V+yyqa4eVbyRxPzXL8gHbrotIfQT8pv6Je7oKSbmV
	 JlUjPY8QvkAyYc4LPmKWtD2qNT1NmPUD17fiP5QMU1d+WBqZVFN5ApgHZ4Cyh482R+
	 y6B5SE1c9S2tzDQvqgBkfMzi+WxdLA5vuf98vmQad0kbTz6MduOgEcuZCuGFwkrfkY
	 5PeJ/4J1hM9Wg==
Date: Tue, 19 Aug 2025 18:20:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Cc: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin
 <fancer.lancer@gmail.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 0/3] net: stmmac: xgmac: Minor fixes
Message-ID: <20250819182031.58becfe7@kernel.org>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_182034_151901_BCC8344A 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
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

On Sat, 16 Aug 2025 00:55:22 +0800 Rohan G Thomas via B4 Relay wrote:
> Subject: [PATCH net-next v2 0/3] net: stmmac: xgmac: Minor fixes

I left one nit, when you repost please use [PATCH net] rather than
net-next as these will go to the net tree, and 6.17-rc3. Rather
than net-next and therefore 6.18.

