Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9E2C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxZnvirIyErX9mPNWRA9E5ZM7s+JLzX2G+ZuBG29gKQ=; b=HJuaCrWsLe7MgR9RSqAtxP1Xk5
	HKv49665+nYmPM8f2DsD1o5exUFVZpT9Op9BSH5785Zax30CIx/3sOaqupPPiNjqAP4/bU3zCJy42
	S0nXQOIqfr2J5pUElVRgQcq6eQwPjyo078L1IQUMbElHnRFwdbKzLsnxXuL1fZrROsir9qrqvLiqL
	xBzb0i1G7/geqUv3Y8X5PgW0EjgxPGgD5Fouwo3CWSJQ3q7IIcwmgHTLM8H0Ir9OdvXlHZGEfTEHC
	L0v/OiBrBBBf0xglKzIA5xGz1BoDzrNzKLysHPWLmZFc/I0OmbmaxLwSEOHc+eNrmXVYhxfxfB5hV
	hlTOhYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncCj-00000007DEW-0fuZ;
	Thu, 27 Feb 2025 11:37:25 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbts-000000078mQ-2nkP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740655077; x=1772191077;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CNhFV9T14sh7OY2SRFlpy7R8+gM04CqgJ0xYvF9HFpo=;
  b=Rn7u7UFvNDOSQ+ndUMGp+APrFdOkRY9rBoWIDWIGBBjs+FEoVnAfuZsU
   GNU9SeXM7VK0bJJs1MAWESPssJ54ael8VkpgdZ/Cq4OzVC6DE3KoEi9Ce
   scz2icOCicCgejUglUrofYvQUmCzOGU9atgHRQyapVK/OmfbL4LByEGe9
   R2S0eKBqmeVTiIlgqn4STBP14GJlll+HeF0SvdDoXk/nyb7EOosTdcdjR
   gjYyH/L2IwYnv8LJ9ewMbg379a1NbiK03H1uAUrjh5Gyp0p72quV5ugew
   UtarqT1LL+MPAN9KV8iMTWMQft4RiEMkk2JzUvBfrU3QHZgJebg0ZDjqY
   Q==;
X-CSE-ConnectionGUID: qyuASdtjQvWCQJSpQmq8gA==
X-CSE-MsgGUID: WsXkJUniTT637QJngd8I2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58955489"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="58955489"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:17:49 -0800
X-CSE-ConnectionGUID: 3Tb9u1sUQPaKicuPXGkj2w==
X-CSE-MsgGUID: 45DyLiKXRPyvMBlpNWZcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117172315"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.81.210]) ([10.247.81.210])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:17:41 -0800
Message-ID: <1ff2fcac-d9d5-4c70-a101-f7026b50646a@linux.intel.com>
Date: Thu, 27 Feb 2025 19:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 1/6] net: phylink: use pl->link_interface in
 phylink_expects_phy()
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
 <20250226074837.1679988-2-yong.liang.choong@linux.intel.com>
 <Z780cM9bejxhzTXO@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z780cM9bejxhzTXO@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031756_740773_C3BB809F 
X-CRM114-Status: GOOD (  15.75  )
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



On 26/2/2025 11:34 pm, Russell King (Oracle) wrote:
> On Wed, Feb 26, 2025 at 03:48:32PM +0800, Choong Yong Liang wrote:
>> The phylink_expects_phy() function allows MAC drivers to check if they are
>> expecting a PHY to attach. The checking condition in phylink_expects_phy()
>> aims to achieve the same result as the checking condition in
>> phylink_attach_phy().
>>
>> However, the checking condition in phylink_expects_phy() uses
>> pl->link_config.interface, while phylink_attach_phy() uses
>> pl->link_interface.
>>
>> Initially, both pl->link_interface and pl->link_config.interface are set
>> to SGMII, and pl->cfg_link_an_mode is set to MLO_AN_INBAND.
>>
>> When the interface switches from SGMII to 2500BASE-X,
>> pl->link_config.interface is updated by phylink_major_config().
>> At this point, pl->cfg_link_an_mode remains MLO_AN_INBAND, and
>> pl->link_config.interface is set to 2500BASE-X.
>> Subsequently, when the STMMAC link goes down and comes up again,
>> it is blocked by phylink_expects_phy().
> 
> I thought we ascertained that it's not "link goes down" but when the
> interface is taken down administratively. "Link goes down" to most
> people mean an event such as the network cable being unplugged.
> Please fix the patch description.
> 
>> Since phylink_expects_phy() and phylink_attach_phy() aim to achieve the
>> same result, phylink_expects_phy() should check pl->link_interface,
>> which never changes, instead of pl->link_config.interface, which is
>> updated by phylink_major_config().
>>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> With, and *only* with the above fixed:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 
Thank you for your feedback and clarification. I will update the patch 
description to accurately reflect the administrative interface down scenario.

