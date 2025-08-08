Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E3AC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MooDDMAl2NFl5QOU2oX/c7U+GQJ3r36ajp8O9TQjifQ=; b=E0nAp6p0fJfbegRjYMW+uJZcDK
	37t2fIILD/mt6fRS7KYjW3xZvJ5QeueaS02eU/iukzv7tYik2o+4IDt7ux7SRe/OWHx5P+XpsUbK7
	lQ73w4LTQNGGK18Z41qbuohnf3+Znu6LiRD3KNVtRDF24gF0IkXZ/YwVJn57/0AydEqMfRjfxhT3G
	LcdY8sx7e73bOb5jwdAPHGkj2zf2ODAUarxmO2Q21xsyjxB4SA25UaVDV180uLSagvo5XoPVp4ETb
	EwYXFDUPp+BahJyaEIM4pU/Lna/YpSEoMd1tLbpf5gWWO3sWejX5fz9ZKgVF+t0FNAGc1FY3GLYyc
	l3bfl9CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHIo-00000002AHt-3UO1;
	Fri, 08 Aug 2025 07:14:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHD1-000000029a6-0XCA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:08:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C98716F8;
	Fri,  8 Aug 2025 00:08:02 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71BF83F673;
	Fri,  8 Aug 2025 00:07:59 -0700 (PDT)
Message-ID: <04e25a86-6c24-4e0c-968d-2575cfbd8c83@arm.com>
Date: Fri, 8 Aug 2025 08:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/36] arm_mpam: Register and enable IRQs
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-26-james.morse@arm.com>
 <OSZPR01MB87989B1F13F79EE70D2D3B238B51A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87989B1F13F79EE70D2D3B238B51A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_000811_215470_5D5DE913 
X-CRM114-Status: GOOD (  16.51  )
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

Hi Shaoepeng,

On 17/07/2025 02:08, Shaopeng Tan (Fujitsu) wrote:
>> Register and enable error IRQs. All the MPAM error interrupts indicate a
>> software bug, e.g. out of range partid. If the error interrupt is ever signalled,
>> attempt to disable MPAM.
>>
>> Only the irq handler accesses the ESR register, so no locking is needed.
>> The work to disable MPAM after an error needs to happen at process context,
>> use a threaded interrupt.
>>
>> There is no support for percpu threaded interrupts, for now schedule the work
>> to be done from the irq handler.
>>
>> Enabling the IRQs in the MSC may involve cross calling to a CPU that can
>> access the MSC.

>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c
>> b/drivers/platform/arm64/mpam/mpam_devices.c
>> index 145535cd4732..af19cc25d16e 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c

>> +static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc) {
>> +	u64 reg;
>> +	u16 partid;
>> +	u8 errcode, pmg, ris;
>> +
>> +	if (WARN_ON_ONCE(!msc) ||
>> +	    WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
>> +					   &msc->accessibility)))
>> +		return IRQ_NONE;
>> +
>> +	reg = mpam_msc_read_esr(msc);
>> +
>> +	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
>> +	if (!errcode)
>> +		return IRQ_NONE;

> In general, I think there is no problem. 
> However, the initial value of MPAMF_ESR_ERRCODE may not be 0 on some chips. 
> It is better to initialize when loading the MPAM driver

Hmm, the architecture doesn't say - but if this weren't true, you get spurious fatal errors.
More interesting is if the bootloader (unlikey) or pervious kexec kernel (feasible) were using
MPAM and triggered an error. We'd ned up disabling the driver when there was no bug...

I'll add something to the hw_probe() path.


Thanks,

James

