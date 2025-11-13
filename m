Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E81CD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYdX7jPld9MHxC/2N/BdveINDqwOk1bdDkzTmhtgkOU=; b=MqHtPeVSQ5banTjbnHe0yuWOA4
	sLVthiPi7F0IJAYvgZ77oIZoDw87Nvg4+EJNM2vO5Gvy3jVAw34hbz2kPeaflhMHIcQw2mPr9pRwO
	X87CxMr22XTr4LQEHSb4uWIdgUVVP3ACrINR6lMY83/rjF1DPUU6ghHlFnguIy8IqF3M/eGzC2xbl
	LxPgKKo2K758rzEauKnoP7ncEO+OermFRKhMiyXtxycA3EMDq7cA/Z5CJ7/fYcRt6pd//524m1fS6
	j7Hkwu9g8B7hs/+Vrg6S7gV4053Wa9VZApTPSx/+C4UqhSUn2UbSO0yFoOt0fnTy8WIeDfYcgBH/2
	Dbm1vj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVEN-0000000AMw5-27Zq;
	Thu, 13 Nov 2025 11:11:11 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVEI-0000000AMv2-3DaQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:11:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sYdX7jPld9MHxC/2N/BdveINDqwOk1bdDkzTmhtgkOU=;
	b=wkgAbgOj/Uyjk7TB32BI8+jld98422LU2nbkIaBXSanzYHVi6qJph7P+LYaPeIHyxTIgLssdk
	NQu5KsJuHwWmg2eHARW+n+NAqI8UehAXAc67lMDLPw4XFhrBllr1+6vcAwL6U9EC1JXIXpDVMd7
	26SAoBvKW98bxHl/K+3zxXw=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4d6cwR1YknzKm5S;
	Thu, 13 Nov 2025 19:09:11 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id F095D180044;
	Thu, 13 Nov 2025 19:10:51 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Nov 2025 19:10:51 +0800
Received: from [10.67.120.171] (10.67.120.171) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 13 Nov 2025 19:10:51 +0800
Message-ID: <fb2412cd-7417-4d65-9dea-d166a3bd146f@huawei.com>
Date: Thu, 13 Nov 2025 19:10:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] io-128-nonatomic: introduce
 io{read|write}128_{lo_hi|hi_lo}
To: Ben Dooks <ben.dooks@codethink.co.uk>, <arnd@arndb.de>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<anshuman.khandual@arm.com>, <ryan.roberts@arm.com>,
	<andriy.shevchenko@linux.intel.com>, <herbert@gondor.apana.org.au>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
	<linux-api@vger.kernel.org>
CC: <fanghao11@huawei.com>, <shenyang39@huawei.com>, <liulongfang@huawei.com>,
	<qianweili@huawei.com>
References: <20251112015846.1842207-1-huangchenghai2@huawei.com>
 <20251112015846.1842207-4-huangchenghai2@huawei.com>
 <59f8bc30-c1c6-4f07-87dd-cd2893ae87f7@codethink.co.uk>
From: huangchenghai <huangchenghai2@huawei.com>
Content-Language: en-US
In-Reply-To: <59f8bc30-c1c6-4f07-87dd-cd2893ae87f7@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.171]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200001.china.huawei.com (7.202.195.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_031107_370511_03ED80CB 
X-CRM114-Status: GOOD (  11.21  )
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


在 2025/11/12 22:48, Ben Dooks 写道:
> On 12/11/2025 01:58, Chenghai Huang wrote:
>> From: Weili Qian <qianweili@huawei.com>
>>
>> In order to provide non-atomic functions for io{read|write}128.
>> We define a number of variants of these functions in the generic
>> iomap that will do non-atomic operations.
>>
>> These functions are only defined if io{read|write}128 are defined.
>> If they are not, then the wrappers that always use non-atomic operations
>> from include/linux/io-128-nonatomic*.h will be used.
>>
>> Signed-off-by: Weili Qian <qianweili@huawei.com>
>> Signed-off-by: Chenghai Huang <huangchenghai2@huawei.com>
>> ---
>>   include/linux/io-128-nonatomic-hi-lo.h | 35 ++++++++++++++++++++++++++
>>   include/linux/io-128-nonatomic-lo-hi.h | 34 +++++++++++++++++++++++++
>>   2 files changed, 69 insertions(+)
>>   create mode 100644 include/linux/io-128-nonatomic-hi-lo.h
>>   create mode 100644 include/linux/io-128-nonatomic-lo-hi.h
>>
>> diff --git a/include/linux/io-128-nonatomic-hi-lo.h 
>> b/include/linux/io-128-nonatomic-hi-lo.h
>> new file mode 100644
>> index 000000000000..b5b083a9e81b
>> --- /dev/null
>> +++ b/include/linux/io-128-nonatomic-hi-lo.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_IO_128_NONATOMIC_HI_LO_H_
>> +#define _LINUX_IO_128_NONATOMIC_HI_LO_H_
>> +
>> +#include <linux/io.h>
>> +#include <asm-generic/int-ll64.h>
>> +
>> +static inline u128 ioread128_hi_lo(const void __iomem *addr)
>> +{
>> +    u32 low, high;
>
> did you mean u64 here?
>
Thank you for your reminder, I made a rookie mistake.


Chenghai

>> +    high = ioread64(addr + sizeof(u64));
>> +    low = ioread64(addr);
>> +
>> +    return low + ((u128)high << 64);
>> +}
>> +
>> +static inline void iowrite128_hi_lo(u128 val, void __iomem *addr)
>> +{
>> +    iowrite64(val >> 64, addr + sizeof(u64));
>> +    iowrite64(val, addr);
>> +}
>> +
>

