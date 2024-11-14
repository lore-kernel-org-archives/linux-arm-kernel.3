Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2CAD41C35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 04:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsylPYNC4Bz3PoVqQpCNEgY/5EoMgJeE0CttbUvuKwI=; b=1UvuXg9RTlbkPrOaZB68BuuwGl
	3NaPvXFLYEe1Gl8vGVfjK8MdYy4IgvKMhP3sGlNtz02JFryHy/9QG9xcymy/eg+JdUmLZ8b5rcccu
	OR9JW501KMf4/BEWiJB7el5mmnYtppSI+TdGPX7Dqy6fDB+z7uV/jp8ifenrypsVEAPBnHfRgLUEQ
	cgLvpQEb5V0RayYzukpfsipEyyHTz9++HOIecPccPKsLHJ47tDUmWjAF9UtqkLHqw2RuHjrNosb0j
	w/X0gS5OC3pqFXSkD/GLJbfD1tPve2bRND1+AUKBc5TVIDpAS28K7JUcrSCXMGjB9YJelNxJ5iQgi
	LZUbLjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRbr-00000008mSH-0tYL;
	Thu, 14 Nov 2024 04:37:35 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRa3-00000008mI2-43ml
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 04:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731558944; x=1763094944;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qD1IW+f1kR09edDspe+k6r67xtRpNtIiv+xj7UhMIfU=;
  b=Rri0iCRGL84l53mtbS+N3sTpRIOHTBwAvdAl+oK05JFkyRkGwz4LLjRT
   IA85zP38c5M8JHh+hpznAnxVh7fx1/pTC3o5FEuqKbKcqrGbCo1Hw+rWo
   EdoY3ksPEEXvLCtU46wpUnwVGvXyXZgtM0fxVbLQcjSsO0X3dU/SKZdiF
   LlnZoqGyp7mpmARGS81nxTCrZxoPeMsNfwfbgf7/70VK93UfW1JKNvH0t
   7ZMbip3/NM62rrK/QQ1suYwtFouy2H3SY5lUeTqDKOOcr4+rJRdMDftZO
   iQn3JSu5iCyODc5d+jHIS1NXGuefIi3Xb8m7/RmF2/E/uBuBlfEIH5h4p
   A==;
X-CSE-ConnectionGUID: Yrb7hqPrQtmLMxSUqEm9Jw==
X-CSE-MsgGUID: VXDbuLReQzmXbR+vBz9DjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42864380"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42864380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 20:35:42 -0800
X-CSE-ConnectionGUID: llR+QJXdTuucDK8/8v7CBA==
X-CSE-MsgGUID: UTS55jWTSVK1r8iz+qNE1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88260930"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.16.168]) ([10.247.16.168])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 20:35:39 -0800
Message-ID: <5401b791-3c69-4603-ba14-7d430df25667@linux.intel.com>
Date: Thu, 14 Nov 2024 12:35:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to update
 eee_cfg values
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
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
 <392105cb-3f73-4765-a702-7cce0c6ac62c@gmail.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <392105cb-3f73-4765-a702-7cce0c6ac62c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_203544_062590_09AD4772 
X-CRM114-Status: GOOD (  23.84  )
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



On 14/11/2024 5:48 am, Heiner Kallweit wrote:
> "relies on" may be the wrong term here. There's an API definition,
> and phy_ethtool_get_eee() takes care of the PHY-related kernel part,
> provided that the MAC driver uses phylib.
> I say "PHY-related part", because tx_lpi_timer is something relevant
> for the MAC only. Therefore phylib stores the master config timer value
> only, not the actual value.
> The MAC driver should populate tx_lpi_timer in the get_eee() callback,
> in addition to what phy_ethtool_get_eee() populates.
> This may result in the master config value being overwritten with actual
> value in cases where the MAC doesn't support the master config value.
> 
> One (maybe there are more) special case of tx_lpi_timer handling is
> Realtek chips, as they store the LPI timer in bytes. Means whenever
> the link speed changes, the actual timer value also changes implicitly.
> 
> Few values exist twice: As a master config value, and as status.
> struct phy_device has the status values:
> @eee_enabled: Flag indicating whether the EEE feature is enabled
> @enable_tx_lpi: When True, MAC should transmit LPI to PHY
> 
> And master config values are in struct eee_cfg:
> 
> struct eee_config {
> 	u32 tx_lpi_timer;
> 	bool tx_lpi_enabled;
> 	bool eee_enabled;
> };
> 
> And yes, it may be a little misleading that eee_enabled exists twice,
> you have to be careful which one you're referring to.
> 
> ethtool handles the master config values, only "active" is a status
> information.
> 
> So the MAC driver should:
> - provide a link change handler in e.g. phy_connect_direct()
> - this handler should:
>    - use phydev->enable_tx_lpi to set whether MAC transmits LPI or not
>    - use phydev->eee_cfg.tx_lpi_timer to set the timer (if the config
>      value is set)
> 
> Important note:
> This describes how MAC drivers *should* behave. Some don't get it right.
> So part of your confusion may be caused by misbehaving MAC drivers.
> One example of a MAC driver bug is what I wrote earlier about
> stmmac_ethtool_op_get_eee().
> 
> And what I write here refers to plain phylib, I don't cover phylink as
> additional layer.
> 

Thank you for your detailed explanation. It has been very helpful and has 
clarified how the code behaves.

Based on your and Andrew's input, I agree that phy_update_eee() is not needed.

I will ensure that our implementation follows these guidelines and will 
address any potential issues with misbehaving MAC drivers.

Thank you again for your valuable insights.

