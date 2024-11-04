Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62173D11185
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NyJAK0arGXOTWWKUDC1b7ee6+6NQ6iS374yTDJnmFQ=; b=hwh8lw7n82rjHhd3irUVE/6cw+
	eknPwZ1uTI+5eTmL6+i9jfU6Cv7v6/tmYqLyxZ/mhwTKAgXZBCp339UCym9yH7Jl1gi8aAh91R0sK
	5sSAyps/gZFq/zfXTtRXJZjRM5ac7YgUvrs6MLmpQOUoAXESbzEE2VBL8lQFGswjyMRQU+SARUrIe
	mS5uRqh+lOXECHUUbD+X/XyWxBtEnzh+6hDBUGddytIhpSwU3nGRLGDF4iecdhS5WNJ5EIk09YVZD
	sx33OCNLiiEM0AhI/7JffuMrlgAizx/rjBpvkJMRo61vyEU/4fyZ1n2cZniH+aZeUxyeWgotoWkQK
	/SnVKvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ql5-0000000Cm9E-2R5X;
	Mon, 04 Nov 2024 06:40:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7qjO-0000000ClyJ-2mxj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 06:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730702310; x=1762238310;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w5IzZhNS0pyq3dZVWuxnPxZjGqxLGha5AZ2HRi5kLkE=;
  b=RBFGq2xh5h2ZM983Zhbc9opeJGCBEh8tqpSQxmOzTrv/u0/LQ88sI1+w
   nZAEKon820piLzDeY1UspOVNMh/Bk2Hd3YErP+nLxTUFqZRHD37G9brqD
   SL539Z6qZGuMpOm6yGajp/LCUCWRn7jTSpD6vXBoc4B8uBzX8urRHCGRP
   m2qTCvI6l/NOgoxbVkPAm6kK+gcycmsMua3YT3e2G82/AsW3apy6veWLV
   nhKwxRsqQrSvXivfU8FXBgoSBDz6shzRCeEaBk5n9CEFMLoO1Tmh5dJJR
   JjJ3b4M6dVE0ZdbP5mkPPqJZfIJw34YHKOnc+X7HcNCMmiOUVvuGkzouh
   Q==;
X-CSE-ConnectionGUID: 2JLXYS0iQHeoQM44xYsSTw==
X-CSE-MsgGUID: E/0LeZVNRnmwlSyhL3MUJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="29801127"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="29801127"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 22:38:24 -0800
X-CSE-ConnectionGUID: 3u7azeIwSYCzt9aSZon4Rw==
X-CSE-MsgGUID: XYoWjP+nSS+br4byYIhU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114348431"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 22:38:19 -0800
Message-ID: <8383c639-66ce-4252-b3e8-734cb6688b44@intel.com>
Date: Mon, 4 Nov 2024 08:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] mmc: host: sdhci-esdhc-imx: implement emmc
 hardware reset
To: Josua Mayer <josua@solid-run.com>, Haibo Chen <haibo.chen@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, Yazan Shhady
 <yazan.shhady@solid-run.com>, Rabeeh Khoury <rabeeh@solid-run.com>,
 imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241101-imx-emmc-reset-v3-0-184965eed476@solid-run.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_223830_752420_5055751B 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On 1/11/24 13:42, Josua Mayer wrote:
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v3:
> - reused existing control register definition from sdhci-esdhc.h
>   (Reported-by: Bough Chen <haibo.chen@nxp.com>)
> - placed both control register mask definitions next to each other
> - fixed timeout write register name
> - Link to v2: https://lore.kernel.org/r/20241030-imx-emmc-reset-v2-0-b3a823393974@solid-run.com
> 
> Changes in v2:
> - replaced udelay with usleep_range
>   (Reported-by: Adrian Hunter <adrian.hunter@intel.com>)
> - added comments for delay values
>   (Reported-by: Peng Fan <peng.fan@nxp.com>)
> - delay values based on JEDEC Standard No. 84-B51, 6.15.10 H/W Reset Operation,
>   on page 159
>   (Thanks to Bough Chen <haibo.chen@nxp.com>)
> - added a second patch demonstrating a cosmetic issue revealed by first
>   patch - it bothered me during development but is not important
> - Link to v1: https://lore.kernel.org/r/20241027-imx-emmc-reset-v1-1-d5d0c672864a@solid-run.com
> 
> ---
> Josua Mayer (2):
>       mmc: host: sdhci-esdhc-imx: implement emmc hardware reset
>       mmc: host: sdhci-esdhc-imx: update esdhc sysctl dtocv bitmask

For both:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>



