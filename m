Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79990E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0GomhkMSBgIP5izblIYNh8zqS/s98pXzCNZi52dFHY=; b=aWGRFlgnflHql4HoUVk5n7f45h
	dCiFXab83K7QTHamgvJMDsQK32seznq39ZABWFj/sMHjjyS9mcFkhMMx0Kyj16cwT9g16nYo/lbLW
	Fv7fGoj6LO8F8Go9c0eYQK0WljLfuiWsL2VNZZxF4Ad599ypW0Z6aApwmT6Ts746T5kBbUPYa8rsY
	BbPAw74tb1WMyGlIkXi5vGnR2YkhvRpR7uM0pB5ijaH3kVG8c/hItN/0D5Lnp0Zt0LxKxEWpMn65w
	xnTImsS00zN5PWRLVh0W8DKFu1Y3o6/te7GPLr5PV2axvFgvyWmgvAw8c/quQEF8YA7HWnMe4642L
	OHp5jvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV37G-00000003dmE-1Jty;
	Tue, 07 Jan 2025 06:31:02 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV360-00000003ddr-1wqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736231385; x=1767767385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2ZNBQV83qRYlGIdvmpF5D7UXo7BcBAAFyvP+LUtLJ7w=;
  b=UNBWoCvzsnJEGqch395+NFIK6PndJBatctHUMd5+zyjvNTFJEd+4f55x
   kmzoeF3st2KDjNmCe6Cp52x4CnQTDNK/37iibTXS9VVuYiY1nRP9LzlHG
   6ihHAnQof/BwnOEvzVosC7fGyBa3l+tU0KvWIZVZ0tieEceD+Cr8Q8m7E
   OgS1ufVDr08UjPSXo3Coq0vTjxumTTRbe6d18Zpi1OXF/bccIGpcOLlcF
   OSmQACn0UAgI8Z/ebpxGFt7ggpy2wO9ale2rlW83PnbLktyVkkQcKiRTi
   jko9b3TlCKPZ0m7kZuQzyMtKLHCI+QSYqEKe0eVVQu9bj2iEbaq49jni0
   w==;
X-CSE-ConnectionGUID: wi6K6sOiQPet8HauFsishg==
X-CSE-MsgGUID: WRnGJDueT6OIp3GJUnaThA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61775239"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="61775239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 22:29:44 -0800
X-CSE-ConnectionGUID: SW9KnGenTBmE8P1OnGYz/Q==
X-CSE-MsgGUID: qJ2kkw5RQxOVafkwq6rSiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106702442"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 22:29:40 -0800
Message-ID: <150e283f-1858-4282-912d-0bb78719b46b@linux.intel.com>
Date: Tue, 7 Jan 2025 14:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
 joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <69a46c72e43ed086840be462eef731167d90a9d8.1735933254.git.nicolinc@nvidia.com>
 <585fc99f-c2dc-459c-929a-c7c7631b9caf@linux.intel.com>
 <Z3wk9TvmUhB3/zlk@Asurada-Nvidia> <Z3yvZsq77bpnaoAb@Asurada-Nvidia>
 <75456867-8993-4be4-bcdf-14df28fe92cc@linux.intel.com>
 <Z3zDA3xx6w6dSQY+@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <Z3zDA3xx6w6dSQY+@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_222944_516252_DFA1165B 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

On 1/7/25 14:00, Nicolin Chen wrote:
> On Tue, Jan 07, 2025 at 01:54:00PM +0800, Baolu Lu wrote:
>> On 1/7/25 12:36, Nicolin Chen wrote:
>>> +static bool arm_vsmmu_supports_veventq(unsigned int type)
>>> +{
>>> +	return type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3;
>> Do you need to check the hardware capabilities before reporting this? I
>> am not familiar with the ARM architecture, but typically it's better to
>> make it like this,
>>
>> static bool arm_vsmmu_supports_veventq(struct iommufd_viommu *viommu,
>>                                         enum iommu_veventq_type type)
>> {
>> 	if (type != IOMMU_VEVENTQ_TYPE_ARM_SMMUV3)
>> 		return false;
>>
>> 	if (hardware_not_capable(viommu))
>> 		return false;
> I think the ARM version of viommu_alloc op has already implemented
> enough capability checks and rejected any of hardware_not_capable.
> So, viommu shouldn't be a thing that the driver could actually use
> to call this helper 🙂

Okay, fair enough.

