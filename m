Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A869CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBW+8UXlGGe/TypZCw8KIj5u5+hhXI1l5BzdyD1ProI=; b=AYGLI55waehogmQK3ueBhuxYo8
	KNCOhq375mBgf686Th+Qmgj0jiilp6sRzMR9JiulkmvJL021ZhI8FQBZxB8QYXdxBXbFwxWdQTdFm
	AHWsOEB1qlQmA12hxYj8ZDVUPa+2NhzLns14KffjjBa+Cxz+bsZCMqQob4dRyH95czAsX4DNl6zHz
	Z7dWqU8lrEJtxojzl6IeF/wgWpCpA/XvMJjYS2xJSJLeO2GDc/K2mlZk239fSg1n2zB4AxpKqAvfr
	tfrQxGBpInXR7OnQwcXB4w6w9W3SdhXXsVm+oDQFg3WMyq5GxzbAynus0KgvxlQvIV3HnE3BA1DEE
	Ro84j3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaMZ-0000000AoPJ-3g7p;
	Thu, 13 Nov 2025 16:39:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJaMW-0000000AoOb-0jF5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:39:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D13412FC;
	Thu, 13 Nov 2025 08:39:47 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D5713F5A1;
	Thu, 13 Nov 2025 08:39:50 -0800 (PST)
Message-ID: <47603a3c-e94d-4452-9f09-0e27ff02e18b@arm.com>
Date: Thu, 13 Nov 2025 16:39:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] arm_mpam: Add the class and component structures
 for firmware described ris
To: Fenghua Yu <fenghuay@nvidia.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-12-ben.horgan@arm.com>
 <316b04af-2005-47f0-887d-6e9d4031df5b@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <316b04af-2005-47f0-887d-6e9d4031df5b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_083956_255366_7AED9101 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Fenghua,

On 11/13/25 03:23, Fenghua Yu wrote:
> Hi, Ben and James,
> 
> On 11/7/25 04:34, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
> 
> [SNIP]
> 
>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>> +                  enum mpam_class_types type, u8 class_id,
>> +                  int component_id)
>> +{
>> +    int err;
>> +    struct mpam_vmsc *vmsc;
>> +    struct mpam_msc_ris *ris;
>> +    struct mpam_class *class;
>> +    struct mpam_component *comp;
>> +    struct platform_device *pdev = msc->pdev;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>> +    if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
>> +        return -EINVAL;
>> +
>> +    if (test_and_set_bit(ris_idx, &msc->ris_idxs))
>> +        return -EBUSY;
>> +
>> +    ris = devm_kzalloc(&msc->pdev->dev, sizeof(*ris), GFP_KERNEL);
>> +    if (!ris)
>> +        return -ENOMEM;
> 
> The ris_idx bit in msc->ris_idxs is not cleared on error paths in this
> function. The bit cannot be set again.
> 
> Not sure if this is a real problem in any case. Clearing the bit on
> error paths may be clean code.

I think this would just add noise. There is no anticipation of any
functionality after failing to create RIS and I expect there are more
places in the code where this assumption is relied on.

> 
> [SNIP]
> 
> Thanks.
> 
> -Fenghua

Thanks,

Ben


