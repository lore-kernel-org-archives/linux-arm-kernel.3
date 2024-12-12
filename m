Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEB7E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvWfD7WgVYRl7lIqCP5allw7Lxl0k+yHRvNG6iCx19I=; b=2rygGww1ctu4IhHHj7FfrsdroJ
	39ahC9np8ZfFrx+EITcBDij6IGrQaKOQepClwjBnX8SmXTaautLlE2ppKLdaWw47q09vg4vUDR+/K
	dOYvaiJVpo0eMS1vLvcAMLSZ7Vynu8AJ36rbngyK4lE04Lw031Zbt9pqHHdvsMgWZz+7T2au24RrV
	y/1OxeMfi3uxr5kknoS0XV4X/yvlJM3YekyXiP0KhbFge/k/Qs0Hg3AdhKHIe1aJrsSfqXxvMODbb
	A2mXllbclVdCF3qQP+CNHjsMyMf+XV9U/VrnWadJ5Is+lbU5p3x6/ixFRQ/WdoKreK/Ly2d5hRmx8
	a1gS75eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfGm-0000000HRMH-1CbR;
	Thu, 12 Dec 2024 09:14:04 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfEi-0000000HQzb-08ln
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733994716; x=1765530716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzBsT3F4zajJH9Dt3PQh+yS4Aot+6eJwHXS8DSaNzEE=;
  b=dHhhO3LaEVwjfofhKQ3ru8NkJckrDhGcqoMEiJ6pV8N7ahQ/R4kH35eK
   j4ht0Uic1ls4gTZq9X0mMDcey1FWBXaFBect+iIBlMWwn+3SPNUOkqn+I
   8EuHjg95WS21p68ls2HMxuDRDTdkLfoEQRBjjd5cEp809kH3pz6RCfelv
   YlGXo6Pt3FhD/megbohOuGSj8hzbkIjzQ/dodj3l6t8YkUuc4zb5/kJBW
   mlTp57YvaLxqu+KT3fUuo9pQj32mP+vvWyUFhv3nrdC6mR9KPZiMAv6C/
   9QSuOL3V6fFue5bGOS/xTcVVMLeQVPQl1v2bMjAr5CMvZVkrBHZjacyaK
   A==;
X-CSE-ConnectionGUID: isPtH/DqRwKm+Qvc4WxMDA==
X-CSE-MsgGUID: Tubf5yTnSXaCTgeZejupkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21994111"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="21994111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:11:54 -0800
X-CSE-ConnectionGUID: uq2AS8WyRZyEF+62XFXmDg==
X-CSE-MsgGUID: tvTJ04EgSRmLHfZCdFa8dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="96256863"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 01:11:51 -0800
Date: Thu, 12 Dec 2024 10:08:49 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: Drop redundant dwxgmac_tc_ops
 variable
Message-ID: <Z1qoITwRF9QLkZq/@mev-dev.igk.intel.com>
References: <20241212033325.282817-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212033325.282817-1-0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_011156_115535_3862A9CF 
X-CRM114-Status: GOOD (  14.63  )
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

On Thu, Dec 12, 2024 at 11:33:25AM +0800, Furong Xu wrote:
> dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
> keep dwmac510_tc_ops to provide better backward compatibility.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h      |  1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 11 -----------
>  3 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 4bd79de2e222..31bdbab9a46c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -267,7 +267,7 @@ static const struct stmmac_hwif_entry {
>  		.hwtimestamp = &stmmac_ptp,
>  		.ptp = &stmmac_ptp_clock_ops,
>  		.mode = NULL,
> -		.tc = &dwxgmac_tc_ops,
> +		.tc = &dwmac510_tc_ops,
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxgmac2_setup,
> @@ -290,7 +290,7 @@ static const struct stmmac_hwif_entry {
>  		.hwtimestamp = &stmmac_ptp,
>  		.ptp = &stmmac_ptp_clock_ops,
>  		.mode = NULL,
> -		.tc = &dwxgmac_tc_ops,
> +		.tc = &dwmac510_tc_ops,
>  		.mmc = &dwxgmac_mmc_ops,
>  		.est = &dwmac510_est_ops,
>  		.setup = dwxlgmac2_setup,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index e428c82b7d31..2f7295b6c1c5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -685,7 +685,6 @@ extern const struct stmmac_dma_ops dwmac410_dma_ops;
>  extern const struct stmmac_ops dwmac510_ops;
>  extern const struct stmmac_tc_ops dwmac4_tc_ops;
>  extern const struct stmmac_tc_ops dwmac510_tc_ops;
> -extern const struct stmmac_tc_ops dwxgmac_tc_ops;
>  
>  #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
>  #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 6a79e6a111ed..694d6ee14381 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1284,14 +1284,3 @@ const struct stmmac_tc_ops dwmac510_tc_ops = {
>  	.query_caps = tc_query_caps,
>  	.setup_mqprio = tc_setup_dwmac510_mqprio,
>  };
> -
> -const struct stmmac_tc_ops dwxgmac_tc_ops = {
> -	.init = tc_init,
> -	.setup_cls_u32 = tc_setup_cls_u32,
> -	.setup_cbs = tc_setup_cbs,
> -	.setup_cls = tc_setup_cls,
> -	.setup_taprio = tc_setup_taprio,
> -	.setup_etf = tc_setup_etf,
> -	.query_caps = tc_query_caps,
> -	.setup_mqprio = tc_setup_dwmac510_mqprio,
> -};

LGTM
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

Thanks
> -- 
> 2.34.1

