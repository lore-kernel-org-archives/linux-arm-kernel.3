Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E52C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q95GYrZJFcrKcY1VkAcZ17z5yWQx4bw3VItykV2gTpI=; b=zuQRaLAsmk1hCk5Q8k0CWL0lLT
	sBCIwUm/RDfqpwZSLuZh88b4m5NO2o5XP9/xBghRr7lU+FtCKSrvxJBycFGokz0iTKe4MLAvCi4ah
	1loyPg92vOHh4iIGgvqAFswJX8iFIcjTUbeFuFpY5YpfrEits8ePdHHEzVhetXeH32BiBnyj5g+Da
	wvgSylLyIec+0yf8xFY1OAbx4KFDuYVmuLOZAz++PfLkramoAMfLc/2uIwVebAJWJKcWI7KI+b6Cr
	y/DMje0FIB1D6blchd0+qin5JQ5ZAacEO1pCTc3K+LTfCPogO0yG4J6KzU1YFBldBPnhlah6bY8Jn
	vB7IQs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZqR-0000000BT0P-2vLe;
	Thu, 30 Jul 2026 23:07:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZqP-0000000BT0F-3zSu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE88D600C8;
	Thu, 30 Jul 2026 23:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C0C1F000E9;
	Thu, 30 Jul 2026 23:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785452836;
	bh=Q95GYrZJFcrKcY1VkAcZ17z5yWQx4bw3VItykV2gTpI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=K6DcTkaSxNC3Mz//SHt/B6bK+8/dIYFonFz5hUDFt+cbWU8v8+L7HTM5TpBy8zQ6I
	 IGXYFiogBsfWPAH7rPrSfuCYP+qcGdS33hcIiq34IN/CoftAG9nZYlJ4l9WwsUqYZ4
	 nEF8z1xa9HoZvRPtqdxXBmtAOMldtBAXBOqtJmJJVRNy74Co3A2D7bn1DzQIKKbflm
	 yE4kgD1obSZpjqaCy15gmcRKjMtmm6nbSPr2EYmx9XHKPbSXsoVS72afJhtr1qXIWK
	 HS3XQdRT9ieCpop5Ba1owiPQbprlWMmHcS5vjxx4lAICCSmYl7k+50BIm9Gbpn2Q16
	 u0SGYs5khxi4A==
Date: Thu, 30 Jul 2026 16:07:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Abid Ali <dev.taqnialabs@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: enable MAC rx/tx after DMA start
Message-ID: <20260730160715.5ba5e272@kernel.org>
In-Reply-To: <8e9563ce-e103-4fda-80e7-5dffaca2a03a@bootlin.com>
References: <20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com>
	<8e9563ce-e103-4fda-80e7-5dffaca2a03a@bootlin.com>
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

On Mon, 27 Jul 2026 10:23:13 +0200 Maxime Chevallier wrote:
> On 7/27/26 08:14, Abid Ali wrote:
> > When the MAC receiver is enabled before the DMA channels are started,
> > incoming frames fill the MTL FIFO with no DMA engine to drain it.
> > If the PHY/Switch is already up at this point, and there is inflow
> > of packets towards EMAC, the per-queue FIFO overflows within this window.
> > 
> > Once the FIFO is full, the MTL read controller goes idle and never
> > retries delivery even if the DMA comes alive later on.
> > This behaviour happens due to enabling the MAC RX path before
> > the DMA setup is ready, and any delay between these events increases
> > the chances of blocking the rx path permanently.
> > 
> > The EMAC should only accept packets after the DMAs are enabled.
> > Similarly, the teardown should ensure the MAC rx/tx is stopped before
> > DMA engine is stopped.
> > 
> > Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>  
> 
> Ah great ! This matches the programming model for the few ref manuals I
> have, e.g. cycloneV manual does state that the MAC must be enabled after the
> DMA has been configured.

Sorry, me+Sashiko again :S

Sashiko wrote a damn essay, IDK if it makes sense.

Looking at the patch - isn't it a bit awkward to handle Rx and Tx
together? We want to keep Rx blocked to prevent incoming frames,
but Tx should be allowed so that Tx can egress?

Grepping around I'm not seeing any flushing of Tx. Aren't there
issues with this driver if we stop the interface while it was
paused by link partner?
-- 
pw-bot: cr

