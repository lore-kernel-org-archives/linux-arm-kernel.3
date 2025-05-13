Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E723C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 05:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNjQZgOSNhu4l9dCJEHCCk/R9Oh6QVo+GQqll8/eNMU=; b=JFHokakWJj4DWvbvvb9KprSeWC
	/JJ6PSz7AEdy/QPO0gqOwUkUTX9uQKQUERxErR37UDN4IfXwXSIqLSlwc+mucXMn6ib8+blYf1B8z
	ooOJvAzz0BLimFWqC/xEcpl0XNviz8NnX/IkUgLYLrKgttpxINwAZoiD5dxEnVN+RZ8szo/k+aJoG
	fSk9ZCJTauaat4/UaffsASDvWz6jjSwWZZDuykMf3DluSi3JYXH7B0dzYmeQyvKuOAvVRWbWgbEVM
	01W/PCtYBgLtee0pOOp5NOEFpJY2whF/DOoOm/6J5vtooaska6xExOld4R+l++iZs+IW4oBLemJbq
	hQXzXdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEi7b-0000000BNqc-0cT7;
	Tue, 13 May 2025 05:24:07 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEi5Z-0000000BNYS-3hEp;
	Tue, 13 May 2025 05:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747113722; x=1778649722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0EkDH2Lu1hmxjJBI+/nOcLCQ85AI1IE323FloCtl0z8=;
  b=gwgPIRHWCFsUgAClnqWyOzf3BJ+2ZLTa9IabYgMMz+ZljtoajZaTbY/Z
   ErC3keVx90kzrT3HgD9ENmnNxr534CGHtAqK6zJOMkgyney+0HNHdXbQ+
   8rwG1dJC0NnyjzPfF9JjeBba4+Zdg4L0ummBmxVvFfu/CG7XCC8CGZaK4
   YM2fxUsfRpiiNQwCCbzIoMDTWKskjxsLnWuUUgKebkB1+Lkh7fIjOnXBd
   6NqQD66hix/WwGRCxHp9oHRqeaYGNJf5JLuffuQsjI00Uiw30BoKYje5s
   cYxQei15H6nzNpGyFBWy7BZ2HFYSUG/zpnV8IFTnfrW8IwlWSXbsdy8MZ
   A==;
X-CSE-ConnectionGUID: GLU31vVESQK1IX1qyJs0jQ==
X-CSE-MsgGUID: h/O4sdIBSseVpG2zc4jAjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60277355"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="60277355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:22:01 -0700
X-CSE-ConnectionGUID: 2yRa1fBCTr+KBaBKRRvjHQ==
X-CSE-MsgGUID: jda8xgckSE+g0j+r2743vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138552385"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:21:57 -0700
Date: Tue, 13 May 2025 07:21:25 +0200
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix typo for declaration
 MT7988 ESW capability
Message-ID: <aCLW1ZAVQvs8fkUm@mev-dev.igk.intel.com>
References: <b8b37f409d1280fad9c4d32521e6207f63cd3213.1747110258.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b37f409d1280fad9c4d32521e6207f63cd3213.1747110258.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_222201_934381_F4EEF076 
X-CRM114-Status: GOOD (  19.06  )
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

On Tue, May 13, 2025 at 05:27:30AM +0100, Daniel Golle wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> Since MTK_ESW_BIT is a bit number rather than a bitmap, it causes
> MTK_HAS_CAPS to produce incorrect results. This leads to the ETH
> driver not declaring MAC capabilities correctly for the MT7988 ESW.
> 
> Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 22a532695fb0..6c92072b4c28 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -4748,7 +4748,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  	}
>  
>  	if (mtk_is_netsys_v3_or_greater(mac->hw) &&
> -	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_ESW_BIT) &&
> +	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_ESW) &&
>  	    id == MTK_GMAC1_ID) {
>  		mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE |
>  						       MAC_SYM_PAUSE |

Looks like other usage of MTK_HAS_CAPS is fine, thanks for fixing.

Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

> -- 
> 2.49.0

