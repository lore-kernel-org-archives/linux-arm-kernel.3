Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7038C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 02:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgpCcuo+kUUBZLKISsqFnmcRWNyxic9TA8kZPz7JzhY=; b=PyGBLvzd0YYkL6rbcD/R0xHTYy
	OgDkhjoMqj+i/ZtIyo6x1mCMFuSLPAl7NmG0T6FrB1wY6XGfrQwU7uHFDAVRpDQKZ3tP/IpIdwyiY
	GxW/EAVM8uVZ2tf4zBfQHsa2QdAkoLXe4+hCwrycxQ1JzWAx4LkvXz8pt73V8n3xdWUALzHdmCUhE
	c+NUTAiFiPnkCbS4ykhEt9cgShXcS7zHwG08X0LO3+BiFAhpAabQYWTCwRT/JXsECes7gO2tdRYb7
	vMMS9MNC6ohjBfCTLdIfE/Y/hXgOKLzEtWHCG2l5Vqkfmw260l2K6Hnl4so7SSZwx4SdyT0JtNBZh
	W62X/8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrZl-000000053Po-3lGg;
	Thu, 06 Feb 2025 02:25:09 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrY9-000000053Dx-2MK9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 02:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738808609; x=1770344609;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MX/9vrVMWFYRt4Rmji6I71xtTK2XSPOEL24m4oemfv0=;
  b=Oe438HpBgV3w+gGapzAqGEurxGIHl2qrwUgqhQHYVJGzYBoiu/tKJK9u
   baWwRl4mQVVOu2McszZB8HcvTAbKsPhH4v5BgLGNjrL6FPwJ0onU1l8n3
   q2S0ufaGqpKtJ76UtTRXukTDZAF5p8b5d+v226gwRV0GC+1q5O/eZ7MmI
   G+L8aNYT1FeSmbHKr/TyKj97ULjvVPW6555TBuyDWFoZIw45yRUhRG/Cn
   lW8f1OkkB/GjA1kUZKLxQtLbcohYpA/uY62ZDKqz3oGHi8ugVss3Pw0nm
   JRQTBsllf8M8R3X1Y1QB5YfkkWQE/uzOlM2atk4Bg4InIp9P3sbFEjGj6
   Q==;
X-CSE-ConnectionGUID: +oEfGCYCSWOThl/md028Fg==
X-CSE-MsgGUID: bDZnbLEPSVWi6OhXirnwdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56945600"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="56945600"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:23:26 -0800
X-CSE-ConnectionGUID: 9N2QkdZTQnGEp6akn4nL/A==
X-CSE-MsgGUID: E5VLiOZUS+ykXC3zAo3hKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="110858842"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.114.122]) ([10.247.114.122])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:23:18 -0800
Message-ID: <603921dc-4cc0-4bc6-960a-00ce6f8dfd5a@linux.intel.com>
Date: Thu, 6 Feb 2025 10:23:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 4/7] stmmac: intel: configure SerDes according
 to the interface mode
To: Simon Horman <horms@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
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
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, Serge Semin <fancer.lancer@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <20250204181339.GM234677@kernel.org>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <20250204181339.GM234677@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_182329_607998_D521D8EA 
X-CRM114-Status: GOOD (  15.16  )
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



On 5/2/2025 2:13 am, Simon Horman wrote:
>> +static int intel_config_serdes(struct net_device *ndev,
>> +			       void *intel_data,
>> +			       phy_interface_t interface)
>> +{
>> +	struct intel_priv_data *intel_priv = intel_data;
>> +	struct stmmac_priv *priv = netdev_priv(ndev);
>> +	int ret = 0;
>> +
>> +	if (!intel_tsn_lane_is_available(ndev, intel_priv)) {
>> +		netdev_info(priv->dev,
>> +			    "No TSN lane available to set the registers.\n");
>> +		goto pmc_read_error;
>> +	}
>> +
>> +	if (intel_priv->pid_modphy == PID_MODPHY1) {
>> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
>> +			ret = intel_set_reg_access(pid_modphy1_2p5g_regs,
>> +						   ARRAY_SIZE(pid_modphy1_2p5g_regs));
>> +		} else {
>> +			ret = intel_set_reg_access(pid_modphy1_1g_regs,
>> +						   ARRAY_SIZE(pid_modphy1_1g_regs));
>> +		}
>> +	} else {
>> +		if (interface == PHY_INTERFACE_MODE_2500BASEX) {
>> +			ret = intel_set_reg_access(pid_modphy3_2p5g_regs,
>> +						   ARRAY_SIZE(pid_modphy3_2p5g_regs));
>> +		} else {
>> +			ret = intel_set_reg_access(pid_modphy3_1g_regs,
>> +						   ARRAY_SIZE(pid_modphy3_1g_regs));
>> +		}
>> +	}
>> +
>> +	priv->plat->phy_interface = interface;
>> +
>> +	if (ret < 0)
>> +		goto pmc_read_error;
> 
> Perhaps this is an artifact of earlier refactoring,
> but the condition above seems to be without meaning
> as in either case the code goes directly to pmc_read_error.
> 
>> +
>> +pmc_read_error:
>> +	intel_serdes_powerdown(ndev, intel_priv);
>> +	intel_serdes_powerup(ndev, intel_priv);
>> +
>> +	return ret;
>> +}
>> +
>>   static void common_default_data(struct plat_stmmacenet_data *plat)
>>   {
>>   	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
> 
> ...
> 

Hi Simon,

You are right.
I will perform the cleanup on the code and submit the next version.

Thank you for your feedback.

