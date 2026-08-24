Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16326C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBIde6Y7JOCXOPgJcdPnOWn/cKDT3PrajChSHP+TKKI=; b=FP62r4nHCM4AtIRDaNYilqc9/X
	+jJVMyhIKr7138OUtAye4LgEATNUJKFOmovEq36YH+bKAIqjPl1csXzk08SzeqX43kBXE9K9AHN+q
	NuBOxZkXsQsYYFkD8U2LXpxqENjwddOFOCDG+1+BmuPhrE+zmQ5go8ktHcUxUGO0EHW+KS/6q/FlH
	5U9xev/Sj2+j9vHWddi4HqDPFEp5vve0p5L0g+iF4IJHplF8YoEzZU1GTtj8gcTlhCuYVCxDemaby
	EI6R8Z+Y9kt6IipvYiQYkvjaqGYQ1Q+J8TdtJ8qMK3E63OU/x2jReWcDFUXrUFjYhc3gxFCTskG6n
	G2YoBzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVa4-0000000GlhI-1eF1;
	Mon, 24 Aug 2026 14:23:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVa2-0000000Glgo-1Eyp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:23:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so18047215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787581396; x=1788186196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MBIde6Y7JOCXOPgJcdPnOWn/cKDT3PrajChSHP+TKKI=;
        b=n2NvbLeq/zQlS7SN48EKkXcQ7mWF5QYeBUFy2bN8qs3ahqBqY3dE6zT8k9O63pFR1w
         X9vZ3VZw6N4ndS6PXhWOylHeakupaybJ/6agiEq4XAizT3XT3ZG6sf2r3H6t7nydVbW/
         Qhiwfb3IOMlQUXSpzXm/GkS5QfIbAx//RJNAsjYjqSF+TM+91mZrSgmiThP8T1Spawsu
         3F1GwJwA1mQmJh0jrprlQM/L8p9BjBhGBZOE3It9wAW8w1jHzriVt0RtNKqiR8KQxoib
         +cprEgtTqsZLmJqnHBQFub0NTGahSVKnERMRqdi9+dXvxEqlDcf5M8BN3jXecyPF65go
         3wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581396; x=1788186196;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBIde6Y7JOCXOPgJcdPnOWn/cKDT3PrajChSHP+TKKI=;
        b=CR95Noxh5myqZv6+DdnzZk7zitnobET6MEy7+Dy+u9FRZyrVIe9DaKLWNbwOCi5YTd
         QL9Sc4mXLHMFZ5dZ2XKiBAXwwAD7Vm+IIJLcK5clldzTs2GpfWKulUcDQIl1OBeOhNiD
         aXXsf5k4lB/DxFbKU7XhdXo4dXTbBYdHfMJ3MyCZoF2lyKddv1+JPTecrewkynGLooPR
         dazvvCSSLjl88cpnR7NxeZOX75SGsSi20uVBHFLJGBBwn0SA8+B+K/tJDDd/zxELidLc
         L6zVZeE3OpB671hcDlREYaXnKo6LRbVbg8V8USdfKD6CnQGU09UlIuzLtV84YJ2TgooZ
         69OQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPk+TAJdD1gHlTMECUhUU7KtzAWCSsMlDCnHsv9EFvKAbccRj/Jq5/B0b1a+zAUTcOND/C7/umyVCmKqinhuAo@lists.infradead.org
X-Gm-Message-State: AFuF++kgKkKg7hAfu89BwRxY1zZwUPxnCMEmVvnIXM1+UglEi6G9Mwl4
	RQioCRBr1OD8gKLQBGUI3xPz3xgwbAgBMWfd1G8KI7aCAekPGj2gK5Ot
X-Gm-Gg: AR+sD12ao6EbtzxRhsgmGX3AIK/etsdOMtF3TDshyLIVaSanMuec/3ykgfxsVrDCpwH
	qFCsPq55cyVr5Ds5YSm27063/yl2W19gUkEMuwquVPRbogLPvjpSRXsZEYiDxaLmDrzqlbO9elY
	NhZTt4Y0FFMK6MQsZWlKt8HSSVZ1IqBbc8fccLbACJa2A+r2V5n5s2DZ0IU+zj/qojp3B9WKd8i
	zZAV/1cZtMziW/pAv+6kMFZbY9Avuewb58B0QlGFpKFOBBWw7liOktGb6bZRkjuGS7ArF9Z/MBw
	6w/dJ787ebWhmRSDBJTPgiKTdRLSgVbQbrhCGGvs7wxJwapc8iKIEyuiEbU/jdI5A6J83GN1pAJ
	dO+IDhIyAvrOowzbsIPzGOlI38sUfywufzwua2w/eZUPNFO/eiIMEbzm3PiBtm3zYz7IX6kGF+c
	T8bFqZeoj7GTJRGdGb8QTBxJMZDOv5tIWdKLXexQddFfbkY7KK1fUDKigWhAKPRJMqUQEXhr0Os
	VYTD/uALSlm8A0nD+f3iCqZ+cEOJuJYCFxM
X-Received: by 2002:a05:600c:46cb:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-499b82d2865mr316509465e9.3.1787581395952;
        Mon, 24 Aug 2026 07:23:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm63148625e9.2.2026.08.24.07.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:23:15 -0700 (PDT)
Date: Mon, 24 Aug 2026 15:23:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Pascal Kneuper <PKneuper@dspace.de>
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, 0x1207@gmail.com, si.yanteng@linux.dev,
 larysa.zaremba@intel.com, aleksander.lobakin@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 DBaldin@dspace.de
Subject: Re: [PATCH net v2] net: stmmac: restore NET_IP_ALIGN in the RX DMA
 offset
Message-ID: <20260824152312.3f6dd2b7@pumpkin>
In-Reply-To: <20260824125014.47862-1-PKneuper@dspace.de>
References: <20260813092923.284285-1-PKneuper@dspace.de>
	<20260824125014.47862-1-PKneuper@dspace.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072318_373997_2C84E006 
X-CRM114-Status: GOOD (  31.59  )
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

On Mon, 24 Aug 2026 14:50:14 +0200 (CEST)
Pascal Kneuper <PKneuper@dspace.de> wrote:

> Since the RX path was converted to zero-copy, the page pool page is handed
> to the stack directly as the skb head, and the offset the DMA engine writes
> at is what determines the alignment of the packet headers.
> 
> Before the conversion the payload was copied into an skb obtained from
> napi_alloc_skb(), which reserves NET_SKB_PAD + NET_IP_ALIGN. The
> conversion moved the headroom into stmmac_rx_offset() but did not carry
> over NET_IP_ALIGN, so on architectures where NET_IP_ALIGN is 2 the IP
> header now lands misaligned:
> 
>   64 (NET_SKB_PAD) + 14 (ethernet) + 20 (IP) = 98
> 
> Same for the XDP branch:
> 
>   256 (XDP_PACKET_HEADROOM) + 14 (ethernet) + 20 (IP) = 290
> 
> On ARM32 this is fatal, because ldm and ldrd trap on unaligned addresses
> even when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.

I suspect an alternative is mark the structure(s) as __packed
when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.
The compiler will then only use 'normal' memory instructions which
won't fault.
OTOH aligning the buffers is likely to be better.

David

> 
> Any received echo request panics the machine, e.g:
> 
>   Unhandled fault: alignment exception (0x001) at 0x81873062
>   Internal error: : 1 [#1] SMP ARM
>   Hardware name: Altera SOCFPGA Arria10
>   PC is at icmp_echo+0x38/0xa8
>   LR is at icmp_rcv+0x22c/0x370
>   Call trace:
>    icmp_echo from icmp_rcv+0x22c/0x370
>    icmp_rcv from ip_protocol_deliver_rcu+0x2c/0x224
>    ip_protocol_deliver_rcu from ip_local_deliver+0xc8/0x1a0
>    ip_local_deliver from ip_sublist_rcv_finish+0x3c/0x50
>    ip_sublist_rcv_finish from ip_list_rcv_finish+0x110/0x118
>    ip_list_rcv_finish from ip_list_rcv+0xc8/0xdc
>    ip_list_rcv from __netif_receive_skb_list_core+0x170/0x1c0
>    ...
>    napi_complete_done from stmmac_napi_poll_rx+0xcb0/0x1030
>   Code: e24dd068 e59020a0 e28dc010 e0822001 (e8920003)
>   Kernel panic - not syncing: Fatal exception in interrupt
> 
> The faulting instruction is the ldm of *icmp_hdr(skb) in icmp_echo().
> 
> Fix by adding NET_IP_ALIGN back to the RX offset, which restores the
> alignment the stack used to get.
> 
> Note that commit a955318fe67e ("stmmac: align RX buffers") made a similar
> change in 2021 and was reverted by commit 12d125b4574b ("stmmac: Revert
> "stmmac: align RX buffers"") because it caused packet corruption. That
> patch raised the offset from 0 without adjusting the buffer size
> accounting, so the DMA engine could arguably write past the end of the RX
> buffers, though this was never root caused.
> Commit df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX
> path") since derives the page pool allocation from stmmac_rx_offset(), so
> the extra bytes are accounted for.
> 
> Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
> Cc: Daniel Baldin <DBaldin@dspace.de>
> Assisted-by: GitHub-Copilot-CLI:claude-opus-5
> Signed-off-by: Pascal Kneuper <PKneuper@dspace.de>
> ---
> v2:
>  - also add NET_IP_ALIGN to the XDP branch, reproduced the same panic
>    with an XDP_PASS program attached (Jakub Kicinski)
>  - retitle accordingly, v1 was non-XDP only
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a71f0df263785..4d4b155d0d931 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1527,9 +1527,9 @@ static void stmmac_display_rings(struct stmmac_priv *priv,
>  static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
>  {
>  	if (stmmac_xdp_is_enabled(priv))
> -		return XDP_PACKET_HEADROOM;
> +		return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
>  
> -	return NET_SKB_PAD;
> +	return NET_SKB_PAD + NET_IP_ALIGN;
>  }
>  
>  static int stmmac_set_bfsize(int mtu)


