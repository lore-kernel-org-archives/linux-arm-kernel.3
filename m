Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C22C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=; b=B+o/uIL0TceprwT0eAeElO7eLP
	HB0OFhEwdpu1OiG+2TQQIeoaYE8ce+bo83v5AbY5tLOOEzofdU4yPMOqMM4BuhulzIO/eMMOgVWT7
	UPM7VKvhU82eV83yOSRKJg04V5VLtaw1u6I3qwXTSicc4AKfHTt9e1jX4V9PC6wF+6yOOlxnads/R
	CGH9DE7WBFH9MzKGR24/e3tRpBjd9gScO7Dl0QGyr4eUU5QW1ivXPIwYIVIlo2D3rwSw3w6XfU2Mj
	wzJ9gSrirkeCURrmNWxVuhCjFaWAxSs93pni4HTJod/Vrg+zMaXnbTC+4voe6NawNOiY+XUqYZm72
	qZcNpdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tplJ9-00000007YGS-3BYk;
	Wed, 05 Mar 2025 09:44:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk1b-00000007MD8-0AXo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 08:22:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=; b=LB2zMn2QlNE7FNLlsplAtwKaIr
	KURNNiZuTWA13b4nYh94FYuCanC8e9pHBx92SJbZDZ6McqkF9jkPB4epWaRNey+G5YTP3N5DYzJDP
	FM2+DcEcM4YgTxfqpVnm3AF0BaUCDC/EJCnbT32eOwbQHCP3qQMWSfzx+6KPhK049XR6oTeKmS2wZ
	FqIYX6Qtw655aYFTyOH0WV5soBIglYfy2Vr857FofB2/5EoNp8lVpWhvvP60mMzW9EacyGcY4aEK8
	c2tVTNVMDXMcKO0K9SZBx4y6+xI62UD61K7FCIP7DjzMQC65OJWOdPduFL3DCvfCFmGJxhKuEI8hX
	ltKlVU5g==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk1Y-0000000569t-1Kir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:22:41 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e53b3fa7daso5384812a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1741162958; x=1741767758; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=;
        b=bCFltbGm9xW2mj1tD69dJEQO3Obp04NYp2XCEOTQfMRNT8GtqU6peY/fFZeCqP91n1
         Hv7ikXaqWBJIAZ6tFTFFtmNs48RCQutYJCGZDzGADUlEaAD0lQ0W6v9fJad5LzRvNg41
         JgP/cQJbCOf7/8wjYa481PeoEt6tQEjM77Hf/YHwiXJ6ghXjc6T0BJCymMg6+RbbqNPp
         +XCn51rM9iZvjkyIJ7+gXFnZaKRuPNGCGDitbiRjxS5lSA2xpApQIgiTnsUWPnKRhYa8
         cYiyrs7bNG+g6KC7TdJx4hNPDgWFGwGqjlsHQtyXIr/n1vGlu5wrb5+F0wjkum4uzaMo
         bx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162958; x=1741767758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1brnVJAGUyBrrxRVaMvTP6y55O5yEMp4c+P5cyU9eYc=;
        b=t/gEVYY7VVty/gGQjV11N1nAiJre+93oakr216J2xczEPLDuE8/at29PvA83RUpW2O
         j0f+wCocvXKjH7PUw3RIUxPAXQ2WFh0WQeV8h8w6P3QBLwt6dg7NNJHeN/ACCBJ9uTPk
         EdeWhpsGiJIGN9p5M4I9sBsJKE9FCW2mLuo+va7+4t+d0nERAokVF4JYMoHgGjpU3JdE
         nwE3TcwGAZfFRvl2HbuegCoAtnXZdYEiAVhq6KdK14N+cayjyv6+/8HVXoXgcEpCldto
         tLtbAZXpkCSg4D3nRNwEQxaWxHfC7lDVO0NukNxCIfH/K/D046cjNrtCndwEeFV1hsVo
         ptKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTHap5FOSSnMCUYkFjtSokDNsQen6Xm44AmnNjHoJRcMEatpIZA/UtjdiZd6zJ9dvY3eqle4k8okFLFGQTMjHn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvvk3y5ICjOTI/6XqnKS63mWV4KURQeaQWjuwN6uhjLfe7FNIx
	DtPfATQh+3Xtg7MrIMWjhmcN2AG+xvau9IcXM4RG1G2W3o5mbexmRIRnN066BtM=
X-Gm-Gg: ASbGnctTBKJbGDfnavLf51W626Ggnibb1a2hhmhmp4+xrNEiTKKi0Afdr/wW3Xq+C4f
	ApKKVednbTSjQmUScFLU1m5YmzkrLsCo2mB9b/0llXC6fdDuUp5O3apKPFj2FGI8nJO1BQGepJF
	jiN3nOierTMGkRs0JO1xTlr4F7zESxITKoWj3W+dmNIKRuFHxP9ucwjAocP0rRTL30Z7zZhoUhz
	PHmTsB5MEIv3YaSkjUt0DAfI5soH4wqZDiQ80cnMcFMfqIvp/etEtbOFa4Qn2Xd2i3miNPnBaS4
	PYTs2t56eWmLkLFK2dfv8JW9VItZQ5z42ER3KrhmkdlBcB0aRAjHMPKKLA3gz033QeBN/m0ZE6i
	e
X-Google-Smtp-Source: AGHT+IHSB1wDKnA9pHV1GSviWm2eGdZkD28ziFa7v6M0Rd/G5QVSKS+XqVwTfVjxopyszVvymfpwQA==
X-Received: by 2002:a05:6402:40cf:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5e59f470c8dmr2220203a12.22.1741162957444;
        Wed, 05 Mar 2025 00:22:37 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6dbbbsm9395036a12.22.2025.03.05.00.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:22:36 -0800 (PST)
Message-ID: <350a057e-39ae-4e8d-a4ec-12b2f78f51cb@blackwall.org>
Date: Wed, 5 Mar 2025 10:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 11/15] netfilter: nft_flow_offload: Add
 DEV_PATH_MTK_WDMA to nft_dev_path_info()
To: Eric Woudstra <ericwouds@gmail.com>,
 Michal Ostrowski <mostrows@earthlink.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ahmed Zaki <ahmed.zaki@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250228201533.23836-1-ericwouds@gmail.com>
 <20250228201533.23836-12-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250228201533.23836-12-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082240_384451_FF368F8C 
X-CRM114-Status: GOOD (  18.51  )
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

On 2/28/25 22:15, Eric Woudstra wrote:
> In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
> forward path is filled, ending with mediatek wlan1.
> 
> Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
> with info.indev = NULL. Then nft_dev_forward_path() returns without
> setting the direct transmit parameters.
> 
> This results in a neighbor transmit, and direct transmit not possible.
> But we want to use it for flow between bridged interfaces.
> 
> So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
> direct transmission possible.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  net/netfilter/nft_flow_offload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
> index 323c531c7046..b9e6d9e6df66 100644
> --- a/net/netfilter/nft_flow_offload.c
> +++ b/net/netfilter/nft_flow_offload.c
> @@ -105,6 +105,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
>  		switch (path->type) {
>  		case DEV_PATH_ETHERNET:
>  		case DEV_PATH_DSA:
> +		case DEV_PATH_MTK_WDMA:
>  		case DEV_PATH_VLAN:
>  		case DEV_PATH_PPPOE:
>  			info->indev = path->dev;
> @@ -117,6 +118,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
>  				i = stack->num_paths;
>  				break;
>  			}
> +			if (path->type == DEV_PATH_MTK_WDMA) {
> +				i = stack->num_paths;
> +				break;
> +			}
>  
>  			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
>  			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


