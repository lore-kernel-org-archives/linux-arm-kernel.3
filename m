Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65B710F931A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ohcczxbi5YZs+//o4093IdzOhyG3cKFYgnUommlZQs=; b=Hbu1tj2DAyh5hiGQkHbilLReHl
	ROh30Dip3DzbquLflueaI5wSUsL/qnnLLGdoBurGcrst5kkUhnpDAUjHODUuYVcKSbhHbvgllHJwP
	6xb5XvF+QqEksJoxL7JLkwhXMRYB8KyH6T+/nlzDvJbkLU/wuuvhwHD5PnfeSeNyUPiUcoi7rIt6t
	Sc09W2FoB7rzHRPy/tgs2L31+xdN32UyFptSXWu9V0oVEgezzORqNvqIcCamY7D5LzlxP28C2Kdfx
	p4KN1OrBosWdmsI61ry1p8LZFJUG8I3EOgt0GBAl1xLidEjOWkSPc6loax3qNaB50azQRw+DCfTo8
	hcZJ17og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lns-0000000Ds82-3U36;
	Wed, 01 Apr 2026 02:59:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lnm-0000000Ds5i-0xaN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 02:59:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3919B43C1D;
	Wed,  1 Apr 2026 02:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C17BC19423;
	Wed,  1 Apr 2026 02:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775012369;
	bh=BGtOrxnlk6f59RvxLQ1mRseOThrers00WBWsCD6tbDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ejXd3AlkjyQFOWvztrRgWHqY/UPe86R9tWibU5sjEoiuQCymqVwOnESxxYPVptFqD
	 ThXvk7uvuC4ujZ0GITitI/+iZWCpcj++s7cmpooq2Ss+Q4ZKYK6Kxdx69dKKcNVhe/
	 YjqFAUrkyChYsqYNhFsR+7P91nxQu00+ckDA0jtk2v69WC5JfCHMWi5oiD8w06SrzM
	 aMvJvsiZ7xO6FkPyefRv5Qa18RhJJrTcaU/Aiz/ZbhcGgShtNyqOZBGOebd91MZxlT
	 BlNVA9JbFLP2PkK7jnIbn0j3rjHu0lBiKS4KfKpTSjESBJBpgc2SOV5nDMRq6NqEtB
	 9AEbFlhiX6mhA==
Date: Tue, 31 Mar 2026 19:59:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [RESEND PATCH net v3 2/2] net: stmmac: Prevent indefinite RX
 stall on buffer exhaustion
Message-ID: <20260331195927.3353cc6d@kernel.org>
In-Reply-To: <20260328192503.520689-3-CFSworks@gmail.com>
References: <20260328192503.520689-1-CFSworks@gmail.com>
	<20260328192503.520689-3-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_195930_301315_5586518C 
X-CRM114-Status: UNSURE (   9.90  )
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

On Sat, 28 Mar 2026 12:25:03 -0700 Sam Edwards wrote:
> @@ -5870,6 +5871,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  	priv->xstats.rx_dropped += rx_dropped;
>  	priv->xstats.rx_errors += rx_errors;
>  
> +	/* If stmmac_rx_refill() failed, keep trying until it doesn't. */
> +	if (unlikely(stmmac_rx_dirty(priv, queue) > 0))
> +		return budget;

If the system is OOMing having ksoftirq busy looping indefinitely is
not going to be very helpful. 1) only react if the fill level is below
some critical threshold, 2) try to add some delay (timer)? before the
retry
-- 
pw-bot: cr

