Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AF8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N00a8Mc4/Ut/XUOXWIvzrzQDVwWNRY8XPYB2HWkAFdY=; b=Wv7WZEUGd0jUd97chnCZwA/XN4
	3XeD5liWfzXeAq/afUHhkuUNOeOCJvWk2to0+NPEujIzfGK6XguDosxDK+cbtH6puFJHFEHXjyPnF
	UDRM3Lo5W4j55QeGP6Tnyi7q5Qe+T+J3ul7GteYd6JsTKmVLjmHekMHNYC3tyay7v86C83zJVBkNJ
	j5XZ9+6zYJH2575do7VdrV6ufH9AalGj/3QbUY1W3necPHp6JI0Im+WXA9P+AAD4DkD+LstkIKfba
	LwJ2zJKL2DfVzuAVPUUaLRftwvBP40kWF4sil7BVmLE4ezD1/nzqMiku9ijaE27CrUk5ROOoRnyfv
	6BuRg5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMrO-00000008BEH-2waR;
	Tue, 18 Feb 2025 12:37:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMks-000000089h1-13A7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 12:31:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B98D152B;
	Tue, 18 Feb 2025 04:31:32 -0800 (PST)
Received: from [10.1.39.25] (010265703453.arm.com [10.1.39.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52AD63F59E;
	Tue, 18 Feb 2025 04:31:12 -0800 (PST)
Message-ID: <73af368a-52a9-4922-876b-7a6e2d32a94e@arm.com>
Date: Tue, 18 Feb 2025 12:31:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
To: YinFengwei <fengwei_yin@linux.alibaba.com>
Cc: will@kernel.org, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, jie.li.linux@linux.alibaba.com
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
 <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
 <hfip42i45jkumuvgdthxm2bk6qylqyqh6erzaq43yiqygvn6uu@dcui675lwtkm>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <hfip42i45jkumuvgdthxm2bk6qylqyqh6erzaq43yiqygvn6uu@dcui675lwtkm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_043114_384766_9B0C2A28 
X-CRM114-Status: GOOD (  18.61  )
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

On 2025-02-18 10:58 am, YinFengwei wrote:
> On Tue, Feb 18, 2025 at 10:31:42AM +0800, Robin Murphy wrote:
>> On 2025-02-18 1:21 am, Yin Fengwei wrote:
>>> Currently, arm-cmn PMU driver assumes ACPI claim resource
>>> for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
>>> failed because of resource claim failes when ioremap() is
>>> called:
>>> [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
>>> [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
>>> [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
>>> [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
>>>
>>> Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
>>> work in ACPI env.
>>
>> No, the CMN-600 routine is a special case for CMN-600 having two nested
>> memory resources of its own. CMN-700 and everything else only have one
>> memory resource, so that is not appropriate. What else is claiming the
>> region to cause a conflict?
> Sorry. Forgot the link for the new proposed fix:
> https://lore.kernel.org/all/Z7QYlUP6nfBNMXsv@U-V2QX163P-2032.local/

Yes, I saw that. It's a broken diff that won't even compile, with no 
explanation of what it's supposed to be trying to achieve or why. I'm 
not sure what you're asking me to comment on.

> My understanding is that there are two problems here:
> 1. ACPI claim the memory range and that's why we see this -EBUSY error
>     with correct code path for CMN700 + ACPI table.

No, it's fine to claim the exact *same* range that the ACPI companion 
owns; the identical requests just nest inside each other. I don't have a 
CMN-700 to hand but here's a selection of other drivers doing just that 
from /proc/iomem on my system:

12600000-12600fff : ARMH0011:00
   12600000-12600fff : ARMH0011:00 ARMH0011:00
12610000-12610fff : ARMH0011:01
   12610000-12610fff : ARMH0011:01 ARMH0011:01
126b0000-126b0fff : APMC0D0F:00
   126b0000-126b0fff : APMC0D0F:00 APMC0D0F:00
126f0000-126f0fff : APMC0D81:00
   126f0000-126f0fff : APMC0D81:00 APMC0D81:00

And I know people are using the CMN-700 PMU on other ACPI systems 
without issue, so there's nothing wrong with the binding or the driver 
in general.

The resource conflict only arises when a request overlaps an existing 
region inexactly. Either your firmware is describing the CMN 
incorrectly, or some other driver is claiming conflicting iomem regions 
for some reason.

Thanks,
Robin.

> 2. It's not correct to apply CMN600 probe method to CMN700 because
>     CMN600 has two nested memory resouces while CMN700 should only have
>     one memory resource. And you don't want to introduce trick to handle
>     incorect ACPI DSDT.
> 
> Regards
> Yin, Fengwei
> 
>>
>> Thanks,
>> Robin.


