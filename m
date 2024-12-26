Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2EAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5Qi0XbzRbCJCgyZuxmVNl2HCVdVWpWhdxaqL2KMtek=; b=fYyvP/TmDhxms22YgPfwdRh429
	bQeGvyiM0UOrDa3FX2su36hFUFDRABs2wI6gODzQOW166zKC5Qwe36+78vtUESXwqVwif+LsouPO8
	wt2g1xkoMADtoZR67wcbdSimBzrozZQXdvP8DutO/Rr/84vo83qGcITPTAsCjzkKT9jtpbVVzTyPy
	EQ5/gK7NdJXV+NvMauFPSNEEUWSpvUv9HZH3zmKHMe/gVEIEETiRJaNttQlIan/zxy+rKpVUOx50p
	XLjHI8/WHfTkntnnlMYZm7VqvCrUmLkJDYxeLSwt39nposmzdYM/Ja9F+JRY8Tb2snJzTCUPPm75U
	95wWONTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmPG-0000000Fibo-11R3;
	Thu, 26 Dec 2024 11:51:58 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmO3-0000000FiRJ-4549
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 11:50:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4YJn2X6DSLzRk9r;
	Thu, 26 Dec 2024 19:48:36 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C4AD1802D2;
	Thu, 26 Dec 2024 19:50:38 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 26 Dec 2024 19:50:37 +0800
CC: <yangyicong@hisilicon.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Shrikanth Hegde <sshegde@linux.ibm.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
 <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a9e19d83-cfc4-910c-7bca-b2dd17647c5f@huawei.com>
Date: Thu, 26 Dec 2024 19:50:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_035044_184435_4CB290B7 
X-CRM114-Status: UNSURE (   8.83  )
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

On 2024/12/26 17:23, Shrikanth Hegde wrote:
> 
> 
> On 12/20/24 13:23, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> The core CPU control framework supports runtime SMT control which
>> is not yet supported on arm64. Besides the general vulnerabilities
>> concerns we want this runtime control on our arm64 server for:
>>
>> - better single CPU performance in some cases
>> - saving overall power consumption
>>
> 
> EAS is disabled when SMT is present.
> I am curious to know how power saving happens here.

EAS shouldn't work on non-asymmetic systems, so it's not the case here.
System wide power consumption comes down from the CPU offlining here.

Thanks.

> 
>> This patchset implements it in the following aspects:
>>
>> - Provides a default topology_is_primary_thread()
>> - support retrieve SMT thread number on OF based system
>> - support retrieve SMT thread number on ACPI based system
>> - select HOTPLUG_SMT for arm64
>>
>> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
>> based QEMU VMs.
>>
> .

