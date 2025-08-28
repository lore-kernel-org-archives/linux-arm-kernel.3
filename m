Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE46C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gte5/zWlsiuvV2EcpF+43TMqIrsJUoZxHURtOhzwJNE=; b=hG7HBgF3YvJSWzOrJkt5E5DuSd
	PjFgorKK1YXRdg8gmRiN4To9e1+fPvTl9So1TP2Jn0EOGhEWTCZ1zB4mIJsN+FOSsRCVghz5z6kjd
	7Sorx4k5NwuOBaNTXqgUK0ECLF84Ozs/4KpncBMk78d7LmNiT3qffX+P73L6l5xAS6MwPvMf77xw+
	EPzkgqh87GMQyTcUPasu7GefTVE1V9hXBFI9kJZ8OzwfZMQjTPxSvTq8/m8G4nyHD+EuXwXKIMWvh
	8y8i1IjcOS+1x/6NBiRsyw0VQTKcFeRSBsKcLYUe7GVYro7m3or2nM/7B+wSGffbj/7XMobMuz+Wr
	HrvaHb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhSi-00000002nXI-2JaB;
	Thu, 28 Aug 2025 18:35:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf0b-00000002AE6-3z5A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:57:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D0232944;
	Thu, 28 Aug 2025 08:57:44 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BFF43F694;
	Thu, 28 Aug 2025 08:57:46 -0700 (PDT)
Message-ID: <5bb98ec3-f918-455e-9f13-71eb0506ad6c@arm.com>
Date: Thu, 28 Aug 2025 16:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] ACPI / PPTT: Find cache level by cache-id
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Amit Singh Tomar <amitsinght@marvell.com>,
 Baisheng Gao <baisheng.gao@unisoc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, bobo.shaobowang@huawei.com,
 Carl Worth <carl@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, David Hildenbrand <david@redhat.com>,
 Drew Fustini <dfustini@baylibre.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Fenghua Yu <fenghuay@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, Jamie Iles <quic_jiles@quicinc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Koba Ko <kobak@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>,
 Linu Cherian <lcherian@marvell.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Newman <peternewman@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rex Nie <rex.nie@jaguarmicro.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
 Xin Hao <xhao@linux.alibaba.com>
References: <20250822153048.2287-6-james.morse@arm.com>
 <6f2db559-5088-4082-ab5e-7b4a66723eb8@web.de>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <6f2db559-5088-4082-ab5e-7b4a66723eb8@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085754_024990_8496F751 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Markus,

On 23/08/2025 13:14, Markus Elfring wrote:
> …
>> +++ b/include/linux/acpi.h
> …
>> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>>  void acpi_table_init_complete (void);
>>  int acpi_table_init (void);
> …
>> +DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))
>> +
>>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
> …
> 
> How do you think about to offer the addition of such a special macro call
> by another separate update step?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc2#n81

As it goes via the same tree I don't think there is a strong reason either way.

Dave points out on an earlier patch that the PPTT code doesn't care about the reference
counting anyway, so this stuff can go.


Thanks,

James

