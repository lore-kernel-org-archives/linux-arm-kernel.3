Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 00:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmKAJN9a2Z98ZmCDlw6pUbTH/OCRHE9s4Pc3n6u147g=; b=sENH9IOXz41qzRUAaHrTvy1cec
	T8FQNedkEa2Wht1GQ7YEybSO97mNWXvoSk7kUpBph4NrwS1QrJToH4zMr2MRQ1Aj0WERiqXjFN5k6
	z6qzdEJWnMO0JqKUyvzlQkij2cwbCy3D7T4nSqR4uKLbBfXBsbuFk5SlMDNrZdJ+C/YlFbzBJbkE2
	2CIlNOv8LadlvX4iZk8lU9nRzn1O8lgoU/JmG2g3S0LuaOMpPmC7QH2h6ZxbN2HNtNCxQlIWcBon3
	Tm/1/jdNVU47TPa3+49AJ8zt056FieYSqJ7NNzc0UilloiMIiCbSYZ2HMDCYfI+DSz9goReg7i2s+
	52rBYdUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO4dJ-00000000RQ9-3g8n;
	Thu, 19 Dec 2024 00:43:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO4cD-00000000RJX-3CKV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 00:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D8395C277B;
	Thu, 19 Dec 2024 00:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7C6C4CECD;
	Thu, 19 Dec 2024 00:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734568928;
	bh=ETOdpjMOcIfpgrnZ8m3rcLo9Y44+EC3i/OGlHZ4PawE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HWT0ap6pyizLpwwjBoNr1Yr8mFmNZZZQQSoqoKIFOy7TEMmR71Nl8EqtWPIAKUchQ
	 MpotDbqhht18A7Je6NT6D5zGZwpLFe2J9/yIiRq9a5611Xdl8IMO8xQkIJF8Y2vWFb
	 HFDu5dR7NpHGdOWURBAFavSEhkddjfp9fR0SfqWaUiv0y5KvUflQZpru1q6do4GSRl
	 jvZl49pfQpvS53dnm3wg00Xhi6O1/hCEV/3G4Vzc17BVB/vqWq2ouUW2rASfsIaFdG
	 q/D3yzIOw4O0Ks96lWlwUH69vfJhiW01Xe+P+xv2lSq17eb/ZWbRftM/mvHniyb600
	 T89VQeH6ODj5A==
Date: Wed, 18 Dec 2024 16:42:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Furong Xu <0x1207@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Simon Horman" <horms@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, <xfr@outlook.com>
Subject: Re: [PATCH net-next v1] net: stmmac: Drop useless code related to
 ethtool rx-copybreak
Message-ID: <20241218164206.437fcedc@kernel.org>
In-Reply-To: <b2ae6b80-83e3-4b22-8301-c91569c89494@intel.com>
References: <20241218083407.390509-1-0x1207@gmail.com>
	<b2ae6b80-83e3-4b22-8301-c91569c89494@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_164209_849883_3F615972 
X-CRM114-Status: UNSURE (   9.60  )
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

On Wed, 18 Dec 2024 16:48:38 +0100 Alexander Lobakin wrote:
> If sizeof(dma_addr_t) == 8, you're clearly introducing a 4-byte hole
> here. Perhaps you could reshuffle the struct a bit to avoid this.
> 
> It's always good to inspect the .kos with pahole after modifying
> structures to make sure there are no regressions.

Pretty off topic but I have a dumb question - how do you dump a struct
with pahole using debug info or BTF from a random .ko?
Ever since pahole got converted to BTF modules stopped working for me :S
I never cared enough to check as most interesting stuff is built-in
in Meta's kernels but it annoys me every now and then..

