Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6FBC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlAnEjOaB1XLpZTFpmv67+kgQWaj1FWTmt3EmrR0nG8=; b=01FYXKkGlQRxETM15vVzKNjrSh
	mRFE4CsGye+AQ7Sri6nA8aHvm259D9mr77HqdwJw0tMSr3MB3SoFIKt/aXUnBgoiaJWdfRrVSfv80
	WK8lclViOqjeCb+B/zkesMm9nWLr1vb7Mt+x5XCWkfQrUfBOXtnDs4hGs2GcmBo3VneopEZSr7cqi
	bxjlP+CX/z3++ytqVZiq9Tj+t9ftdVLjnCmi4uByypHAGwP5BWWAM52ZmZBHbw/rmksZfLshneB1v
	/JF5c/Sariyp8QF0dYGj8oP3buHvWBhsmXijY689uqYNNMH8PdSuOXv+aPPEFnlcOcnPKNMwBhUkw
	sD4ZkP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aLp-00000001WA1-3LYy;
	Mon, 21 Sep 2026 09:30:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aLm-00000001W8T-1pbC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:30:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A35391476;
	Mon, 21 Sep 2026 02:30:09 -0700 (PDT)
Received: from [10.0.128.141] (unknown [10.0.128.141])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2EDF3F86F;
	Mon, 21 Sep 2026 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789983013; bh=Nx4WZlKJnXSyg8EFFohhZy2iio9HDYgvdXDUkRHuHFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TA2OKI2R90zeFDEYscKNv8cKQQLZqlW9boTf2WEPyQACBeBtIk/4kWBcMSYfj11Ta
	 thnG2OttsvgBkI/LGT02+e0GOC2V7FMXXy0A5co47CyyZzaUYaajQ7Pk9XV/Fp6o2I
	 Q/zAfD9Z3CLDuBrRFxdUP6C7NRpPAVCz+MYTKf4o=
Message-ID: <ae243947-9d82-4b08-8e24-df0411a61a0e@arm.com>
Date: Mon, 21 Sep 2026 10:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Alper Gun <alpergun@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-7-suzuki.poulose@arm.com>
 <CABpDEum16ZzLSjd7Yg2Ge6VjwL8S8xxtSs_AsqOeNT9-9FNKKQ@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CABpDEum16ZzLSjd7Yg2Ge6VjwL8S8xxtSs_AsqOeNT9-9FNKKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_023014_527577_87802382 
X-CRM114-Status: GOOD (  13.97  )
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

On 16/09/2026 19:23, Alper Gun wrote:
> On Sat, Sep 12, 2026 at 1:37 AM Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> [...]
>> +static int rmi_init_metadata(void)
>> +{
>> +       phys_addr_t start, end;
>> +       struct memblock_region *r;
>> +
>> +       for_each_mem_region(r) {
>> +               int ret;
>> +
>> +               /* Firmware-reserved NOMAP regions are not usable system RAM */
>> +               if (memblock_is_nomap(r))
>> +                       continue;
>> +
>> +               start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
>> +               end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
>> +
>> +               ret = rmi_prepare_memory(start, end);
>> +               if (ret)
>> +                       return ret;
>> +       }
> 
> Hi Suzuki,
> 
> What happens if a system has memory regions in memblock that are not
> tracked by RMM (e.g. CXL memory)?
> 
> Currently, rmi_verify_memory_tracking() returns -ENODEV for untracked
> regions, causing rmi_init_metadata() to abort and disable CCA
> system-wide.
> 
> Shouldn't rmi_init_metadata() skip untracked regions (continue) with a
> warning/info log instead of aborting? That would allow Realm support
> for conventional DRAM while leaving untracked memory for the host.

No. We can't handle RMI_ERROR_TRACKING if the Host tries to back the
Realm memory by the memory that we haven't verified. So, it is safer
to give up KVM support for now. We plan to address this in future
by introducing the dynamic tracking.

Cheers
Suzuki

> 
> Thanks,
> Alper


