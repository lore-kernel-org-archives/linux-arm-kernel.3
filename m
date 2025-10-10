Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD253CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr0P4znH5UXUChxfT5YwVTEwQD217HnepPjUTCBNMTs=; b=u0U9rZyCGEPQGp28gUwXjuUviF
	0iGNSAOIT7ckG3n1iBal4LEIqRIJRrmZtZwdNk53Ur4Ue7MlOMdPdjIRB7Ww2DVYSgPMMIV3EFZMU
	mVfKZUs1zFlQhnkFtj/POcIkXNiGDmx679UMhcfnPoAriw1l0l/J+fyro0baVoW6M7atC82fFplnM
	pE7/L/SeyQbNM/t1gK26gEwX5K/ZWpqCjy4vKcBwIbEySm444U3P0tGUflIg6FGbT9GxVoRwnc62m
	fpBRiow/h6s8gd8hyI3P9+bDnVpFIwNOeuMj52aLk+5/YCEZup1EqaEu9ikikwaNXSCQn3T5EAHqZ
	JaN6u73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GP0-000000090te-28Cc;
	Fri, 10 Oct 2025 16:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOz-000000090t6-0WJH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jr0P4znH5UXUChxfT5YwVTEwQD217HnepPjUTCBNMTs=; b=C/t28s58PbIYRrdjuSUr+tgNtN
	SgIvdmYtS3+7d0ZnyFYPrbrEgXL26XGu9Pp1vzMGlH2QVtAy8Q60xc7h8j7NjXUe7A2aqESZjU8iS
	zaYk9AqkiZ4RX5TwzDOS6v0pMS37BRiIJrUEcqCjqTYmdd90F+fuiOoXlR8hd9k1CYMTLh5jUdBV6
	LijNFDEJfnv6bOewwxJQJHFInuBAjD47A2lopPeUra3t0AVKBl5nfqzOCiTpdeSAyFUYnAUX+IuCN
	Vj7ojdeJbtIjdXihnr7Eg/Ic8XfbtUFvYHu1ydRz3tzyTOKjLH66Z7rDUJSou8X8HcSYVK+UqEYa8
	LLranerQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GOw-00000002JJN-05SY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:55:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A279153B;
	Fri, 10 Oct 2025 09:55:21 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A66AB3F66E;
	Fri, 10 Oct 2025 09:55:23 -0700 (PDT)
Message-ID: <6cdb1661-67c5-445e-bfe0-b4a8f3493676@arm.com>
Date: Fri, 10 Oct 2025 17:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/29] ACPI / PPTT: Add a helper to fill a cpumask from
 a processor container
To: Gavin Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-2-james.morse@arm.com>
 <3a2f6807-9a49-4976-a4d7-7577756c3c26@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <3a2f6807-9a49-4976-a4d7-7577756c3c26@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175530_356191_20E9753F 
X-CRM114-Status: GOOD (  11.17  )
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

Hi Gavin,

On 03/10/2025 01:15, Gavin Shan wrote:
> On 9/11/25 6:42 AM, James Morse wrote:
>> The ACPI MPAM table uses the UID of a processor container specified in
>> the PPTT to indicate the subset of CPUs and cache topology that can
>> access each MPAM System Component (MSC).
>>
>> This information is not directly useful to the kernel. The equivalent
>> cpumask is needed instead.
>>
>> Add a helper to find the processor container by its id, then walk
>> the possible CPUs to fill a cpumask with the CPUs that have this
>> processor container as a parent.

> With the description for the return value of acpi_pptt_get_cpus_from_container()
> is dropped since that function doesn't have a return value, as mentioned by
> Stanimir Varbanov.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>


Thanks!

James

