Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF58C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjndcfyqjqX0suK3BJwJI5MpJWEUcpM/zhKh9Jt/IFw=; b=rwsboWGhICaKGoZdXdORbLsWh7
	D0CiZb5BzxTAQK4puU44tarXvvgahyGk9Xh68O12XKQ0YsbYWhfmG243eHU8OnztZOU1BBJyn4R7u
	pIgIavtJ8b/hfiu1jloOe1rPEtSVtIuBsnV/7DoBWM4QvRl/bD9dqWGtySeXjMnsYYpjfll0OqOmO
	6pGkgXLy0wPqMybu116kAkCWCAG7OJWWE+7soWJ0JPcnYUmfvU8iKoG0mDHdx3B8thnQIRQ5DrjAB
	XrhD1t0KhpCyb/Q1rtV+SbnhsV4OyGTZi5oBDW59oXQ5cS46GvdHdgGsmubgxTchJaV1VqINwqTCV
	ZGfmTnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2rV-00000006Zlb-27bd;
	Thu, 06 Feb 2025 14:28:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2kW-00000006YIX-1qrU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:21:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab7800d3939so48754866b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851658; x=1739456458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjndcfyqjqX0suK3BJwJI5MpJWEUcpM/zhKh9Jt/IFw=;
        b=RYZv5uAtpg1E5NXqVAPNMC2+IA7QuOGZfGK/bltwdL36jlnZj8kn34VL76yyqhaWeI
         CNf8D/QFqBYxIOo9IkmdXPNHWwlMSXC3adp04/7KcGQh2kToEO5vr+8D2EDU5mk4cHo1
         L/vIKXP6q6d0di9qlkZUw9IRIYjJ7xb1yeJCcfVHne2Zacu59hx2/eTN5KrSuoKr+ycE
         UnxaFDPEOHjTdOK4g7YgqPti1zQog6LGx2tqQE5K20H9WwiAf8Lky9VKeRLggWfreo2I
         rO62OkjcpR7NbTz6k+DPqpFfoYpMc8dvLfHywvCbtqg4b9iGeMy9KMnpXq9AWr+GrG9C
         Gxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851658; x=1739456458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjndcfyqjqX0suK3BJwJI5MpJWEUcpM/zhKh9Jt/IFw=;
        b=mLZQKdUY8CBht4MbpWT44ff4GHrctqACDoL1PS2mgCIpYGFt6/lLL6wlCNha3ZmTcc
         HZsmeuc8D1FpdRb4y7yr/vSxbkG6irogoOxa45QqlIh3ufx0RYWNcuWHmxRqviVO6tTc
         x7Rc+doumNMQBbpBrEkiOQsZtGbn5Vd1o+ZJJrYEy5xLkJKc2U7nprtQVoKFAgaZPgqQ
         qxWp6/IWcDjlwdN5sKHgBTL38FNFlc1E2I8yWmcw4foCnFtYm0V/+BeV9KnvPfoDZlZW
         zt7vijvQrqKR6Nao8OWaFDocCGJndHlHHO2BwxPrhCTo24mqF9FYcF2ukbg/ecf07XRi
         QQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe5PmJYIvR78wOeS9Asu3pJoZ3i1NHdPvhBxpzCvdfTlNUqfrr915LXH0ViGcgGxVVP78lyAPQUL6qGKY8t3R5@lists.infradead.org
X-Gm-Message-State: AOJu0YwS4MJGzgclD8rxxLbBueyKQVpVAaI7vbBqBxq06dLvPYpsGFZv
	uRHyJTQn3bUgYvcyyFKFM0z5XGA+qPZkDaJOB3Jc5s9Q2tIL8V1N2pmkSJwDBTg=
X-Gm-Gg: ASbGnctlVLisEI/MqAuGOdFAtk82MSeWPFN9x6Cn8xIsPMZJ9JkkAgoV9A4qwfj5MFt
	Fw4z4UIMeS3sPfyZ7+LrtFLPt/w+knhFtHSCL4a9VrewtyKJrSXALBZDHmKEmGL2pvaGJIaCG01
	GHPyKu+yNoZB/F/ZFmjyxLEWESyXYoMH56dPdPsnPXtxsxp/z8/8IlOgMcWEDqJ0p4BdITX5JJD
	dXIJ6Ttw8W34a7wz2WBqcjHws+Na78J4p86msh/u8BmGcvz7MDlQqNUJq3Q1ybHQNP5vLTjXpql
	pu8AfU0sT044+o0nEYCTRTDLomE8B9qh6qcC4OaafgOPSiA=
X-Google-Smtp-Source: AGHT+IEtj41Y5GMmmjFUnay2iogZtTrhXfr7uhOofHHSDx3vmcnEYXA/d41IrDMa8vkMQ4WmCAfDEQ==
X-Received: by 2002:a17:907:7e8e:b0:ab7:4262:686b with SMTP id a640c23a62f3a-ab75e2f2a97mr822408166b.40.1738851657921;
        Thu, 06 Feb 2025 06:20:57 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm931494a12.25.2025.02.06.06.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:20:57 -0800 (PST)
Message-ID: <5de3c769-68b8-4f59-8a76-1b81d51040b1@blackwall.org>
Date: Thu, 6 Feb 2025 16:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 03/14] netfilter: bridge: Add conntrack double
 vlan and pppoe
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
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
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-4-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-4-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_062100_487849_F6937132 
X-CRM114-Status: GOOD (  20.34  )
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

On 2/4/25 21:49, Eric Woudstra wrote:
> This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
> packets that are passing a bridge.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/bridge/netfilter/nf_conntrack_bridge.c | 81 ++++++++++++++++++----
>  1 file changed, 69 insertions(+), 12 deletions(-)
> 
> diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
> index 816bb0fde718..6411bfb53fad 100644
> --- a/net/bridge/netfilter/nf_conntrack_bridge.c
> +++ b/net/bridge/netfilter/nf_conntrack_bridge.c
> @@ -242,53 +242,110 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
>  {
>  	struct nf_hook_state bridge_state = *state;
>  	enum ip_conntrack_info ctinfo;
> +	int ret, offset = 0;
>  	struct nf_conn *ct;
> -	u32 len;
> -	int ret;
> +	__be16 outer_proto;
> +	u32 len, data_len;
>  
>  	ct = nf_ct_get(skb, &ctinfo);
>  	if ((ct && !nf_ct_is_template(ct)) ||
>  	    ctinfo == IP_CT_UNTRACKED)
>  		return NF_ACCEPT;
>  
> +	switch (skb->protocol) {
> +	case htons(ETH_P_PPP_SES): {
> +		struct ppp_hdr {
> +			struct pppoe_hdr hdr;
> +			__be16 proto;
> +		} *ph = (struct ppp_hdr *)(skb->data);
> +
> +		offset = PPPOE_SES_HLEN;
> +		if (!pskb_may_pull(skb, offset))
> +			return NF_ACCEPT;

You should reload ph because pskb_may_pull() may change the skb and it can
become invalid

> +		outer_proto = skb->protocol;
> +		switch (ph->proto) {
> +		case htons(PPP_IP):
> +			skb->protocol = htons(ETH_P_IP);
> +			break;
> +		case htons(PPP_IPV6):
> +			skb->protocol = htons(ETH_P_IPV6);
> +			break;
> +		default:
> +			nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
> +			return NF_ACCEPT;
> +		}
> +		data_len = ntohs(ph->hdr.length) - 2;
> +		skb_pull_rcsum(skb, offset);
> +		skb_reset_network_header(skb);
> +		break;
> +	}
> +	case htons(ETH_P_8021Q): {
> +		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
> +
> +		offset = VLAN_HLEN;
> +		if (!pskb_may_pull(skb, offset))
> +			return NF_ACCEPT;

ditto about vhdr, should be reloaded after the may pull

> +		outer_proto = skb->protocol;
> +		skb->protocol = vhdr->h_vlan_encapsulated_proto;
> +		data_len = U32_MAX;
> +		skb_pull_rcsum(skb, offset);
> +		skb_reset_network_header(skb);
> +		break;
> +	}
> +	default:
> +		data_len = U32_MAX;
> +		break;
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
>  
>  static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,


