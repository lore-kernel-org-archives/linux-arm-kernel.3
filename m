Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A449D132D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uE7/EEHJQMi0IC54XrajBkKpxP0fphrJFkkngDzHsLM=; b=hh2MYfrbJXt3nU4iS1qjzIVXDf
	f+CUsoHdT5l7dtF2+T6NC2rsIz/18PmMkuVYMK49ODiJspWVOmZdK4dBeQlvsoj2us764IBC9ZiYd
	xTvV2nH9DKZDcCDV8BT/qTLcjSzx0fyh7tgDviaFxHctFu3iHWoPZEQy2ewdkHKyetseiKlTrRnJ0
	uJ1ALFMKesrZFTUZVYyottBYAKaxAdUZ6m2dJPHLli1F5k8BwaLd2MfFo3QU53koENZmM1OBo85+f
	pj0tyzYSkaR4cMOaX67pv9YxoF0uV9EEUree/G4oRi61b7YZQy0AyWX3XTE5gsuL03XXsvaa+jPvY
	yPB4ENWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yT3-0000000E7m8-1uji;
	Mon, 04 Nov 2024 14:54:09 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y8n-0000000E3na-3NSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:33:15 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xhv8J72RNz9sSR;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWfhLmnpm9tF; Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xhv8J6736z9sSN;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B3EE88B770;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id X3XWHlYHgmaK; Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 811948B763;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Message-ID: <34c972b7-ba53-46ba-ada9-df741bc21e47@csgroup.eu>
Date: Mon, 4 Nov 2024 15:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] soc: fsl_qbman: use be16_to_cpu() in
 qm_sg_entry_get_off()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Radu Bulie <radu-andrei.bulie@nxp.com>,
 Sean Anderson <sean.anderson@linux.dev>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-2-vladimir.oltean@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241029164317.50182-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_063314_031371_0C5D38E2 
X-CRM114-Status: GOOD (  20.69  )
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
> struct qm_sg_entry :: offset is a 13-bit field, declared as __be16.
> 
> When using be32_to_cpu(), a wrong value will be calculated on little
> endian systems (Arm), because type promotion from 16-bit to 32-bit,
> which is done before the byte swap and always in the CPU native
> endianness, changes the value of the scatter/gather list entry offset in
> big-endian interpretation (adds two zero bytes in the LSB interpretation).
> The result of the byte swap is ANDed with GENMASK(12, 0), so the result
> is always zero, because only those bytes added by type promotion remain
> after the application of the bit mask.
> 
> The impact of the bug is that scatter/gather frames with a non-zero
> offset into the buffer are treated by the driver as if they had a zero
> offset. This is all in theory, because in practice, qm_sg_entry_get_off()
> has a single caller, where the bug is inconsequential, because at that
> call site the buffer offset will always be zero, as will be explained in
> the subsequent change.
> 
> Flagged by sparse:
> 
> warning: cast to restricted __be32
> warning: cast from restricted __be16
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   include/soc/fsl/qman.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
> index 0d3d6beb7fdb..7f7a4932d7f1 100644
> --- a/include/soc/fsl/qman.h
> +++ b/include/soc/fsl/qman.h
> @@ -242,7 +242,7 @@ static inline void qm_sg_entry_set_f(struct qm_sg_entry *sg, int len)
>   
>   static inline int qm_sg_entry_get_off(const struct qm_sg_entry *sg)
>   {
> -	return be32_to_cpu(sg->offset) & QM_SG_OFF_MASK;
> +	return be16_to_cpu(sg->offset) & QM_SG_OFF_MASK;
>   }
>   
>   /* "Frame Dequeue Response" */

