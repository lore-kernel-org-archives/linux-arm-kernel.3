Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C9BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pJcWvIhqLuJxPO4aE4cyY/xCREGxJtBF+FRAD54hro=; b=e+oZ6W6eyquayj9HtgsQfcDjwg
	zFaSaHP8ZyC4Cjj/77w1s0uyDRITCOvAH+2inBM5zic4ysTkV6ottvwxjeBVey/q6upOZ9IJ/7PJ2
	U8h0Hdyyou1TQHSYV04eA9quAE7Q4E75QlSE32QziiM3YV+6LR6U2a1n9CmawZyWeidfYmQqoxxwj
	J8q47DaOrQMM5PQ9K3rmWjrIVqyrZ9iCev5ZAmbKnM8O3MvatZ/OyT8goavIC/Ptw9L2lyIWWXoOt
	/hqNNnlztrAe05ahvCkBszOcun9RZDplFAb86H5dzaB/02edlYBzBEZzzf7cnce603snxg6Q3pIyp
	vLpNQwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmJY-0000000D5Hi-3fV8;
	Mon, 06 Jul 2026 16:37:00 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmJS-0000000D5DS-1gdu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:36:58 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8143d904b01so34534697b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783355813; x=1783960613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0pJcWvIhqLuJxPO4aE4cyY/xCREGxJtBF+FRAD54hro=;
        b=gOHEMhveuBDidlQ5lx3daP3HcGAG4JE1zpPTwKB8rqcy7T+Ikya/b5kZXBYfkQUE+8
         ZIDaGrvF6l1E1b+F8NKoyzb7Z/0va4ga8AWniVT69rjt0rAzVCpOVkDfCldk7rOVby1N
         tqEFSeukPxdg1hWySubrk9qG/ek1nThpHIGpzaaR0puHgpJ/U3NCe3yuT6/qVJgcamiB
         jCbn4njFsv8J4/BINtCS3okeIREDVYFtVwMaF8LvHCiGKR+ij9keLh058XDcq1aipqFp
         XpO1C6Rf1uPb1w0zcY+bToyYOfFh8DKomFwiWs78D8+7PNeM9hVztkSOfhauzObSch1H
         urLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355813; x=1783960613;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pJcWvIhqLuJxPO4aE4cyY/xCREGxJtBF+FRAD54hro=;
        b=eAejK7PUqAZry+/NZEQtVzVFCTg0iYrg/EYAQJrB/NT8ZYy0lfApXtWj6La4tCI6Ck
         4pTMKkiUeKlMisw2r463lXHwBOWfWBpXPPz7CjICpP0M0WLfUHHAxtlxxeaxun8GwpwR
         Y0zW3nKqKFLZMC2qgg2tViCE98C4roq6Zu7HVo0rbAyWhgr89tY796sadBiK/TNPFJfS
         sSsoiX3Z6xH6FUqFnsoDLiZZDmojGbvawhlVsTq45J5TAhxjB7tE1uCDStFiR8SaWMYv
         MiXKUn8MZe0eDR2ZwIAiZMfbkM+iPwB93SHck89vUO0YuSbEcOU2VOZcftEXSCuZ2s96
         VL0g==
X-Forwarded-Encrypted: i=1; AHgh+RoDybw4pqMmla9duHGdg9TqsxjtokEwo+zVWOJ1aVuYIQmK0l3ClvcP60iM6h1ND9vn86DbnR6vIO4Wk+K1F9G9@lists.infradead.org
X-Gm-Message-State: AOJu0YwcdXOG16Ac5aRZA8w3GEXqzZ5SuNwDwHqDMpy4BR+RQUfiqYmr
	wcWAWh3fOaqPM4uNuAFMW884ob8Sv8ksuEdgzjlFuIyA6PvP8a5kGFqj
X-Gm-Gg: AfdE7cnb9XEal9sPi2Vf8cSSRWq2NI/5xBJ4KWyLhnMkdET/vw3PcyDTFWpM5BvEwcT
	glyRqmOfXKJ3r4m/T6yALRPt/rCDHMn5s+t75wOuudgkcUEFYOAx6WqPJCVePaSfAPBcTnmZn1Q
	6csnZEitb0tCESSeYnBKnCS88d23ttaYmC1hTMCMBx7f0hmK01vDp0KQAlFBqSd4AZCl44ns2nu
	QQJs2UmRCR5gCVx/HlK43sgvdEQ3GJpWw9RE8LUbVAnoQGO8AogqvLazh15UGHi2ZseVcHPZofq
	BwqqYAlTTuZlZ50W4SsJKzRFHncCVlNeLpn0E7wO0cqVRJQs9Fcp6AiJnZmGNKcDj3C465yTT8D
	OT7E2ySBwi4a4PYufAiabj43Frk7fBfLtLxh4+OIuHoAL1Wl4pRGra4HxrGPvywYjYoWprWjLmB
	4/ws2zNSa5TVjDmMQIfp8VkzcpFt80/Dg4dUWkxjHe3bHzVss64AeG5t8Tg1JpNr0WXw==
X-Received: by 2002:a05:690c:ed6:b0:80c:85e5:8750 with SMTP id 00721157ae682-81be33a3727mr8097857b3.57.1783355812853;
        Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144bd26ebfsm59805817b3.48.2026.07.06.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
Date: Mon, 06 Jul 2026 12:36:51 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Shiming Cheng <shiming.cheng@mediatek.com>, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 willemb@google.com, 
 daniel.zahka@gmail.com, 
 alice@isovalent.com, 
 sd@queasysnail.net, 
 eilaimemedsnaimel@gmail.com, 
 imv4bel@gmail.com, 
 nbd@nbd.name, 
 dsahern@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 steffen.klassert@secunet.com
Cc: stable@vger.kernel.org, 
 lena.wang@mediatek.com, 
 shiming.cheng@mediatek.com
Message-ID: <willemdebruijn.kernel.27b4940999026@gmail.com>
In-Reply-To: <20260706034611.360-1-shiming.cheng@mediatek.com>
References: <20260706034611.360-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH v5] net: gro: fix double aggregation of flush-marked skbs
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_093654_452939_78E393BE 
X-CRM114-Status: GOOD (  24.12  )
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

[PATCH net v5]

Shiming Cheng wrote:
> The skb_gro_receive_list() function is missing a critical safety check
> that exists in the skb_gro_receive() implementation. Specifically, it
> does not validate NAPI_GRO_CB(skb)->flush before allowing packet
> aggregation

In v3 I requested referring to the commit that fixed this in
skb_gro_receive: commit 0ab03f353d36 ("net-gro: Fix GRO flush when
receiving a GSO packet."). That explains the issue well.
> 
> This allows already-GRO'd packets with existing frag_list to be
> re-aggregated into a new GRO session, corrupting the frag_list chain
> structure. When skb_segment() attempts to unpack these malformed packets,
> it encounters invalid state and triggers a kernel panic.
> 
> Scenario (Tethering/Device forwarding):
>   1. Driver: Generated aggregated packet P1 via LRO with frag_list
>   2. Dev A: Receives aggregated fraglist packet and flush flag set
>   3. Dev A: Re-enters GRO, skb_gro_receive_list() is called
>   4. Missing flush check allows re-aggregation despite flush flag
>   5. Frag_list chain becomes corrupted (loops or dangling refs)
>   6. Dev B: TX path calls skb_segment(), crashes on corrupted frag_list
> 
> Root cause in skb_segment():
>   The check at line ~4891:
>     if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
>         (skb_headlen(list_skb) == len || sg)) {
> 
>   When frag_list is corrupted by double aggregation, when list_skb is
>   a NULL pointer from skb->next, skb_headlen(list_skb) dereference
>   NULL/corrupted pointers occurs.
> 
> Call Trace:
>  skb_headlen(NULL skb)
>  skb_segment
>  tcp_gso_segment
>  tcp4_gso_segment
>  inet_gso_segment
>  skb_mac_gso_segment
>  __skb_gso_segment
>  skb_gso_segment
>  validate_xmit_skb
>  validate_xmit_skb_list
>  sch_direct_xmit
>  qdisc_restart
>  __qdisc_run
>  qdisc_run
>  net_tx_action
> 
> Fix: Add NAPI_GRO_CB(skb)->flush validation to the early-return check in
> skb_gro_receive_list(), matching the defensive programming pattern of
> skb_gro_receive().
> 
> Fixes: 3a1296a38d0c ("net: Support GRO/GSO fraglist chaining.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shiming Cheng <shiming.cheng@mediatek.com>
> ---
>  net/core/gro.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/gro.c b/net/core/gro.c
> index 35f2f708f010..b1573d98f3a5 100644
> --- a/net/core/gro.c
> +++ b/net/core/gro.c
> @@ -229,7 +229,14 @@ int skb_gro_receive(struct sk_buff *p, struct sk_buff *skb)
>  
>  int skb_gro_receive_list(struct sk_buff *p, struct sk_buff *skb)
>  {
> -	if (unlikely(p->len + skb->len >= 65536))
> +	/*
> +	 * Packets marked with NAPI_GRO_CB(skb)->flush have already gone
> +	 * through GRO/LRO processing and must not be aggregated again.
> +	 * Re-entering frag_list GRO may corrupt the frag_list chain and
> +	 * later crash during GSO segmentaiont.
> +	 */

Such a verbose comment is not needed. Code would be overwhelmed by
comments if done everywhere.

> +	if (unlikely(p->len + skb->len >= 65536 ||
> +		     NAPI_GRO_CB(skb)->flush))
>  		return -E2BIG;
>  
>  	if (!pskb_may_pull(skb, skb_gro_offset(skb))) {
> -- 
> 2.45.2
> 



