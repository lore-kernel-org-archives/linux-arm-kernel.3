Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BEBC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D32mu7KNPnBffeL1XcVgKfdubzhnvoXDxyAldCEm80M=; b=u1GqJ5eoHhHFbwDMHEMDdS9IMZ
	Ea9rqUCmsHDaInQew8PplFxCfx0GRWc4YXlr0clnBNt5djqA+VC2ZcDg5Ee4paZBGTqaxN9u8avnZ
	IaTthtCEYbT/8lsSfuQiJ5s1INVE+oV/YBAiaW7Et/WGyl+HWkHZQ3EYSszrqesBYjPI1GkI1Ilv+
	pwV3mOSnlOwioyUA1vbZUftGApBxDp2cR1OnGxfmYWEP7b7I5IkPNDXmZvo2bq5DZ0oEx6N+fSwtY
	Z3UYpI9kNipo3BhVYGyS7s9laDvOF0i6ROn+aI+7QYRA/Gd+yo3myaxe3wuFgT6jrQrJKjmW8B1td
	fZatkOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncFh-00000007DXn-2ywi;
	Thu, 27 Feb 2025 11:40:29 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbuW-000000078z7-2EyR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740655117; x=1772191117;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IDZov/Dczn2f/ieNl0tUIoh9CnexHmfb2x1sTLNrFZA=;
  b=bZqxDYmGd8ofzhohhdB4mvgtrSgFqaVnT6LO+Pwl+Cw0mq4pzB4iyfCQ
   P3l3X7C8LYYt/tGhqB9Mx8bdQg+rZn2Of5R9V6beds1xDzk8repbR2UAN
   MGkGG/1hCQvxAOKW7+0PwyAc7naSgzlEVnT2ujba6H0dnbQrQ11RFv98S
   134PJeRAQ7LSGNh51tGCjLuVMelXklr5eONj08WTtxl6vpnjnP9QJ8hpf
   xjUvBxocNzoV0PTX67S8JW07mLEDWIGuE+gh5eh+8muECw6qTDD/Bf8PK
   oLf55cH0qC25/1wMbDI3q+ZZUzbPfJdQs4ZFcH+mA9AsmeXEoUj+mqc15
   w==;
X-CSE-ConnectionGUID: W6MnT3S0TW6EmT7YplG0SQ==
X-CSE-MsgGUID: qjH0+vC0RzaWGk1scmtE+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58955634"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="58955634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:18:36 -0800
X-CSE-ConnectionGUID: CyeTxPjwSHeHLctx7MMYQw==
X-CSE-MsgGUID: 9QUOdIUaRUO9MO1mKfn1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117172376"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.81.210]) ([10.247.81.210])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:18:28 -0800
Message-ID: <8395554a-4aaf-45fb-a89d-34f5b10255fb@linux.intel.com>
Date: Thu, 27 Feb 2025 19:18:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 4/6] stmmac: intel: configure SerDes according
 to the interface mode
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-5-yong.liang.choong@linux.intel.com>
 <Z782i67tlpj6d57m@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z782i67tlpj6d57m@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031836_617519_812D2F13 
X-CRM114-Status: GOOD (  12.76  )
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



On 26/2/2025 11:43 pm, Russell King (Oracle) wrote:
> On Wed, Feb 26, 2025 at 03:48:35PM +0800, Choong Yong Liang wrote:
>> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
>> index 6d2aa77ea963..af22a11c2b8a 100644
>> --- a/include/linux/stmmac.h
>> +++ b/include/linux/stmmac.h
>> @@ -236,6 +236,10 @@ struct plat_stmmacenet_data {
>>   	int (*serdes_powerup)(struct net_device *ndev, void *priv);
>>   	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
>>   	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
>> +	int (*mac_finish)(struct net_device *ndev,
>> +			  void *priv,
>> +			  unsigned int mode,
>> +			  phy_interface_t interface);
>>   	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
>>   	int (*init)(struct platform_device *pdev, void *priv);
>>   	void (*exit)(struct platform_device *pdev, void *priv);
> 
> This should be part of patch 5, and the order of patches 4 and 5
> reversed.
> 
> The subject line should also be "net: stmmac: ..."
> 
Thank you for your guidance. I will adjust the patch sequence as suggested 
and update the subject line to "net: stmmac: ...". I appreciate your 
attention to detail.

