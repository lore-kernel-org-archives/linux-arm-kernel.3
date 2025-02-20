Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B043BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 02:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2LR/JimVsSln6OjvLMxASghoMn/729DMpvubUk9y+U=; b=wj9F8zA3fLgPPtUfGhReuLykUg
	aMhIls+7uGVccfzLwaQwH/TvzdYR/3eR1jnpl+TUEYmLD4YHuq8uyQFhByV7gj2m0UKZuopwiLTJK
	zoOcp/oQ5myOm3m1mjMu6KGSswDjPNs8Ef/osUX1WRCeWKRqNFRr8BAV7qH3M01gB2FNwM3zDaoPl
	sOwtT3ITHis3Wq24eYFo4Vswh7acs0gOMxyrEnQ0sK1R/rt3WAM1KOz22dqKIU4joy/0QnClMLWvz
	eUUe7LMrTbs5Ih1bqnlilDpb/AIUfi9a+l1mWw8ZjTYBj41ZE4ZsO0u9rPwrrXb50HjNOoWdwpYc7
	bpSXZQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwLM-0000000GLYg-2ysv;
	Thu, 20 Feb 2025 02:31:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkwJs-0000000GLCi-1Gf3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 02:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740018584; x=1771554584;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qHJy/wVMlxB0RzaDnffLNI7sYULYz+gIzJ4B57XyBGM=;
  b=DCHDI8cxdnrWV2YHRO9KIKN2eUe1MsHuNaPpO5SG1CkqGEi5k6q/DqYl
   4N+YnMcLg1hj7s62X7FTuY8lO/AcGJewPBpugio9q53WHXcODwuEubP/R
   5vgu0hgCTs80QcjwtZcDa+bdLk/CJiF384EBlD35+AM/ZxtEgUEPYZvjF
   mo0lWTwuzoTesxymloA8hnrQ+iNVj+vAC/ApvXNNFZdO3vquFIxEWKDCy
   TkJMTFHTPBnj0PmPT1djl+ZjxX1K+1/hQ7lvyWFA3RmQHprjYGzFRamzE
   EkDoXLNDK/hIAtJvoFupndUeQzbQw+2obxPf4YX+kjiADcoU7JJfsFFTl
   w==;
X-CSE-ConnectionGUID: 4TKZDD6hRlSUOtoIEvHM/g==
X-CSE-MsgGUID: RfYgEAmcTTK8HZ8fGfr/6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28378267"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="28378267"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:29:41 -0800
X-CSE-ConnectionGUID: ZqGHmeIwRl65QQYDBiVAyw==
X-CSE-MsgGUID: 0W87J4dIQfylMzMyKIP0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="115572775"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.53.67]) ([10.247.53.67])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:29:34 -0800
Message-ID: <0307750b-dd98-4718-8c3c-928df6a80ef5@linux.intel.com>
Date: Thu, 20 Feb 2025 10:29:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/7] arch: x86: add IPC mailbox accessor
 function and add SoC register access
To: david.e.box@linux.intel.com, Dave Hansen <dave.hansen@intel.com>,
 Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-4-yong.liang.choong@linux.intel.com>
 <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
 <4cf99d5f9b63aec22c24c445dea9a80d71f5f024.camel@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <4cf99d5f9b63aec22c24c445dea9a80d71f5f024.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_182944_379224_6491AC15 
X-CRM114-Status: GOOD (  29.68  )
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



On 20/2/2025 1:01 am, David E. Box wrote:
> On Thu, 2025-02-06 at 08:46 -0800, Dave Hansen wrote:
>> On 2/6/25 05:18, Choong Yong Liang wrote:
>>>
>>> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
>>> - Add support to use IPC command allows host to access SoC registers
>>> through PMC firmware that are otherwise inaccessible to the host due
>>> to security policies.
>> I'm not quite parsing that second bullet as a complete sentence.
>>
>> But that sounds scary! Why is the fact that they are "otherwise
>> inaccessible" relevant here?
> 
> The PMC IPC mailbox is a host interface to the PMC. Its purpose is to allow the
> host to access certain areas of the PMC that are restricted from direct MMIO
> access due to security policies. Other parts of the PMC are accessible via MMIO
> (most of what the intel_pmc_core driver touches with is MMIO), so I think the
> original statement was trying to explain why the mailbox is needed instead of
> MMIO in this case. However, I agree that the mention of security policies is not
> relevant to the change itself.
> 
>> ...
>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>> index 87198d957e2f..631c1f10776c 100644
>>> --- a/arch/x86/Kconfig
>>> +++ b/arch/x86/Kconfig
>>> @@ -688,6 +688,15 @@ config X86_AMD_PLATFORM_DEVICE
>>>   	  I2C and UART depend on COMMON_CLK to set clock. GPIO driver is
>>>   	  implemented under PINCTRL subsystem.
>>>   
>>> +config INTEL_PMC_IPC
>>> +	tristate "Intel Core SoC Power Management Controller IPC mailbox"
>>> +	depends on ACPI
>>> +	help
>>> +	  This option enables sideband register access support for Intel
>>> SoC
>>> +	  power management controller IPC mailbox.
>>> +
>>> +	  If you don't require the option or are in doubt, say N.
>>
>> Could we perhaps beef this up a bit to help users figure out if they
>> want to turn this on? Really the only word in the entire help text
>> that's useful is "Intel".
>>
>> I'm not even sure we *want* to expose this to users. Can we just leave
>> it as:
>>
>> 	config INTEL_PMC_IPC
>> 		def_tristate n
>> 		depends on ACPI
>>
>> so that it only gets enabled by the "select" in the other patches?
> 
> I agree with this change Choong. This can be selected by the driver that's using
> it. There's no need to expose it to users.
> 
>>
>>> + * Authors: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>>> + *          David E. Box <david.e.box@linux.intel.com>
>>
>> I'd probably just leave the authors bit out. It might have been useful
>> in the 90's, but that's what git is for today.
>>
>>> +	obj = buffer.pointer;
>>> +	/* Check if the number of elements in package is 5 */
>>> +	if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count ==
>>> 5) {
>>> +		const union acpi_object *objs = obj->package.elements;
>>> +
>>
>> The comment there is just not super useful. It might be useful to say
>> *why* the number of elements needs to be 5.
>>
>>> +EXPORT_SYMBOL(intel_pmc_ipc);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_DESCRIPTION("Intel PMC IPC Mailbox accessor");
>>
>> Honestly, is this even worth being a module? How much code are we
>> talking about here?
> 
> Yeah, this doesn't need to be a module either.
> 
> David
> 

Hi David,

Thank you for the confirmation.
Let's work together to address the comments.

