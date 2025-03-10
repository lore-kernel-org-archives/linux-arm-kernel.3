Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C63C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZEKwdOofjp6NDR+2hlCzSLPGInK74STCfZGhKf2O+k=; b=RgmyvUGBd36n6LBRbwta8ZG6ek
	GVtmDFWaSCc7VuBL/5zCOytrl3isbRNe1C7s++V5BVhiOHwltkaqLY4XsTKwoshnYYea/2r/Ki9PR
	pg271ETcY7OwSxbxMeC7DbjZWEEOI/0/Q1uNOs+VVqraHLWneHQdVq1sH91RDpBx9BwxyL0zFXIE7
	/hNyUE/lAkua3q7AwDhAM5ifPjh/PJBHmzMIg2GJpxkhTvMhDiQqPrBoM11lPLCX/VEqY7YntCTH1
	mfs1r7UQkvn8x4Vw9r64fz5CKMb4lvCNZP0H6U3jNIMOOGPoZkEildte4zLOWukeeZdiPbi99v1D2
	psKb32Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trh5C-00000003W35-0o0T;
	Mon, 10 Mar 2025 17:38:30 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trh39-00000003Vsp-3N20
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:36:24 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1DFE72038F33;
	Mon, 10 Mar 2025 10:36:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1DFE72038F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741628182;
	bh=iZEKwdOofjp6NDR+2hlCzSLPGInK74STCfZGhKf2O+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eN2UJ3y3nG1bAmMoF3LcnG5o5qMeihqJMUFoq8f8VQkTQKjrwMphlZxBpakvB6lYA
	 cSNptejg8D34S3125VES0nI3+8se2yDSJeQJmJrUFy33o/Z7zwGERJrRVw8E/zoDSv
	 1g3S3ylZGCNVS7jCVQd173bGvBEvgxrxkXMhTQwI=
Message-ID: <b3d1609e-4f64-4a88-b453-cb79936cb469@linux.microsoft.com>
Date: Mon, 10 Mar 2025 10:36:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
To: Arnd Bergmann <arnd@arndb.de>, bhelgaas@google.com,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Conor Dooley <conor+dt@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Joey Gouly <joey.gouly@arm.com>, krzk+dt@kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 ssengar@linux.microsoft.com, Sudeep Holla <sudeep.holla@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-9-romank@linux.microsoft.com>
 <29bb5b7a-b31f-4b32-92c6-e2588a0f965a@app.fastmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <29bb5b7a-b31f-4b32-92c6-e2588a0f965a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_103623_868565_FA4383E8 
X-CRM114-Status: GOOD (  12.13  )
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



On 3/8/2025 1:11 PM, Arnd Bergmann wrote:
> On Fri, Mar 7, 2025, at 23:03, Roman Kisel wrote:
>>
>> +static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
> 
> Instead of the __maybe_unused annotation here
> 
>>
>> +#ifndef HYPERVISOR_CALLBACK_VECTOR
>> +	ret = vmbus_set_irq(pdev);
>> +	if (ret)
>> +		return ret;
>> +#endif
>> +
> 
> you can use
> 
>         if (!__is_defined(HYPERVISOR_CALLBACK_VECTOR))
>                    ret = vmbus_set_irq(pdev);
> 
> and make it a little more readable.
> 

Thanks you very much, will update! Very neat :)

>      Arnd

-- 
Thank you,
Roman


