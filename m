Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B447D12668
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1F/UoD2VFfgZvODvCjSc+7YCdWKH3qS7tDGOxaO8Jo=; b=lSqLIVQBhdNe4iYG/DuBS2XDtv
	fL7rgtTIJCMzloygMiKVqE2LgH4TqQYMDXG71f1q74LWbmntXze+vphamN6UtCrr85QFY67efTbct
	Zkq1wNU7IBPOuJZjnxul8vgPw3x0ReubTzNlwISx1M/sQneTCvGz3b+DVK+FQlpaa/fq4ETy6shhX
	pCJC/5l5x8vawYtdbCnclOy1T8JFvW9GR9SsetVodOR3UvK18IEvHmUsBSf/Dm+5h4j1y+gjUzjoV
	Y7NijpJtp4yjY2INJu9slzB0OSMPtPnIjcivH3r6Duzp/plgT1CC629JYOqpPOIAeWilRoCs2HeAo
	odwTyt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQVEb-00000005jDd-0D4q;
	Tue, 02 Dec 2025 18:36:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQVEW-00000005jDA-2go9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 18:36:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56F6C4430A;
	Tue,  2 Dec 2025 18:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84B6C4CEF1;
	Tue,  2 Dec 2025 18:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764700576;
	bh=yQgqsiygSaMJpkmvOUK9aemziX5h+9PzpA/FfdGF87g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vBhdLZyUIJxX3qFGn+1p1zfpDXi4JrkXnRLoyId49gMS1/SXmjPkJ4Nnf57igtPaH
	 I/olXQCHfoPjw5pbnNrA0Fond5qVj9DcisoZwGzX7EsvBR8Vh5gGq6Ho2AC9equBid
	 LhdQXl6tKAGIM5bORYZl57dWUqhhXKRymnNSD7T7yvnMdJmX+LhWzAeq5UAeoJJpd9
	 hpN7EA8ftOaRejC1KTKy4Dh9ICoj3AbTlIeReLheXhBiS6ZDoRaRPJwkVft/SvrfjX
	 xQBeel4PJQezO/vuZcR276e3+jk/bKwCT8NMXWTVDTCOHRAKiQsExMuXbpjY/M2+XX
	 Hn+rvqc6JI4pQ==
Date: Tue, 2 Dec 2025 10:36:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: 2694439648@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 hailong.fan@siengine.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: Modify the judgment condition of
 "tx_avail" from 1 to 2
Message-ID: <20251202103614.6a185bf6@kernel.org>
In-Reply-To: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
References: <tencent_4A0CBC92B9B22C699AC2890E139565FCB306@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_103616_963496_888A5CA2 
X-CRM114-Status: UNSURE (   7.11  )
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

On Tue,  2 Dec 2025 15:43:59 +0800 2694439648@qq.com wrote:
> -	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 1))) {
> +	if (unlikely(stmmac_tx_avail(priv, queue) <= (MAX_SKB_FRAGS + 2))) {

Also, if there isn't a comment already somewhere - it's worth
documenting what the + 2 stands for. head buffer + vlan + frags ?

