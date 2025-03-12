Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA486C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBCq+hwhK1axsi5G47bpx4/uZwOLA/maDvmVfbKOI44=; b=fBRTU1ZhRyQ/AYSGk8jwk2lAh1
	YDCaVXZC1d/vnzYblgmWmEmFEv6olGqjU/41cx191aWvfolQulY0puFE4485ShDeHz89ElgaI/33E
	OBUOhue0N08ebG0s8YUsN33u3+6FFiR48mXOB8Rgy1/QcsGvemcfSqTj7JvggTSMTpfNJAzIohs5y
	68stC3HnqS+lOCMjMkCB2n+qh3fH+ehtdaOJThQGv/qVYa+0cgMIPqJGWKg3IrHNHMGuT49qaX3M2
	ccTCEyxEPKAbSRLTLj+7cNsKCIG1a+aO6GQmJKZ8sgJp47wCP9B2Tkj70MK5eOnpbeHhY/nJrqFEb
	dQU5FPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK7p-00000008EdI-2fUI;
	Wed, 12 Mar 2025 11:19:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJuv-00000008D0h-2TKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777590; x=1773313590;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zpVEj/Z0/zd3i/AJFV7MDl6B+Q7yGagVxm2zpHnOD3w=;
  b=PE717Sw2t3m6sfp7XuLCRAGyFO08d+dnGSsTjQqsxDgbtxVGQt3T9RyD
   /l8Xv5igMVCnL/O3aYtIgHWyMq/0PzBCeYa7SdnEu37QR4qDR+QTtVyRE
   BWBWbE45gSpDWGmMEHWh8syNBLe2sxTIlLxhkKk1JGDKZfVUBpz6Ysp+3
   2mFcUEecjydGw7RnTktALUNFx7HlTFUYgaFflxxavow+RQ8EJKbhH+FQr
   upaa2EMd8C5rxt2M9cXFGAUsJY1v59Cf+eAuxekiV7fHgi0eDcCiBQ43M
   GjT8eh/UfuvSVG9QppWZWE8YK6saXhpqG/MLJWV+Vmt9Rzu6PJ9vJ7YY+
   Q==;
X-CSE-ConnectionGUID: og0SOlj9RNWsn3AJeWKKUw==
X-CSE-MsgGUID: 2ltK2lH2ToWhKFiNUwi0Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53841910"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53841910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:06:28 -0700
X-CSE-ConnectionGUID: FTcHnpSoR1On2p12HpUfcQ==
X-CSE-MsgGUID: 1vDNffJDSfyoLH+Tbkug3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125669067"
Received: from soc-5cg4396xfb.clients.intel.com (HELO [172.28.180.56]) ([172.28.180.56])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:06:25 -0700
Message-ID: <93f1c6d0-a1fe-4154-a31d-20cc878476d9@linux.intel.com>
Date: Wed, 12 Mar 2025 12:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X
 only configuration.
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 git@amd.com, harini.katakam@amd.com
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-3-suraj.gupta2@amd.com>
Content-Language: pl, en-US
From: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
In-Reply-To: <20250312095411.1392379-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_040629_680031_CB439C6B 
X-CRM114-Status: GOOD (  12.21  )
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

On 2025-03-12 10:54 AM, Suraj Gupta wrote:
> AXI 1G/2.5G ethernet IP has following synthesis options:
> 1) SGMII/1000base-X only.
> 2) 2500base-X only.
> 3) dynamically switching between (1) and (2).
> Add support for 2500base-X only configuration.

Hi, thanks for the patch.

nit: a discrepancy between the commit description for and the comments 
in the code for 3)

Maybe adding that information here in the commit description would make 
sense as well? Or giving a bit of a background that SGMII/1000base-X is 
already implemented in the driver and you are adding 2500base-X only 
support.

> +	/* AXI 1G/2.5G ethernet IP has following synthesis options:
> +	 * 1) SGMII/1000base-X only.
> +	 * 2) 2500base-X only.
> +	 * 3) Dynamically switching between (1) and (2), and is not
> +	 * implemented in driver.
> +	 */

For the rest of the patch, it looks good to me but I'd rather have 
someone more experienced provide the Reviewed-By tag if they find the 
patch appropriate.

Best regards,
Dawid

