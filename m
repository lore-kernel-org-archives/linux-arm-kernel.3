Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC8C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/m4x3NE2XSretG6gpGtgW8BBokheb1uJwPRSAZKAzQ=; b=4NVidupPdkNaVC
	33gANBjM/ygI8qgrK40HrDa0oyKqhDzjMrXx3bHcoA7205sKLvgGDYtL2fjUXjcTBXMkstaTYWZkS
	tmfFkD9CwAfFj1IXjiI+Ll4b7oqvYZbQYWBhjIsQvVbH2YYeCH/1e8gSd22LLBn67wJPPFSe5W6V8
	1DMrR+oYT+FLmzxjKI1gBCcZGzkoOyyV4MLFsDUb/qEBWFSgr8TKpcRJ6YkGx2xLnHI6br3fxlim8
	KewYuIefhaDDQmneLif+bvIKx26ZEXHJbCfoRSRy7ANb5JF2yknoRxFZtCf0CMI3F2Np8NrdMz7/L
	FIrwwrkXRYy4O6//lrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSUm-0000000BHhq-247v;
	Wed, 22 Jul 2026 08:40:04 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSUj-0000000BHdN-1ubi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:40:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4/m4x3NE2XSretG6gpGtgW8BBokheb1uJwPRSAZKAzQ=;
	b=qZHD4GSFj+A5tO+T1MEd208Z5N0Chuuy7RQBMWlA+cOS4A1Geh64EIu9AUOD78nCW8KlwaxXW
	CWjbo6aZjZiV5DgbINK/0VPzCSUCimM/4BTZLzgCTrn4h3Cq1HyRDJQ3o38ga7JkJxmm3FWM3An
	rd0sB+6pLYTLYTBh+TA5fY0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h4nWb1cMcz1T4Km;
	Wed, 22 Jul 2026 16:30:35 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C022B4057F;
	Wed, 22 Jul 2026 16:39:55 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:39:55 +0800
Message-ID: <3196b90a-2a69-404a-bb8d-e006bf8248fc@huawei.com>
Date: Wed, 22 Jul 2026 16:39:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/36] arm64: cpuidle: use new helpers to bypass
 interrupt priority masking
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-17-vladimir.murzin@arm.com>
 <d47d4a67-6bca-49a0-87d6-a82816566045@huawei.com>
 <0111c537-bf49-4ccb-b37f-10ce212bafe5@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0111c537-bf49-4ccb-b37f-10ce212bafe5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_014001_663660_F41FE363 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/14/2026 8:51 PM, Vladimir Murzin wrote:
> On 7/13/26 09:28, Jinjie Ruan wrote:
>>> diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
>>> index 2047713e097d..0c7ccdaf1832 100644
>>> --- a/arch/arm64/include/asm/cpuidle.h
>>> +++ b/arch/arm64/include/asm/cpuidle.h
>>> @@ -5,22 +5,17 @@
>>>  #include <asm/proc-fns.h>
>>>  
>>>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>>> -#include <asm/arch_gicv3.h>
>>> +#include <asm/interrupts/masking.h>
>>>  
>>>  struct arm_cpuidle_irq_context {
>>> -	unsigned long pmr;
>>> -	unsigned long daif_bits;
>>> +	arm64_exc_hwstates_t arm64_context;
>> Why not directly replace the arm_cpuidle_irq_context structure with
>> arm64_exc_hwstates_t?
> 
> struct arm_cpuidle_irq_context is used by psci_cpu_suspend_enter().
> Since that function is shared between arm64 and arm32, we have to
> keep it for now.

Make sense.

> 
> Cheers
> Vladimir
> 


