Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38130E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHxjC6h0Kfucr4tH2PqzFsx9yRATfufXfuxgz/uTgy0=; b=u4BktzMd4tlaL1g+/NGi6MyWuv
	3UgUaJsAOrYI9vogueVWPMHajrcSRxNBxTXZcbKN/eSkB91swxAtkBYGedJ5VXSkbuXwWmheIneHX
	pQdRvVA5WFoMpa9BpjubDjRryBsmfG6uc66ATlYBdHJlpyje7WOFg+/JVE6y376l3tWLnO9+fLidV
	Mi/A9Dx9WtWVSvbB/hG7+UufPXXciscRuzxieAxy9mpNazNF09Wsxrw6TQClW1vS26Jn7wZYu7Ik8
	IBGCyhP+xV3aqOtrPFFZmHEzvkBLxoGC5VE6PTLEGNytYnrVSDdjJGDSsI6+HQ2pqaAYJiqQubg2Z
	aL5o03oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV61Z-000000049Rx-2Feu;
	Tue, 07 Jan 2025 09:37:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5xu-000000048X9-16Bt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:33:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaeec07b705so1749652466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1736242412; x=1736847212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHxjC6h0Kfucr4tH2PqzFsx9yRATfufXfuxgz/uTgy0=;
        b=LQYcjmcYUrVqVJ52ICswox7+AEqygOQXcfi1PoK+XyjY7c8LwCWCtkj161WYtypHIf
         kZVg9uzjqo8Pk6gqsb8kSWRakBM4fpOiPbu8wTM7rp87jF2M6bKzaOtFNMZ3FGJyvqif
         HB1eBEeT/dnpKP+Tm4mAZvLfEmb+BbXOn0K0RfnIsFxs+JpGW2JoWJ/OYDPfYGNdDkUH
         ZDmLS1iQYZpkhpqXD295jd2YDr3QfP4a/bNHsXbXs5EO6SwZs8uQSyGGnBeKRhI5PSYb
         DhPFOBRE0ixb0aiA85a4jdC/eVZOj5Z6vSLuWYUHPm+Wk59VAiX+vLBAPLPX7psq6sE1
         9rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242412; x=1736847212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHxjC6h0Kfucr4tH2PqzFsx9yRATfufXfuxgz/uTgy0=;
        b=Gh6gygkvPjtctb7+wxFsRb/4gzxe4SvUeO6EfMrrU9q0ax/U8VldtttmrmAueWqcwT
         pY1L5QNkvwNPSWvnLLilOWQdxp1/lMM8J8w3wYXzIPlx+XdzsJlMaBEtcr0NDN75g9m1
         MOMH269NqKQpXYp2bj5FRmGBZF4dvl2zLiYgMt0oBKK57l87tV/V/KPx1VwfzzqHkZwP
         hUv/mSKSuU959T6zSvXm7KORUoQ81t7KLrFt1lAD8WmW9ybbKvysa4Th1917dPLWayKv
         aUW0Gy3mAiT+IaqmClmHAXJGjCkLe43wUnkwCWD6BgH0yP5Y3iNmJRP9RCTvD6k8GlWP
         /s+g==
X-Forwarded-Encrypted: i=1; AJvYcCXBnrmJ4oZoYNqZrqQ5keTffvZvUXvxbDD0HO9txgI6OmAcXnf0wUcrzoM7c8zJluEP/xavpWoJ6uZt4wLgcHJt@lists.infradead.org
X-Gm-Message-State: AOJu0YwBCTk5m0Y/JE1Q2mEotsG6rmrswQoNiuj1+/+oZckv4x8vXuwY
	3mbArd1s+hrzKC64wpRprMVIHmI61MnapUSAEv2CUXHzrBWXjjhsC2VKn5YCHUg=
X-Gm-Gg: ASbGncvABkQJzwWuAb/kI8MhYhQDUShYdr5X3+rzVgP3gtZXBi5NHR3BRJzF1zHiTUi
	Y7rK7dB35q7N/WBvOiVv8EO+XGMtY8dRUD5dxJncuJrJ5+L5hXaBZsBbfgeLFe8WB9Kz4vlPS44
	lErFBsCVJwHmjcx//4iI2uOQ97mM+h+vXel5WKAykTRu8JZ/TGDi39yz1R79nbR6SFvowPMx0I7
	MhjMQS0BN1QvMxkuRLXEeO2ntgFxMaeBukRXpLaezyj0t2h72Go25tH0vOnumC+5W/hbG0R0dgC
	kr5X+ybWgGsr
X-Google-Smtp-Source: AGHT+IGa/DGsAatcdI0vhBgT7pEyChI9fpmymNYGz7BLnI1zVom6ss0TkBiupaXLIbc8eDhgvofItg==
X-Received: by 2002:a17:907:724f:b0:aae:ebfe:cedb with SMTP id a640c23a62f3a-aaeebfecfc4mr3325114266b.51.1736242412236;
        Tue, 07 Jan 2025 01:33:32 -0800 (PST)
Received: from [192.168.0.123] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm2354283266b.47.2025.01.07.01.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 01:33:31 -0800 (PST)
Message-ID: <2b2488d5-8e34-429b-98f2-0ddb0cce87eb@blackwall.org>
Date: Tue, 7 Jan 2025 11:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 02/13] netfilter: bridge: Add conntrack double
 vlan and pppoe
To: Eric Woudstra <ericwouds@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Ahern <dsahern@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250107090530.5035-1-ericwouds@gmail.com>
 <20250107090530.5035-3-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250107090530.5035-3-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_013334_573854_DB2DB2A7 
X-CRM114-Status: GOOD (  21.75  )
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

On 1/7/25 11:05, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 88 ++++++++++++++++++----
>  1 file changed, 75 insertions(+), 13 deletions(-)
> 
> diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
> index 816bb0fde718..31e2bcd71735 100644
> --- a/net/bridge/netfilter/nf_conntrack_bridge.c
> +++ b/net/bridge/netfilter/nf_conntrack_bridge.c
> @@ -241,56 +241,118 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  				     const struct nf_hook_state *state)
>  {
>  	struct nf_hook_state bridge_state = *state;
> +	__be16 outer_proto, inner_proto;
>  	enum ip_conntrack_info ctinfo;
> +	int ret, offset = 0;
>  	struct nf_conn *ct;
> -	u32 len;
> -	int ret;
> +	u32 len, data_len;
>  
>  	ct = nf_ct_get(skb, &ctinfo);
>  	if ((ct && !nf_ct_is_template(ct)) ||
>  	    ctinfo == IP_CT_UNTRACKED)
>  		return NF_ACCEPT;
>  

In all cases below I think you should make sure the headers are present
in the linear part of the skb, either do pskb_may_pull() or use
skb_header_pointer(). This is executed in the PRE bridge hook, so nothing
has been pulled yet by it.

> +	switch (skb->protocol) {
> +	case htons(ETH_P_PPP_SES): {
> +		struct ppp_hdr {
> +			struct pppoe_hdr hdr;
> +			__be16 proto;
> +		} *ph = (struct ppp_hdr *)(skb->data);
> +
> +		data_len = ntohs(ph->hdr.length) - 2;
> +		offset = PPPOE_SES_HLEN;
> +		outer_proto = skb->protocol;
> +		switch (ph->proto) {
> +		case htons(PPP_IP):
> +			inner_proto = htons(ETH_P_IP);
> +			break;
> +		case htons(PPP_IPV6):
> +			inner_proto = htons(ETH_P_IPV6);
> +			break;
> +		default:
> +			return NF_ACCEPT;
> +		}
> +		break;
> +	}
> +	case htons(ETH_P_8021Q): {
> +		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
> +
> +		data_len = 0xffffffff;
> +		offset = VLAN_HLEN;
> +		outer_proto = skb->protocol;
> +		inner_proto = vhdr->h_vlan_encapsulated_proto;
> +		break;
> +	}
> +	default:
> +		data_len = 0xffffffff;
> +		break;
> +	}
> +
> +	if (offset) {
> +		switch (inner_proto) {
> +		case htons(ETH_P_IP):
> +		case htons(ETH_P_IPV6):
> +			if (!pskb_may_pull(skb, offset))
> +				return NF_ACCEPT;
> +			skb_pull_rcsum(skb, offset);> +			skb_reset_network_header(skb);
> +			skb->protocol = inner_proto;
> +			break;
> +		default:
> +			return NF_ACCEPT;
> +		}
> +	}
> +
> +	ret = NF_ACCEPT;
>  	switch (skb->protocol) {
>  	case htons(ETH_P_IP):
>  		if (!pskb_may_pull(skb, sizeof(struct iphdr)))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		len = skb_ip_totlen(skb);
> +		if (data_len < len)
> +			len = data_len;
>  		if (pskb_trim_rcsum(skb, len))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		if (nf_ct_br_ip_check(skb))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		bridge_state.pf = NFPROTO_IPV4;
>  		ret = nf_ct_br_defrag4(skb, &bridge_state);
>  		break;
>  	case htons(ETH_P_IPV6):
>  		if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
> +		if (data_len < len)
> +			len = data_len;
>  		if (pskb_trim_rcsum(skb, len))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		if (nf_ct_br_ipv6_check(skb))
> -			return NF_ACCEPT;
> +			goto do_not_track;
>  
>  		bridge_state.pf = NFPROTO_IPV6;
>  		ret = nf_ct_br_defrag6(skb, &bridge_state);
>  		break;
>  	default:
>  		nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
> -		return NF_ACCEPT;
> +		goto do_not_track;
>  	}
>  
> -	if (ret != NF_ACCEPT)
> -		return ret;
> +	if (ret == NF_ACCEPT)
> +		ret = nf_conntrack_in(skb, &bridge_state);
>  
> -	return nf_conntrack_in(skb, &bridge_state);
> +do_not_track:
> +	if (offset) {
> +		skb_push_rcsum(skb, offset);
> +		skb_reset_network_header(skb);
> +		skb->protocol = outer_proto;
> +	}
> +	return ret;
>  }
> -
>  static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
>  				    const struct nf_hook_state *state)
>  {


