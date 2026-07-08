Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6814C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYx5u+5FGWCJdyvt6JytRXDJ/jVT6gVVxpgW5mLqOwE=; b=WeQorhG93yjKcZOb3MfsNsJIvt
	8mg4K0w9fwxx9uNzgavkf/JOCT83qvgXEt9VR0llDwnaYBnAM026VldUzTIWqKNsWcIn1IRfvAL7e
	f7Zi7ZWu5xRZOkzGNKoquwJaZQ0p7PkXMj3lS1jYED+UTgbnV7pNmFRcWBQdYwfG7fgGi4tC2CrxQ
	s9NEEGp35o7S6NbLi7/Mv6LtD2/BXWqSIXC/treUaiAbY+8tKoslUajKvZVQgUlsnblfcZl+FhUjT
	x3RrMKbOAOwaRfEaV6hPnU3iIeI7WsutnOTD0S+eBmDeopbbpRIWgLzoBFWhDTBa5j26w/BghicXp
	Fae0mJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYhO-00000000L6d-3nnk;
	Wed, 08 Jul 2026 20:16:50 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYhN-00000000L6D-0Q8m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:16:50 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260708201647euoutp013789856a932eb68c5b979f5fd97978f1~AadMFllia0324803248euoutp01W
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Jul 2026 20:16:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260708201647euoutp013789856a932eb68c5b979f5fd97978f1~AadMFllia0324803248euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783541807;
	bh=RYx5u+5FGWCJdyvt6JytRXDJ/jVT6gVVxpgW5mLqOwE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uXNcoISCsD7Metr8ZkJ1mZrZ0T1+I81OIj5dF7xW5GCScFcnJuPA3pY34RFG8NXFv
	 ThYeAHT5X5Fpq4YBNTebOyA1WHeOZG+W3TGjgpTNToX4HsKgV3zFGBtIfJpcbNRJ4n
	 2MPZ0U7Vj2uPVH1h75Z9KQ1hm1h4Yj8vixQcvhos=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260708201646eucas1p1dff8fa3d9a443180852126f72f1cb3a1~AadLmuqnh2208022080eucas1p1H;
	Wed,  8 Jul 2026 20:16:46 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260708201645eusmtip15a406be522cc4e7c4578748b4c2e0a3f~AadKo4mXv0367403674eusmtip1M;
	Wed,  8 Jul 2026 20:16:45 +0000 (GMT)
Date: Wed, 8 Jul 2026 22:16:45 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko
	AI <sashiko-bot@kernel.org>
Subject: Re: [PATCH net 2/2] net/stmmac: Prevent dma queue NULL free on
 allocation failure
Message-ID: <ak6wLcK1xCXZf4mS@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260707174115.1264466-3-j.raczynski@samsung.com>
X-CMS-MailID: 20260708201646eucas1p1dff8fa3d9a443180852126f72f1cb3a1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad66_"
X-RootMTR: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
X-EPHeader: CA
X-CMS-RootMailID: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
References: <20260707174115.1264466-1-j.raczynski@samsung.com>
	<CGME20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276@eucas1p2.samsung.com>
	<20260707174115.1264466-3-j.raczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_131649_290258_0B637A99 
X-CRM114-Status: GOOD (  15.93  )
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

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad66_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 07:41:15PM +0200, Jakub Raczynski wrote:
> During allocation of RX/TX descriptor resources and its DMA,
> there is verification of failed dma_alloc_coherent() due to lack of memory.
> In case of that failure, all allocated resources are freed instantly after,
> but there are no checks for dma_free_coherent() whether previous step has
> failed.
> This will generally result in panic due to freeing NULL address.
> 
> Fix it by adding NULL verification of memory that is to be freed.
> 
> Theoretically code should also set address of pointed memory to zero when
> freeing, but currently the only path of invalid address is non intialized zero,
> and there is no case possible of double-free of same memory.
> 
> Fixes: e73b19baa3b1c ("net: stmmac: simplify DMA descriptor allocation/init/freeing")
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> ---

Sashiko AI gave review that has valid point, patch needs changes.
Please drop it.

--
pw-bot: cr

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad66_
Content-Type: text/plain; charset="utf-8"


------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad66_--

