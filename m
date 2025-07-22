Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8F3C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJqS25+tm0t7CWltPikdOoykwtYsQ0Ghy810YY755OA=; b=RIFNQoFxH9ZtSnqtQjI8irQu+f
	m9AAdxb9pfL/vME+NMluiL1YY2DQfhCkqYYGZiv7rzpUHEskqpEDfuuIueTL/V0euBG2m+QKfya0g
	+LWlbTJkynNw/GTd4rUUmzMSl+sPF04hcRnSBU27BIT2HkjcHAfWZBQAp5XH5Xna/F0aaypG2D+Yx
	gbY7pvkczA7EhEw6IpNJWNUhuo13Zw9LgBJOcOnLPX5Nxz83ocClCcTflruViKt/Ce8w0oFKwTxIB
	6iQGn+/jv782Qq3rsERXsa4CiESl9kf3x0ZjlLbZHxB0SGR4V2KElOOxnHLQ5HIXF7O0PQrog3eaa
	h9nMBzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue295-00000001339-0vBu;
	Tue, 22 Jul 2025 01:50:19 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue26a-000000012ff-2EQb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 01:47:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bmKpY56Yjz2FbQq;
	Tue, 22 Jul 2025 09:45:25 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id D62E71A0191;
	Tue, 22 Jul 2025 09:47:36 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Jul 2025 09:47:31 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 22 Jul 2025 09:47:30 +0800
Message-ID: <1b17f637-ecba-43cc-8ca6-e4bb73bd152e@huawei.com>
Date: Tue, 22 Jul 2025 09:47:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] SCTLR_EL1.TIDCP toggling for performance
To: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
CC: <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <sashal@kernel.org>,
	<yangjiangshui@h-partners.com>, <zouyipeng@huawei.com>, <justin.he@arm.com>,
	<zengheng4@huawei.com>, <yangyicong@hisilicon.com>, ruanjinjie
	<ruanjinjie@huawei.com>
References: <24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com>
 <4b010cc5-9244-450d-9a03-4ff6bf5c9a20@arm.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <4b010cc5-9244-450d-9a03-4ff6bf5c9a20@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_184744_756912_4E443B25 
X-CRM114-Status: GOOD (  12.07  )
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



在 2025/7/19 1:28, Kristina Martšenko 写道:
> Hi Chang,
> 
> On 18/07/2025 03:32, Liao, Chang wrote:
>> Hi, Kristina
>>
>> I've reviewed your patch [1] for FEAT_TIDCP1 support, which by default traps EL0
>> accesses to implementation-defined system registers and instructions at EL1/EL2.
>>
>> Do you have any plans to add support for toggling the SCTLR_EL1.TIDCP1 bit? I'm
>> encountering performance degradation on CPU where certain implementation-defined
>> registers and instructions are designed for EL0 performance use. The trapping
>> overhead is substantial enough to compromise any benefits, and it's even worse
>> in virtualization. Therefore, I'm hoping there's a way to clear the SCTLR_EL1.TIDCP1
>> bit on such platforms, perhaps via a kernel config option or command-line parameter.
>> Alternatively, do you have a better solution for gracefully toggling this bit on
>> and off?
>>
>> Thanks
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/Yrw3NWkH6D0CgRsF@sirena.org.uk/T/#m5cfdb27b48d9d7e30db73e991fc6c232ba8a7349
> 
> I don't have any plans to add support for toggling it. You could try sending a
> patch for a Kconfig option or kernel command-line parameter. I'm not really

Kristina, I am going to send a patch for command-line paramter as Catalin suggested.

Thanks.

> sure what the maintainers' view on supporting IMP-DEF features is.
> 
> Thanks,
> Kristina
> 
> 

-- 
BR
Liao, Chang


