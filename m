Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51516C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzMzjB7Q/Kry8Hq+AJa37dFyn46MkFkE9+t45EDLLtw=; b=AHFh9UFYt6jMi14qqHK02+P8vN
	6EpfqAXdIBVtde0pYmWmfPLnpl3BHaRGbWNoq0Ukw8vknbbxFBYgaER/Nq0MZBu9X6ur1sZmecSnE
	LRZHSCt2fQwYyLNQjApCSOTNSqDhYB+/Fq75Y6FoK/Qam1B5dFCUv1XYU+FP4TRMBic9l5fMGsFHr
	QbNTMxJnjqRDeuKx0hthQgL0vvEmS7lG2gmJfb0cwsVxY0QzWZaVDu85TC5NkrN/35SkgmlpNzXbg
	N4RWXtS+4hQZMrI7FmfcEb0ICRyJTtckEVpPMUimRlPPGwzK2K02SPEQF4oWqAh2yu8mnBW+dsUFo
	8n5OyFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53p3-0000000HB9h-2QZF;
	Fri, 11 Sep 2026 16:09:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53p0-0000000HB8w-44Ha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:09:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 688F22A6B;
	Fri, 11 Sep 2026 09:09:45 -0700 (PDT)
Received: from [10.0.129.245] (unknown [10.0.129.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784C03F7B4;
	Fri, 11 Sep 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789142989; bh=R3y5188pd0F5/104NAoFNHI16Opb2VM5/osMkCNme7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JshXtrxSRrDc6ppaqUNxzL3+c8nw0Rq35ew6fiWeq9Y8nm1TzCoTY6U7coeQnvSml
	 Qv4sQtRVYZK0c/4QXq/1rq3WTwF+RdF/XL1fDQGAj6JQcJ4vA28kWeWlVfaQZz51A+
	 9iPAGWE9xFM7a4K6nGjuMb7d0/ETE/256oE+FFVc=
Message-ID: <16a02301-96a1-42cd-95ed-ed773f4ad77e@arm.com>
Date: Fri, 11 Sep 2026 17:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/1] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, maz@kernel.org,
 pavan.kondeti@oss.qualcomm.com, tabba@google.com, aneesh.kumar@kernel.org,
 mark.rutland@arm.com, sdonthineni@nvidia.com, steven.price@arm.com,
 gshan@redhat.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev
References: <20260907162204.1479401-1-suzuki.poulose@arm.com>
 <aqP72gst-Y0KtxA5@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aqP72gst-Y0KtxA5@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_090951_057959_1A16EECB 
X-CRM114-Status: GOOD (  15.45  )
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

On 11/09/2026 14:02, Will Deacon wrote:
> On Mon, Sep 07, 2026 at 05:22:03PM +0100, Suzuki K Poulose wrote:
>> This single patch teaches the arm64 fault handling code about Granule
>> Protection Faults, introduced by FEAT_RME. This was posted with KVM CCA
>> support series, but split from that, to allow for other users of GPF.
>>
>> The immediate user is KVM CCA, where the host may fault if it accesses
>> granules that have been delegated for use by a Realm. However, the fault
>> handling itself is architectural and not KVM-specific. It should also be useful
>> for other FEAT_RME users where an access to secure memory or root memory can
>> result in a GPF.
>>
>> GPFs during a page table walk are treated as kernel bugs, while non-page-walk
>> faults can be reported to userspace with SIGBUS. The patch also allows existing
>> exception-table fixups to handle known in-kernel accesses such as
>> load_unaligned_zeropad() while private memory remains mapped in the linear map.
> 
> I assume you can't handle GUP for realm memory, so you must be using
> guest_memfd to avoid userspace mappings of realm memory. In that case,
> why don't you unmap it from the linear map entirely? There's ongoing work
> to do that afaik, it can be done largely outside of arch code and it
> seems like people want it to defend against side channels anyway.

Yes, thats the plan. Sorry, the commit message is a bit vague. Until we
have that support, we should try to fixup the exception.
Once we get the support to unmap them from the linear map, we could
relax this.


Cheers
Suzuki

> 
> Will


