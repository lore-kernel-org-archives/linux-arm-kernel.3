Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ueWQAy9NKeOBPwY9q2/4YG3p/NKgE6FIhLz9uDT7E4=; b=4+OdT1juXjjejTiNCvl9iaKI7Q
	yq4985/HrvxqVvd3rIYdyrWce680gbt/1aY02zQq4U6pr4nmpsFSHFKiIOlxvbZRtriMzHSIRvUpa
	LHd8/nS+ySYxF0bq9+kuGbkjVDETBnjKZ5t8X6H3PCaCLUQmgFU6cTIg9p4WzVjCqiX2TIe49UibP
	UuT61nWoIbPWdapU+2ZQEIM0gWEnUlUgPsLYj6KHagm/MoOevJEOCCw/rhr5V3n9UBshqw00GFx/o
	b6CgjxEx5n4EUu3GBVT/URt+WHZqYHTf8W9MiMHO9kRXj0CO02bjn1FKW9hZHO2I0jN+yyQoxJHlx
	TNeJXZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLzG-0000000AJ29-0DU9;
	Fri, 25 Jul 2025 17:13:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLrx-0000000AICs-1I2J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 17:06:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C1E176C;
	Fri, 25 Jul 2025 10:05:58 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A0BC3F66E;
	Fri, 25 Jul 2025 10:06:00 -0700 (PDT)
Message-ID: <1097d0cf-deb7-4247-93eb-2fe8b23dbd6c@arm.com>
Date: Fri, 25 Jul 2025 18:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/36] ACPI / PPTT: Add a helper to fill a cpumask
 from a processor container
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-6-james.morse@arm.com>
 <20250722152807.000069d3@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250722152807.000069d3@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_100605_396676_4EA12F13 
X-CRM114-Status: GOOD (  10.76  )
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

On 22/07/2025 15:28, Jonathan Cameron wrote:
> On Fri, 11 Jul 2025 18:36:17 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> The PPTT describes CPUs and caches, as well as processor containers.
>> The ACPI table for MPAM describes the set of CPUs that can access an MSC
>> with the UID of a processor container.
>>
>> Add a helper to find the processor container by its id, then walk
>> the possible CPUs to fill a cpumask with the CPUs that have this
>> processor container as a parent.

>> +/**
>> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
>> + *                                       processor containers
>> + * @acpi_cpu_id:	The UID of the processor container.
>> + * @cpus		The resulting CPU mask.

> Missing colon.
> 
> From a W=1 build (and hence kernel-doc warning).

Thanks!

W=1 spews so much output I tend to rely on the kbuild robot to report if I'm making it worse!


James

