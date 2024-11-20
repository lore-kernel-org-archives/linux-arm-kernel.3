Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0A1D63925
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcRy9ENgI4dw0UlDdOV5tCi4tXBKLKbiq7w57FjAmcA=; b=Sms5if1eHgmOigG2Mv3f0TYNFp
	JpjsAnC9cY750c+d87UNzHMFjeZZ8K/yq6uYnuu4sMf1qFxL2D7ZncQ2apqBDRJHrz4fsv9x4Toku
	aylBJF3XOixahxbY34bMrmwKvaVf78iaA7GhIcBfr83jbkFPWC9S+m6g93PAu1k4Kd/YNZowXOf8h
	HCR9xC7fdADnOPm/xudHnb2H8SA7c8L/6sd4YIx4hW+H/AuToQXDch890dW9xpnTads+q8Z+kHnlo
	YdkCJyUe/NlbnPaVAc3kasBtZZdPEyvzVk8vd1kp4Nsa3DKojqnJ/BqWBPMeDILg1s6i+vbDjdcwz
	8wSBhD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiGw-0000000F5pz-0SGn;
	Wed, 20 Nov 2024 10:49:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiFz-0000000F5f4-0wNY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732099703; x=1763635703;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DdnwLC1nlOOJXfXe14SuzanZGrbtUU6kyE6ng30glmk=;
  b=N8fua/nL7N1mEBKiJlYDMHAgHBTTvsl0BEChJKfJm3IfiWGDkmgbdKgg
   JvvGx0BGIWLqI0uT2ZB30urO6vCsJ48l9on+IdUVQFCp/NflxDXSvefUe
   sMYY7wNDVjqyompbHveIuvQQzDfM34hHuZ55wT5eeKHPlwMJvZxQk9Xm2
   CFwkTqMdjkMInaioKoDQfWKE53cLd4E83S1Z+H+9KwKGB9legwPv6n10c
   bRNwbMqYUxoYOVa7JK3UyCOMr0rQs+QPWA4KxoTpmUp6SdpYiEMBOu1XV
   l8soevPRIGYRCK4LLQvQm/hWbG47ipGTMQsRpp7gwzjdakeboKD1gbUPc
   A==;
X-CSE-ConnectionGUID: eD0y585SQemU/MowAZJDcg==
X-CSE-MsgGUID: ClHEgQlOSb6sBgRt2GZEdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31521010"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="31521010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:48:17 -0800
X-CSE-ConnectionGUID: W48YHOZpTiGL35DWyTxvhg==
X-CSE-MsgGUID: BIrFOaQ7Sv+bsw9FnoXbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89677797"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.82.175]) ([10.247.82.175])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:48:13 -0800
Message-ID: <14202f42-5408-4127-8664-8ad958fb2046@linux.intel.com>
Date: Wed, 20 Nov 2024 18:48:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: phy: replace phydev->eee_enabled with
 eee_cfg.eee_enabled
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
 <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
 <ZzxerMEiUYUhdDIy@pengutronix.de>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZzxerMEiUYUhdDIy@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_024823_278309_B3ACC943 
X-CRM114-Status: GOOD (  17.71  )
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



On 19/11/2024 5:47 pm, Oleksij Rempel wrote:
>> Sorry for the late reply; I just got back from my sick leave. I wasn't aware
>> that you had already submitted a patch. I thought I should include it in my
>> patch series. However, I think I messed up the "Signed-off" part. Sorry
>> about that.
>>
>> The testing part actually took quite some time to complete, and I was
>> already sick last Friday. I was only able to complete the patch series and
>> resubmit the patch, and I thought we could discuss the test results from the
>> patch series. The issue was initially found with EEE on GPY PHY working
>> together with ptp4l, and it did not meet the expected results. There are
>> many things that need to be tested, as it is not only Marvell PHY that has
>> the issue.
> 
> Hm, the PTP issue with EEE is usually related to PHYs implementing the
> EEE without MAC/LPI support. This PHYs are buffering frames and changing
> the transmission time, so if the time stamp is made by MAC it will have
> different real transmission time. So far i know, Atheros and Realtek
> implement it, even if it is not always officially documented, it can be
> tested.
> 
> Regards,
> Oleksij

Thanks, Oleksij, for the suggestion.
The actual problem we are facing is that the software and hardware 
configuration is not in sync.

With the following patches applied, the issues were fixed:
- 
https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
- 
https://patchwork.kernel.org/project/netdevbpf/patch/a5efc274-ce58-49f3-ac8a-5384d9b41695@gmail.com/
- 
https://patchwork.kernel.org/project/netdevbpf/patch/20241120083818.1079456-1-yong.liang.choong@linux.intel.com/

