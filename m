Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C682CED603
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYKxvtyV+R4FpVq6xDWKFKm30MmzmyJAZs/lQfDkZTg=; b=LABf72GWOr6QcsvmOyy4v+1c5b
	i+aAW7WzVTtFpCA1AYoSkDAsN6byWidTBLnYNpPQoPV4onEKhMMrlZB81GpSxzI32DYHnHEQXlZSR
	lYiTzSE8AW7I2h9kR33W+MkqKy/W3tW8GpoMWgtFxEkvxHp/BNrAgeYLKfgpB2r2utzfzJLWVuafc
	lVfHrBRnQRsQSdxSjOhPEPUOkbtfWtTZWS91nd4xUYR3fFAYv4pxD12VGA/OuprGsBYN+Gk7GcbeT
	QbdFQi9Ls0jPbVUtRE2GA9WfwTclBZcw+FZ8VJKlfFNfa5rKNIaJMqHfoU95dHEAqHFAwLoMBvGK6
	zdy8aSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJCM-00000000H1j-20zV;
	Tue, 18 Nov 2025 10:44:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJCK-00000000H1N-3NkS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:44:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DBF3FEC;
	Tue, 18 Nov 2025 02:44:24 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1E4C3F740;
	Tue, 18 Nov 2025 02:44:26 -0800 (PST)
Message-ID: <3d2b7980-db26-423f-9525-5d18eade8344@arm.com>
Date: Tue, 18 Nov 2025 10:44:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/34] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: Markus Elfring <Markus.Elfring@web.de>, James Morse
 <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Amit Singh Tomar <amitsinght@marvell.com>,
 Baisheng Gao <baisheng.gao@unisoc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
 David Hildenbrand <david@redhat.com>, Drew Fustini <dfustini@baylibre.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Gavin Shan <gshan@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, Jamie Iles <quic_jiles@quicinc.com>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Koba Ko <kobak@nvidia.com>,
 Len Brown <lenb@kernel.org>, Linu Cherian <lcherian@marvell.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Newman <peternewman@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Will Deacon <will@kernel.org>, Xin Hao <xhao@linux.alibaba.com>,
 Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-11-ben.horgan@arm.com>
 <a5306f5a-92b0-437d-b384-40863fbed6d8@web.de>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <a5306f5a-92b0-437d-b384-40863fbed6d8@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_024432_898820_E0D6F3FA 
X-CRM114-Status: UNSURE (   9.86  )
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

On 11/17/25 19:50, Markus Elfring wrote:
> …
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -0,0 +1,190 @@
> …
>> +static int mpam_msc_drv_probe(struct platform_device *pdev)
>> +{
> …
>> +	mutex_lock(&mpam_list_lock);
>> +	msc = do_mpam_msc_drv_probe(pdev);
>> +	mutex_unlock(&mpam_list_lock);
> …
> 
> Does anything hinder you to integrate statements like “guard(mutex)(&mpam_list_lock);” here?
> https://elixir.bootlin.com/linux/v6.18-rc6/source/include/linux/mutex.h#L228

The mpam_list_lock needs to be dropped before the end of the scope as it
is also taken in mpam_msc_drv_remove().

> 
> Regards,
> Markus

Thanks,

Ben


