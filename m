Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C32D29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8FG3iu4VXIYK2ixIxL6D4XbULtxT3YQRepQf0YaUAA=; b=oGGLyTLbJPwfIRzRRB4zINF2Wa
	ifCskSdmbjy1A0hun7OaFKxDCmA9yi+Vk3ZM5wneKnM29ek92keNFXxCeY+MoWO91OhfdQi82nMKZ
	VCL5UBRH23xt9xoSymuoAjh/A+4HWrkMUQnXfzUnqf/MRUimt78C196UoEH2pSuBe84QI0Sif/tyH
	MQu3dR8cgyBhiWZu9GL94boTJ00SE+Lc8jNqlb97NpK4Xnrc+RWOBK75Lu6uz3WFMGoUlN1z6xfdG
	EgiCZ4QZ6s+vlhcEIinxm6QqWJFdqIB5ghk+HuojkVB2S7Xk+8yXVbFyc/+G7tviiSj9Pn0lm6fJN
	EX8+ByCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtJY-00000002fBs-0XKl;
	Mon, 19 Jan 2026 17:45:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtJW-00000002fBi-0lfi;
	Mon, 19 Jan 2026 17:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D7CB60054;
	Mon, 19 Jan 2026 17:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907E0C116C6;
	Mon, 19 Jan 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768844716;
	bh=QZppzWwMaxmLDfvLc0EL4sJUn0FxeL+jQ+zzwKRWA+s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WB+bXX/2wcQQZczTXvNBPixTycuoTgDFwCzKDyue0qGjEdd9b8ONdUpO2GxVnn1fr
	 1O05KLhgXPr12NR2L3PqTQSRcOnr4OMi6MrkEkc1cxj60aeKmRFMoYK2qTZ1/h3yxS
	 goAmTmr7kPJhQzlPiGbnEZ7PbyM03xP1ai7o6m+m2Jpfj9PRNup+qlCNsAH5s2SNHj
	 CoorInrneQKQGQQm1K7A4uVbQaOBF+sEG5B3CGcmzTN6g/1Ktg3RoShBk2AKAKJ254
	 /lFdKrjjxKSQfYMEjXeS+DG9eqoQP0yixST+O8fgbr2j7PDkGqyZECXlq3cYS0ATpY
	 rC6W4TmQK42Zw==
Date: Mon, 19 Jan 2026 09:45:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna
 <sriharsha.basavapatna@broadcom.com>, Somnath Kotur
 <somnath.kotur@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon
 <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Bryan Whitehead
 <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Raju Rangoju <Raju.Rangoju@amd.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/9] net: benet: convert to use
 .get_rx_ring_count
Message-ID: <20260119094514.5b12a097@kernel.org>
In-Reply-To: <l66l2ijd45fkwniaesgau5jdzoxrdyt4t7tnsd6dpo4dlefytf@tugyhkn2th36>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
	<20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
	<20260117181551.0b139ca1@kernel.org>
	<ziyd3327jr7miqgv2e252w4wpizphomkvxxge6nbjwtg4pyvf4@gvwwi2r7rykl>
	<l66l2ijd45fkwniaesgau5jdzoxrdyt4t7tnsd6dpo4dlefytf@tugyhkn2th36>
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

On Mon, 19 Jan 2026 04:56:49 -0800 Breno Leitao wrote:
> > > I think we need to add this check to set_rxfh now. The error coming
> > > from get_rxnfc/GRXRINGS effectively shielded the driver from set_rxfh
> > > calls ever happening when there's only 1 ring. Now they will happen.  
> > 
> > You are absolutely correct. The ethtool core calls
> > get_rxnfc(ETHTOOL_GRXRINGS) _before_ allowing RSS configuration via
> > set_rxfh, and if it fails, ethtool_set_rxfh() will fail as well. And
> > with the current change, ethtool_set_rxfh() will not fail if the adapter
> > is not multi-queue.  
> 
> Upon further consideration, should we implement this limitation directly within
> the ethtool infrastructure?

That may cause some regressions, we're getting the number of currently
configured Rx rings. If we were to check how many Rx rings the device
has that'd make sense. But since we can only access currently
configured rings, in theory, if the device has multiple rings,
just only one is active now - changing config for the RSS key or
function should work just fine. IOW

 # change key
 # increase ring count to make they key meaningful

Used to work.

