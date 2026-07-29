Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A342C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOPGeN0rKCz6mNY13kxCbWHtRpr8S9PGt80cMx45CS0=; b=aMdWERAMQ5PA6+mLjDEJxqjyzS
	XwcpxUhpiMd2BrXgvwMtrEjNwYx6N8DUWXJ6daOphTmElMyxDd8klQfqkfrQvIiBa72ExLwgCBP6p
	DNtlD0r2RN6ezIaby2j/IYdF7LgQHXBKgVb5St7vzsJCsJZtzeMTdWTEcxDSI9nNFMNROT+STrs4z
	6t8cGLOJfu+1LPWZj/7izzDMsx+Qv4fZoo4F5UM79lctZ8B1IdNd0zyoSEeQqfweoeaafzzFVDB8Q
	eFQqw8/kTgBQtG/UITYBCxjNUr9lL6X+ui/mL2a9M9nRSxYy7j03qa5vCpE1JdQvmhGLBXb7Ozmkh
	MCEEmNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp62J-00000008N0F-31yj;
	Wed, 29 Jul 2026 15:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp62G-00000008MzG-3fQ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:17:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07D1A1688;
	Wed, 29 Jul 2026 08:17:28 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A4A3F763;
	Wed, 29 Jul 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785338252; bh=yxG2rPBIIwl247qKcaaMERIvGw6yJjMqKv6TJ9vu+Hw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ax5MADysoC/XxHv4h3VmFwFgWS3XYIyXGU7QVxjLPdu8sDanQ3XF5LaFknF1/YptF
	 cP0EbCYt3MaeZYZKe62IeCpHab9sQBnFhanqVkI3k8eXdFCKhN5OjsCSRSMWu2/VWB
	 +Tg9dTfl957zi0ZDyyV3bjMjvfwl2tUSHqfkacL8=
Message-ID: <6266693e-61d1-41df-bbee-c761ecb47353@arm.com>
Date: Wed, 29 Jul 2026 17:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Ben Horgan <ben.horgan@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-9-andre.przywara@arm.com>
 <1da9895e-eaf8-45f0-bac8-c4304a3b4f6a@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1da9895e-eaf8-45f0-bac8-c4304a3b4f6a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_081733_032051_AB2C01F0 
X-CRM114-Status: GOOD (  17.82  )
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

Hi Ben,

thanks for having a look!

On 7/29/26 16:51, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/29/26 14:41, Andre Przywara wrote:
>> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
>> alternative way of accessing the "Memory System Components" (MSC) in an
>> MPAM enabled system.
>>
>> Normally the MSCs are MMIO mapped, but in some implementations this
>> might not be possible (MSC located outside of the local socket, MSC
>> mapped secure-only) or desirable (direct MMIO access too slow or needs
>> to be mediated through a control processor). MPAM-fb standardises a
>> protocol to abstract MSC accesses, building on the SCMI protocol.
>>
>> Add functions that do an MSC read or write access by redirecting the
>> request through a firmware interface. For now this done via an ACPI
>> PCC shared memory and mailbox combination.
>>
>> Since the protocol used is only a small subset of the full SCMI spec,
>> and the SCMI protocol has no full ACPI support anyway, open-code the
>> (simple) SCMI message generation, for just the fields we need.
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> [...]
> 
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 2b81b6b0bf4e..a2193e7df57c 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -11,6 +11,7 @@
>>   #include <linux/io.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/llist.h>
>> +#include <linux/mailbox_client.h>
>>   #include <linux/mutex.h>
>>   #include <linux/resctrl.h>
>>   #include <linux/spinlock.h>
>> @@ -57,6 +58,15 @@ struct mpam_garbage {
>>   	struct platform_device	*pdev;
>>   };
>>   
>> +struct mpam_pcc_chan {
>> +	struct list_head	pcc_chans;
>> +	struct mbox_client	pcc_cl;
>> +	struct pcc_mbox_chan	*pcc_chan;
>> +	struct mutex		pcc_chan_lock; /* only one message at a time */
>> +	struct kref		refcount;
>> +	int			subspace_id;
>> +};
>> +
>>   struct mpam_msc {
>>   	/* member of mpam_all_msc */
>>   	struct list_head	all_msc_list;
>> @@ -66,6 +76,8 @@ struct mpam_msc {
>>   
>>   	/* Not modified after mpam_is_enabled() becomes true */
>>   	enum mpam_msc_iface	iface;
>> +	struct mpam_pcc_chan	*pcc_chan;
>> +	int			mpam_fb_msc_id;	/* in its own name space */
> 
> This gets removed in patch 10 now. I guess you just edited the wrong patch.

Argh, you are right, I squashed the fix into 10/10, but indeed the 
member is already introduced here.
Good catch!

Cheers,
Andre

