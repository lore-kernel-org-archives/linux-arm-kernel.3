Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B51D58D76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2kYk+T9PuyySXsLzGUWngqTMrMVeZ0IjDJ/V0brDU0=; b=Fk2gXFEElBCwrP84cq20qvetID
	b/rJ9Fr+78SGVvX4escKdiB9yEYEL1xkSt780ejSsblOTAox3YoWh3OHqBVTEJUZX27IytuGuYghq
	IdDszcB90+3HZf8V2UDJQufUr1/Orfzy8O/dd47BQh6j6+z30otJlsZmcEEvpH7vqqXaDLEmD9Rhl
	8ONU5DR4XfmfnPYxdAXj6M8cAK43KpqO95zbsfP6EOA9vmVSYpWpcMDBG0c6I+s7v9Q46ab+fxYCg
	TmPbgDvN2nYZY4WMD3z4lXjiSfXvdgjuwB17VANyWZinzGROL67ZhIqG8q93Jw4aXKbW1HFuUGw61
	DhJS+AQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdmy-00000008rM5-1xda;
	Mon, 25 Nov 2024 18:26:24 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdm0-00000008rHC-1TXv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 18:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732559125; x=1764095125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6aRiboS4Jxrz+jvRtPC54qrBkrsY/RgG6OavSsJocjI=;
  b=Vnk8L9ZX3tM4oL2WINNcQdRt283EIZCGKEx9fNjn57OjFn/FPtt9ZG10
   UXZJp1NCti17bA5nIeHgLT669XmFXKLKAGZlphtN8zLLV/sC9LTMBzJIk
   sATqlUwunsFvzPCOifmmBAZgffDXlaBgqm3GTBWhV2Ynb2nBT0Ck5Z27f
   8qHoeOIiWzvDiDnOGAIsoN3yI1NyOhUH25cpsGDgF3I2QRnE8gJGy9e1G
   AboJ2+QDQ1lqaBQG0PlPoczwHWDNKXGRUlwgzdZUtRVjUxtqYuLLEz7hl
   SmtNYmPZ2/xCPUJ8kZ02RM3D7KCjM/8/PfjX3oUUAKmXCpfwmnKjfNZ4v
   w==;
X-CSE-ConnectionGUID: Z9bUuUx3RGWt+8h9fyJfiQ==
X-CSE-MsgGUID: dVCM3rJ0TryjeQ/pDhYP2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43751857"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="43751857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:25:00 -0800
X-CSE-ConnectionGUID: INFUjcOqQSy+Joj9bnk6cA==
X-CSE-MsgGUID: OMdoFMV9SvODLT5m/kOgjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="95440526"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.115.59])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 10:24:55 -0800
Message-ID: <8bd461ba-7fbe-4f1b-91cf-d33483cb4930@intel.com>
Date: Mon, 25 Nov 2024 20:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk
 for S32G
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-mmc@vger.kernel.org, s32@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_102524_491776_DC76A072 
X-CRM114-Status: GOOD (  13.25  )
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

On 25/11/24 10:33, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Enable 'SDHCI_QUIRK_NO_LED' quirk for S32G2/S32G3 SoCs.
> S32G SDHCI controller does not have a LED signal line.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index d55d045ef236..e23177ea9d91 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -304,6 +304,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
>  			| ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>  			| ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>  			| ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
> +	.quirks = SDHCI_QUIRK_NO_LED,
>  };
>  
>  static struct esdhc_soc_data usdhc_imx7ulp_data = {


