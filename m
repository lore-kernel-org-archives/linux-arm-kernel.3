Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E7D41C3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 04:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJaCPJzV0jYTExzR7UOoxQhb2a1pD/bx3oQvNAdSpms=; b=JoAWWtSSvsCSqqTz+2QOSLEYUo
	JsULqodw6G64jjIPgrrbVFASbbEqhJZfOXNXOTg3kR1cDYdI6bg2BECkfgYmgjjLZK43nIA3lOMHM
	Ap8eAplEmFKhR2guiCHNTQi8bx8hyoBdpLs0MZ1JoeQ34JlZs5QV3O4MPxtsmpZ0uKcPGyjFwERNo
	gWLDV7QO/kr6GA1JJvTergHigfa+p/lJJch4ppcbs19TZSxSz355gaY7H9J7X3lZbtj6+jWA4haqM
	7aQKrZBDwBA2esAGYv6nX0AWTQYmnynoAOvDSeEwIC16SfVlYVU5MFNUoRtvot0jvgd5/JcJni/Rd
	YWFo51rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRdt-00000008mni-0d3t;
	Thu, 14 Nov 2024 04:39:41 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRc3-00000008mTr-29XM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 04:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731559067; x=1763095067;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WKOXFnXXfoup+z1HHcm+BHwMVCrgMUWLaq9XXRMUTgQ=;
  b=fjAILGMxuBNQgZr09zYyonSdu4Kk/LFWF1tlZp0LP+f42xFHvif6Bjyf
   orez6qrcDCKoCig5RQ/E59thwcA8ab6q/D+Yx7YTSlikq5Am5zzEbyfDq
   RjHdsidQkhTexamrXqXMDtqmgnprJaw7cqMI5rZZpOr5OWRnk15tnVQ8U
   2e7T2RzSaxS4E07L1tvzNzDTGvTfNo9nGLsQGLkZyvcBaUBnFHIUC6lI2
   UMHPCK0pKCYjGUnBG8CFM5FcLDabK12bVUy1E/uO7O7zvY3zJm3cg89/j
   CzOzv5wijt/H4g9HvMH+RvLiYKMebzp1DaAeEScV718Q2pA5kcuzqtH5w
   w==;
X-CSE-ConnectionGUID: f119OcEOQQGx/qS30KZPOg==
X-CSE-MsgGUID: tpETnoWKR0Ge/B9H74RIeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42864462"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42864462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 20:37:47 -0800
X-CSE-ConnectionGUID: kE45sCQ0RsO5lvNHx0MVow==
X-CSE-MsgGUID: f67o2F7qRBenNM1uR0308g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88261207"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.16.168]) ([10.247.16.168])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 20:37:43 -0800
Message-ID: <1a94d554-c043-4444-85a1-d30d07e7580f@linux.intel.com>
Date: Thu, 14 Nov 2024 12:37:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to update
 eee_cfg values
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
 <20241112072447.3238892-2-yong.liang.choong@linux.intel.com>
 <f8ec2c77-33fa-45a8-9b6b-4be15e5f3658@gmail.com>
 <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
 <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
 <b61a9c36-dfd5-4b90-88a6-90e43cfae000@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <b61a9c36-dfd5-4b90-88a6-90e43cfae000@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_203747_608788_A844A575 
X-CRM114-Status: GOOD (  24.80  )
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



On 14/11/2024 7:05 am, Andrew Lunn wrote:

> tx_lpi_timer is a MAC property, but phylib does track it across
> --set-eee calls and will fill it in for get-eee. What however is
> missing it setting its default value. There is currently no API the
> MAC driver can call to let phylib know what default value it is using.
> Either such an API could be added, e.g. as part of phy_support_eee(),
> or we could hard code a value, probably again in phy_support_eee().
> 
> tx_lpi_enabled is filled in by phy_ethtool_get_eee(), and its default
> value is set by phy_support_eee(). So i don't see what is wrong here.
> 

Thank you for your detailed explanation. I will follow your suggestion to 
set the default value for tx_lpi_timer in phy_support_eee().

>> Currently, we are facing 3 issues:
>> 1. When we boot up our system and do not issue the 'ethtool --set-eee'
>> command, and then directly issue the 'ethtool --show-eee' command, it always
>> shows that EEE is disabled due to the eeecfg values not being set. However,
>> in the Maxliner GPY PHY, the driver EEE is enabled. If we try to disable
>> EEE, nothing happens because the eeecfg matches the setting required to
>> disable EEE in ethnl_set_eee(). The phy_support_eee() was introduced to set
>> the initial values to enable eee_enabled and tx_lpi_enabled. This would
>> allow 'ethtool --show-eee' to show that EEE is enabled during the initial
>> state. However, the Marvell PHY is designed to have hardware disabled EEE
>> during the initial state. Users are required to use Ethtool to enable the
>> EEE. phy_support_eee() does not show the correct for Marvell PHY.
> 
> We discussed what to set the initial state to when we reworked the EEE
> support. It is a hard problem, because changing anything could cause
> regressions. Some users don't want EEE enabled, because it can add
> latency and jitter, e.g. to PTP packets. Some users want it enabled
> for the power savings.
> 
> We decided to leave the PHY untouched, and will read out its
> configuration. If this is going wrong, that is a bug which should be
> found and fixed.
> 

I do agree with your point about leaving the PHY untouched and reading out 
its configuration as the default values in phy_support_eee() instead of 
setting the existing values to true for eee_enabled and tx_lpi_enabled.

> We want the core to be fixed, not workaround added to MAC
> drivers. Please think about this when proposing future patches.
> 
> 	Andrew
I will create different small patch fixes for each of the implementations. 
Thank you.

