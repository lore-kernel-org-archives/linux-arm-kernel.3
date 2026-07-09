Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 02:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiPeyVYQaEiVqx7WKQEaIVABISxwCwD67P0r37Z1zdw=; b=VpiF98T5/TmbkJAbNpukXXS5Fr
	XMN3YNofi5+A2UwsBXiEuwgbk/ivrmB7o4cRUtT9EpgoU7Tt01unhCeDP/Gu6QP4sLjtXGk1Csw3m
	SIshPZZD54bQJYPGlvEks9dyF5+Rorc9lq/vYiEV1romx/vQwqkSppSIEL9NPOl/AChiqucdZEQuO
	spCkcZJ234gxo923hzQo7MAocyyFJNPCbsD3k2UdhCbR5s206LR0BG2/IuznbYaBmOT3YwCWYaXb8
	auW/A4aUzip4wfw7iQc6qjqqj5+lrzWkbvZBLkSZ/ovbx5XDFF7HSHdajNJF/2OdUowQTPbIFnwEm
	qehvGBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheAc-00000000nZY-0SF2;
	Thu, 09 Jul 2026 02:07:22 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheAa-00000000nYp-0a0Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 02:07:21 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-81cfc429bc2so9725087b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 19:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783562839; x=1784167639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DiPeyVYQaEiVqx7WKQEaIVABISxwCwD67P0r37Z1zdw=;
        b=FZC6jaIWPR/HC3TBgXdMzhFT8Y776dWdq2WiBMm9xtK3iPNQBjF2EWXQMgFDbr2Tog
         2osViER/wz4muOPV7ZyldttUUxELrTwuhna2N6xslXow+ndBCqpRbDGDF8F3Kmf+nhQ8
         lkyZ+4dqpu24ad6/rIRQaQrlCDi7U6k1vr2luXqR0K+HJfijYG/taAPpnM+B2dCqu5t6
         ZWnrAEXL7JhCKcZCqVZKdPCefxGAB1Qo8FB6CgD3J64XL9iz/pAeungxQB9/8TptwppZ
         nM6ViedMm9MlL/iITYyu9CefsXSa+5oL61X+qchaY5u+NqpT+PQzrYPMUBWbhguPsFzR
         OWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783562839; x=1784167639;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiPeyVYQaEiVqx7WKQEaIVABISxwCwD67P0r37Z1zdw=;
        b=eiziAnd1FPAdInvtDvHfPPcmejSiLWCAD89DDF57/CCGyEDn8kT1oRx71yaUuwPSJ/
         P7v61bZKn4sKVYpLDK8UJzitXPhgofSAl5H1Te/xkyHQDIPvGJUG7j9N/tiE6f8rR2Dd
         Dy2XlGg2b+Whqv4BUpqPIw2ZoN/Ka88TjwYicFVb1TEasLoIg0EKmNsbRjL+D4fiIR2t
         tojN2sSrWvwUFy+o67kKjHFh/y2duqi3laX/SVgkZHoNagylAHApH+8Fy5b4hWv3rhPR
         4nLYnGM4+ng0SOsIe+hqNev/QkbZRqrLkzkqwzCQwvr6iujRqREf0FDtZ6UDBkjqzcoJ
         h9Lg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4P2kPL55wRIN7nwpy9l61L5sQ5BELlD08YpnNRqtDeV+VotlUSogU3oIKG+w+3UYuOhiZdsibRtAXuiylEy+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzkIPvDmUBfyolCguua+UwFQRp3Xkx+5QQwccH+nkv6D8oUdy49
	c42G64J0u4Utm6R9E67+IJuifHPyfQ6SCEhMfYFRFtJ0MFpWaNlGdvqH
X-Gm-Gg: AfdE7clANPrkLMSt54AQDRwCQ0R30seQNTHO6Jg2xRysloOJkBo9M0TBpG528LnDT39
	JTbpzJ5gMzOd4pBSoDFE67Dyx+lt2cQi6iZCYqDTV1I0lcx3i4FFLjWUVICm6HEuhwnKWnQCn+7
	8HlNawj/s/BdmmgbGG7VdhAIF7JuERGzjpBD939sj5a2DOb0f4PM0sQu+dbVvjzRaWO1onz4gXA
	r5lyATFCmayARoy5vihomiSjc5qhfzXNamFqRbOn2G0ouqraxVHACGm9U2EeGYNtHeEvolSJDol
	0FEMXODf4RzJaDMolpJUw8yHPj6Z1C+NG7Rf4vg3vYGSn6fbra/TUhagtOm+ZwbFt4weblapdHe
	eQKHKUwZFLAjt0Z+MFYdu4/jVgwGHaAKRASoktIEDs0RF91rvZFgpPTKjDFJG5uW9cwZXxx/zAf
	G1Vkb9KVLGt9RL/k4QNJ88kgcdyVSgFJ/gNO8U3NhpI7TZ8IUs4Y/YaAhn1L56KbaYBg==
X-Received: by 2002:a05:690c:4b90:b0:814:608a:acb4 with SMTP id 00721157ae682-81dbeb5f73emr38829227b3.27.1783562838726;
        Wed, 08 Jul 2026 19:07:18 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be904a4sm6869687b3.7.2026.07.08.19.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 19:07:18 -0700 (PDT)
Date: Wed, 08 Jul 2026 22:07:17 -0400
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
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org, 
 steffen.klassert@secunet.com, 
 lena.wang@mediatek.com, 
 shiming.cheng@mediatek.com
Message-ID: <willemdebruijn.kernel.2801a1401793d@gmail.com>
In-Reply-To: <20260709014704.3625-1-shiming.cheng@mediatek.com>
References: <20260709014704.3625-1-shiming.cheng@mediatek.com>
Subject: Re: [PATCH v7] net: gro: fix double aggregation of flush-marked skbs
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_190720_266247_75A23FE9 
X-CRM114-Status: GOOD (  14.98  )
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

Reminder to mark patches [PATCH net v7]

(or PATCH net-next when targeting that tree)

Shiming Cheng wrote:
> Commit 0ab03f353d36 ("net-gro: Fix GRO flush when receiving a GSO
> packet.") added a flush check to skb_gro_receive(), but
> skb_gro_receive_list() lacks the same validation.
> 
> As a result, packets marked with NAPI_GRO_CB(skb)->flush may still be
> re-aggregated.
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

Reviewed-by: Willem de Bruijn <willemb@google.com>

