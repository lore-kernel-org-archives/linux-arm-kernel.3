Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189B1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL3V1/sUKwkkXMZR/2JVFYQkxv2fRhBoQVf6kk72Bu4=; b=1oONRccuWrCFADn56ntglzT6Jx
	l5CMPslAY5VOMKG3OT4wm2RQt5qRq5b7vbIue8fJoguoUNBWDvoZwfyLMCzylTw8dOXiKstCAqiC0
	adtF9HcE8/CYBdb/vzqkx3z1aEnMi209zYcg6j+3zECyzEp5wTMp0xCmvR3j+rE2eQ8YEZwCy9c45
	HeTVAHa0IbNB14NMBuIb8tA+6t5FDQx6py8HyO2cGCh4/mAHXAIkGq4GUxYYDCJEWZgna+CsgnHOd
	Nd4o4PwARNTaekW6uOao72fiIrRa6Z7DZ/jmn1oWChz7PyuM2szF/9mmJ8cE53bkOUkUJsxtA0K1m
	asZNZVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGR5-0000000EDAk-3NAa;
	Thu, 04 Sep 2025 20:19:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuDlD-0000000DG9t-3BCv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 17:28:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B514D2E98;
	Thu,  4 Sep 2025 10:28:26 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 773093F6A8;
	Thu,  4 Sep 2025 10:28:29 -0700 (PDT)
Message-ID: <dfddc34d-bfe7-48e3-a454-c3be7e093e1e@arm.com>
Date: Thu, 4 Sep 2025 18:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/33] ACPI / MPAM: Parse the MPAM table
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
 Shameer Kolothum <shameerkolothum@gmail.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
 Xin Hao <xhao@linux.alibaba.com>
References: <20250822153048.2287-9-james.morse@arm.com>
 <60b72fd4-0a63-44ff-9850-1848d3fe9559@web.de>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <60b72fd4-0a63-44ff-9850-1848d3fe9559@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_102835_832868_BFBDBA57 
X-CRM114-Status: UNSURE (   8.22  )
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

Hi Markus,

On 23/08/2025 11:55, Markus Elfring wrote:
> …
>> +++ b/drivers/acpi/arm64/mpam.c
>> @@ -0,0 +1,331 @@
> …
>> +static int __init acpi_mpam_parse(void)
>> +{
>> +        struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_MPAM, 0);
>> +	char *table_end, *table_offset = (char *)(table + 1);
> …
> 
> Please replace eight space characters by a tab character here.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.17-rc2#n18
> 
> Are further source code places similarly improvable?

Yes - I just copied this rune from the email from Jonathan that suggested it.
'Fixed',


Thanks,

James

