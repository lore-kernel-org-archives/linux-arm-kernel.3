Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA81C47BE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aifObyyWO4qDqYOgoXP/GPvrGOpHfgscosm8W+9X5o=; b=4oTUuQhoXMQnFF60aYXJE4vutE
	Ov3HuheHiJ6ZOiJadw+YkUzzGYDc1U1H3pemkeB95HdoGp/TTzPaSFtXa+7WX9xXRnskmIAe0+Jy9
	Gjtxd5Vuc0jM9RA8CUu5VaC12+yGWGVc+6Z9wFu7RoPRIyImUIjYD2GQJ7nwTD/kVGvF4ykQsxYsO
	YKusLspVmUFMKx8j4heeK3TgkeOB8qIZt9x09cVWtf+RHjvcIRfXZVcWwY/Ob4sGRZOuKLRZsS2+b
	ejGJK1TJuodGwYx03FHSJ2CUQCY/1no2qsyVNTstQq2RjpjqzkABs52KNw1FHTSixLvHsfyvWqdGC
	4t3kWPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4yI-0000000CqfY-3dqq;
	Tue, 06 Jan 2026 11:11:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4yF-0000000Cqeh-3SV8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:11:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7564497;
	Tue,  6 Jan 2026 03:11:19 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B3AD3F5A1;
	Tue,  6 Jan 2026 03:11:21 -0800 (PST)
Message-ID: <397def6c-d730-4e10-8a8b-c7c30c07281f@arm.com>
Date: Tue, 6 Jan 2026 11:11:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/45] arm_mpam: Use non-atomic bitops when modifying
 feature bitmap
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-4-ben.horgan@arm.com>
 <20260105163305.00002306@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260105163305.00002306@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_031127_907894_8A016A6C 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Jonathan,

On 1/5/26 16:34, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:05 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> In the test__props_mismatch() kunit test we rely on the struct mpam_props
>> being packed to ensure memcmp doesn't consider packing. Making it packed
>> reduces the alignment of the features bitmap and so breaks a requirement
>> for the use of atomics. As we don't rely on the set/clear of these bits
>> being atomic, just make them non-atomic.
> 
> oh. That's a bit horrible.
> 
> Whilst I guess no one is likely to 'upgrade' these it feels odd enough that
> I'd be tempted to leave a breadcrumb of a comment next to them on why
> they must be the non atomic versions.

Sure, I've added the comment:

The non-atomic get/set operations are used because if struct mpam_props
is packed, the alignment requirements for atomics aren't met.

> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> Jonathan
> 
> 
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Thanks,

Ben


