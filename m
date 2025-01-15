Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E83CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b/ggq74aYViLyGj4QDV+WQKvH8YAOxH6gN7qJL4uVQ=; b=HuqlKqvYCp/OZ3fFjFm4gRHsKM
	BfWBAMXW9rF5sCXkH8EBwer3rVcdYbxKT2kR0Mf8gbi51kaD8IfnC7ceFrC1diFnJ+ePvETIUHE4d
	CGWG/Fd0F5MrQTImm+8Na4O++QC7VOhDxf2K2SksXoILSjBuFRR89J+94F/TSan2P5HBSEwmmuctT
	n7pJt/hTgkx2zdCkPNyMVkzlDorOm0U9A+NWWcficwtqI38X42j5USDnZIEkag01pBTCYiUZb4PZi
	RI1FCkllcIH5CqLJ1woRrQhKiCpUh7qiT/CIXRqE93km2bhb8R7JC6DfBPUfuw9feK3TjoL9u74nc
	lf88MTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXt2O-0000000AOoP-3CWp;
	Wed, 15 Jan 2025 02:21:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXt0o-0000000AOaM-3o7T
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Jan 2025 02:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3b/ggq74aYViLyGj4QDV+WQKvH8YAOxH6gN7qJL4uVQ=; b=dCpYJ7NIOAo/bo3V11FIi0RjvS
	o97imDbYwf7mV6MH0tkd+LnnNBQ2VIvxELXxPYq0pP6IGp75xJuEUYPDiCDIwOZxFmH7ux5rKTRtu
	ENL4wlSMRV0G9nM42rNiTFtCPR0jTYyUm/QCyu9h/8ShfzqSJNkg0YzDpXurWdo/mN9Y+8IQgl0Ay
	k/8AWreiwNu5NFxqDaJiCz83PX2HueT6IFaIbtC9+S6sgWOaiJJ9flPhjgKnwVMonsf+XXHw/KcXH
	+HIARp9y1Q2dBLv+pxnFk96uBYoKfCSOyoT85TWZUlmvsYZim9oYTGVpAVWmd2Mg1iiweOgJrmzKj
	YZmxcDQA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXt0l-0000000Ak1D-1AIp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 02:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8975A41275;
	Wed, 15 Jan 2025 02:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379E2C4CEDD;
	Wed, 15 Jan 2025 02:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736907601;
	bh=k5zcdfRd+dirvcL8WCDgycvlSRDQLgmbaRl4EKUNh8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F18nyyAYLuvENyVSSD71xF45K2a6V9tKMNA9Jg5utrotWZdfHvUhkle8ERQPMAF/j
	 9X2YVem+hIZKDHX+CHUCaSP6kW3XEbjsX5mky8Vn6aLbtV64WIqrAGZrJjMtsjnGFV
	 5WbNyMLFhHYZBf5qz7P5JbXLAqZkSKdbBIb9aBJ5Sfv+VGkc/i5LchZZeCX0/w3uMn
	 Kve9q964/87EekbJHWGGPpvg55HqskaqJHZHXsn9kEkCMjJ2u9A7+WVPXrWxqRZdER
	 yloi7L0GfaMhe0P/MDptWxXLeLmsW2lHzpEUmYIOcKRo3nDtt+qF6jCBpotrYlorde
	 FXY4LTwo5Yu9A==
Date: Tue, 14 Jan 2025 18:20:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <jdamato@fastly.com>
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Optimize cache prefetch in
 RX path
Message-ID: <20250114182000.4ca2c433@kernel.org>
In-Reply-To: <Z4bzuToquRAMfvvu@LQ3V64L9R2>
References: <cover.1736777576.git.0x1207@gmail.com>
	<668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
	<Z4bzuToquRAMfvvu@LQ3V64L9R2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022003_965832_C7BE247B 
X-CRM114-Status: UNSURE (   9.19  )
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

On Tue, 14 Jan 2025 15:31:05 -0800 Joe Damato wrote:
> > @@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
> >  
> >  			dma_sync_single_for_cpu(priv->device, buf->addr,
> >  						buf1_len, dma_dir);
> > +			prefetch(page_address(buf->page) + buf->page_offset);  
> 
> Minor nit: I've seen in other drivers authors using net_prefetch.
> Probably not worth a re-roll just for something this minor.

Let's respin. I don't know how likely stmmac is to be integrated into
an SoC with 64B cachelines these days, but since you caught this - 
why not potentially save someone from investigating this later..
-- 
pw-bot: cr

