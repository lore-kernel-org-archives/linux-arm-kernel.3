Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29905C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 03:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDsYQPlp8x+KuXL1MS66/sNiI7gtxO3dlkQIougjdos=; b=VIfaHeMVuk6OgqlRJZuMb+7wG0
	hMAOTOUn/dy1XEbRAdQNsEVPYWAYbV7iuvD9je0JUfWOi4piIXj3XL/OL5RuuFdnlEY37JADD3U+p
	A94r08vr46Dx5J1GuNF/fDkNzmPE94IfGXRHAxUA2cXO+Mo5SHi56Q6VyQQOkahpNljdFr3SrIYBG
	rgvMa6CufLdgMStJs8s/7xfZ7OKy26R0rQrIHocY6nuap2guc+0ehPEyECFEAOWyKVhq8cuzNM4WJ
	UmfYMT1FN9dmwPqtK2x8FhVolI61r+01q/JQXMX3Yk1b9ZZck1vgwaVZ1W9LAN+dSgs+6MrsPQxZA
	G1GIXSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRwI-00000003xWI-3WS3;
	Tue, 01 Jul 2025 03:45:46 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRtx-00000003xHA-0kPG;
	Tue, 01 Jul 2025 03:43:22 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWRtf-000000008Tg-49Ij;
	Tue, 01 Jul 2025 03:43:04 +0000
Date: Tue, 1 Jul 2025 04:42:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
Message-ID: <aGNZP5JFXzFcBVla@makrotopia.org>
References: <cover.1751319620.git.daniel@makrotopia.org>
 <ec99dca250c0805a2307b0aaa9cf30b29ee2a989.1751319620.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec99dca250c0805a2307b0aaa9cf30b29ee2a989.1751319620.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_204321_478594_1C66EACA 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Jun 30, 2025 at 10:47:02PM +0100, Daniel Golle wrote:
> Use a dedicated "mmio-sram" and the genpool allocator instead of
> open-coding SRAM allocation for DMA rings.
> Keep support for legacy device trees but notify the user via a
> warning to update.
> 
> Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: fix resource leak on error in mtk_probe()
> v2: fix return type of mtk_dma_ring_alloc() in case of error
> 
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 117 +++++++++++++-------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   4 +-
>  2 files changed, 83 insertions(+), 38 deletions(-)
> 

I just noticed I forgot to 'git add' the Kconfig change adding 'select
GENERIC_ALLOCATOR' for NET_MEDIATEK_SOC... I will include that in v4 and
also add a patch dropping the open coded static partitioning of the SRAM
in favor of always using the gen_pool allocator even with legacy device
trees.

Meanwhile I would still be thankful to see this patch reviewed as apart
from the Kconfig addition it won't change.

