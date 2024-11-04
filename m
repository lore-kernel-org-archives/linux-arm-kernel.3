Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED83ED132D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpyT7tE07BjOP0Fir/BNsKyQ5l4rDLa/KXv/XcsxY98=; b=0vfEJAmCYTnwtzvv5LvOoQeMYV
	IRlJ2qE0kHxde4X4cfWDf5njeUHPYp5sKvbRa+1zPnqd4rjyv1SXkRP6ouD9ZORM/e2VHY1pb1K4q
	ntf6pyNV2TiRiTzdRUIZruWr+2XioTxPjL77dVbi5CxmSuZTTP1pbpO23gqMlcSIVjsaoDWm1/GzE
	KDQTCaMUHldnGT4kS/Xd2L099FFnOd9EjPTW+dYAqBkKgNc1B7ARJUc2RYhLPukKUyQDvN/2MPhZt
	WD99Sv8wOgNtY/gODnOgu+6vzUmohWCj3wuRCpgu6vA+HyvPN16GJyFhXtMeZzG6YpnagQof5lRiB
	co9bguSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yUj-0000000E7yz-26IM;
	Mon, 04 Nov 2024 14:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yA5-0000000E3xQ-2BaE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 14:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zpyT7tE07BjOP0Fir/BNsKyQ5l4rDLa/KXv/XcsxY98=; b=IxSQw1X8dYEU2Ph34zjict46Ov
	bFJDq/LyrjIbt4IiznSv7wTa5kDZYCz7VTthREQy1fv8iyY2sbZWIhzQwOF3DebTg/LqgzyI98GCh
	huAlui/USZODrv5RE2NdT40Y0xvtqw6G+zsibA4/ADs3kKVSrAzm5GDuZXOUcZ7h4C9VDeJkbA7z0
	M8Sr0eaC2jsvI5dQj1394N0ofLnOW8NYaReTLObvmm4QtTDw3Axbl8CbUkKlG067yrbtu8PFgeIRS
	lickbrJGai2bACHKKcUDr0XfixUT3guv8UFclK3V49uYDPkUG9BY6EZSZ16aZvDZvdCASfhQYrT0f
	5XjBoVrQ==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yA1-0000000BM6J-2vl3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:34:32 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xhv9v0sCKz9sST;
	Mon,  4 Nov 2024 15:34:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RH5f9tRQBcV2; Mon,  4 Nov 2024 15:34:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xhv9t6hz1z9sSS;
	Mon,  4 Nov 2024 15:34:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD0A68B770;
	Mon,  4 Nov 2024 15:34:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vJlu8CVG94Eu; Mon,  4 Nov 2024 15:34:26 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DAC98B763;
	Mon,  4 Nov 2024 15:34:26 +0100 (CET)
Message-ID: <81fa5067-88d3-4693-9e42-7072b5430ac8@csgroup.eu>
Date: Mon, 4 Nov 2024 15:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: dpaa_eth: add assertions about SGT
 entry offsets in sg_fd_to_skb()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Radu Bulie <radu-andrei.bulie@nxp.com>,
 Sean Anderson <sean.anderson@linux.dev>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-3-vladimir.oltean@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241029164317.50182-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_143430_007201_797DCCD1 
X-CRM114-Status: GOOD (  36.25  )
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



Le 29/10/2024 à 17:43, Vladimir Oltean a écrit :
> Multi-buffer frame descriptors (FDs) point to a buffer holding a
> scatter/gather table (SGT), which is a finite array of fixed-size
> entries, the last of which has qm_sg_entry_is_final(&sgt[i]) == true.
> 
> Each SGT entry points to a buffer holding pieces of the frame.
> DPAARM.pdf explains in the figure called "Internal and External Margins,
> Scatter/Gather Frame Format" that the SGT table is located within its
> buffer at the same offset as the frame data start is located within the
> first packet buffer.
> 
>                                   +------------------------+
>      Scatter/Gather Buffer        |        First Buffer    |   Last Buffer
>        ^ +------------+ ^       +-|---->^ +------------+   +->+------------+
>        | |            | | ICEOF | |     | |            |      |////////////|
>        | +------------+ v       | |     | |            |      |////////////|
>   BSM  | |/ part of //|         | |BSM  | |            |      |////////////|
>        | |/ Internal /|         | |     | |            |      |////////////|
>        | |/ Context //|         | |     | |            |      |// Frame ///|
>        | +------------+         | |     | |            | ...  |/ content //|
>        | |            |         | |     | |            |      |////////////|
>        | |            |         | |     | |            |      |////////////|
>        v +------------+         | |     v +------------+      |////////////|
>          | Scatter/ //| sgt[0]--+ |       |// Frame ///|      |////////////|
>          | Gather List| ...       |       |/ content //|      +------------+ ^
>          |////////////| sgt[N]----+       |////////////|      |            | | BEM
>          |////////////|                   |////////////|      |            | |
>          +------------+                   +------------+      +------------+ v
> 
> BSM = Buffer Start Margin, BEM = Buffer End Margin, both are configured
> by dpaa_eth_init_rx_port() for the RX FMan port relevant here.
> 
> sg_fd_to_skb() runs in the calling context of rx_default_dqrr() -
> the NAPI receive callback - which only expects to receive contiguous
> (qm_fd_contig) or scatter/gather (qm_fd_sg) frame descriptors.
> Everything else is irrelevant codewise.
> 
> The processing done by sg_fd_to_skb() is weird because it does not
> conform to the expectations laid out by the aforementioned figure.
> Namely, it parses the OFFSET field only for SGT entries with i != 0
> (codewise, skb != NULL). In those cases, OFFSET should always be 0.
> Also, it does not parse the OFFSET field for the sgt[0] case, the only
> case where the buffer offset is meaningful in this context. There, it
> uses the fd_off, aka the offset to the Scatter/Gather List in the
> Scatter/Gather Buffer from the figure. By equivalence, they should both
> be equal to the BSM (in turn, equal to priv->rx_headroom).
> 
> This can actually be explained due to the bug which we had in
> qm_sg_entry_get_off() until the previous change:
> 
> - qm_sg_entry_get_off() did not actually _work_ for sgt[0]. It returned
>    zero even with a non-zero offset, so fd_off had to be used as a fill-in.
> 
> - qm_sg_entry_get_off() always returned zero for sgt[i>0], and that
>    resulted in no user-visible bug, because the buffer offset _was
>    supposed_ to be zero for those buffers. So remove it from calculations.
> 
> Add assertions about the OFFSET field in both cases (first or subsequent
> SGT entries) to make it absolutely obvious when something is not well
> handled.
> 
> Similar logic can be seen in the driver for the architecturally similar
> DPAA2, where dpaa2_eth_build_frag_skb() calls dpaa2_sg_get_offset() only
> for i == 0. For the rest, there is even a comment stating the same thing:
> 
> 	 * Data in subsequent SG entries is stored from the
> 	 * beginning of the buffer, so we don't need to add the
> 	 * sg_offset.
> 
> Tested on LS1046A.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>


Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 24 ++++++++++++-------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> index ac06b01fe934..e280013afa63 100644
> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> @@ -1820,7 +1820,6 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
>   	struct page *page, *head_page;
>   	struct dpaa_bp *dpaa_bp;
>   	void *vaddr, *sg_vaddr;
> -	int frag_off, frag_len;
>   	struct sk_buff *skb;
>   	dma_addr_t sg_addr;
>   	int page_offset;
> @@ -1863,6 +1862,11 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
>   			 * on Tx, if extra headers are added.
>   			 */
>   			WARN_ON(fd_off != priv->rx_headroom);
> +			/* The offset to data start within the buffer holding
> +			 * the SGT should always be equal to the offset to data
> +			 * start within the first buffer holding the frame.
> +			 */
> +			WARN_ON_ONCE(fd_off != qm_sg_entry_get_off(&sgt[i]));
>   			skb_reserve(skb, fd_off);
>   			skb_put(skb, qm_sg_entry_get_len(&sgt[i]));
>   		} else {
> @@ -1876,21 +1880,23 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
>   			page = virt_to_page(sg_vaddr);
>   			head_page = virt_to_head_page(sg_vaddr);
>   
> -			/* Compute offset in (possibly tail) page */
> +			/* Compute offset of sg_vaddr in (possibly tail) page */
>   			page_offset = ((unsigned long)sg_vaddr &
>   					(PAGE_SIZE - 1)) +
>   				(page_address(page) - page_address(head_page));
> -			/* page_offset only refers to the beginning of sgt[i];
> -			 * but the buffer itself may have an internal offset.
> +
> +			/* Non-initial SGT entries should not have a buffer
> +			 * offset.
>   			 */
> -			frag_off = qm_sg_entry_get_off(&sgt[i]) + page_offset;
> -			frag_len = qm_sg_entry_get_len(&sgt[i]);
> +			WARN_ON_ONCE(qm_sg_entry_get_off(&sgt[i]));
> +
>   			/* skb_add_rx_frag() does no checking on the page; if
>   			 * we pass it a tail page, we'll end up with
> -			 * bad page accounting and eventually with segafults.
> +			 * bad page accounting and eventually with segfaults.
>   			 */
> -			skb_add_rx_frag(skb, i - 1, head_page, frag_off,
> -					frag_len, dpaa_bp->size);
> +			skb_add_rx_frag(skb, i - 1, head_page, page_offset,
> +					qm_sg_entry_get_len(&sgt[i]),
> +					dpaa_bp->size);
>   		}
>   
>   		/* Update the pool count for the current {cpu x bpool} */

