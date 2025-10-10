Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F268CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGKuqUFXFhtmXQaBXV9JV0w++IW3OC9KcjYFYScoxV8=; b=2O/DEGdOheqOVbNMzOzHh+cpmT
	p5TbQEShKd2uE0qaEphvNaRUqvghDnwYyJq9ZDqsL58samc/aNECAcUi2zaihJO1Uj1Ilfytja27Z
	aYtS47aQVUsYtvBb/bCIb5kzd4rW7jpGxkDqfyh7NOyzc5L+jNz0w0xKVuNG7f14bCWd265aR/chL
	BVNewEjGPD4uElKJqPIzi7Cg1XD2YAJab1WVs4T2M22OpBdy7cOKnZEFPxd0tole1FHS3Lx06uKcT
	ifE8ZXhh0N5J3Mz25SmS2dsjSjYK9NvRbfd/bldoncMUODpWZzMslRsVbRTR1AzNVqcGWe5fVBNuc
	zlI3bA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GMn-00000008znr-0NOa;
	Fri, 10 Oct 2025 16:53:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GMj-00000008znL-3mkZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:53:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1649153B;
	Fri, 10 Oct 2025 09:53:01 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30B843F66E;
	Fri, 10 Oct 2025 09:53:04 -0700 (PDT)
Message-ID: <de2c78a5-4879-46a4-9869-5bcd0c694302@arm.com>
Date: Fri, 10 Oct 2025 17:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/29] arm_mpam: Use long MBWU counters if supported
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-27-james.morse@arm.com>
 <20250912142929.00003cff@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912142929.00003cff@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_095313_993295_C6170FB7 
X-CRM114-Status: GOOD (  11.33  )
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

On 12/09/2025 14:29, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:06 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> From: Rohit Mathew <rohit.mathew@arm.com>
>>
>> If the 44 bit (long) or 63 bit (LWD) counters are detected on probing
>> the RIS, use long/LWD counter instead of the regular 31 bit mbwu
>> counter.
>>
>> Only 32bit accesses to the MSC are required to be supported by the
>> spec, but these registers are 64bits. The lower half may overflow
>> into the higher half between two 32bit reads. To avoid this, use
>> a helper that reads the top half multiple times to check for overflow.
>>
>> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
>> [morse: merged multiple patches from Rohit]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!

Your push back on the 'front facing' thing in the previous patch made some knock on
changes here, but I think they're minor.


Thanks,

James

