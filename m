Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4747C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPDbAw9W5ESYsauWYEFOCtro1UthpXAvzjPAgxZWvOM=; b=VOUMdROFybN/lLQgrSImApOhro
	CTv3DYxMMpSW8HCwOFPZDyGhsAQ6+pNHEuEjMVGWgztumvcIP8k6GwdGcS1sDA/YGbx6U4ZpEStUx
	TX1MrywAae6lTH7HWa0U5f0YG/ct5twai6sK4uBnOKE+EYBuaoVLYPB4AdJbfU15ZzJmcyip+vAK2
	Q9+Lg/bVi9zdu/loJ0vYqAzX5Cxy4V98QkKVuNujI8Mu4qc81g6lS7B2agDCn9cyZu9dhPk+RJ/FL
	MT0QVTPy1ZGn6nOx5pNtMKQMp/5hUW82kr/rZm1Lzl1RoW6rxZXZtwDdC6l/l/13noIgzbNVhepNi
	fAvDkBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLbQ-0000000DS0a-3sx4;
	Tue, 05 Aug 2025 17:37:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL96-0000000DNn8-1GSf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:08:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F5CA150C;
	Tue,  5 Aug 2025 10:08:07 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 459CF3F673;
	Tue,  5 Aug 2025 10:08:11 -0700 (PDT)
Message-ID: <370d63d1-3ab9-4da5-bac1-29b4229df3bd@arm.com>
Date: Tue, 5 Aug 2025 18:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] ACPI / MPAM: Parse the MPAM table
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
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-11-james.morse@arm.com>
 <20250716180725.0000452d@huawei.com> <20250728110849.00004062@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250728110849.00004062@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_100816_386342_154A5F2B 
X-CRM114-Status: GOOD (  16.98  )
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

On 28/07/2025 11:08, Jonathan Cameron wrote:
>>> +static struct acpi_table_header *get_table(void)
>>> +{
>>> +	struct acpi_table_header *table;
>>> +	acpi_status status;
>>> +
>>> +	if (acpi_disabled || !system_supports_mpam())
>>> +		return NULL;
>>> +
>>> +	status = acpi_get_table(ACPI_SIG_MPAM, 0, &table);
>>> +	if (ACPI_FAILURE(status))
>>> +		return NULL;
>>> +
>>> +	if (table->revision != 1)
> 
> Missing an acpi_put_table()

Oops,


> I'm messing around with ACQUIRE() that is queued in the CXL tree
> for the coming merge window and noticed this.
> https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/log/?h=for-6.17/cleanup-acquire

(not more C++!)


> Interestingly this is a new corner case where we want conditional locking
> style handling but with return_ptr() style handling. Maybe too much of a niche
> to bother with infrastructure.
> 
> Worth noting though that one layer up it is probably worth something like:
> 
> DEFINE_FREE(acpi_table_mpam, struct acpi_table_header *, if (_T) acpi_put_table(_T));
> 
> That enables nice clean code like:
> 
> 
> static int __init acpi_mpam_parse(void)
> {
> 	struct acpi_table_header *mpam = __free(acpi_table_mpam) = get_table();
> 
> 	if (!mpam)
> 		return 0;
> 
> 	return _parse_table;
> }

I've got bits of that from your PPTT suggestions. I ended up folding the get_table()
helper in here.

count_msc() gets the same treatment and the cleanup thing lets _count_msc() be folded into it.


Thanks,

James


> This series was big enough that I'm spinning a single 'suggested changes'
> patch on top of it that includes stuff like this.  Might take another day or so.
> 
> Jonathan


