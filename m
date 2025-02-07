Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A88C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U40YS9CxwTxSqWYRm8Pu/lzfTyU6KzKQtqK1QBfpVb0=; b=QpPiTYE/xTtEanXCdABxL04xJ+
	0ke3bB3bO7elmT4eUxplZIq9uz269L/FFua9Pm3MtltTDXpFiZHK8e+ottAbvetwKAHwS4cMA5hp2
	3SYeVintR5coiUAizhzmmFUarqvPp/3f/eI0Fa8qrw/7Ea8wLJRp5pz7bJdg2nVY03V4uzUjXA+Fe
	6RYcXqZzSuD8+rOprYf+Vx0+OjwYRe1qiUH1WLE5jZx9djNVJ6Nw37DK+8pUiCIPc/P/VSU3FtQOP
	7APQ55WUdC7gnB6CgLGuObCZkkAUUW4S84pYSgP2YbKlgBu5QxaSBOiJVwUy1FvKWhXMCghbiZygW
	Sv56Nb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKZV-000000090Is-0jfg;
	Fri, 07 Feb 2025 09:22:49 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKXR-00000008ztq-2al2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738920041; x=1770456041;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hA2SG/by2VlZkg0k+rBAIateDa8Wr9F6Pl3v/Hw6QSU=;
  b=iDdjvuysaVA2bwEUZ2sfpU3gcIYBUYu2ek0KlY/tTlp49jgrnYf/ewte
   9VCiKluyIZR9TwwX1xIS8lw94fe/jPlZBgdl/nyA9tAT28E34Rg+CZqOR
   ZTgpk8AskmSLY+Q7ntxlWeFkPC7tW+3Gqgv0K2CaATK8pqn7+sR1iassF
   iiwwuAxKiBS1lDsFPzIlK0eJ2ooaO9qJ0YmWbVbtKDN7nqFvLt4q+Bgyf
   uFHydFiCnDdyceaqOJfE85hqV6Q4YufOGssLmpa6BkM94k00XPXGFK90H
   29hJ1IzwmAm9k7h4VgtqoSaMOIaJOpsb9ofU11UgYOpu7SdKk5kXPA2yn
   Q==;
X-CSE-ConnectionGUID: KHa6zXlIRAmlnMMvrNJ6rA==
X-CSE-MsgGUID: LUFtduJbRBO6p4wgDemVFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39428957"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39428957"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:20:40 -0800
X-CSE-ConnectionGUID: Rs/q4v6kTrSfo8mlMCbvMQ==
X-CSE-MsgGUID: 4DBwnz/7TVqAchVWKhRZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148692076"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.39.73]) ([10.247.39.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:20:32 -0800
Message-ID: <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
Date: Fri, 7 Feb 2025 17:20:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/7] net: pcs: xpcs: re-initiate clause 37
 Auto-negotiation
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
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_012041_707433_58150DA8 
X-CRM114-Status: GOOD (  31.42  )
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



On 6/2/2025 11:30 pm, Russell King (Oracle) wrote:
> On Thu, Feb 06, 2025 at 09:18:54PM +0800, Choong Yong Liang wrote:
>> The xpcs_switch_interface_mode function was introduced to handle
>> interface switching.
>>
>> According to the XPCS datasheet, a soft reset is required to initiate
>> Clause 37 auto-negotiation when the XPCS switches interface modes.
> 
> Hmm. Given that description, taking it literally, claus 37
> auto-negotiation is 1000BASE-X, not Cisco SGMII (which isn't an IEEE
> 802.3 standard.) Are you absolutely sure that this applies to Cisco
> SGMII?
> 
Hi Russell,

Yes, you are correct that Clause 37 auto-negotiation is for 1000BASE-X. 
However, I do not believe it applies to Cisco SGMII. The XPCS implements 
Clause 37 auto-negotiation for both 1000BASE-X and SGMII.

> If the reset is required when switching to SGMII, should it be done
> before or after configuring the XPCS for SGMII?
> 
A soft reset is required before configuring the XPCS for SGMII. Based on 
the existing XPCS handling in the initial state, the xpcs_create() function 
will be called, and then xpcs->need_reset will be set to true. Later on, 
phylink_major_config() will call xpcs_pre_config() to perform the 
xpcs_soft_reset(), and then it will continue with xpcs_config().

I apologize for missing this patch: 
https://patchwork.kernel.org/project/netdevbpf/patch/E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk/

I think I should move xpcs_switch_interface_mode() to xpcs_pre_config() and 
just update xpcs->need_reset instead of implementing my own method for 
calling xpcs_soft_reset().

> Also, if the reset is required, what happens if we're already using
> SGMII, but AN has been disabled temporarily and is then re-enabled?
> Is a reset required?
> 
Good point. I cannot find this scenario in the datasheet. Please allow me 
some time to test this scenario. I will update you with the results.

> What about 1000BASE-X when AN is enabled or disabled and then switching
> to SGMII?
> 
According to the datasheet, a soft reset is required.

>> +static int xpcs_switch_to_aneg_c37_sgmii(const struct dw_xpcs_compat *compat,
>> +					 struct dw_xpcs *xpcs,
>> +					 unsigned int neg_mode)
>> +{
>> +	bool an_c37_enabled;
>> +	int ret, mdio_ctrl;
>> +
>> +	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
>> +		mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
>> +		if (mdio_ctrl < 0)
>> +			return mdio_ctrl;
>> +
>> +		an_c37_enabled = mdio_ctrl & BMCR_ANENABLE;
>> +		if (!an_c37_enabled) {
> 
> I don't think that we need "an_c37_enabled" here, I think simply:
> 
> 		if (!(mdio_ctrl & BMCR_ANENABLE)) {
> 
> would be sufficient.
> 
>> +			//Perform soft reset to initiate C37 auto-negotiation
>> +			ret = xpcs_soft_reset(xpcs, compat);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
>> +	return 0;
> 
> I'm also wondering (as above) whether this soft reset needs to happen
> _after_ xpcs_config_aneg_c37_sgmii() has done its work - this function
> temporarily disables AN while it's doing its work.
> 
Based on the programming sequence in the datasheet, it is not necessary to 
perform a soft reset after xpcs_config_aneg_c37_sgmii() has completed its work.

> I'm also wondering whether AN being disabled is really a deciding
> factor (e.g. when switching from 1000BASE-X AN-enabled to SGMII, is a
> reset required?)
> 

Thank you for pointing this out. The datasheet only mentions performing a 
soft reset when switching to the 1000BASE-X and SGMII interfaces, and it 
does not specify whether AN needs to be enabled or disabled. I thought 
adding a check would reduce the calls to the soft reset. However, I did not 
consider the scenario of switching from 1000BASE-X with AN enabled to SGMII 
with AN enabled. This scenario might cause regression. I will remove all 
the checks and just perform a soft reset when switching to the SGMII interface.

