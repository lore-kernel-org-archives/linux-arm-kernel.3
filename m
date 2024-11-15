Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E33D6A223
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnopEV30nL1b9Cl0HnPVmIv7FqBqCF/jD4njhWbWG2c=; b=almkNawWc8b9FKDd3BIH6qBsKO
	VapKVaCN4LvXbmTc3Fah9KV/fBhWHyUf6BYfY0sIU92Y8wWd2sjDaadzJOP9zgf5othp18HCI1v2f
	FSqqBRTshhrNUPzV6iWN50WDhie1Hp6H1sU0J/rX93+85xnvmeYdMOEXwNjhdUpOkkWqS0JGlaX5D
	3abS8oaN9l2rCnR3M/TXkwYjLWQHWpOzlH4gNr9WrtZAjrmC2XDKaqJ7ywmAHhXDsfsG1R2ImpFaQ
	bmXPtwbnBFetLlAq4b75ur//hBnyMbbmJTYHgHB7UqcDy3QakFT5XZbIVDpY5BpFOmmLQzeepnJ8b
	MZsovNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlQs-00000001L77-0rOY;
	Fri, 15 Nov 2024 01:47:34 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlPb-00000001Kqz-0Hnd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 01:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731635175; x=1763171175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m5vc2Wizx2rJbKoJg3DIZCEwDfTT1ErdANobu7oKqtg=;
  b=U1HXVmgWvkxkK2UNWVgFDd1wQfG8Imsl1E/dML+bE3G0hOPOWLz0Za9J
   CTrLDj4mgf72ijAx/cSjTkr/McmkmQuyFgb7FbbnSfYxj2kwAZ+tShItz
   CxllunPogJLyZoxlV5ozkV3qeeo63z7Cuv16W/6wHGQS3SLxQmOgwFMew
   Gny4YDKmKjisj84VBdQeWm7nRONv9GP8QuileNCQSGXtIWIdS7a/ninPj
   CCy5pnnBAEq0bI6yW2GtrAk3W9YNPfUSMocBLMlYcAE3eSzel/EchbeD4
   ORtHjEbZjuuNWTdAImgrPmDSMc06jK7U4Dq9Nlks8x7X6CQZXw6AxSvsT
   Q==;
X-CSE-ConnectionGUID: Ci1zDAU5RUOewFVLTm8WyA==
X-CSE-MsgGUID: fvcspYD8QGWVbHqkPSRHRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31028343"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="31028343"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 17:46:13 -0800
X-CSE-ConnectionGUID: 5je70P8PRcmZc2W8TeLARg==
X-CSE-MsgGUID: RJOEMptXRAm1HGWlvPOq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="89153309"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.75.68]) ([10.247.75.68])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 17:46:09 -0800
Message-ID: <6c023200-5e81-432c-b21d-d7a9cf1bfc92@linux.intel.com>
Date: Fri, 15 Nov 2024 09:46:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/2] net: phy: set eee_cfg based on PHY
 configuration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
 <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
 <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
 <ZzXOAvc__iQscSb4@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZzXOAvc__iQscSb4@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_174615_129028_07F49A57 
X-CRM114-Status: GOOD (  20.00  )
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



On 14/11/2024 6:16 pm, Russell King (Oracle) wrote:
> On Thu, Nov 14, 2024 at 10:05:52AM +0000, Russell King (Oracle) wrote:
>> On Thu, Nov 14, 2024 at 09:23:48AM +0000, Russell King (Oracle) wrote:
>>> On Thu, Nov 14, 2024 at 04:16:52PM +0800, Choong Yong Liang wrote:
>>>> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
>>>> designed to have EEE hardware disabled during the initial state, and it
>>>> needs to be configured to turn it on again.
>>>>
>>>> This patch reads the PHY configuration and sets it as the initial value for
>>>> eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
>>>> true by default.
>>>
>>> eee_cfg.tx_lpi_enabled is something phylib tracks, and it merely means
>>> that LPI needs to be enabled at the MAC if EEE was negotiated:
>>>
>>>   * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
>>>   *      that eee was negotiated.
>>>
>>> eee_cfg.eee_enabled means that EEE mode was enabled - which is user
>>> configuration:
>>>
>>>   * @eee_enabled: EEE configured mode (enabled/disabled).
>>>
>>> phy_probe() reads the initial PHY state and sets things up
>>> appropriately.
>>>
>>> However, there is a point where the EEE configuration (advertisement,
>>> and therefore eee_enabled state) is written to the PHY, and that should
>>> be config_aneg(). Looking at the Marvell driver, it's calling
>>> genphy_config_aneg() which eventually calls
>>> genphy_c45_an_config_eee_aneg() which does this (via
>>> __genphy_config_aneg()).
>>>
>>> Please investigate why the hardware state is going out of sync with the
>>> software state.
>>
>> I think I've found the issue.
>>
>> We have phydev->eee_enabled and phydev->eee_cfg.eee_enabled, which looks
>> like a bug to me. We write to phydev->eee_cfg.eee_enabled in
>> phy_support_eee(), leaving phydev->eee_enabled untouched.
>>
>> However, most other places are using phydev->eee_enabled.
>>
>> This is (a) confusing and (b) wrong, and having the two members leads
>> to this confusion, and makes the code more difficult to follow (unless
>> one has already clocked that there are these two different things both
>> called eee_enabled).
>>
>> This is my untested prototype patch to fix this - it may cause breakage
>> elsewhere:
> 
> As mentioned in the other thread:
> 
> Without a call to phy_support_eee():
> 
> EEE settings for eth2:
>          EEE status: disabled
>          Tx LPI: disabled
>          Supported EEE link modes:  100baseT/Full
>                                     1000baseT/Full
>          Advertised EEE link modes:  Not reported
>          Link partner advertised EEE link modes:  100baseT/Full
>                                                   1000baseT/Full
> 
> With a call to phy_support_eee():
> 
> EEE settings for eth2:
>          EEE status: enabled - active
>          Tx LPI: 0 (us)
>          Supported EEE link modes:  100baseT/Full
>                                     1000baseT/Full
>          Advertised EEE link modes:  100baseT/Full
>                                      1000baseT/Full
>          Link partner advertised EEE link modes:  100baseT/Full
>                                                   1000baseT/Full
> 
> So the EEE status is now behaving correctly, and the Marvell PHY is
> being programmed with the advertisement correctly.
> 

Thank you for all the suggestions, the provided prototype, and the tested 
results.

I will study the suggestions in depth, test the provided prototype, and 
provide more feedback.

