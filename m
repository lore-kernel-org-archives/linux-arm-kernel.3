Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB37CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1t4yOPGl7iovj1yMi4ktaAt69UR/oigmsH6EJIpApyI=; b=IGXhHRrnw4jYWjhOeM4xZEB3eh
	QBQU6XCWJRAUP1e7/jtrMGzhLCVAs5nlWPsCNUQyFqtcr9AM52TkOhSWyoFIKmrRdGxnngJQGe0gJ
	uIdEQYTBgyIvCErO3RgTUiuTHmETBv1QGxXxn5CPKYmtXr2wJM5CU4A0/lEDOUxS1bI31/drSjaQ8
	6Pkwj9NKq5xm4sCDuaW83kgXLUQDjOwN748uCzN8JkpEfP4iQAe1TZje9tL7WN49Yp5Jtv24c0Ynx
	+JW7jqk7j0ruJth7qzahSDDTK7SP+mjZSDdnpRee2i203h5tTojdLbnDIQMkElcKlY9g0gPDXWbi7
	QkAr28RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQWt-0000000GIQD-2K8A;
	Wed, 10 Sep 2025 19:30:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQWq-0000000GINR-3C6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:30:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA46A16F2;
	Wed, 10 Sep 2025 12:30:43 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31ACF3F694;
	Wed, 10 Sep 2025 12:30:45 -0700 (PDT)
Message-ID: <7760c082-2702-42bb-ad0d-cc7db40b0d4d@arm.com>
Date: Wed, 10 Sep 2025 20:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/33] arm_mpam: Use long MBWU counters if supported
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
 <20250822153048.2287-31-james.morse@arm.com>
 <a3d26a1d-6887-47a4-8679-4567e417f65e@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <a3d26a1d-6887-47a4-8679-4567e417f65e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123052_850162_82818BE6 
X-CRM114-Status: GOOD (  12.77  )
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

On 29/08/2025 17:39, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
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


> Looks good to me.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!


>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 2ab7f127baaa..8fbcf6eb946a 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

>> @@ -1058,6 +1100,7 @@ static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>  static void clean_msmon_ctl_val(u32 *cur_ctl)
>>  {
>>  	*cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS;
>> +	*cur_ctl &= ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;

> I observe that this bit is res0, in the CSU case, and so the clearing is ok.

As they've started allocating bits that collide, it probably shouldn't rely on that.
The bug would be when that bit gets set for CSU in the future, its always masked out and
the monitor gets reprogrammed every time. (possibly incurring the timeout each time)

Changed as:
|	if (FIELD_GET(MSMON_CFG_x_CTL_TYPE, *cur_ctl) == MSMON_CFG_MBWU_CTL_TYPE_MBWU)
|		*cur_ctl &= ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;


Thanks,

James

