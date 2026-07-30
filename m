Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9811C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnLRaVPWPQZEK/6V146uMIJTjvHZOKMkuiI72X2sjgo=; b=XF3pC+KpYVUXSvmyw6aIh+3cu4
	z2CoQYZDUk6+k0Krs35IEvf17mH2ghpnkKUPYLnxyZnJRJzfqDEqvjGAgOJTXTFvekkRkOHF2ut9A
	eoKafsh4/hhdfVwrlHK8VZbph1RlvIWQzbrNryXVtdQ/Hi7G6QxRE7gJe2Cmxf59urruBcy7C6TGk
	Vp0M8TMQrwbQct6z706iX6wW6o2tvS2PtwEuyXk0QlFOc4oqb8J6pHfQWp42Ifde9tEgeZg3j5U+G
	plv4yjEd7I3ypm1cQXsGKBwnQM9rxfJiBVElJbqf5Og0Bz/rfsQM1oT/rvhi7CK1Oj2MTxBEOhuwL
	ZVjW6l8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNeP-0000000A8aU-3vMG;
	Thu, 30 Jul 2026 10:06:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNeN-0000000A8a3-0dSe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:06:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC1A1688;
	Thu, 30 Jul 2026 03:05:56 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5FE13F86F;
	Thu, 30 Jul 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785405961; bh=v4V2gdET86XAJclDguNfpx2W1wsFhmMD/X0Z7GT4l6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M8GMK3Jynb+fO6dBwN9sR+CzM4U3+oUgWw8scFhrB6fr+SMTaM2+B/Wqyf740qKYX
	 DMynXn8Tl/w1FdvgwEfMDmHVJqVtSDZdOJ26HwprEhaKQez3oZbYgzVv4wKdd84q1D
	 bT1PjhyIFU2pvdPPg9H8f4KCZaUUHj2V/GQLEXpI=
Message-ID: <455fc826-50c9-4380-b4e6-87f241dcd86f@arm.com>
Date: Thu, 30 Jul 2026 12:05:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-11-andre.przywara@arm.com>
 <5722b21f-6406-44e8-9b55-7272cf6014e0@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <5722b21f-6406-44e8-9b55-7272cf6014e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_030603_288987_00CA7197 
X-CRM114-Status: GOOD (  29.42  )
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

Hi Srivathsa,

many thanks for having a thorough look!

On 7/30/26 11:58, Srivathsa L Rao wrote:
> Hi Andre ,
> 
> On 7/29/2026 7:11 PM, Andre Przywara wrote:
>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>> registers through a firmware interface. This requires a shared memory
>> region to hold the message, and a mailbox to trigger the access.
>> For ACPI this is wrapped as a PCC channel, described using existing
>> ACPI abstractions.
>>
>> Add code to parse those PCC table descriptions associated with an MSC,
>> and store the parsed information in the MSC struct.
>> There can be multiple PCC channels, and each channel can serve multiple
>> MSCs, so we need to keep track of the channel usage, using a list and
>> a refcount.
>>
>> This will be used by the MPAM-Fb access wrapper code.
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c  | 119 +++++++++++++++++++++++++++++++-
>>   drivers/resctrl/mpam_fb.c       |   4 +-
>>   drivers/resctrl/mpam_internal.h |   6 +-
>>   3 files changed, 124 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index e535603d2c7d..e360051f4aa7 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -19,14 +19,19 @@
>>   #include <linux/irqdesc.h>
>>   #include <linux/list.h>
>>   #include <linux/lockdep.h>
>> +#include <linux/mailbox_client.h>
>>   #include <linux/mutex.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/printk.h>
>> +#include <linux/property.h>
>>   #include <linux/srcu.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>
> [...]
> 
>>   /*
>>    * Number of MSCs that have been probed. Once all MSCs have been 
>> probed MPAM
>>    * can be enabled.
>> @@ -2221,6 +2304,8 @@ static void mpam_msc_drv_remove(struct 
>> platform_device *pdev)
>>   {
>>       struct mpam_msc *msc = platform_get_drvdata(pdev);
>> +    mpam_pcc_chan_put(msc->pcc_chan);
>> +
>>       mutex_lock(&mpam_list_lock);
>>       mpam_msc_destroy(msc);
>>       mutex_unlock(&mpam_list_lock);
>> @@ -2231,7 +2316,7 @@ static void mpam_msc_drv_remove(struct 
>> platform_device *pdev)
>>   static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device 
>> *pdev)
>>   {
>>       int err;
>> -    u32 tmp;
>> +    u32 pcc_subspace_id;
>>       struct mpam_msc *msc;
>>       struct resource *msc_res;
>>       struct device *dev = &pdev->dev;
>> @@ -2279,7 +2364,7 @@ static struct mpam_msc 
>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>       if (err)
>>           return ERR_PTR(err);
>> -    if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
>> +    if (device_property_read_u32(dev, "pcc-channel", &pcc_subspace_id))
>>           msc->iface = MPAM_IFACE_MMIO;
>>       else
>>           msc->iface = MPAM_IFACE_PCC;
>> @@ -2295,6 +2380,36 @@ static struct mpam_msc 
>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>           }
>>           msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> 
> Ritwick pointed out in the v4 thread that mapped_hwpage_sz should use
> resource_size() rather than open-coding (end - start).  That fix doesn't
> appear to have made it into v5.

Yes, that's because that's an existing bug, so it deserves a separate 
fix (from him), with a Fixes: tag. I didn't want to complicate things by 
making it part of this series unnecessarily. He will send something 
ASAP. That being a fix it's less timing critical (as in: could be taken 
any time).

Cheers,
Andre

> 
> Also I did verify the resource_size() in my setup by adding prints, it 
> did work well.>           msc->mapped_hwpage = io;
>> +    } else if (msc->iface == MPAM_IFACE_PCC) {
>> +        int ret;
>> +
>> +        msc->pcc_chan = mpam_pcc_chan_get(dev, pcc_subspace_id);
>> +        if (IS_ERR(msc->pcc_chan)) {
>> +            pr_err("Failed to request MSC PCC channel\n");
>> +            return ERR_CAST(msc->pcc_chan);
>> +        }
>> +
>> +        if (msc->pcc_chan->pcc_chan->shmem_size < 
>> MPAM_FB_MAX_MSG_SIZE) {
>> +            pr_err("MPAM-Fb PCC channel size too small.\n");
>> +            mpam_pcc_chan_put(msc->pcc_chan);
>> +            return ERR_PTR(-ENOMEM);
>> +        }
>> +        ret = mpam_fb_get_protocol_version(msc);
>> +        if (ret < 0) {
>> +            pr_err("Cannot query MPAM-Fb protocol version.\n");
>> +            mpam_pcc_chan_put(msc->pcc_chan);
>> +
>> +            /* ret is an MPAM-Fb error code, return a Linux one. */
>> +            return ERR_PTR(-EIO);
>> +        }
>> +        if (FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, ret) != 1) {
>> +            pr_err("Incompatible MPAM-Fb protocol version %ld.%ld\n",
>> +                   FIELD_GET(MPAM_FB_VERSION_MAJOR_MASK, ret),
>> +                   FIELD_GET(MPAM_FB_VERSION_MINOR_MASK, ret));
>> +            mpam_pcc_chan_put(msc->pcc_chan);
>> +
>> +            return ERR_PTR(-EINVAL);
>> +        }
>>       } else {
>>           return ERR_PTR(-EINVAL);
>>       }
>> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
>> index dbe984241b0d..55c4778a8379 100644
>> --- a/drivers/resctrl/mpam_fb.c
>> +++ b/drivers/resctrl/mpam_fb.c
>> @@ -190,13 +190,13 @@ static int mpam_fb_send_request(struct 
>> mpam_pcc_chan *pcc_chan, u32 msc_id,
>>   int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 
>> *result)
>>   {
>> -    return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
>> +    return mpam_fb_send_request(msc->pcc_chan, msc->id,
>>                       reg, result, MPAM_MSC_READ_CMD);
>>   }
>>   int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 
>> value)
>>   {
>> -    return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
>> +    return mpam_fb_send_request(msc->pcc_chan, msc->id,
>>                       reg, &value, MPAM_MSC_WRITE_CMD);
>>   }
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/ 
>> mpam_internal.h
>> index a2193e7df57c..e926b7feb72a 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -77,7 +77,6 @@ struct mpam_msc {
>>       /* Not modified after mpam_is_enabled() becomes true */
>>       enum mpam_msc_iface    iface;
>>       struct mpam_pcc_chan    *pcc_chan;
>> -    int            mpam_fb_msc_id;    /* in its own name space */
>>       u32            nrdy_usec;
>>       cpumask_t        accessibility;
>>       bool            has_extd_esr;
>> @@ -532,6 +531,11 @@ int mpam_fb_send_write_request(struct mpam_msc 
>> *msc, u16 reg, u32 value);
>>   int mpam_fb_get_protocol_version(struct mpam_msc *msc);
>>   #define MPAM_FB_PROT_HEADER_LEN        sizeof(u32)
>> +/* The longest message is MPAM_MSC_WRITE, with 4 parameters. */
>> +#define MPAM_FB_MAX_MSG_SIZE    (MPAM_FB_PROT_HEADER_LEN + 4 * 
>> sizeof(u32))
>> +
>> +#define MPAM_FB_VERSION_MAJOR_MASK    GENMASK(31, 16)
>> +#define MPAM_FB_VERSION_MINOR_MASK    GENMASK(15, 0)
>>   /*
>>    * MPAM MSCs have the following register layout. See:
> 
> 
> -- 
> Best Regards,
> Srivathsa
> 


