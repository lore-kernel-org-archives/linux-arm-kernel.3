Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A15FC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn9AysUH1VrFe+nloOlag9vnvl6F643sqcyGhZVFbwo=; b=DWUENdxpNXS+Ug+I8+EXU3trSO
	b0ZyIEgfVHmRV3C8/9W9XSf5gmp09NOjtfoOvM3i0FLSgFgitIbRBqPPVNZj5bcKt1jPKcxdpWxFq
	Jm1ignVY447LjBYD/D6mPORuH2fMnU3GMNQ5Veqvbt7/oYS75DGc5XHWuTjPNaRulMn44DdcBtZNw
	t4ohy6k6CVpBp3wda+2HExf/XAzT1epEW2ReV2Zj2kpenmmOzdjSl/XyrxTwAFJ1gI+nfg1Bq8RCl
	6DvR9SqDJ5SYm5S4T3sIVmGVyMCoApDTngv1WWq5zw97CflXkD/hjrS0ldCxeD79E7n8PLgj9mYzu
	8zQPGn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Bf2-0000000AgUF-0q4F;
	Mon, 31 Aug 2026 23:43:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Bf1-0000000AgU9-285Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:43:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D02774057A;
	Mon, 31 Aug 2026 23:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371071F000E9;
	Mon, 31 Aug 2026 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219810;
	bh=Dn9AysUH1VrFe+nloOlag9vnvl6F643sqcyGhZVFbwo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VC9e6snbLdIvE1BAb7foGj2WKAG/+ktLs8oA6/WNiYfE5wqU3gqj8mBo9ut2FaN5T
	 y98ySuiCp1AH4l6tZ73f4a0Rg+0wB1VsZYLmgxlC1ggDFpaSDdNFKwpNJXFd7ieKLe
	 4ZOd0g4v6hRBfrUEohie3stl+Byp/MevaNbXSlQhF4kjIF2SAXZf905mYHzBU9juEZ
	 EYC0V7Zkqq7yi/EJ2bfyWrATL1/XmbBjhZJl3l7Anqdn7d7jKUMYJhzz/HIiXTm0BC
	 ccqgwHXNl5+CalNAwjNEBx7iRwD+fsCj4RLvDkIvO8N6E2MGvkzGhTgm1i4yJLAqNN
	 Z0ldwsHihYVcQ==
Date: Mon, 31 Aug 2026 16:43:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 0/5] net: stmmac: Fix double VLAN 802.1ad tag
 handling
Message-ID: <20260831164329.138dbf3b@kernel.org>
In-Reply-To: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
References: <20260825164522.4244-1-ovidiu.panait.rb@renesas.com>
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

On Tue, 25 Aug 2026 16:45:17 +0000 Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain an 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag.

Test LGTM, let me apply just the test since it looks like the driver
part will need a respin.

