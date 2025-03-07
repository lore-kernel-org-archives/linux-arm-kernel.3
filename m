Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0727C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 05:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHENnzSh3PpGAHsyYg5ynEtTiRyp55hML6z4++e3cvk=; b=GTcKtc9not7aQalr/sAcpLne4f
	jHY5iLSmg3CfzMR/yq26Kq0bot3kkFMdV5nI+yHpd1gPwHNHqA18uku4yQnwQ75dM7B+3blceQoZ5
	Dnu/xaMdp5l5eVXL22Q/cewOu09ULu03th9SoLMnAy8jdwnyLcDt3w1N1Odbg3JmAkQLwcWN8p5sU
	OQkvVFbF3ioqRuGfLLWyCZ1I1YVLzVgFye0L3y/zVaoSsWfOUmV/R2IDchw4J+N6BiclL6y1tTA0K
	vMza33SuDtvJk8VEgj9YTEjQaEYCeRyQW85Ss+rOE+3m5pkWAkYOgqkkzlzNmcE8K5HwMGSlMKovp
	K+s+1wJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQIJ-0000000DD8j-2uih;
	Fri, 07 Mar 2025 05:30:47 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqQGd-0000000DClh-2TCX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 05:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741325343; x=1772861343;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E2Y/GlpLCkl4xHcskn4WALbBs9h6FoTrMIP+94YBi9M=;
  b=iMYGQsgJZQqHRP6b4PB+5uaM8Yb3Vz0LgxWzX3RMPbmraT0ZTyxYrj/a
   Djf+yqUn1u33f99LbEoIMeaHh+A6Ttc3Fdw9yGeE32uDIuW6KzlyFBORI
   DAz6skC88wx4B5rimYsH91b93Qqnwx6XLjEs1BrV0kEQtd1WrdN12oKgD
   I06nxneerhNdAdVnaMfq0QjYVeXtV12EgOQVEpHc9EaYN9sdu1iSyrMPI
   U7AF6Wc+SDmAKaYJTirEibGNn8joFX8IzumDGQHJFdt/0x6D18L4GELlu
   c7Uc6egXVP/D+sQEglWoroJJc3PAu3EhZ/iA8kREOnH/oh5hh4klq6hEw
   Q==;
X-CSE-ConnectionGUID: G+AFfqBWR4y5fnaIRwJkvg==
X-CSE-MsgGUID: yXEGsG6GQl2r9OQdIl22Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46142875"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="46142875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:28:57 -0800
X-CSE-ConnectionGUID: Gav6l5ujTTC3cGO4QrwZ5w==
X-CSE-MsgGUID: +DtmNiMrS1qMuYKKWLnO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124261411"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.53.67]) ([10.247.53.67])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 21:28:49 -0800
Message-ID: <19b78790-d4d3-45db-9b1f-fbe40f8ed795@linux.intel.com>
Date: Fri, 7 Mar 2025 13:28:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: configure SerDes according
 to the interface mode
To: david.e.box@linux.intel.com, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
 <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
 <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_212903_691667_E008B54E 
X-CRM114-Status: GOOD (  23.17  )
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



On 7/3/2025 4:52 am, David E. Box wrote:
> On Thu, 2025-03-06 at 20:56 +0800, Choong Yong Liang wrote:
>>
>>
>> On 6/3/2025 5:05 pm, Andy Shevchenko wrote:
>>> On Thu, Mar 6, 2025 at 10:39 AM Choong Yong Liang
>>> <yong.liang.choong@linux.intel.com> wrote:
>>>> On 6/3/2025 3:15 pm, Andy Shevchenko wrote:
>>>>> Thu, Feb 27, 2025 at 08:15:21PM +0800, Choong Yong Liang kirjoitti:
>>> ...
>>>
>>>>>> config DWMAC_INTEL
>>>>>>        default X86
>>>>>>        depends on X86 && STMMAC_ETH && PCI
>>>>>>        depends on COMMON_CLK
>>>>>> +    depends on ACPI
>>>>> Stray and unexplained change. Please, fix it. We don't need the
>>>>> dependencies
>>>>> which are not realised in the compile time.
>>>> The dependency on ACPI is necessary because the intel_pmc_ipc.h header
>>>> relies on ACPI functionality to interact with the Intel PMC.
>>> So, that header has to be fixed as ACPI here is really unneeded
>>> dependency for the cases when somebody (for whatever reasons) want to
>>> build a kernel without ACPI support but with the driver enabled for
>>> let's say PCI device.
>>>
>>>
>>> -- With Best Regards, Andy Shevchenko
>>
>> Hi Andy,
>>
>> Thank you for your feedback, Andy.
>> I appreciate your insights regarding the ACPI dependency.
>> The intel_pmc_ipc.h header is under the ownership of David E Box, who
>> focuses on the platform code, while my focus is on the netdev.
>>
>> Hi David,
>>
>> if you could kindly look into making the ACPI dependency optional in the
>> intel_pmc_ipc.h header, it would be greatly appreciated.
>> I am more than willing to provide any support necessary to ensure a smooth
>> resolution.
> 
> Choong you only need put the function under a #if CONFIG_ACPI block and provide
> an alternative that returns an error when the code is not build. Like this,
> 
> #if CONFIG_ACPI
> static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc_ipc_rbuf
> *rbuf)
> {
>     ...
> }
> #else
> static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc_ipc_rbuf
> *rbuf) { return -ENODEV; }
> #endif
> 
> David
> 
>>
>> This patch series has already been accepted, but we recognize the
>> importance of addressing this issue in the next patch series for upstream.
>> Our goal is to ensure that the driver can be compiled and function
>> correctly in both ACPI and non-ACPI environments.
>>
>> Thank you both for your understanding and collaboration.
> 
> 
Hi Andy and David,

Thank you for the feedback.

The current ACPI dependency for the config DWMAC_INTEL is necessary, but I 
agree on making it optional.

Implementing the suggestion from David using the "#if CONFIG_ACPI" approach 
would address your concern about users who need to build a kernel without 
ACPI support.

If you are okay with this approach, then I will submit the solution for 
upstream.

