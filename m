Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A71CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFDIOt8JS+mrvBiRxUF7cPHKkmrgOLymMcKx+84+QYU=; b=wYu0xhedtp94bqoMpundMPDcOq
	bF3Fb/yqBMYmbWQ7RQBuNLFWtj6heZIYoJMYKqxB/fxnN/a/iaKNc9v+qGAR97yMz2cRfQYAk2axT
	fZXxFeNwRrDIm41iPLqWLtZg5wLt4UV/FPQQe3nW1meYItuuFMGR4K8BH3M2r72o+jxXDnA0We4OO
	MSXMs6C0jm7kq38XUPhga/5roCushcUyzqnRoVXyVKaZ+Zk8QCGen+O5mMc8glh7ooLeya8NZaLNm
	vUss04wGZv5xCqkVU9KLKD4IUS55C1Oyx5p+IOy2RphhagP8pdhMGTInSFVhMj+/Pu4truskeFP7J
	VA+kZLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQX9-0000000GIdr-3rFn;
	Wed, 10 Sep 2025 19:31:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQX2-0000000GIXr-3OxV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:31:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2EF316F2;
	Wed, 10 Sep 2025 12:30:55 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810E93F694;
	Wed, 10 Sep 2025 12:30:57 -0700 (PDT)
Message-ID: <3502cad6-e2e2-426b-b707-162d338c87c9@arm.com>
Date: Wed, 10 Sep 2025 20:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/33] arm_mpam: Add kunit test for bitmap reset
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-33-james.morse@arm.com>
 <ee847bec-ad08-473e-96b5-407872c2a0f2@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <ee847bec-ad08-473e-96b5-407872c2a0f2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123104_943393_8EF302EA 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Ben,

On 29/08/2025 17:56, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
>> The bitmap reset code has been a source of bugs. Add a unit test.
>>
>> This currently has to be built in, as the rest of the driver is
>> builtin.

>> diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
>> index dff7b87280ab..f5e0609975e4 100644
>> --- a/drivers/resctrl/Kconfig
>> +++ b/drivers/resctrl/Kconfig
>> @@ -4,8 +4,21 @@ config ARM64_MPAM_DRIVER
>>  	bool "MPAM driver for System IP, e,g. caches and memory controllers"
>>  	depends on ARM64_MPAM && EXPERT
>>  
>> +menu "ARM64 MPAM driver options"
>> +
>>  config ARM64_MPAM_DRIVER_DEBUG
>>  	bool "Enable debug messages from the MPAM driver."
>>  	depends on ARM64_MPAM_DRIVER
>>  	help
>>  	  Say yes here to enable debug messages from the MPAM driver.
>> +
>> +config MPAM_KUNIT_TEST
>> +	bool "KUnit tests for MPAM driver " if !KUNIT_ALL_TESTS
>> +	depends on KUNIT=y

> It depends on ARM64_MPAM_DRIVER as well.

Yeah, the kbuild robot had some fun with all this. Turns out ARM64_MPAM is undefined on
non-ARM64, which means its dependencies disappear.

All this is now under an 'if ARM64_MPAM_DRIVER' and the driver symbol depends on ARM64 &&
ARM64_MPAM...


Thanks,

James

