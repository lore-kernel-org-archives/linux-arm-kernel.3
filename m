Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A56AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X2jrfez8+9jMVqiE2XvaHZSBVJggR4QyEv+6Cs3MIw=; b=DGOR4MLIqCrUJXZsJWxP/zaiCi
	K4FAB4xUByYFDDXwJQaxYEhdznI79WRFvMtfR9l0uWYBBEF5XCJrgA55HUUtD8u72GB83YMNwMqkM
	9M98BvKoJRIjM/SgRAB1uIFDGVj2a9M3F/svfoNSJISEhMqI93t3Dsh1s1FgwxxxecqVDrniB37MY
	peW+qoM5F86dgxGBATi6NXgEYzsvgyCyvZfvd5F6DWIVrsqc/Y5DZV5iCoKrMLC7tKxBFiqZUJNYY
	AqKzxMCG+1F7uxVdDmH85GJWSMju+14VKQMwdG0cu34kbUnv9m4qAzk2mgz5BdGh6S/n4kMtqu1dT
	visbYjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mLX-0000000BbYy-0ixS;
	Thu, 24 Sep 2026 16:30:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mLV-0000000BbYl-0fdc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56AD7601DE;
	Thu, 24 Sep 2026 16:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977C31F000FF;
	Thu, 24 Sep 2026 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790267452;
	bh=4X2jrfez8+9jMVqiE2XvaHZSBVJggR4QyEv+6Cs3MIw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=luNjR/p6QZfdYSMeTKfOfEjkWtfZEIXLTqEOLk1LLNcwP1EHgCq/YTlfYu8vSS1lN
	 OTN1Ayc/C7l/cCLNKUnVHDl2na81EvFGKg2yDoVUEsCaqoPJ9f04ufXCX/sHqODs1V
	 ARlk2pXlgYJ1ZjJj6+L6gXwwSHuMBIAmzOYfHjw9dfSEeNzfDlD8UVpm4gfXO53oGP
	 4yQZzHtrjCAaI0ySWLsGsWic6YiaK26cnkf9bElT0RoLsK3HsXzjdOP86yVySVUirF
	 9D8auDCzcKImbfKH/dpFTwL9YaJj39oJDesIBtUJYPw+nU4N+PIaaat6V/jK+RHlnu
	 gYvcK/2LdVpJw==
Date: Thu, 24 Sep 2026 09:30:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 0/5] net: stmmac: Fix double VLAN 802.1ad tag
 handling
Message-ID: <20260924093051.71e9cf52@kernel.org>
In-Reply-To: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
References: <20260920153516.103461-1-ovidiu.panait.rb@renesas.com>
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

On Sun, 20 Sep 2026 15:35:11 +0000 Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain an 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag.

Failed to apply patch:
Applying: net: stmmac: Remove VLAN perfect matching dead code
Applying: net: stmmac: Stop toggling the EDVLP bit
Applying: net: stmmac: Rename double VLAN references to svlan
error: sha1 information is lacking or useless (drivers/net/ethernet/stmicro/stmmac/hwif.h).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0003 net: stmmac: Rename double VLAN references to svlan
-- 
pw-bot: cr

