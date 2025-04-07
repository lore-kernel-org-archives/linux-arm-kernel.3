Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15479C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w4Y1XN5C0IRLgF1jSAmUFOtNgMOyDZ5Wd2dSoRtb7E=; b=zT9Ii4loHQ6KrKKt9IjfxXYh5t
	YWaciP/ePLiygLD0sPYbbbhuLU5cPakHbXqjk5QjxHnGR3Hdo5+VGCqWPBfw28ZmcXtHNflPJa0Ql
	jB0/8xrzWxgAI66WfSzCT4MSNJZHYMiXKrOeK4WcMzMw2GwRr8kYP9yKYBDPsRNZG9Ol6Xxb8mVhL
	X4lnMDpV0jl6IIdvqW3kR8PhZ7k4wkgGuKEt9x9BvnmrlV8ASzIjS6/yLjfbwRVZr1fff6PAY1Gdh
	VNVYUBndJO0tCuX1AmZa4RICyZfdouWsfih5eMIr/ZnDu6yLK63wVcOCB7xjdxEARiHxrSg+Toesl
	TPAYQsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dXO-0000000GIgS-0QgO;
	Mon, 07 Apr 2025 03:52:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dVc-0000000GIZO-3X8Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 03:50:54 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZWFWq1h70zCsQL;
	Mon,  7 Apr 2025 11:47:03 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 58CA4180103;
	Mon,  7 Apr 2025 11:50:47 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 7 Apr 2025 11:50:46 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<yangyicong@hisilicon.com>, <joey.gouly@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>
Subject: Re: [PATCH v2 1/6] arm64: Provide basic EL2 setup for FEAT_{LS64,
 LS64_V} usage at EL0/1
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-2-yangyicong@huawei.com>
 <957ccba4-2ae1-4358-b62d-3b5c44d7f1ca@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a520bb9c-839d-fd96-7ecf-365371e65e44@huawei.com>
Date: Mon, 7 Apr 2025 11:50:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <957ccba4-2ae1-4358-b62d-3b5c44d7f1ca@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_205053_027998_83D66E72 
X-CRM114-Status: GOOD (  12.82  )
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

On 2025/4/3 17:04, Suzuki K Poulose wrote:
> On 31/03/2025 10:43, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
>> HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
>> at EL0/1.
>>
>> This doesn't mean these instructions are always available in
>> EL0/1 if provided. The hypervisor still have the control at
>> runtime.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index ebceaae3c749..0259941602c4 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -57,9 +57,19 @@
>>           /* Enable GCS if supported */
>>       mrs_s    x1, SYS_ID_AA64PFR1_EL1
>>       ubfx    x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
>> -    cbz    x1, .Lset_hcrx_\@
>> +    cbz    x1, .Lskip_gcs_hcrx_\@
>>       orr    x0, x0, #HCRX_EL2_GCSEn
>>   +.Lskip_gcs_hcrx_\@:
> 
> minor nit: For consistency, could we rename this "set_ls64", similar to "set_hcrx" ?
> 

IIUC, set_xxx really touches the registers and skip_xxx should just check and prepare
the feature bits. so here using .Lskip_gcs_hrcx_\@ should be more proper and consistent
with other places in el2_setup.h, like __init_el2_debug/__init_el2_fgt which also use
.Lskip_xxx for skipping an unsupported feature?

Thanks.

>> +    /* Enable LS64, LS64_V if supported */
>> +    mrs_s    x1, SYS_ID_AA64ISAR1_EL1
>> +    ubfx    x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
>> +    cbz    x1, .Lset_hcrx_\@
>> +    orr    x0, x0, #HCRX_EL2_EnALS
>> +    cmp    x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
>> +    b.lt    .Lset_hcrx_\@
>> +    orr    x0, x0, #HCRX_EL2_EnASR
>> +
>>   .Lset_hcrx_\@:
>>       msr_s    SYS_HCRX_EL2, x0
>>   .Lskip_hcrx_\@:
> 
> Suzuki
> 
> .

