Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF72E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peNV1/narB+N1OxtD8fDB5flsO2+vGuoHsNfdEP2yM0=; b=JFrjSmDZU8QqYzpjpJ4j8Hu1Xv
	73WC1mmXqWlZPYishxZJQoNzN4Em9NIfNvPSh/vuw/Qw6rYJdxQsW7pYH2pP1CUa1md6gGlBkQfPa
	lX+51iM2LJuIvYPzxN1h4pI5AwR0nkQXxceLfv84vbgCbPWA80TLL2w1L/A9/0nRkDBPQQooasoNe
	cu96IfmmAZCT0VUjx+4QfITMrIriGVq+FFEw3BbiLfmaTbYJhFrZfYdRDUP9P3Xhw2G4m/kuZbH70
	2wWVxS3MiXNffcvNQhjvHYwLI81zhrTMfvOuqA7uEm4WrzRT80krrXYe8+54aFVm+karNBHvyJvY+
	G6PkUh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4br-0000000HE8k-0eVD;
	Fri, 27 Dec 2024 07:18:11 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR4ae-0000000HE08-13ba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 07:16:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YKGvG3K8mz1T7Vc;
	Fri, 27 Dec 2024 15:14:02 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0058A1A016C;
	Fri, 27 Dec 2024 15:16:49 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 27 Dec 2024 15:16:47 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, Nysal Jan K.A. <nysal@linux.ibm.com>
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
 <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
 <04c9757c-98e9-4c5d-9759-8a9ac9d6a803@linux.ibm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <ec04a084-0e01-afe3-6836-ed33615926ab@huawei.com>
Date: Fri, 27 Dec 2024 15:16:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <04c9757c-98e9-4c5d-9759-8a9ac9d6a803@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_231656_637537_9BD0F1C9 
X-CRM114-Status: GOOD (  12.67  )
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

On 2024/12/26 20:28, Shrikanth Hegde wrote:
> 
> 
> On 12/26/24 17:20, Yicong Yang wrote:
>> On 2024/12/26 17:23, Shrikanth Hegde wrote:
>>>
>>>
>>> On 12/20/24 13:23, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>
>>>> The core CPU control framework supports runtime SMT control which
>>>> is not yet supported on arm64. Besides the general vulnerabilities
>>>> concerns we want this runtime control on our arm64 server for:
>>>>
>>>> - better single CPU performance in some cases
>>>> - saving overall power consumption
>>>>
>>>
>>> EAS is disabled when SMT is present.
>>> I am curious to know how power saving happens here.
>>
>> EAS shouldn't work on non-asymmetic systems, so it's not the case here.
> 
> Ok. so this is a symmetric system then?

yes, symmetric.

> 
>> System wide power consumption comes down from the CPU offlining here.
>>
> 
> Ok. So SMT is enabled by default and then at runtime disable it to save power by off-lining the sibling threads?
> 

yes.

> 
> Note: When enabling SMT, current behavior differs when a core is fully offline on different archs. You may want to see which is behavior you need in that case. i.e either online or skip.
> 
> PowerPC change where we are skipping a fully offline core.
> https://lore.kernel.org/all/20240731030126.956210-1-nysal@linux.ibm.com/
> 

Thanks for the information! Currently it's implemented as online and no special need for skip. We may need further
support if skip is required in the future, currently for GENERIC_ARCH_TOPOLOGY an offline CPU's thread sibling
only contains itself so there's no information for checking whether the whole core is offline or not.

Thanks.

>> Thanks.
>>
>>>
>>>> This patchset implements it in the following aspects:
>>>>
>>>> - Provides a default topology_is_primary_thread()
>>>> - support retrieve SMT thread number on OF based system
>>>> - support retrieve SMT thread number on ACPI based system
>>>> - select HOTPLUG_SMT for arm64
>>>>
>>>> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
>>>> based QEMU VMs.
>>>>
>>> .
> 
> .

