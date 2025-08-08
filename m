Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17327C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ficybAwMRfNoReqFkJqnkeZ2tIFdxuQcmQU2yhOwAc=; b=Vqc3N+99OiG+0q+x4h0GbhxS/W
	/UEEi7GRGQw6v3EYn+w60AcYugiPdMdo0S5ABAgvoCa+z1I0BdPOrrgsrtzjeF1afWhv5r/mJ+yLf
	Bz2M/SN4ew86Z2ybh9XO2d/n8ybYUm1MNup1YDYZQwIbj6SF9kWAYxlcuYwvPw6Yll9l3IexNYRii
	Mv1gqevXE9pLyD31iWEY1LuLDmV5FuK47VQIhNGiUgY3OnOXldFLwAwYbY63z+WKUVNGxg2S0d8t+
	M33OAoH293cESLVUnSQDL8QOaYiKE5Y/rjv1/yIwyIac6EgjWx8b3T5yABtv5/3DJgGlRXR6li9A2
	XQ3HTSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHGM-00000002A1T-01MN;
	Fri, 08 Aug 2025 07:11:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHCO-000000029Ww-2nI3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:07:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBC1916F8;
	Fri,  8 Aug 2025 00:07:23 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F7823F673;
	Fri,  8 Aug 2025 00:07:14 -0700 (PDT)
Message-ID: <321bd04c-9885-4c67-9d39-db4d5919b5b4@arm.com>
Date: Fri, 8 Aug 2025 08:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/36] arm_mpam: Extend reset logic to allow devices
 to be reset any time
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
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
 <20250711183648.30766-25-james.morse@arm.com>
 <fcbe5517-0256-48ce-aa50-8017928737d7@arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <fcbe5517-0256-48ce-aa50-8017928737d7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_000732_744960_E4168784 
X-CRM114-Status: GOOD (  14.21  )
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

On 28/07/2025 11:22, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> cpuhp callbacks aren't the only time the MSC configuration may need to
>> be reset. Resctrl has an API call to reset a class.
>> If an MPAM error interrupt arrives it indicates the driver has
>> misprogrammed an MSC. The safest thing to do is reset all the MSCs
>> and disable MPAM.
>>
>> Add a helper to reset RIS via their class. Call this from mpam_disable(),
>> which can be scheduled from the error interrupt handler.
>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index 2e32e54cc081..145535cd4732 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c

>> +/*
>> + * Called in response to an error IRQ.
>> + * All of MPAMs errors indicate a software bug, restore any modified
>> + * controls to their reset values.
>> + */
>> +void mpam_disable(void)
>> +{
>> +    int idx;
>> +    struct mpam_class *class;
>> +
>> +    idx = srcu_read_lock(&mpam_srcu);
>> +    list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>> +                 srcu_read_lock_held(&mpam_srcu))
>> +        mpam_reset_class(class);
>> +    srcu_read_unlock(&mpam_srcu, idx);
>> +}
> Consider moving to the next patch where you introduce interrupt support.

I pulled these changes out of that patch to try and make it simpler!
Doing that would leave a bunch of static functions unused.


Thanks,

James

