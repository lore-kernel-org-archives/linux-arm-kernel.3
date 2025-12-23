Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542B4E6F090
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnt9HsgJu0ejswucQziIfqB6VQPJ8jxDsIeAyekFBzs=; b=EZU4W7qvlnNgoK+KIlCBSUyoEG
	YCGjrnT0Tfx/4R24utjTh5ifx3jKeF600UY1lOgUgz3MU8F3NPRkaXIHEeCCX7DhTO1NKpck/r+BV
	7zkPk+08TOvC6hwdWohD0DBJ2YyGMhz9G5RKmTOezGLmoGsM9YDmWvYyZQPiXQBRUlG0TiEcA0soM
	8zxLsCUMzI1b1/179+9IDJYn56hjxYk4R/XQwDWDfIhqP/AiPirMjgAudK5eglE+mXeNriDiKrmHA
	nhZhFe0gaJmRFO5HL0lg2FZS9oR+2pE3UFcdlzaHdt969c4GBSY9VSg+IRydMIRZzcRvgp1QoQRng
	e4aJrVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY38O-0000000FaYw-0jdQ;
	Tue, 23 Dec 2025 14:13:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY38L-0000000FaY7-3zMY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766499184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tnt9HsgJu0ejswucQziIfqB6VQPJ8jxDsIeAyekFBzs=;
	b=iC155lAPbIaJvhFdQj7fTWN3fVW5+Jlclfae4pYbEKVf3C290HYtpJBDAIEKpXzgwK4RG7
	U3CFb4aUU27JFvszIavEzoY38oWIZO9an4L8Q4SX5mHVnL5nlQGffFVlR3E10sA6mOaf68
	3C8OkPrA/H+sRUWcxq0NCnG9V1cFJMo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-PByO3_EcMCqX8PTlgrvwHg-1; Tue, 23 Dec 2025 09:13:02 -0500
X-MC-Unique: PByO3_EcMCqX8PTlgrvwHg-1
X-Mimecast-MFC-AGG-ID: PByO3_EcMCqX8PTlgrvwHg_1766499182
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47a97b719ccso28837015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499181; x=1767103981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tnt9HsgJu0ejswucQziIfqB6VQPJ8jxDsIeAyekFBzs=;
        b=Qtlmfmp+9AFUJ27HiGUY7MkEUogXQlXL6xhPTCK1bH8GC7HXSi4D+F6ALDUMC8ANPt
         XlnK0BRSHrPq4dmJ+2Z+aQYPd7+452QnA49IL8HMI2jWW75ysenjMkL40fOzHd6hmA9e
         l1+8AX91i40ysOumpFW5R8yQo8tpvaKsJoLx187rzMCdJykh0CVpiuFBaP7+TRPqHmWz
         GzKBMuzk8ajXlwnQFP2oTe/NQDSZ8e79+A/oIZs7P5NpYLLXz8cawm7gp3fEGQPNytnl
         6WDgg7WSEJP7fM48XYedxUT5BhpTZU/bnJvBjN3SswizQ/+XDFketiDkkG0vFrcCf9An
         fZeg==
X-Forwarded-Encrypted: i=1; AJvYcCU8f0spu3NMRauzb6aBJAmeiXCVeOZjYiybV8joWNin1qA/SwgiUNpy0fj64iYWph/9uRTWQQlhoRxo+rUW//PF@lists.infradead.org
X-Gm-Message-State: AOJu0YycwO/Ss11a1RIqiVIoE51hTYDfBWncxJLVooUcsW6b3ayamu+H
	76B6j5UxIrBVPeul7mPunfzHmeEikzm7oHa3TX0AiWAeJScFEOBJduOwHOXSnf7XpCFI7M3wuYh
	gT7187jPYRj/xPXjZq9ifJT0HLHqDEJZUmEovvMFJXLGjfpACTvCSitceQ0LfTMx7tLsrNAGNVo
	3N
X-Gm-Gg: AY/fxX5squQ1Ic2ClVxUptWTfZYf2Xekz2MGgxL6vDLkcX03I+4896UL9IYQs3PEEl1
	PdwYge5jEW1vcKVFqeVqx75/37Omvmv5ozZ4gjrphxJFZkX/ceJzauXYv0Qf9ToLoK2TXw/8io2
	MKc2lPp108cpBExVREuxp+BPjtAjm3OxMIFmP+NgRvjL0C1oZLbz/J4HVumx0w0GaKkAFKPaPRv
	zGIpGV7Ht+xqKyKmmXdR6F5BJ7Z829anxhaiajnjkE8sjkTPTkjtquS6E8Qe6dwqxZq22fV/6wB
	pV+3IB7DQyLkKSCznWcwlJbqwplhnuu8bCByhkQp7j5TxrqI4bMAVmf6LGVw+1IPLQAmS5PbGOs
	lMiImxkYy8ZXR
X-Received: by 2002:a05:600c:a00b:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47d1957e4e0mr139227655e9.21.1766499181633;
        Tue, 23 Dec 2025 06:13:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd2F5z4wbLe3efZdpRSf3+bxZeFuR7kdHFUh/07zOmiOvBJ9uVUehgrpT1q45jZN+DWyz2Gg==
X-Received: by 2002:a05:600c:a00b:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-47d1957e4e0mr139227375e9.21.1766499181248;
        Tue, 23 Dec 2025 06:13:01 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d192e88f5sm238919555e9.0.2025.12.23.06.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:13:00 -0800 (PST)
Message-ID: <aab6c515-12e4-48ca-8220-c0797dae781f@redhat.com>
Date: Tue, 23 Dec 2025 15:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: fix segmentation of forwarding fraglist GRO
To: Jibin Zhang <jibin.zhang@mediatek.com>, Eric Dumazet
 <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: wsd_upstream@mediatek.com, shiming.cheng@mediatek.com,
 defa.li@mediatek.com
References: <20251217035548.8104-1-jibin.zhang@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251217035548.8104-1-jibin.zhang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SjcHE7ZAQHQNy3JgJ0fVa_ZZufb4hy5V8s9HNM081xc_1766499182
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_061306_129482_1F117D6B 
X-CRM114-Status: GOOD (  22.03  )
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

On 12/17/25 4:55 AM, Jibin Zhang wrote:
> This patch enhances GSO segment checks by verifying the presence
> of frag_list and protocol consistency, addressing low throughput
> issues on IPv4 servers when used as hotspots
> 
> Specifically, it fixes a bug in GSO segmentation when forwarding
> GRO packets with frag_list. The function skb_segment_list cannot
> correctly process GRO skbs converted by XLAT, because XLAT only
> converts the header of the head skb. As a result, skbs in the
> frag_list may remain unconverted, leading to protocol
> inconsistencies and reduced throughput.
> 
> To resolve this, the patch uses skb_segment to handle forwarded
> packets converted by XLAT, ensuring that all fragments are
> properly converted and segmented.
> 
> Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>

This looks like a fix, it should target the 'net' tree and include a
suitable Fixes tag.

> ---
>  net/ipv4/tcp_offload.c | 3 ++-
>  net/ipv4/udp_offload.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index fdda18b1abda..162a384a15bb 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -104,7 +104,8 @@ static struct sk_buff *tcp4_gso_segment(struct sk_buff *skb,
>  	if (!pskb_may_pull(skb, sizeof(struct tcphdr)))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) {
> +	if ((skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(skb) &&
> +	    (skb->protocol == skb_shinfo(skb)->frag_list->protocol)) {
>  		struct tcphdr *th = tcp_hdr(skb);
>  
>  		if (skb_pagelen(skb) - th->doff * 4 == skb_shinfo(skb)->gso_size)
> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index 19d0b5b09ffa..704fb32d10d7 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -512,7 +512,8 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
>  		return NULL;
>  	}
>  
> -	if (skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) {
> +	if ((skb_shinfo(gso_skb)->gso_type & SKB_GSO_FRAGLIST) && skb_has_frag_list(gso_skb) &&
> +	    (gso_skb->protocol == skb_shinfo(gso_skb)->frag_list->protocol)) {
>  		 /* Detect modified geometry and pass those to skb_segment. */
>  		if (skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size)
>  			return __udp_gso_segment_list(gso_skb, features, is_ipv6);

I guess checks should be needed for ipv6.

Also it looks like this skips the CSUM_PARTIAL preparation, and possibly
break csum offload.

Additionally I don't like the ever increasing stack of hacks needed to
let GSO_FRAGLIST operate in the most diverse setups, the simpler fix
would be disabling such aggregation.

/P


