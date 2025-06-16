Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C421C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 20:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWf4U2IMgfXaKMSLGJUCrHvubnG0tLPF0JXW2PD8mi0=; b=FjB5pUeJpL/7mYN2CxLHmI7Hv7
	5nCz+16HUynhkn2MJ6ca3j3tjll3tiMbtfxQAU+Juw12MhBozbPCqc+jC0qfkam2FAW4/G6w8szUV
	8cvvLQtoQHfbCc1E6R8xQzqQZ6Am2ksg7A59MqMgvVUoxz/rJgBxf9CbYRbGeqcwaUuDNN8ssQoMh
	0xVd3a5XGdcn4u5tUnRM+bgBTlIIyAKrm6iiEE6t1How5TXh71F+qVQFAPF1Gr0aculpA5Nx93grG
	g9ucl/Jwjp+EUx/BMh0pZePAUN4/9jtHcxJl4MLNjWSAsOf0swK9wmBboqjkTk4TeZKEg3OJmzIk9
	2tU2MHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRG8H-00000005R8r-0jY9;
	Mon, 16 Jun 2025 20:08:41 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRG63-00000005QyL-1EV2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 20:06:24 +0000
Received: from [100.65.1.24] (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id A030C21176C6;
	Mon, 16 Jun 2025 13:06:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A030C21176C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750104381;
	bh=RWf4U2IMgfXaKMSLGJUCrHvubnG0tLPF0JXW2PD8mi0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MwygWuhajk7TGYV1hsriMnPH/Z615YS+VR6NW/7XY+ka4XNr/WLH2QUZibl6KRgys
	 duta2oQez2pfYwZQIs/JdGdS7BHRSYlkI3IaA2ECLv+a5lZnTkfKCJiuOuMTv1PfU1
	 VHKF/NIqb+R7AbxYyEWJNa2pTcbblAVqovZtzrig=
Message-ID: <38127f1a-3761-48c7-8e95-1f677d6bd7b3@linux.microsoft.com>
Date: Mon, 16 Jun 2025 13:06:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PCI: hv: Do not do vmbus initialization on baremetal
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
 <kw@linux.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1749599526-19963-2-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB41574163515870DB8E430C56D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41574163515870DB8E430C56D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_130623_389422_4E5E5313 
X-CRM114-Status: GOOD (  17.35  )
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

On 6/11/2025 4:06 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Tuesday, June 10, 2025 4:52 PM
>>
>> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> The patch Subject line is confusing to me. Perhaps this better captures
> the intent:
> 
>  "PCI: hv: Don't load the driver for the root partition on a bare-metal hypervisor"
> 

Thanks, that does make more sense.

>>
>> init_hv_pci_drv() is not relevant for root partition on baremetal as there
>> is no vmbus. On nested (with a Windows L1 root), vmbus is present.
> 
> This needs more precision. init_hv_pci_drv() isn't what is
> "not relevant". It's the entire driver that doesn't need to be loaded
> because the root partition on a bare-metal hypervisor doesn't use
> VMBus. It's only when the root partition is running on a nested
> hypervisor that it uses VMBus, and hence may need the Hyper-V
> PCI driver to be loaded.
> 

I'll update it so it is clearer, thanks.

>>
>> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  drivers/pci/controller/pci-hyperv.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
>> index b4f29ee75848..4d25754dfe2f 100644
>> --- a/drivers/pci/controller/pci-hyperv.c
>> +++ b/drivers/pci/controller/pci-hyperv.c
>> @@ -4150,6 +4150,9 @@ static int __init init_hv_pci_drv(void)
>>  	if (!hv_is_hyperv_initialized())
>>  		return -ENODEV;
>>
>> +	if (hv_root_partition() && !hv_nested)
>> +		return -ENODEV;
>> +
>>  	ret = hv_pci_irqchip_init();
>>  	if (ret)
>>  		return ret;
>> --
>> 2.34.1


