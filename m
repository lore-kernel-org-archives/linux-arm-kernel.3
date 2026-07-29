Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E098BC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07zzg4tyQn68vbdlszr3ligpYW8XEoNE156+JLLXuMM=; b=AyPdgvZONRBkN7LkA8vis2K4OD
	rFSj+los4IxocTqnJSlb9X/mO92s5PigDD9WT5is8+esWPUL8hP+31fE3PnKsLzJ+akKLrdicXdE5
	pX8uJbStgMBe8dTkKKiaAkKqFwzvkiZ7mzbq6ddp2ycGg104px+1/5EeNvp8FCTgs6k3678sCjsHg
	tm58d03XHsj5mJ+v3U7LnB/Ii5oQJaaCBuEaMv2t7S+NulGmxGjTVMDm0YBMQRsVKeRr27Sg4eKnk
	WGrn+PlHNG4gJYyUUiT7njW/ynxTYzDvOTa2OOMPEAiBvKIg/zCG3ni61IYRZNp4qyySu9Tnsruy8
	EhaVXz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp79s-00000008YI8-34ju;
	Wed, 29 Jul 2026 16:29:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp79p-00000008YH8-2Erk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=07zzg4tyQn68vbdlszr3ligpYW8XEoNE156+JLLXuMM=; b=U2nC0qZh5fjvgMxsARqJR3miYA
	gmgfYHrXlKqsCJQzQBBUsnlfh2NSbE8L78Z7Kbd6EtY2BxkGkvfdWqG8ITgb6TbR7q5qWV6TcgBqW
	Y0wKN2EcMGFWlxqgZe8oYDeX4Qjdp5nLJn2UrUrEVL4jQQ7/bLNcbm6VO2xgOml8xjNU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wp79U-00Eqcw-Nc; Wed, 29 Jul 2026 18:29:04 +0200
Date: Wed, 29 Jul 2026 18:29:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	jun.ann.lai@intel.com, yi.fang.gan@intel.com,
	boon.khai.ng@altera.com, matthew.gerlach@altera.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/5] net: stmmac: Fix double VLAN 802.1ad tag handling
Message-ID: <d39c7b4c-04b4-4bfd-8a4b-821a8a32a885@lunn.ch>
References: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729095110.164157-1-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_092925_582660_B534E3C2 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, Jul 29, 2026 at 09:51:04AM +0000, Ovidiu Panait wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain an 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag.
> 
> This issue was observed on the Renesas RZ/V2H platform (which has a dwmac4
> IP), when testing QinQ ping:
> 
>   # DUT
>   ip link add link end0 name end0.100 type vlan proto 802.1ad id 100
>   ip link add link end0.100 name end0.100.200 type vlan proto 802.1q id 200
>   ip addr add 172.16.3.2/24 dev end0.100.200
>   ip link set end0 up
>   ip link set end0.100 up
>   ip link set end0.100.200 up
> 
>   # Peer
>   ip link add link eth0 name eth0.100 type vlan proto 802.1ad id 100
>   ip link add link eth0.100 name eth0.100.200 type vlan proto 802.1q id 200
>   ip addr add 172.16.3.1/24 dev eth0.100.200
>   ip link set eth0 up
>   ip link set eth0.100 up
>   ip link set eth0.100.200 up
>   ping 172.16.3.2
>     -- FAIL --

I stretch goal, if you are interested and have time. Can you turn this
into a test somewhere in tools/testing/selftests/net ? If one MAC
driver has it wrong, there are probably other MAC drivers which are
also wrong.

	Andrew

