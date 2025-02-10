Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437FDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFZwg4gssek4E0qCtKZlJ+QXDkOGPKA0iRXi0wCZsLA=; b=s2lfAjm8b+MAJO21lAjZQ+g6NU
	w0k34agBGlPgI0qo++4myrKGYza/Zsq9HpCNjOAiJEJNGrDLpXNv6UEtiLSPfnJ1TXTBVzVdp1YzO
	7CoQRi4J3bZcjQmZ2YYzxA2dzI+edKIfWwysWJKASiielat5QUOORY9/ViSQBT8hzvjCgLd497OiK
	RAvHKAsjiGL42CEU2+kCgNpSFNL4QcBulo256lOyGD6f+9v4tZ+EUE/V/5I6fEzH64gyGdOlNs8Di
	T//AeGwOQzGAYiaIdazOUpiFf8lTaRnYplGm185fx9H2ynlrpysERDZDymeSLbXRyBcHt4x89UhjG
	5NTy0p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thOX9-0000000GZAU-2J2v;
	Mon, 10 Feb 2025 07:48:47 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thOVG-0000000GYvn-0Bgy;
	Mon, 10 Feb 2025 07:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739173610; x=1770709610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=57FsZbFOLUMSsYGliPSMD+RfYyI9b+xhfGwhfTv6VoU=;
  b=PQwp/R6UroCeY8NZiOekM1PXj15Vxu4CCW5ee0lVYBt9pdX4nCu9T1K3
   94ZRR0P4+i/BEWwrH6BPRz3w5wrSlRh9GnTKueVyDGGHkP2tD2Foz0hDv
   w6dxjnyhCKPdvzFXxiy2At6nlDumcDE0nu3DAqnBbRzcnIjAlQMjka2Vd
   jExTAmznYMDALK+2lSejvg8sao1mvft/1IWNelW8CpGhTdT8aEo3vre5x
   r/gsk7piafpBNVKYONLP+t1aID4jmbfrI0BmDpqdxiciz9lUddog+9J4b
   z1/DipEQtQSyIiQa3fgkCuMVrS3niVvrwEFUba8bNt0fV8G3q6HcNDbgI
   g==;
X-CSE-ConnectionGUID: bKErg7W9SPWPhxOne734Sw==
X-CSE-MsgGUID: 7nax8ZWtT5mZTzPhqfrg3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39868190"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39868190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 23:46:46 -0800
X-CSE-ConnectionGUID: 168nfPuIRfeGYDg3PECo0w==
X-CSE-MsgGUID: cljx2HRWQAuLmpH7eaD5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112994147"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 23:46:42 -0800
Date: Mon, 10 Feb 2025 08:43:07 +0100
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
Subject: Re: [PATCH v3 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ
Message-ID: <Z6muC7WshGlaY9Ft@mev-dev.igk.intel.com>
References: <20250209110936.241487-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209110936.241487-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_234650_126413_07ADBBE8 
X-CRM114-Status: GOOD (  23.97  )
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

On Sun, Feb 09, 2025 at 12:09:36PM +0100, Eric Woudstra wrote:
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
> Changes in v3:
> - Removed unnecessary second check for ETH_P_8021Q.
> 
> Changes in v2:
> - Unchanged, only RFC to PATCH.
> 
> Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.
> 
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   | 22 +++++++++----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index f20bb390df3a..c855fb799ce1 100644
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
> @@ -450,12 +453,9 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
>  	if (offload_type == MTK_PPE_PKT_TYPE_BRIDGE)
>  		foe.bridge.vlan = data.vlan_in;
>  
> -	if (data.vlan.num == 1) {
> -		if (data.vlan.proto != htons(ETH_P_8021Q))
> -			return -EOPNOTSUPP;
> +	for (i = 0; i < data.vlan.num; i++)
> +		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.vlans[i].id);
>  
> -		mtk_foe_entry_set_vlan(eth, &foe, data.vlan.id);
> -	}
>  	if (data.pppoe.num == 1)
>  		mtk_foe_entry_set_pppoe(eth, &foe, data.pppoe.sid);

Thanks for addressing comments.

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

>  
> -- 
> 2.47.1

