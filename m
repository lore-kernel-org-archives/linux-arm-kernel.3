Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005A9CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyFsXjy5OaEZl8PGd7I/kiFPbnTj9jr9ZigL3uz+Ws0=; b=OhaCr4iicO8K+AdedObzi2MzdX
	JuA7zafpOWpVRiaHqu8RVf9KCrI0aSD91I1H+lAP9fx+3FqXsrS4TPnQF4yUL29ga+FpQUkhgoJAe
	HeluYjbP0kAbYSGkQ8CvyTuVZv0Ve9Tj6Xj3BoRr5iAvI+icDXX8qBv0iDoKJpDjyh9pJyfiHu6ch
	JSgwUwE8Tz9ogoSUxYN/b1EuhDd8WqBD4UFk9zcn2DSUaHrK5+jTd860KeRwDu6CbV5IBz/O1rSGw
	X+3KSmgLIRWyJESjADCgXQLJH6h1bVQiuWLgomhNOG/Kca2QayhPzfJfa2BubBoWQcRzGKa+cdcng
	m5vTSUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNGv-0000000GLnz-3Nvm;
	Tue, 02 Sep 2025 09:25:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhj-0000000GAed-1tMx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B612360207;
	Tue,  2 Sep 2025 08:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE7C4CEED;
	Tue,  2 Sep 2025 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802966;
	bh=rEEUhyesr1JfcnPJBOaeHTZak+JujvzT4iPgYVAefgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4dK+02dMlR8emlHiLWqZYbLOQhyLVddyOOin8epDnyty080NGW2VX2tWBmYFo1zC
	 1fzMnTtYbdLKl4lyGu3PkXcLMCXqrRJEkzD7o6NfFYDqwJz7xvOU0vtDRfxKfELku8
	 IqAlKWY1CZaVZCkpF81r/Sx1HKQYpgm7/MnbFMgCLcds8WCOWjZi12/fSsjMWrR8g4
	 edT7akdZ4A4pNTJJ1OwT9xzJzf5BQCG50jJ3RTJo6KITr44epGr4jzAz9tUDNalccz
	 c+6SZEwjc4yqdWSNBJhWX+2F1juf2LY9raq7U8W0xe6NlyK+Nbzp8JEGAm4YUvO2C3
	 b5upV9De/LlVg==
Date: Tue, 2 Sep 2025 10:49:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: dwmac: Increase
 'maxItems' for 'interrupts' and 'interrupt-names'
Message-ID: <20250902-spirited-congenial-stingray-f8aff7@kuoka>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Tue, Sep 02, 2025 at 01:12:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Increase the `maxItems` value for the `interrupts` and `interrupt-names`
> properties to 19 to support additional per-channel Tx/Rx completion
> interrupts on the Renesas RZ/T2H SoC, which features the
> `snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.

This alone makes no sense. Why would we need more interrupts here if
there is no user of it at all? Squash patches.

You also need to constrain other devices, because now one Renesas
binding gets 19 interrupts without any explanation. Please rethink how
you split your patches...

Best regards,
Krzysztof


