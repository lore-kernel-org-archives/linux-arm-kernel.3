Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1084C02197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gew1xg9tGmhycefVQilgpYpxDvqbmdULT4xeC9VD2dA=; b=ax252Z5Cr0DLMcYpnY/LNtcdDJ
	hRrLTAsGw40W0PUtpV8l/lbiwR1AntF4HA3wHx2Cb6AG5XcGDL1ekpttGbVlk3rMIqldX2Dji6CCs
	eMdKWXOO6nnx2EPyZgieZmZA60TUHPr/uH9CR8SM42EmDv4/ci9pClrx1Wqw/mFXmMkp6gyVaLLOw
	BIOqdRdW2/OSIupJOe97zojy5g94sXCH8sMj1OaCcFIBD+tJ9DISabehFK0OKv0fSlAbOrB3b3ogq
	HL8IwwgtjWP6QtHlun7fpMsSK50ECZfQY8lRM+suiR1H6gvc1OmBTSASyOrNZW2RQVFvpxW0bWIgG
	aRp6Ubnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYrE-00000002QJ0-0vHm;
	Wed, 05 Feb 2025 06:25:56 +0000
Received: from [192.198.163.17] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfYoo-00000002Pdt-1HKc;
	Wed, 05 Feb 2025 06:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738736606; x=1770272606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HP9+g74QEkY9kBAOGEAE+ZVm8tC/bXMDrX7XPQ/5eCs=;
  b=jF7PATptU3lkSNZ+dwhB76h/swfjrEwDBfXfC6irTw/LYQjJxM8Orut2
   TaEjRCd/frfAsOeMqGYWtTUjT+UrrrTdY6bpR4rRNv9PiK0kxZv9rrPUu
   1t/u+lurocPJilDZQ5tDSewYkJRV1COSIf+LSvAaDe/0+msIDRVnLMhPC
   KsX5WWGbjx11pOfcUCEFsiQNrwnlZQ2PS+N0WwxLSlnT3U6VDJG0tTy//
   AhL/dMWrAIaBPx0rHfpEKcqkrI4Xviqs4wLZw98+uZKczI4qGrqj5BdLD
   eHt9diMK62KfcXkZn7Ai9KJUvw23+kQb1dXoHojl4MMRDgVKkTyqiYoOH
   w==;
X-CSE-ConnectionGUID: hWjQW4YERUmRqr7FY/YOzQ==
X-CSE-MsgGUID: YFow/LR7RuWFu7BOsqq85w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39187860"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39187860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:23:14 -0800
X-CSE-ConnectionGUID: lNSBHWnpTgCzYu0jrN7DVQ==
X-CSE-MsgGUID: bRJ2CwhTQgWO+oJMETI0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141696589"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:23:09 -0800
Date: Wed, 5 Feb 2025 07:19:37 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Message-ID: <Z6MC+WUALT3H6unG@mev-dev.igk.intel.com>
References: <20250204194624.46560-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204194624.46560-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_222326_354203_829B8F2A 
X-CRM114-Status: GOOD (  23.27  )
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

On Tue, Feb 04, 2025 at 08:46:24PM +0100, Eric Woudstra wrote:
> mtk_foe_entry_set_vlan() in mtk_ppe.c already seems to support
> double vlan tagging, but mtk_flow_offload_replace() in
> mtk_ppe_offload.c only allows for 1 vlan tag, optionally in
> combination with pppoe and dsa tags.
> 
> This patch adds QinQ support to mtk_flow_offload_replace().
> 
> Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
> of PPPoE and Q-in-Q is not allowed.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
> 
> Since the RFC v1 did not recieve any comments, I'm sending v2 as PATCH
> unchanged.
> 
> Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.
> 
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   | 21 +++++++++++--------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index f20bb390df3a..c19789883a9d 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -34,8 +34,10 @@ struct mtk_flow_data {
>  	u16 vlan_in;
>  
>  	struct {
> -		u16 id;
> -		__be16 proto;
> +		struct {
> +			u16 id;
> +			__be16 proto;
> +		} vlans[2];
>  		u8 num;
>  	} vlan;
>  	struct {
> @@ -349,18 +351,19 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
>  		case FLOW_ACTION_CSUM:
>  			break;
>  		case FLOW_ACTION_VLAN_PUSH:
> -			if (data.vlan.num == 1 ||
> +			if (data.vlan.num + data.pppoe.num == 2 ||
>  			    act->vlan.proto != htons(ETH_P_8021Q))
>  				return -EOPNOTSUPP;
>  
> -			data.vlan.id = act->vlan.vid;
> -			data.vlan.proto = act->vlan.proto;
> +			data.vlan.vlans[data.vlan.num].id = act->vlan.vid;
> +			data.vlan.vlans[data.vlan.num].proto = act->vlan.proto;
>  			data.vlan.num++;
>  			break;
>  		case FLOW_ACTION_VLAN_POP:
>  			break;
>  		case FLOW_ACTION_PPPOE_PUSH:
> -			if (data.pppoe.num == 1)
> +			if (data.pppoe.num == 1 ||
> +			    data.vlan.num == 2)
>  				return -EOPNOTSUPP;
>  
>  			data.pppoe.sid = act->pppoe.sid;
> @@ -450,11 +453,11 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
>  	if (offload_type == MTK_PPE_PKT_TYPE_BRIDGE)
>  		foe.bridge.vlan = data.vlan_in;
>  
> -	if (data.vlan.num == 1) {
> -		if (data.vlan.proto != htons(ETH_P_8021Q))
> +	for (i = 0; i < data.vlan.num; i++) {
> +		if (data.vlan.vlans[i].proto != htons(ETH_P_8021Q))
It is already checked in FLOW_ACTION_VLAN_PUSH, so data.vlan.num can't be
increased if proto is different. No need to check it again.

Other than that rest looks fine.

>  			return -EOPNOTSUPP;
>  
> -		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.id);
> +		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.vlans[i].id);
>  	}
>  	if (data.pppoe.num == 1)
>  		mtk_foe_entry_set_pppoe(eth, &foe, data.pppoe.sid);
> -- 
> 2.47.1
> 

