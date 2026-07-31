Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EEEC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 10:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hupI5WFk59oFt99VB19aOOfT0m58sVIle+0HRkScMyk=; b=YyhnVN0O2YAMSnd5n6MRJJ6PHJ
	vkRiDEo4Yufo8Z9Ev4MwU+NfIJ8o/ThCDxBK+BPUhx9WZDrFtozgbd+9i+XKb0iCGR8CyGAFnmPLt
	/1Z1ER8x7sUfUEikqCKP7keQ5lNLgKcrqk+37Vtxc9Pno5E4+CemMbfetboFavOf/NglznR0Z7Ev3
	4gk4wFlboA3joQ+CLcTazlVD0DG2Asy85ZLNe1DhVYvDbuolX9c/2h8d8bgvV14hMo7hfHJ2zywFH
	v3u8rKRewfgLsMIC5j2f27hvYdD+75P33b/PrwFQnXhHWSjMYNgwtUnHWrsS9gx86ZsakNsII2jkk
	N3uaGgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkn7-0000000CMEh-0oRm;
	Fri, 31 Jul 2026 10:48:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkn5-0000000CMEL-0JYf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:48:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3199165C;
	Fri, 31 Jul 2026 03:48:29 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35B813F86F;
	Fri, 31 Jul 2026 03:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785494914; bh=ratjVqBu7p3JZWZjD/O28L5zEMWQLUbFrNGlwxKGTdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kYDLuAQe7elelYPkJMrRzshoXDSkqWcXGcM4W6epQJB4vjPITlDdO3dayC1yBlYkE
	 TJRnDlLfGeUEw7ViWWKFhpfJOOa6KiuY4d4qYpVkBnUDo3ZRMOCy8D9eJm5jOgLKqS
	 4AAWXpf6HpI1Yzk0GVx57z5XH4UIoQyDXYZPjMNU=
Message-ID: <fa401c52-b9f2-4e48-87d1-9ddfca330ed0@arm.com>
Date: Fri, 31 Jul 2026 12:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] arm_mpam: prepare mon_sel locking for MPAM-Fb
To: Lee Trager <lee@trager.us>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Ritwick Sharma <ritwick.sharma@arm.com>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
 <20260730152539.2712312-8-andre.przywara@arm.com>
 <b9d57d9f-61c7-4e62-a120-7631bdb7069b@trager.us>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <b9d57d9f-61c7-4e62-a120-7631bdb7069b@trager.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_034835_171269_A31DF5F0 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Lee,

On 7/30/26 23:46, Lee Trager wrote:
> On 7/30/26 8:25 AM, Andre Przywara wrote:
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 38450c55e45e..d175d1d50030 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2230,7 +2230,10 @@ static struct mpam_msc 
>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>       if (err)
>>           return ERR_PTR(err);
>> -    mpam_mon_sel_lock_init(msc);
>> +    err = mpam_mon_sel_lock_init(dev, msc);
>> +    if (err)
>> +        return ERR_PTR(err);
>> +
>>       msc->id = pdev->id;
>>       msc->pdev = pdev;
>>       INIT_LIST_HEAD_RCU(&msc->all_msc_list);
>>
> msc->iface is set below, it needs to be set before calling 
> mpam_mon_sel_lock_init() so PCC devices initalize mon_sel_mtex, while 
> MMIO initialize the spinlock.

Ouch, that's a good one. This worked before, because we initialised 
both, but indeed now breaks.

Thanks for noticing, just moved the initialisation down now.

Cheers,
Andre



