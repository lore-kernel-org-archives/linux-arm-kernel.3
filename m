Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119AEC55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJUCWtqiYp3MzazFJFstpq7urKk8PTa/reM6aRzMYDQ=; b=EAXXfAEoIjohA6XvJ712f9lxMR
	Tgy5CWseW4YIAJJe3g7bIkPqxjYKNKZO95wPoZJdxYtDNsDkIlpdHjgl1+nyRgNUOIg6cNZn9fTqN
	Ta5oIJltFjIAoUjXub+rKnR6vgE3dwotpMVMCi3N17ttQLw2P5DBLCYZfU4GyZJoG/qJJITA6DZLc
	XasWAfQDZ3l+2zj9FfcfbB9lVTZ0IF9RrAfkuOqhDR+wwFI/sahLrXRrwyX7dIVIOR2zOjAmLB7Ev
	yWEjnZtO0QgUJRoG+i10ifBIPaWz/cytsGNm6+H9Vv7zeF+4SwbIdFgUGJB6OBpMi6kbOvByt66L3
	SjowB3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQAc-0000000AVFS-2lnj;
	Thu, 30 Jul 2026 12:47:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQAa-0000000AVEV-0Zn5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCBA91688;
	Thu, 30 Jul 2026 05:47:22 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFE693F86F;
	Thu, 30 Jul 2026 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785415646; bh=WfoefAgOES6CV8muplxagsKiTcKIhpvznQ3erz47QIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M9GlJbEnDyAE36ajxjU3N/JvgUuLPxebLwxy32c5OG18qrASRykhHyODOxg1C0mlQ
	 8fThFosPU3gph4odkmhtrOXhVxno4HzVAlL6/Ry9DXsKHWj48QmPZtNDRIisbzDaeX
	 InQfqjrXh9dGRHgVaiju4ohl4n0GJWKae81oIRds=
Message-ID: <3a06f20a-c7dd-4deb-abc5-b0f67faee343@arm.com>
Date: Thu, 30 Jul 2026 14:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
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
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-11-andre.przywara@arm.com>
 <ec478b24-0a30-4b63-b191-08d05f606bad@trager.us>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <ec478b24-0a30-4b63-b191-08d05f606bad@trager.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_054728_344890_25B40702 
X-CRM114-Status: GOOD (  19.56  )
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

On 7/30/26 03:34, Lee Trager wrote:
> On 7/29/26 6:41 AM, Andre Przywara wrote:
> 
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
>>           msc->mapped_hwpage = io;
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
> 
> I think the PCC shared-memory size undercounts the required region. From 
> my understanding shmem_size is the length of the complete PCC shared- 
> memory region advertised by the PCCT and mapped by the PCC driver. 
> MPAM_FB_MAX_MSG_SIZE is the 4-byte protocol header stored in pcc_shmem- 
>  >command + the 16-byte write payload.
> 
> However, mpam_fb_build_write_message() places the payload after the 
> complete 16 byte struct acpi_pcct_ext_pcc_shared_memory. The largest 
> request therefore occupies 32 bytes of shared memory region(16-byte PCC 
> header+ 16-byte write payload). Thus a firmware region between 20 and 31 
> bytes currently passes the check but overruns when constructing a write 
> request. I think this should be

Ah, you are right, there are indeed multiple things at play here.

 > if (msc->pcc_chan->pcc_chan->shmem_size <>
>      sizeof(struct acpi_pcct_ext_pcc_shared_memory) +
>      MPAM_FB_MAX_MSG_SIZE - MPAM_FB_PROT_HEADER_LEN)

I simplified that by just dropping MPAM_FB_PROT_HEADER_LEN from the 
MPAM_FB_MAX_MSG_SIZE definition.

Thanks for having a thorough look!

Cheers,
Andre

> 
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


