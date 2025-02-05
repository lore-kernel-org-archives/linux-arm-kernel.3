Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ACDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UB90fKNNho5pG3Wox1T80sbOlO+p9uD6JEacPgEMiM=; b=h61Z0cHOElxGI7hIM38wsr8ZIY
	l7KB9/WeD4C4a/7I/sxWT/ZKdPkEmLtxUbHb/0/WOQXeCl5u+Jlb+IaO9hUnhv0jGOS3mr4kMBvAe
	y1p6vZRPPt2Qpt1qWHmF4VL57UZQ6+EbL1FLn51HtuskLSKDi8oBuAc1nKX2iKiOjr3gQWxHSfZnV
	SPLxdOza3kjwycAzQCemwhwYCYDNT+YJkQq4XR177ZkJ9mJff2VR8oTTfpLg56doh6/s3iUJM26eH
	rqOj0fHhxAbaOJ9Q2ZyzE2dB4X0OWytjPmRT5QZ0iE0XzhE2gAZgshFPx4GwjnV0tI7izfuU6DJnp
	t2hsRH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZGc-00000002RyB-2Rgo;
	Wed, 05 Feb 2025 06:52:10 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZFG-00000002RpG-0Otd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 06:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738738246; x=1770274246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=55hxtyx4DMhF2qYY+kBeRk1DqvJKGJ9IUbKzhKO8vbg=;
  b=RHb5+lrDLD5IB6h65QEMHLdyYCmWpP8/8ViPXlMpSkl0Q2yXLNHiLc3r
   EKEXeqRw//Ij+/PWw4HU1xPFXxaLBKvDWysjEYEppu29bwJTFG6+DLxBF
   5BNAbRQFEVFd4MI1RS4bGPmD9DbuyqS5IzUsdZ6AmYYuZw9uTSk5+8ix9
   LWt2ZXu+7zGrYw+kOtVG7mxbjLhJDLByzuUyNIYlmbPBTZln6od0clvku
   vxXIVXkneHPFahW5ZP33W5R421kjpTEUxSng7tdHzudHZ4O5JmbQCzaOM
   2eMPx/+tYMYNZay+VQJi5pm1zvgtFECxmgnYzI3Hibcl4BwDqlnmUs464
   g==;
X-CSE-ConnectionGUID: fGlY3Nk7RhCDvQhvPyl6Cw==
X-CSE-MsgGUID: voXySTRbRam1HXELeFQX+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39175594"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39175594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:50:44 -0800
X-CSE-ConnectionGUID: oo32QqH1QrmHW2tYAHIDrw==
X-CSE-MsgGUID: W8AT1xq9Tz+DU8R6MpUXgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="111400846"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.100.100]) ([10.247.100.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:50:35 -0800
Message-ID: <c25c2da7-18fa-46b7-b992-fb5b17a01749@linux.intel.com>
Date: Wed, 5 Feb 2025 14:50:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/7] net: phylink: use act_link_an_mode to
 determine PHY
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
 Andrew Halaney <ahalaney@redhat.com>, Serge Semin <fancer.lancer@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-2-yong.liang.choong@linux.intel.com>
 <Z6ICO06RbJ1ulDh1@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6ICO06RbJ1ulDh1@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_225046_243571_58FB3B10 
X-CRM114-Status: GOOD (  22.24  )
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



On 4/2/2025 8:04 pm, Russell King (Oracle) wrote:
> On Tue, Feb 04, 2025 at 02:10:14PM +0800, Choong Yong Liang wrote:
>> When the interface mode is SGMII and act_link_an_mode is MLO_AN_INBAND,
>> switching to the 2500BASE-X interface mode will trigger
>> phylink_major_config, and act_link_an_mode will be updated to MLO_AN_PHY
>> in phylink_pcs_neg_mode when the PCS does not support in-band mode.
>> The MAC and PCS will configure according to the interface mode
>> and act_link_an_mode.
> 
> act_link_an_mode must only ever be updated by phylink_major_config()
> since it defines state for the currently configured mode, and must
> stay in sync with how the hardware has been programmed at all times.
> 
>> However, when the interface goes link down and then link up again, the MAC
>> will attempt to attach the PHY.
> 
> Why is the MAC trying to disconnect and reconnect the PHY on link
> changes? Do you really mean "link down" and "link up" as in "connection
> with the link partner" or do you mean administratively taking the
> interface down and up (which is a completely different thing.)
> 

The "link down" and "link up" I mention in this part refer to using the 
command:
ifconfig <interface> down/up

>> The interface mode remains as 2500BASE-X,
>> but cfg_link_an_mode still holds MLO_AN_INBAND. This causes a failure to
>> attach the PHY.
> 
> Hmm.
> 
> pl->link_interface is the configured setting from firmware etc and doesn't
> change.
> 
> pl->cfg_link_an_mode is the configured mode from firmware etc which was
> passed to phylink_create(), and again doesn't change.
> 
> So there should be no difference unless something weird is going on,
> which as you're talking about stmmac, could be the case.
> 

Thank you for pointing that out.

I think I was confused between pl->link_interface and
pl->link_config.interface. The function phylink_attach_phy() uses
pl->link_interface, whereas phylink_expects_phy() uses
pl->link_config.interface.

When the interface switches from SGMII to 2500BASE-X,
pl->link_config.interface is updated by phylink_major_config().
So, when the STMMAC link goes down and comes up again,
it is blocked by phylink_expects_phy().
At this point, pl->cfg_link_an_mode is MLO_AN_INBAND and 
pl->link_config.interface is 2500BASE-X.

Since phylink_expects_phy() is trying to achieve the same checking 
condition as phylink_attach_phy(), it should use pl->link_interface for the 
check as well.

Does that make sense to you?

> More information needed, but as this patch currently stands, I deem it
> to be incorrect, sorry.
> 


