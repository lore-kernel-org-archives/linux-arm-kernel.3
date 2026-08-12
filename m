Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4DDC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUY/Ds/MUvmVmH7d6jg454DnOepLNosOzWfrRQBaR+4=; b=lqcnzk+s5SLXgSL3G1881TOaXC
	pBnLOySy9V7nOCFB0RMJc7t7YU6PqLABjGt5Nu4H7rmxoF0Wva9e3e+7/X66BeK9BHHrxbOl26ytq
	1EfaZ7pkWdi1w2kMFUJZiN56a8uXMMXTaaY7GHVXIwnXPQX4s5C/D70LhTl9Igbh5bxUj0stjdb5W
	IkeJSLac4cUzg6FMUq4uEZnzIq3SH3piMeDB2LKn4zuFpNtsH5DPS7QvzS4UDBsCf2/L7eP/j8P80
	tShWIeuMwptn1dkNEoDuBXNuZ8RAQuphwvGjW0pd8TTP6zLyta658chyzhkZ5U/jmLacKmCbEjwla
	/HVpWHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuI5q-0000000H80Q-2x14;
	Wed, 12 Aug 2026 23:10:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuI5p-0000000H80I-0zmC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 23:10:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D6AE600AD;
	Wed, 12 Aug 2026 23:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C32A1F000E9;
	Wed, 12 Aug 2026 23:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786576239;
	bh=CUY/Ds/MUvmVmH7d6jg454DnOepLNosOzWfrRQBaR+4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IoAYHNY+QUKKh+ZdT2yVJSbBiZ7Y9lXnHdVaeKw4QClxpQggA5wKRNyLeGwkRqPy8
	 81OlXlKGYXsA3vUMKukuCjPOJ8PCfYISeko2z24lO1bZ7Ws+HDlA/BG5iWM0G8AURs
	 UJSAxOLtghAd4xRU+TjAM62b0oPOaWyrNSHGSTkIIkgjC7GKE9qN16b6zelQ53xZTW
	 26qy16fv1uaDFGFIeIwfH3w8O+84tgzBTLBVx29p8M9YhWUk4G/UVRPStzTCueO6Nd
	 iJCLkS21FNZ6jGM3ucuU+b2lVtLvj0WQDFhPVpS3wUHVOVJQyTQiCaOzbqH1j+Bdmn
	 8afo83nwAchnw==
Date: Wed, 12 Aug 2026 16:10:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: stmmac: improve TSO/GSO queue
 selection
Message-ID: <20260812161038.5602eac9@kernel.org>
In-Reply-To: <anybM_3Rdg8X8CMs@lore-qca>
References: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
	<anybM_3Rdg8X8CMs@lore-qca>
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

On Wed, 12 Aug 2026 18:11:31 +0200 Lorenzo Bianconi wrote:
> please drop this version, I will post v3 to fix some pending issues.

FTR Russell was trying to fix TSO in this driver too, before giving up
(on us?). The direction he was following of clearing the TSO caps in
ndo_features_check and letting the stack GSO instead of all the weird
hacks this driver has seemed much more sane. But maybe I'm missing
something TBS specific here 

