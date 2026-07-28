Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6856BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnZIBIfuAN65w+Kig7JAgaIcGU9jpuhp67GcExPOu88=; b=FKjQ2AIWVS3/kKxHtXsQ9sdQRe
	YgjzvyRtJ0EC6w8DvCuEpFpDQ7pkCJvdS11ZVO0J7HhvNAdvL77CDwexYWEibR2bECeW9feB3WeHy
	kApLB8j9sMAFmolAkSKpROi7bFNgCPMdNyHs2Sakza87EgX8R5YIRvmC0YqzR+xBSGizqQsv4+MCv
	Nc4LiXyg6zlKmJpp5dHMtwUgoTQy9GlC2K+qvhc80CbJNXHTk4hp5xovS9ZxZYe6WnW5EooEgDPoa
	3f71/whbME3nqauuj8Ar7sKyDvpc9RY+vBj4EDs6QJZ8Gi5sPdmbFMGwubHxFKAUJvcsTMUrszv6p
	66heoZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woezB-00000004x9u-0qQh;
	Tue, 28 Jul 2026 10:24:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woez9-00000004x9H-20K3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 10:24:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DE7D1A9A;
	Tue, 28 Jul 2026 03:24:26 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88F8A3F66F;
	Tue, 28 Jul 2026 03:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785234270; bh=Qmp+S4jeEmSrfkFAfQ5zyR7lzd8T38ptAobQNxd/cuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SJoNAdegQ7YKgun3wquk6jCn/mdv9DajGXn+1hdsfPdT+pcXBg9qEg2yzQ6VpNyta
	 yRKeNFrrELThJLda9OTQ2THOOTS49n5hTEam30QxUHBoHnctkdaAXmieiaC4TgUmV7
	 XmLOIkBrKGhWFoiXy/YoqSi8OyRf3fcUqsNrb8FY=
Message-ID: <22434d15-7e7c-457d-8431-b77db9448cf0@arm.com>
Date: Tue, 28 Jul 2026 12:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Ritwick Sharma <ritwick.sharma@arm.com>
Cc: ben.horgan@arm.com, catalin.marinas@arm.com, fenghuay@nvidia.com,
 ganapatrao.kulkarni@oss.qualcomm.com, guohanjun@huawei.com,
 james.morse@arm.com, jic23@kernel.org, lee@trager.us, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
 reinette.chatre@intel.com, sramana@qti.qualcomm.com,
 srivathsa.rao@oss.qualcomm.com, sudeep.holla@kernel.org, tsoni@quicinc.com,
 will@kernel.org
References: <20260723155454.1760823-9-andre.przywara@arm.com>
 <20260728100421.4047928-1-ritwick.sharma@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260728100421.4047928-1-ritwick.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_032431_563771_159FCA09 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Ritwick,

On 7/28/26 12:04, Ritwick Sharma wrote:
> On Thu, Jul 23, 2026 at 05:54:52PM +0200, Andre Przywara wrote:
> 
>> -	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>> +	if (msc->iface == MPAM_IFACE_MMIO)
>> +		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
> 
> I tested the MPAM-Fb series on an Arm AGI CPU.

Many thanks for that, and for reporting on the list!

> I think a similar MPAM_IFACE_MMIO check is needed in
> mpam_msc_zero_mbwu_l(). Without this check, the mapped_hwpage_sz bounds
> check is also performed for an MPAM-Fb MSC, which does not have an MMIO
> mapping. I observed the following warning during testing:
> 
> [   50.638246] WARNING: drivers/resctrl/mpam_devices.c:1266 at mpam_msc_zero_mbwu_l+0x98/0xa8

Ouch, you are right, I missed that one. It seems my very limited testing 
didn't touch that code path.

> There also appears to be an off-by-one issue in the calculation of
> mapped_hwpage_sz:
> 
> 	msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> 
> The current calculation records a size that is one byte smaller than
> the actual resource. I think this should use resource_size() instead:
> 
> 	msc->mapped_hwpage_sz = resource_size(msc_res);

Well spotted, I can make a separate patch for that, unless you beat me 
to it!

Many thanks,
Andre

> 
> Thanks,
> Ritwick


