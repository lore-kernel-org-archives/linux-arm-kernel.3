Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61996CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dw31ylgTw5lVkOHJ0GjXBHniTQtPSmoq+7esHDkGbVw=; b=0sAM/3rJhFwx+CkYYIn9e2Dk7r
	JQ1khm34mSrTnWzPJU2I3ncJw4+uhoZKhlIusVABlZ7iv1kGBS/Kt9/9nwXtJqVD84JkwiAtJFFIj
	tAb0Swu8ptihLYIQcrs+Zup7D2eRa1CGZM75tSKB0T/tGGAzydTj5sIOB9qe2mgU4isiqhm/nyrS8
	BDESN2N21FHLuMKtRKM9g1JiAzmMcMr4o1QuTFIzlOycDATOnwnQziKbSExcEYwtFEiYH6cwj9NFl
	EQcoEbVVQm3HNfjKSKQoztNJ6d+j6TDfB2YV4wHYMs+Bd+EUl3e+Fvpk9eND4kVTLLZIWf80H6TMc
	q7bUgpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaUa-0000000GUMB-3NXb;
	Thu, 27 Nov 2025 11:48:56 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaUY-0000000GUKB-00W2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:48:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Dw31ylgTw5lVkOHJ0GjXBHniTQtPSmoq+7esHDkGbVw=;
	b=XWTtN5L7zPwfC0KqbuHtes1A/mmqYWRuONQsCEL6DCH3mFXhGME9j5wthhQnM0qC+Zl4U0HD2
	A92Y/JUbpG8MX5P7KuhPOd6V4u9tYnk12FGAqW3P2OfgoM7gvrdlRUBIGm7kqBGCxxQ7KkmJrmL
	Rp4BQuZcRuDEgxiHbEZ+R1c=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dHF5w4WDwznTY0;
	Thu, 27 Nov 2025 19:47:16 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 9687A140135;
	Thu, 27 Nov 2025 19:48:39 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 27 Nov 2025 19:48:38 +0800
Message-ID: <54558610-1062-4632-a44c-d06443bdc736@huawei.com>
Date: Thu, 27 Nov 2025 19:48:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64/sysreg: Add HDBSS related register
 information
To: Marc Zyngier <maz@kernel.org>, Tian Zheng <zhengtian10@huawei.com>
CC: <oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <corbet@lwn.net>,
	<pbonzini@redhat.com>, <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <20251121092342.3393318-2-zhengtian10@huawei.com>
 <86wm3iqlz8.wl-maz@kernel.org>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <86wm3iqlz8.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_034854_529305_A2A9A98D 
X-CRM114-Status: GOOD (  11.38  )
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



On 2025/11/22 20:40, Marc Zyngier wrote:
> On Fri, 21 Nov 2025 09:23:38 +0000,
> Tian Zheng <zhengtian10@huawei.com> wrote:
>>
>> From: eillon <yezhenyu2@huawei.com>
>>
>> The ARM architecture added the HDBSS feature and descriptions of
>> related registers (HDBSSBR/HDBSSPROD) in the DDI0601(ID121123) version,
>> add them to Linux.
>>
>> Signed-off-by: eillon <yezhenyu2@huawei.com>
>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>> ---
>>   arch/arm64/include/asm/esr.h     |  2 ++
>>   arch/arm64/include/asm/kvm_arm.h |  1 +
>>   arch/arm64/tools/sysreg          | 28 ++++++++++++++++++++++++++++
>>   3 files changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
>> index e1deed824464..a6f3cf0b9b86 100644
>> --- a/arch/arm64/include/asm/esr.h
>> +++ b/arch/arm64/include/asm/esr.h
>> @@ -159,6 +159,8 @@
>>   #define ESR_ELx_CM 		(UL(1) << ESR_ELx_CM_SHIFT)
>>
>>   /* ISS2 field definitions for Data Aborts */
>> +#define ESR_ELx_HDBSSF_SHIFT	(11)
>> +#define ESR_ELx_HDBSSF		(UL(1) << ESR_ELx_HDBSSF_SHIFT)
>>   #define ESR_ELx_TnD_SHIFT	(10)
>>   #define ESR_ELx_TnD 		(UL(1) << ESR_ELx_TnD_SHIFT)
>>   #define ESR_ELx_TagAccess_SHIFT	(9)
>> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
>> index 1da290aeedce..b71122680a03 100644
>> --- a/arch/arm64/include/asm/kvm_arm.h
>> +++ b/arch/arm64/include/asm/kvm_arm.h
>> @@ -124,6 +124,7 @@
>>   			 TCR_EL2_ORGN0_MASK | TCR_EL2_IRGN0_MASK)
>>
>>   /* VTCR_EL2 Registers bits */
>> +#define VTCR_EL2_HDBSS		(1UL << 45)
> 
> I think it is time to convert VTCR_EL2 to the sysreg infrastructure
> instead of adding extra bits here.
> 
Sure, I will move VTCR_EL2_HDBSS into the sysreg description file
alongside VTCR_EL2.
> 	M.



