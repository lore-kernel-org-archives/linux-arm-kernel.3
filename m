Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69866D62040
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nslOnfEsidr7hcS2PGm1GMlaVvkbcFEiOpbvPxiS7s=; b=VxZxYKs3ipi8huG1XM/UdCY5R5
	CEG+w0U9oW9+nhs7RlWwFdWATQK01wq2U3WaqvDgrHerfxkGj8+a0Ik9fg2P/bipMsodXTbdPqd+6
	Y/EErwINZMmpo7gfSQejo6MvL/MUU6nqL4j503ya3juoFRLjIrTGewAoC+cSPu/zucIutLOrMxxFj
	h0lgt8pmkhFzCdcryobjiAkv45PvpgNrjF3KPn8MnHCpPw7PiwlleS9xIub1qCcvYu2LdQfiEsKCM
	pjSKLfSfxF9Cy6WHidJ12/Wg/bqP/Di7vkqtdAHhpdTikYlMt8lV39H3ylVhwt4X+lFypDgssIWDj
	G9+/EenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKCy-0000000BqBs-2qpb;
	Tue, 19 Nov 2024 09:07:40 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKC1-0000000Bq1w-2NQG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732007202; x=1763543202;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HtjEr6MyQAiTzXqILd1meE2GmGtMVF3rg86A6w3dlq4=;
  b=gWHlImR8fhb91KMk8M1uwht27cVCF48lu9xyelIlUZR0eCsCryr4a96Y
   HVjPFspZqV00tVl7EAoZ5agr2CmiFcjxbGPtB3Odik1hNunnh0N5Vl9Es
   Z23FjriF8YGfTLu//1qGoqRfpvMZb7MKm2P4Vhao1po7ENlXKX7vGeeSO
   iZVAtugiZY3IctH19F1lvcQEG28Kvppuaif2ZJDmbiTgqw/B9oUW4A5ZW
   vnFNeMzlF4vM4PfgTkJqWFFdACCrt3EEu7kuI5/zWabTVd2q4TIt087l5
   th6yv3Ehef1P9WuNRihAbyURdTu2F8SO4TwUEZPdXo6rWMoArIz1pCdGj
   A==;
X-CSE-ConnectionGUID: 842uCxJzS6+q8jBvLEInNQ==
X-CSE-MsgGUID: vXngEw9mRCOmY3IJ1aC8Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19605058"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="19605058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 01:06:39 -0800
X-CSE-ConnectionGUID: zsvHZ+PwTi68k0a9K6UDpA==
X-CSE-MsgGUID: 4tKkEW0eSyiBbNpB7+8d9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89905283"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.75.104]) ([10.247.75.104])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 01:06:36 -0800
Message-ID: <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
Date: Tue, 19 Nov 2024 17:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: phy: replace phydev->eee_enabled with
 eee_cfg.eee_enabled
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
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_010641_654342_58DB15BA 
X-CRM114-Status: GOOD (  27.47  )
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



On 15/11/2024 9:37 pm, Russell King (Oracle) wrote:
> On Fri, Nov 15, 2024 at 07:11:50PM +0800, Choong Yong Liang wrote:
>> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
>> designed to have EEE hardware disabled during the initial state.
>>
>> In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
>> Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
>> enabled. However, when phy_start_aneg() is called,
>> genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
>> This causes the 'ethtool --show-eee' command to show that EEE is enabled,
>> but in actuality, the driver side is disabled.
>>
>> This patch will remove phydev->eee_enabled and replace it with
>> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
>> it will follow the master configuration to have software and hardware
>> in sync.
> 
> Hmm. I'm not happy with how you're handling my patch. I would've liked
> some feedback on it (thanks for spotting that the set_eee case needed
> to pass the state to genphy_c45_an_config_eee_aneg()).
> 
> However, what's worse is, that the bulk of this patch is my work, yet
> you've effectively claimed complete authorship of it in the way you
> are submitting this patch. Moreover, you are violating the kernel
> submission rules, as the Signed-off-by does not include one for me
> (which I need to explicitly give.) I was waiting for the results of
> your testing before finalising the patch.
> 
> The patch needs to be authored by me, the first sign-off needs to be
> me, then optionally Co-developed-by for you, and then your sign-off.
> 
> See Documentation/process/submitting-patches.rst
> 
> Thanks.
> 
> pw-bot: cr
> 

Sorry for the late reply; I just got back from my sick leave. I wasn't 
aware that you had already submitted a patch. I thought I should include it 
in my patch series. However, I think I messed up the "Signed-off" part. 
Sorry about that.

The testing part actually took quite some time to complete, and I was 
already sick last Friday. I was only able to complete the patch series and 
resubmit the patch, and I thought we could discuss the test results from 
the patch series. The issue was initially found with EEE on GPY PHY working 
together with ptp4l, and it did not meet the expected results. There are 
many things that need to be tested, as it is not only Marvell PHY that has 
the issue.

With your patch, most of the issues were resolved based on the testing. 
However, the set_eee was using the old value of eee_enabled and was not 
able to turn EEE on or off. I think Heiner's patch already solved that part.

With all the solutions provided, I think the only patch left that I need to 
submit is the one calling 'phy_support_eee()' from stmmac.

