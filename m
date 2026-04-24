Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F9FDEE5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhME/phpxsA4dpDGQEC0SmSdwksCW7HpdUx7Bp4vJAA=; b=nf4ZEL9Fc/X8WXZzKDKHbdbsOw
	U6B/gPGeZ6NvStrGj2ylEN9SAvCRbNaIIetfuYp+WaKNhLkOScBe4btsBVXncQn0eIcFgYsHPVNj1
	VMy9CMK4HBrCQDucyOLLK02P9jgQP1Zy4E4DXlhBn650JGYJ18tfyQPolDd2t3wTYdnRBkkB3A14L
	vLEDi0rq/fzMvNZpyGMtTMY+aCZ0mSZ/jkvF5TKaT7/vrIxqrBu+8ehW9/5u1qG8gGwgLN31uehz+
	TpoAb3kHSARQvS0SobRwMxMvY0g8alUmNAhzPtfV4s+qmkAOO1CexN19lsOqsidBS7tcsynkEWSV5
	sml0VCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6Kh-0000000CVLZ-1nrh;
	Fri, 24 Apr 2026 02:31:55 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6Ke-0000000CVLE-2U6f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 02:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776997913; x=1808533913;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LyMvA85aXO9l8odLPd+42Em6naKlmY2OXKuRaUPutyE=;
  b=jBsn8uPctiIX0sfeIhGLub6uuAJi4dmTLWO7X6Dnasm+07NtN5u4AMLG
   DLp++K+wtQ0kB7YZYNLvD6hzGQw77mc1NdUIYX6ViC6cPCzMZCJ5tyib+
   GZSkVqHjobfGBRPijl+4huIPA65c8V+7fuiTk4NCU1CKTtv0EEiLY66wc
   CJrHVOaWS/Swo1RJaIuqRFgIHGwHg3Cko/WdQ46X03hRYaqnDeAFBq5IT
   CC45UKxtrSCi9XKBslLyIhULOQI9qkSalqH6LWYKOGqTYono8iMrAGmbC
   Rs07ID1Hi1ihpKY48czv0rDoQMbbsYwNfIa5kn6YjxfsIiximIlxe0AIA
   w==;
X-CSE-ConnectionGUID: 2n15DTyJSdijSmPrK5RRew==
X-CSE-MsgGUID: ezBJxq/gQiK5nY/TS6wqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88671345"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="88671345"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:31:51 -0700
X-CSE-ConnectionGUID: hSntE3wvRXCvwE4MXgt62Q==
X-CSE-MsgGUID: ZLZ+lQZtQqm4aQohybn0aw==
X-ExtLoop1: 1
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 19:31:46 -0700
Message-ID: <667647da-c8e3-483f-aa57-c3730194c8a5@linux.intel.com>
Date: Fri, 24 Apr 2026 10:29:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] iommu: Defer __iommu_group_free_device() to be
 outside group->mutex
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Gunthorpe <jgg@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>,
 Mostafa Saleh <smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, vsethi@nvidia.com,
 Shuai Xue <xueshuai@linux.alibaba.com>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <3f5d229267d1f4d918641bc5b896f54b5c4b7782.1776381841.git.nicolinc@nvidia.com>
 <3570e178-f887-45c9-a251-e089915cfbd9@linux.intel.com>
 <aeo/BDwYM9yYHctI@Asurada-Nvidia>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aeo/BDwYM9yYHctI@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_193152_697942_5D6D2F4A 
X-CRM114-Status: GOOD (  18.71  )
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

On 4/23/26 23:47, Nicolin Chen wrote:
> On Thu, Apr 23, 2026 at 03:55:02PM +0800, Baolu Lu wrote:
>> On 4/17/26 07:28, Nicolin Chen wrote:
>>> +static void __iommu_group_empty_assert_owner_cnt(struct iommu_group *group)
>>> +{
>>> +	lockdep_assert_held(&group->mutex);
>>> +	/*
>>> +	 * If the group has become empty then ownership must have been
>>> +	 * released, and the current domain must be set back to NULL or
>>> +	 * the default domain.
>>> +	 */
>>
>> Nit: this comment doesn't quite match the following code. The code
>> doesn't check "group->domain != NULL". Or perhaps in that case,
>> group->default_domain must be NULL?
> 
> This is the original patch from Jason:
> https://lore.kernel.org/r/4-v3-328044aa278c+45e49-iommu_probe_jgg@nvidia.com
> 
> I kept the comments as-is, though It might be slightly confusing?
> 
> I think it means:
> If group->default_domain == NULL, it does check "set back to NULL".
> If group->default_domain != NULL, it then checks "default domain".
> 
> Maybe it could be "must be set back to the default domain (which
> itself can be NULL"?

This is clearer. As I understand it, when the last device leaves the
iommu_group, the group->domain should be one of the static system
domains, either the default domain or the blocking domain.

> 
>> Furthermore, if a device is currently quarantined, group->domain will be
>> the blocking_domain. If that quarantined device is then hot-removed and
>> happens to be the last device in the group, will this WARN_ON trigger
>> unnecessarily?
> 
> If a device is quarantined, its group->domain is retained to the
> previously attached domain. Its blocking state is logged in the
> gdev->blocked flag. So, I think it can pass the test.

Oh, my mistake. I thought group->domain would point to the blocking
domain when a device is quarantined. It's fine if group->domain remains
set to the previous domain.

> Thanks
> Nicolin

Thanks,
baolu

