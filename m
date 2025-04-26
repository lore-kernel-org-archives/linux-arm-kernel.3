Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CAAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 02:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwE+FP6VudviHR4DD+imSE1cBd1GwbqzddecLUlb4/o=; b=LPgLzkk/Fypfa31QdlNeRpfchQ
	bQJk+0Mm6JCgpRBfU4oNlKfsYTnRQWOwHwM4bpTHA0lggNcnrxJrRtkHXTRj7dY9TcsIloxSyMVZ2
	ym/B82AQFE8+/OuMPaXytGP7c94iaa+vFqq1ZwPKPJAt/xCTB+5Sv6sUf5IOQ6hd1fpOh/T6ljI24
	AUbj6rnD7gr94dYccAUhGWV6NxOfEzXbbQPgRyDWogr/MVmPRNv/2nqhbgqniy5B1xGa87C4IR9Zu
	Ip+oBKZrDnzIrBjkOUaI6Q8Sy43f67fF7Va/9dbV9NTRrj5rVmdU42N/Dcf92pNT3BnBqwOZk23XJ
	cBr6HZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8V4S-00000001IpC-34zr;
	Sat, 26 Apr 2025 02:15:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8V2b-00000001IfS-3VwR;
	Sat, 26 Apr 2025 02:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F72861127;
	Sat, 26 Apr 2025 02:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1667AC4CEE4;
	Sat, 26 Apr 2025 02:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745633594;
	bh=CZWHyrSRI9rXVWjIfZhJMz/8qMBovApYmofIr02qYqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ihFHd1dpkRKkjIbze4T1hv+T18Nf9KFeghaGyUMZCpU7f7WKRL6++Fig2DqIke+bG
	 LujSGPHQiWXmVCH3ySideOWtYonDKfE7bfckOZPVoKofWqZizYhpKDxPimyXDSO986
	 ACyfYdbA2LoD2qiLEp2AEGse5ZNuT2ozeCrpBB7F7idY7PLeRX11aAcQtBC/9vucuS
	 kWQqJpTCDBzvleYUdng9gDyEYqHhno8BXg6erh3y+qS0XGOsxvzUR2t5jQ4vcJ90yX
	 QnpeEqBY/CkdgFgkTR8op9wItIWHU+9sfsjAMulC8MRmTbxLY1SexJi020RkHjPWMC
	 iqU08BtkrtplA==
Date: Fri, 25 Apr 2025 19:13:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Felix Fietkau
 <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, kernel@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 2/2] net: ethernet: mtk-star-emac: rearm
 interrupts in rx_poll only when advised
Message-ID: <20250425191313.3692348b@kernel.org>
In-Reply-To: <20250424111623.706c1acc@device-40.home>
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
	<20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
	<20250424111623.706c1acc@device-40.home>
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

On Thu, 24 Apr 2025 11:16:23 +0200 Maxime Chevallier wrote:
> > In mtk_star_rx_poll function, on event processing completion, the
> > mtk_star_emac driver calls napi_complete_done but ignores its return
> > code and enable RX DMA interrupts inconditionally. This return code
> > gives the info if a device should avoid rearming its interrupts or not,
> > so fix this behaviour by taking it into account.
> > 
> > Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> > Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>  
> 
> I'm unsure wether this counts as a bugfix, as no bug was
> seen, and there are quite a few divers that already ignore the return
> from napi_complete_done().
> 
> I don't think the patch is wrong, but maybe it should be sent to
> net-next :/

Agreed, probably the only case where it would matter would be busy
polling. But it's trivial and looks correct, so probably not worth 
the respin

