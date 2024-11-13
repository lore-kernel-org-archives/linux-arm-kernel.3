Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E2FD41C2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbWyTdx7HJ7niEllDXTu+jkaLJF04ROmcRAa3Frc5yM=; b=urSC4pf7I9dQIBQdpEBZ2pkCDD
	v02vE7A0P/4Ey8Q/OOFXPvhOJ68nvAOTDJ3S3oIBjoqLNTbFHV6iaAmnaR9f29ZNSzzW/bJqDGTpP
	tSkvv8ju0IOgJE7Agb4rs1IWKfXUjSNzAy8wFpZzzNHdP15fOmxLj1W7X/2iQL62XePxn8NbnXjDR
	qm4K8YETkOu+HIDwp31fbe66Jn2jiG893TIN4cy9ozDiBkIvWN8j5ZQ3g8aWzKwABEWMDj6OzqTSf
	J0yfooPIa7GkHjByI/kn2kckwoCZVQn21mmPKnwncj0zVMmtIANMAzwDdwD5/vDHtp3+w9G0h2Z3T
	QxnxgnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBANH-00000006Omp-0FCq;
	Wed, 13 Nov 2024 10:13:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBALP-00000006OIW-1p6n
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Nov 2024 10:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FbWyTdx7HJ7niEllDXTu+jkaLJF04ROmcRAa3Frc5yM=; b=ceoZ+m37i0DIp4d5Z9OgolUXQD
	yzT1GU2cdJTZ7T6Euo84h7T4VLDIiCMK+z30Hcng8G5BCYZAM3kih0J32gsS7zqphKNpcLZpV4Y78
	7vFejK9pf2w1eUxaD6gr3EzbTb8bquwYBLY4mDG0EaoeKR/CNqLR4hLNkl5xC0f5p5nXBl4Cu2r/R
	KaEJ7BXex5dR7nR+vWNIlu6+kcY/xR3FhGI8QKbgqfSVeLbf1wvUTn5lUq2MLdXdufIXD8JP5xl/d
	m1iHU6Znn1DDUtCtC1oG5t+rgdipUlsaPYUE2PpNex++2969l1xwJfPXLwuh6i9iGLQRIfS4ga4f1
	MxawUmGw==;
Received: from mgamail.intel.com ([192.198.163.14])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBALM-0000000DF0z-0qNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 10:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731492684; x=1763028684;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vy8Iqu3OFXniKxvWbng1DoVI0tlBlU/xFf+XDj6PoTQ=;
  b=fUJJ9i+agRGChJS1kikwzOtfp0ks1iRU8mbHz25iFJrV446/Fd+syFbD
   6egXYyb2Pv4HIqicrQcKtgNT3u+8RbxdBWk5lCtb0ds+K11S+NeLLFP+L
   KeQpQ30ZlHtkzEKdy4aOx+Lr4Kel9vhcEV7It35LsiqDVxGyu5pdOPlcH
   f3DjJNWNPAtXbzW09rA2MbU4muJzXyyK+VIXO2vne6Oc3eMSnqp3N8zjt
   F8W9+YSFjfwVQ9xINuhXkXqvLKvSDp/vcfxpLLvBm9ak7Q1eaFMRcAqIL
   9busyO2HyYnLNrZxVPje1GsebPQSVhdiFDamZYLe3HPXDqVcWxNJqrrad
   Q==;
X-CSE-ConnectionGUID: zfLKRCm0Tfakj9nlOZOc5Q==
X-CSE-MsgGUID: 28K5F8Z9TGWzZpiuTNPKag==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31608047"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="31608047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:11:15 -0800
X-CSE-ConnectionGUID: 05tXbYHhRACmOLJ2EKDmjQ==
X-CSE-MsgGUID: uVFc8516StGJKtpbzyMqgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87395176"
Received: from hooisan-mobl.gar.corp.intel.com (HELO [10.247.100.100]) ([10.247.100.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:11:11 -0800
Message-ID: <eb937669-d4ce-4b72-bcae-0660e1345b76@linux.intel.com>
Date: Wed, 13 Nov 2024 18:10:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/2] net: phy: Introduce phy_update_eee() to update
 eee_cfg values
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
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
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <71b6be0e-426f-4fb4-9d28-27c55d5afa51@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_101124_673623_8ED854DE 
X-CRM114-Status: GOOD (  18.89  )
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



On 12/11/2024 9:04 pm, Andrew Lunn wrote:
> On Tue, Nov 12, 2024 at 12:03:15PM +0100, Heiner Kallweit wrote:
>> In stmmac_ethtool_op_get_eee() you have the following:
>>
>> edata->tx_lpi_timer = priv->tx_lpi_timer;
>> edata->tx_lpi_enabled = priv->tx_lpi_enabled;
>> return phylink_ethtool_get_eee(priv->phylink, edata);
>>
>> You have to call phylink_ethtool_get_eee() first, otherwise the manually
>> set values will be overridden. However setting tx_lpi_enabled shouldn't
>> be needed if you respect phydev->enable_tx_lpi.
> 
> I agree with Heiner here, this sounds like a bug somewhere, not
> something which needs new code in phylib. Lets understand why it gives
> the wrong results.
> 
> 	Andrew
Hi Russell, Andrew, and Heiner, thanks a lot for your valuable feedback.

The current implementation of the 'ethtool --show-eee' command heavily 
relies on the phy_ethtool_get_eee() in phy.c. The eeecfg values are set by 
the 'ethtool --set-eee' command and the phy_support_eee() during the 
initial state. The phy_ethtool_get_eee() calls eeecfg_to_eee(), which 
returns the eeecfg containing tx_lpi_timer, tx_lpi_enabled, and eee_enable 
for the 'ethtool --show-eee' command.

The tx_lpi_timer and tx_lpi_enabled values stored in the MAC or PHY driver 
are not retrieved by the 'ethtool --show-eee' command.

Currently, we are facing 3 issues:
1. When we boot up our system and do not issue the 'ethtool --set-eee' 
command, and then directly issue the 'ethtool --show-eee' command, it 
always shows that EEE is disabled due to the eeecfg values not being set. 
However, in the Maxliner GPY PHY, the driver EEE is enabled. If we try to 
disable EEE, nothing happens because the eeecfg matches the setting 
required to disable EEE in ethnl_set_eee(). The phy_support_eee() was 
introduced to set the initial values to enable eee_enabled and 
tx_lpi_enabled. This would allow 'ethtool --show-eee' to show that EEE is 
enabled during the initial state. However, the Marvell PHY is designed to 
have hardware disabled EEE during the initial state. Users are required to 
use Ethtool to enable the EEE. phy_support_eee() does not show the correct 
for Marvell PHY.

2. The 'ethtool --show-eee' command does not display the correct status, 
even if the link is down or the speed changes to one that does not support EEE.

3. The tx_lpi_timer in 'ethtool --show-eee' always shows 0 if we have not 
used 'ethtool --set-eee' to set the values, even though the driver sets 
different values.

I appreciate Russell's point that eee_enabled is a user configuration bit, 
not a status bit. However, I am curious if tx_lpi_timer, tx_lpi_enabled, 
and other fields are also considered configuration bits.

According to the ethtool man page:
--show-eee
Queries the specified network device for its support of Energy-Efficient 
Ethernet (according to the IEEE 802.3az specifications)

It does not specify which fields are configuration bits and which are 
status bits.

