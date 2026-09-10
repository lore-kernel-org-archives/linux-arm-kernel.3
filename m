Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF1DC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC6/PV84yJCDbibwSryMMEIqIXR32jy1oOQ/uNb5TRU=; b=iMeTmX+30AX3CRNT4a8ogohW/j
	HGnDNMwSEEqKlZFXsO+ULgy78taGVxrEQcFSZePpbraxG4kEgI7JduIzk5zaKMo0hQmRzd/GRyDdK
	nkIUVFfQVS2aqHxoL5VJTXscxpxhx1kipFQB01g99WI5j5NQ8d6sssufkkd3hn0oqkrEUtnlx3fcc
	UvLKYKTxsnHDVMpptDAJBdAqQf2B84gDZEBoPqbjdyn5B2rEQ72+uLD2uHM5dbRw1gaBijhYVl/F2
	IEIMI6nnBhgdY5WmYa1cSRBLqlpqiPK3HP+ZfmTks0ayNqdyRz0x8Kp2Wi81Cu3XAvNeWZ8xzqmoO
	aF2VFz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oYs-0000000FaVb-2cgo;
	Thu, 10 Sep 2026 23:52:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oYr-0000000FaVT-4BPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:52:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 307E660202;
	Thu, 10 Sep 2026 23:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4C31F000FF;
	Thu, 10 Sep 2026 23:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789084328;
	bh=dC6/PV84yJCDbibwSryMMEIqIXR32jy1oOQ/uNb5TRU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VXqOE8NuDfDqdpnWa2e6EIkbuR690saZMaKMQ2JBcc7Bv3jAMN2xeyjuqNniOhXCn
	 cqloFC2TN4wbgRmsAupgsig0jlsCh0BJUsQXSk/qIXJBBTxcC88yKHuEBgMC2TK8e9
	 co0QoCtDgmQHXQUF56is68/L1MASiaCKe1/icgXfunYff4Iw0+zNwT1BosFsIf7iIq
	 q3B3+JTfGPLskrneZmqBhjAQEr5pNR5XDFJLiy9qUBd+/Vayd3IKXsoxz43YBoUFGE
	 oHroEB7hwjPr7ER7zVVaOMImnmLit/pWU3H8Mjt8qJVI55nf4RXOBUBAXBpXn31mag
	 rsE2zae1qnv8g==
Date: Thu, 10 Sep 2026 16:52:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: ovidiu.panait.rb@renesas.com, maxime.chevallier@bootlin.com,
 recv.jo@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shuah@kernel.org, joabreu@synopsys.com,
 yi.fang.gan@intel.com, jun.ann.lai@intel.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 7/7] selftests: drv-net: Add VLAN test
Message-ID: <20260910165207.3aec9178@kernel.org>
In-Reply-To: <178908396551.219967.6360903882566438769@kernel.org>
References: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
	<178908396551.219967.6360903882566438769@kernel.org>
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

On Thu, 10 Sep 2026 23:46:05 +0000 netdev-bot+sashiko@kernel.org wrote:
> > +@ksft_variants(_vlan_variants())
> > +def test(cfg, outer_proto, inner_proto, hw_strip):
> > +    """Run a single VLAN test"""
> > +
> > +    cfg.require_ipver("4")  
> 
> [Severity: Low]
> 
> Is this requirement needed? The test never uses the environment's IPv4
> endpoint addresses: _vlan_setup() installs its own 198.51.100.1/24 and
> 198.51.100.2/24 on the newly created VLAN devices and the ping goes between
> those.

AI seems to be right, what we'd actually need here is 
"require l2 connectivity" Let's leave it be for now,
just drop the require_ipver("4") and maybe we'll revisit
this when we also have the PHY related tests.

Could you break out the selftests to a separate series
for net-next? This posting seems to have conflicted with
other stmmac patches on the list and it'd be great to
run them a few times on our CI NICs before merging.

