Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA2C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 03:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1SG2C5I2TgnvoqStIRUNb2mF/vOzm6Bxai2vAmWHOg=; b=Yb9PF0xCQq6EJaSsCh7rC+yMcG
	HWfncCPb0vwWA2IY/NLymNUkDwtGEbikVpfz9sNwLmweyG4tKU/rDcVQcrqsMTAyO17LSeLOd7+1s
	8OJ9Xd9sa9GYTS+4+DjMf0eYJFsd3aB4MMd3k4HG25tEiQxWod1DVxBmLw68nyGDYLKRoK0+3Z1HP
	twcQbgHaTKRJ8SjgtSXWB2I8jaWYG/4fSc7acnZk2NXNZVhXVLR/QVsZeBiG3Rg0IyDYYd9sB0zgO
	1L7Ty+EAubqetI3o3uNFVlO+RP2LWyVQBRIRWGHmIs33YAwdHdnXlyPOUnzhl+Njq97uESA4qaa05
	Cvl06gAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgbck-0000000C1RB-3Ad3;
	Sat, 08 Feb 2025 03:35:18 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgbbL-0000000C1FG-3HDp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 03:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738985632; x=1770521632;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E4ef/ftjH8Y83ESfkZ/ek4OwMIc3mSgBksj42G9pEyE=;
  b=Rmj+Olqlkl4daXgmiDzoy7Slo4PX3jDgiNYhOr8eb1P+dd6o2IJPI0zE
   6uLxvc2UuK9AaVM+cn4VDu06ogNXEtefVytyZQE8A57MXojrkqPr6qfVs
   UhlWJR3yRmr+yCOFYP+xOSBadRSvxqo+am4vaYRGKwYRclJ1q/ns90aBK
   y5t/STxtFxhDCPXMEam8P+OOSGSXU+hV9ZxMi/LkcRlJHVwx8t6KmBAzD
   +ZMEtGs0lcqFGUSqdz9AMMHX81P091//On623gYGoo21nHxtkuSUv5fPD
   QZDP+IF5kRB21fWut0fgUCQ+lNzHi4JD1kRqtyGBXdRD17yi9CNRcVBPf
   g==;
X-CSE-ConnectionGUID: 6w1h+b8UQhuH/A3Eljzceg==
X-CSE-MsgGUID: /TqxbaIRS0WF0o25P2lpOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39541416"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="39541416"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 19:33:48 -0800
X-CSE-ConnectionGUID: KfrjFuMpRnayDLYzhLb9nA==
X-CSE-MsgGUID: nahwQkBJSY+cDoGI/mkrIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="111621205"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.21.123]) ([10.247.21.123])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 19:33:41 -0800
Message-ID: <71887246-d30f-4134-8c6d-b379477b2457@linux.intel.com>
Date: Sat, 8 Feb 2025 11:33:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/7] net: pcs: xpcs: re-initiate clause 37
 Auto-negotiation
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
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
 <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
 <12e86fbe-9515-4b81-951c-8bf86e2939d6@lunn.ch>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <12e86fbe-9515-4b81-951c-8bf86e2939d6@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_193351_908953_1E311E5F 
X-CRM114-Status: GOOD (  15.07  )
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



On 7/2/2025 9:32 pm, Andrew Lunn wrote:
>> Good point. I cannot find this scenario in the datasheet. Please allow me
>> some time to test this scenario. I will update you with the results.
> 
> By data sheet, do you mean documentation from Synopsis, or is this an
> internal document? Assuming the hardware engineers have not hacked up
> the Synopsis IP too much, the Synopsis documentation is probably the
> most accurate you have.
> 
>>> What about 1000BASE-X when AN is enabled or disabled and then switching
>>> to SGMII?
>>>
>> According to the datasheet, a soft reset is required.
> 
> Do you know if this is specific to Intels integration of the Synopsis
> IP, or this is part of the core licensed IP?
> 
> We need to understand when we need a quirk because intel did something
> odd, or it is part of the licensed IP and should happen for all
> devices using the IP.
> 
> 	Andrew
> 

Hi Andrew,

Thank you for your questions. Just to clarify, when I mention the 
"datasheet," I am referring to the documentation from "Synopsis - 
DesignWare Cores Ethernet PCS" and not specific to Intel's documentation.

