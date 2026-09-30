Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427F2CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4G3sKWZIlCfo2hjBMDIfRgFkOo3aOxVZX09z7zcj3o=; b=bGYDCTCWxUFLTg3UM7EynuLaX0
	v+2nEEz3NEc7PK/cneyyN7Me3RH6qv+3FN4h7Fd93bG3WK2TjFkHiTLbIu6dWKXU+U6fPdZenJMV/
	JUw3mwzLDp1tPjIuP4BfY/qmUxnTy95Q3s7KdHUoJsC+oGz7gYI/sbxYCUlxzbEKcFLkQs4igJ4yC
	dfTeD63aezYu37tK4xNGfMWY61aDLxAiL+yNxx7cNR8ZGQe4hSmwNlfY3T+kZgZAXSKzPuz3KYJ3O
	ch8dH86cy02H86Qc2d1YGavpKwLHrEkle9m7UZAM2lOwJmE4uPdXgCajUl4sVX+4HewE9xvISZWyl
	z8w5TubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBipA-00000004qvj-17Mv;
	Wed, 30 Sep 2026 01:09:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBip8-00000004qvV-2V1W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 01:09:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0243842A1E;
	Wed, 30 Sep 2026 01:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAFC1F000FF;
	Wed, 30 Sep 2026 01:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790730569;
	bh=u4G3sKWZIlCfo2hjBMDIfRgFkOo3aOxVZX09z7zcj3o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fSOCQkQ8n6pZPkXZDoHF8wcQke84pv6gMjBzBCiLHDy/HlPQ2W+vniU8herUwFNWw
	 CHhSK0y28CdCLm4ik3KSQ4mNZcUQ0RY4hFihRosnnttXsJ6MNXm6fY3tSdcP7r5rmK
	 +2YzxFo0IwJFNYSQfsSMeEOpekooL5wY6D/5moaPR3voISvDqPDVL3UUWXUlj72OLE
	 9xlO7SF0SOhGcuEgROBaipK4VF3Wi2Id3nh4597MEpT9rYEYl7TF4twvm/8dFtpR7W
	 H8DETQggxKwciqIqAcjE9yPQ0W1LbP9H338mwHIhzeZPncnQWblTD5dj6rXq0xTwRj
	 0aQYnQbomFf1Q==
Date: Tue, 29 Sep 2026 18:09:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, nb@tipi-net.de, jitendra.vegiraju@broadcom.com,
 thomas.petazzoni@bootlin.com, alexis.lothore@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
Message-ID: <20260929180928.546f23af@kernel.org>
In-Reply-To: <71adb267-2dd9-4225-91e5-19848a87eb49@bootlin.com>
References: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
	<179067171307.434549.1093187286398187440@kernel.org>
	<71adb267-2dd9-4225-91e5-19848a87eb49@bootlin.com>
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

On Tue, 29 Sep 2026 10:57:10 +0200 Maxime Chevallier wrote:
> >> @@ -943,6 +949,9 @@ static int stmmac_get_rxfh(struct net_device *dev,
> >>  	struct stmmac_priv *priv = netdev_priv(dev);
> >>  	int i;
> >>  
> >> +	if (!stmmac_rss_is_supported(priv))
> >> +		return -EOPNOTSUPP;
> >> +  
> > 
> > [Severity: Medium]
> > Does this -EOPNOTSUPP break namespace-wide ETHTOOL_MSG_RSS_GET dumps?  
> 
> This was reported by Nicolai already, and other drivers report -EOPNOTSUPP
> here.
> 
> If we address that, I'd say we do that in the RSS ethnl code.

Let's get this in the same series, cause I'm not 100% convinced.
My instinct is that returning 0 size for indir table and key
would be correct and less hairy for the core to handle.
All pieces of RSS are optional so returning 0 size for everything
should be equivalent to having no RSS.
-- 
pw-bot: cr

