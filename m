Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5BE1090221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZPjYNQ+OXcjI/mEyJaFF4aXAvMvzmy+Rpx3iOU5yFY=; b=uGinblejoS/q9obZfyXc10JYig
	55VXmrzVaF7BdXw2lx3h7Mvl+lDiesl+qBg2ehdSUM8l7KkiuZZs4wCURKMkcfprxfnP4Fm6u2YMv
	8kkj6Qn7vTSVmX64dtqpDFlBMM+e+yXX8R0KojDc1LWKdUzoES8nThuAmqeI8NuP6kzhnzO1LgTp8
	NMbuWYsYoUs7leDKqNn2SJOo8FIXFBgjZKFtYtYVhs0nnOi3CGNKsz4tZNcVjJCUibN+QN0bTY/c/
	xy3Voj1T3Lb1pMcvyWnUQIQOOvXwgqi7UramwGXQ0qY32Ipl9jRlNz/33nQmPAcvrgdFtRt+81+y7
	STLghG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CuI-0000000AdyU-2sPJ;
	Thu, 19 Mar 2026 12:55:22 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CuG-0000000AdwP-09sm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:55:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fc5Bg0c56z1prjs;
	Thu, 19 Mar 2026 20:50:03 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 950754056B;
	Thu, 19 Mar 2026 20:55:05 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 20:55:05 +0800
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemq200004.china.huawei.com (7.202.195.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 20:55:04 +0800
Message-ID: <4bbf64ef-e629-3908-b37f-d99c6639be2c@hisilicon.com>
Date: Thu, 19 Mar 2026 20:54:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Question about ARM KVM stage2 contiguous bit support for
 contiguous hugetlb
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<tangnianyao@huawei.com>, jiangkunkun <jiangkunkun@huawei.com>, "xuwei (O)"
	<xuwei5@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>
References: <704b6126-f1ad-4d8a-5709-a12e4c8c79ca@hisilicon.com>
 <87qzpocgol.wl-maz@kernel.org>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <87qzpocgol.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.115]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055520_684512_7F47130C 
X-CRM114-Status: GOOD (  12.64  )
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

On 2026/3/13 15:49, Marc Zyngier wrote:
> On Fri, 13 Mar 2026 07:09:40 +0000,
> Zhou Wang <wangzhou1@hisilicon.com> wrote:
>>
>> And do we have any plan to support this?
> 
> Not really.
> 
> Configurations that are looking at extracting the best possible
> performance use large mappings at S2 (hugetlbfs). I'm not convinced
> that there is a strong use-case for dealing with the contiguous hint
> at S2 when backed by anonymous memory. If you're not under memory

We want use 64KB basic page, in this case we have 2M cont PTE and 512M
block page. However, the latter may waste more memory.

> pressure, THP already gives you the uplift you want. If you are under
> memory pressure, you're unlikely to get the contiguity you want.
> 
> Additionally, dealing with the contiguous hint is a real pain.
> 
> If you are undertaking this work, please make sure to provide
> reproducible benchmarks and results that show a definite improvement
> on the majority of workloads.

We have a initial test in hardware emulator, for lmbench lat_mem_rd 1G
256 stride，the cost of virtualization will change from 17% -> 3%, we do
the test using a VM with 4 vCPU / 8GB memory in 64KB basic page / 2M
contiguous hugetlb system.

Will do more tests in the real chip.

Best,
Zhou

> 
> Thanks,
> 
> 	M.
> 

