Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A91C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYOi8Pn86GLJLRg1NK8G+xbOZu8C3DTaYMw9S8/4958=; b=KifYU2SFOnactVQ89dcY5f9jES
	sX+7znRlIWAVxKlofbRPCArTQ7H55sxnSlwzBuQPcl9Um4dO8FZVItEucIuuVISWVyuCTFgU4JeIL
	/WV9uT1qxPcYUS5oUUls4bBUgeXdWaPjQMoNxVMVO1dV5K2qQRpzE/FaGcWw4oaxZs1Yiw+EOpyFr
	eZ4Buicx6VyboKB6Bn3YvERJA8ASXXxd41noqFQyyGtsZwY8/mZ+HmKDhM79/lzDT26n+uSVv3QmO
	edP5xHYUc1UBr+yY2ljaZn1FcP4PFFIsz0h/dsHGBj3+UO4mcr9968aRYdubhkmR8UfGsUp81+Z2R
	gN1PobRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncEE-00000007DKf-09PV;
	Thu, 27 Feb 2025 11:38:58 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbu8-000000078st-2uV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740655093; x=1772191093;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K9BvBv3hLYw0IGq8eJuii6hDq4mM87UTjkwNlZVz44I=;
  b=P0GodFDMBoFSHwz64pmcR4XSAZAWAyn1z8UM4Z4Kyz+Q37iAnXhhRpPx
   ySANvXdGi63KdLMqnPNwDYFNhoNabHj4jAzX0yVCCdQniiCnmAvhZLTxi
   zpbHaol7t+MCM/9JKOSHPC9RmW79+BQRnOrZvQSwGJAxBvd2DOnhfQS2W
   1hu7e7FadgT8vTDwh8MPbRaB0Sx8gvObMEkdIFSJ067I8j3nwgA1LE3W5
   1Z9bp2otGB1+f7wLT13XT/NX5WkJ+Lc2Nyr8knWvXHd8Unw4oaaKUF91x
   BaBb7SRGblN3/tBZZqSEizuWKbhqI+C5pJlutaznhlLWooWO/WR4uqSSa
   Q==;
X-CSE-ConnectionGUID: k2I6Jp/9QP+4de8CTHkz0A==
X-CSE-MsgGUID: WHUHFKLxTUKiWWdOdmPehg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58955539"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="58955539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:18:12 -0800
X-CSE-ConnectionGUID: PDI93uncReGm6znVKxCg+w==
X-CSE-MsgGUID: 4PYYlND1R6+gWOxBvTmk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117172348"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.81.210]) ([10.247.81.210])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 03:18:04 -0800
Message-ID: <55ddacb9-dc00-4477-aeab-9b8861563194@linux.intel.com>
Date: Thu, 27 Feb 2025 19:18:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 2/6] net: pcs: xpcs: re-initiate clause 37
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
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
 <Z78141ZNWEYDSi5l@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z78141ZNWEYDSi5l@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031812_779492_ECD986EC 
X-CRM114-Status: GOOD (  20.91  )
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



On 26/2/2025 11:40 pm, Russell King (Oracle) wrote:
> On Wed, Feb 26, 2025 at 03:48:33PM +0800, Choong Yong Liang wrote:
>> diff --git a/drivers/net/pcs/pcs-xpcs-wx.c b/drivers/net/pcs/pcs-xpcs-wx.c
>> index fc52f7aa5f59..f73ab04d09f0 100644
>> --- a/drivers/net/pcs/pcs-xpcs-wx.c
>> +++ b/drivers/net/pcs/pcs-xpcs-wx.c
>> @@ -172,11 +172,9 @@ int txgbe_xpcs_switch_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
>>   		return 0;
>>   	}
>>   
>> -	if (xpcs->interface == interface && !txgbe_xpcs_mode_quirk(xpcs))
>> +	if (!txgbe_xpcs_mode_quirk(xpcs))
>>   		return 0;
>>   
>> -	xpcs->interface = interface;
>> -
> 
> ...
> 
>> --- a/drivers/net/pcs/pcs-xpcs.c
>> +++ b/drivers/net/pcs/pcs-xpcs.c
>> @@ -602,12 +602,37 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
>>   		__set_bit(compat->interface, interfaces);
>>   }
>>   
>> +static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
>> +				      phy_interface_t interface)
>> +{
>> +	int ret = 0;
>> +
>> +	if (xpcs->interface != interface) {
>> +		if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
>> +			ret = txgbe_xpcs_switch_mode(xpcs, interface);
>> +			if (ret)
>> +				return ret;
> 
> The above modification changes the functionality.
> 
> In the old code, txgbe_xpcs_switch_mode() does its work when
> xpcs->interface is not the same as interface OR txgbe_xpcs_mode_quirk()
> is true.
> 
> Your replacement code calls txgbe_xpcs_switch_mode() when
> xpcs->interface is not the same as interface, *and* it can do its
> work when txgbe_xpcs_mode_quirk() returns true.
> 
> So, e.g. when txgbe_xpcs_mode_quirk() returns false, but the interface
> changes, txgbe_xpcs_mode_quirk() used to do its work, but as a result
> if your changes, it becomes a no-op.
> 
> The point of txgbe_xpcs_mode_quirk() is to always do the work if it
> returns true, even if the interface mode doesn't change.
> 
> Therefore, this patch is logically incorrect, and likely breaks TXGBE.
> 
Thank you for pointing out the oversight. I will review the logic and make 
the necessary corrections to ensure the patch does not disrupt the expected 
behavior.

