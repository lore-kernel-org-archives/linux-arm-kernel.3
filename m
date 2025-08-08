Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bq319q5A4QdnaB/hSf5+gJ8KJURbS72sLXzYM6F/SRk=; b=Ebb2jh+UQmQW7Gg89SzDxcPJVI
	vKV679P6fnHgjjKSMFgJoJ8RqJm+Bxp4utQBDCvDq+tORVRnXbUIc/2shhOeBBxX0W3Y6ktRY2T1a
	O2Agtp3tkPqseSsAFY+U9K2GTujfSXgYxV4F7xkv+bH5QofXOuo267guT43lOaiILnPRTnYmX6sVF
	HwIuPX5hc7K8UP0IwILoskKH7AOYe1tQYKZ78uOoVD39IcRhb+4khGUQPO+r37cejTV6eRjNL4cXg
	yJNFYyXOWk+SnlcDP7S+atpQFXzaXU4I3uLQ2Ubxg17kpAk1m5LhWgv1pJTlI9YVnze93ciXOk52S
	5r+O4tRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHLG-00000002AfC-2NuD;
	Fri, 08 Aug 2025 07:16:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHDZ-000000029i5-2wJo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:08:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95CA022EA;
	Fri,  8 Aug 2025 00:08:36 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 959F13F673;
	Fri,  8 Aug 2025 00:08:13 -0700 (PDT)
Message-ID: <963309ff-9097-4ef7-a492-4f63491a4feb@arm.com>
Date: Fri, 8 Aug 2025 08:08:03 +0100
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
 <OSZPR01MB8798186D954C5D36FDA3FBEB8B56A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798186D954C5D36FDA3FBEB8B56A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_000845_786027_3277A775 
X-CRM114-Status: GOOD (  12.25  )
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

Hi Shaopeng,

On 16/07/2025 08:31, Shaopeng Tan (Fujitsu) wrote:
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
>> +
>> +	/* Clear level triggered irq */
>> +	mpam_msc_zero_esr(msc);
>> +
>> +	partid = FIELD_GET(MPAMF_ESR_PARTID_OR_MON, reg);
>> +	pmg = FIELD_GET(MPAMF_ESR_PMG, reg);
>> +	ris = FIELD_GET(MPAMF_ESR_PMG, reg);
> MPAMF_ESR_RIS?

Yup, thanks for catching that!


James

