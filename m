Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA943D132D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7J7SxbYNkFOeauNfPcJtMWdixZ4cGL9MkYuvNXSDBg=; b=Rb9bOJWcegfYVcEtwETZDbhJpj
	dH+TMgfcsdVkzSUhRRdr/JibmkqzaUqiXefTPhavcMWqIhBdW0KP/W+a7Gi5A1KASEHHFfnP3JOkF
	WGoPNQg+tg8ORGCToL63ObArLINdL1UqHpAaCJmq2PCXDTsKoZEfel53CxaH1PG7eVGaJpHBzh2cB
	12R1UPhPVMfsMt8ukJmVFwL46FNPGwZDhlDVeWoLLEaOU0V0fDkZzzZX8V4on8CgbrHmwqj0O0Tdi
	2GeZCwgdAahtVWrB3vPlzfpug0gj4ZPUZIcrQgR0w/6szkzwUPnBTaxd5IEb/RCPtpwslzPDUQsz4
	H81+5zwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yWO-0000000E8DH-1L8d;
	Mon, 04 Nov 2024 14:57:36 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yB3-0000000E4Jy-45nw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:35:35 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XhvC82mfbz9sSX;
	Mon,  4 Nov 2024 15:35:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ttptrm8rp-3y; Mon,  4 Nov 2024 15:35:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XhvC81z3Wz9sSV;
	Mon,  4 Nov 2024 15:35:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 312F18B773;
	Mon,  4 Nov 2024 15:35:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TRbO97QGNqR3; Mon,  4 Nov 2024 15:35:32 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E86488B763;
	Mon,  4 Nov 2024 15:35:31 +0100 (CET)
Message-ID: <71956f4c-4b08-4ade-a19e-7cda8677c326@csgroup.eu>
Date: Mon, 4 Nov 2024 15:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: dpaa_eth: extract hash using __be32
 pointer in rx_default_dqrr()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Radu Bulie <radu-andrei.bulie@nxp.com>,
 Sean Anderson <sean.anderson@linux.dev>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-4-vladimir.oltean@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241029164317.50182-4-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_063534_193930_7D71A61E 
X-CRM114-Status: GOOD (  14.38  )
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
> Sparse provides the following output:
> 
> warning: cast to restricted __be32
> 
> This is a harmless warning due to the fact that we dereference the hash
> stored in the FD using an incorrect type annotation. Suppress the
> warning by using the correct __be32 type instead of u32. No functional
> change.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> index e280013afa63..bf5baef5c3e0 100644
> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> @@ -2772,7 +2772,7 @@ static enum qman_cb_dqrr_result rx_default_dqrr(struct qman_portal *portal,
>   	if (net_dev->features & NETIF_F_RXHASH && priv->keygen_in_use &&
>   	    !fman_port_get_hash_result_offset(priv->mac_dev->port[RX],
>   					      &hash_offset)) {
> -		hash = be32_to_cpu(*(u32 *)(vaddr + hash_offset));
> +		hash = be32_to_cpu(*(__be32 *)(vaddr + hash_offset));
>   		hash_valid = true;
>   	}
>   

