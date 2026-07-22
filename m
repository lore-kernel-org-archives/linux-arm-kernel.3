Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121B9C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGWz4AGPTvjqBJii69009HGXG9cV0427s/VqH2p6rLk=; b=FW/x7ejjhAXNTZJtiNwT+LQ342
	zz6wlq9XIrBqrBTo1Gv7Ui0ri7UKwiTNaATqDRkEkH57aDsNi3gIEvyuvg34EWTQuSUG1FtbHgHP+
	L8GHVyJAGt8IFNK0wT+0gfSbodkFUctoH0e2wqpgYzA47qiLQ0ec12PCPHa2FSWzUvRqCvW8czMMR
	9HZnl3hamLWWq+rS9KvRe6+GYzuxZEP+O3xcX1lAbB9EtJ/GymvfGBALXzR3yNMWNkdlOoStze74A
	KSbmaKs38orIyVDPUnNcgnl29DDWzL/rJhqH1Zc/jxt3qtFQiGroNaljB55wqHDqOJGT6c/yLoPcC
	30SniW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZGI-0000000CGaM-2dg1;
	Wed, 22 Jul 2026 15:53:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZGG-0000000CGZq-0TTq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:53:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C001595;
	Wed, 22 Jul 2026 08:53:26 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15F543F66F;
	Wed, 22 Jul 2026 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784735610; bh=dcp6HTSyuOWcjJDMfXlAQoNquO+oXsqnobogH3j6v8g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cABz2ofccR8DvclNcEDmORPHdPNFDAr1BWe7QCujRVuzOrM0iUm+128bKYrP4DyWB
	 jAhv4u8hWJWVJY3pg7BwaH8EydZp53TxLEdkRHgwU3BHyZHz4LJ58kRl6QWqaPZXBa
	 Qut1QGdQ1Mm81GQEyO3Q0wMWPwj2aZLiA+evQqBE=
Message-ID: <e5cfe018-4b04-4f65-8142-d9ae19eee6a4@arm.com>
Date: Wed, 22 Jul 2026 17:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] arm_mpam: prepare mon_sel locking for MPAM-Fb
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-14-andre.przywara@arm.com>
 <20260710121433.00001ad6@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710121433.00001ad6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_085332_234094_E8B21EF2 
X-CRM114-Status: GOOD (  18.48  )
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

Hi,

On 7/10/26 21:14, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 16:45:17 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
>> interrupt, and when taking an IPI to access these registers on platforms
>> where MSC are not accesible from every CPU. This makes an irqsave
>> spinlock the obvious lock to protect these registers. On systems with SCMI
>> mailboxes it must be able to sleep, meaning a mutex must be used. The
>> SCMI platforms can't support an overflow interrupt.
>> Clearly these two can't exist for one MSC at the same time.
>>
>> Change the mon_sel locking wrapper function to only use a spinlock when
>> the MSC is accessed directly via MMIO. In case of MPAM-Fb, we use a
>> mutex, but only if we are in a sleepable context. If that's not the
>> case, we return an error. This should not happen, as MPAM-Fb by design
>> does not require an MSC access to happen from a specific CPU, so there
>> is no need for any IPIs or preemption disabling to satisfy CPU
>> constraints. And since overflow interrupts are not supported at the moment
>> anyway, we also wouldn't meet the other case.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> I've not been paying attention to this topic, so I might come back
> with some more feedback after I've had time to think about it a bit!
> So trivial stuff only for now.
> 
>>   
>>   static inline void mpam_mon_sel_lock_init(struct mpam_msc *msc)
>>   {
>>   	raw_spin_lock_init(&msc->_mon_sel_lock);
>> +	mutex_init(&msc->mon_sel_mutex);
> 
> I'm not that fussed, but maybe add a call to mutex_destroy().
> Most likely it'll never help catch anything in this code though..

I just used devm_mutex_init() now, like we already do for the other mutexes.

Cheers,
Andre

> 
>>   }
>>   
>>   /* Bits for mpam features bitmaps */
> 


