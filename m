Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309ACD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCqC+fclu7sVj3OwwC1i530gr1DeutuEQFpGVVDViMk=; b=PSFvybmsoCYxDLo8NaJFIi7wLM
	2HvXqGNO+UBEk7yTq6CpR/5NOM5nzYdSZ8seBprjj0uOG3AI3ZbJBKxw+FygWT1IEmPHNUjQQQt1g
	5YIx2+qZLVJvvqR03KKVWdmcm9ThxySNG9trIezwJyxGq6wVyd6BmqtPS+eGwZC+k8WdvdMRaYyIp
	ZuL0aun+DAIJsNtBcjJW5+y68CFZVqARKVeBBaoL3lYWpSdTBKfy8n7POiTMkfuKldVLdRBvN3HMo
	Fpp4qg+qZdHwv1eREQDH+3ppPHTRUQ52ZZxPxIgqyieJrxIAlGG00tsy5e/HqD6DCAx/HEPAvgXbg
	z/iHVbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOayR-0000000GXCl-030o;
	Thu, 27 Nov 2025 12:19:47 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOayN-0000000GXCG-3fyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:19:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sCqC+fclu7sVj3OwwC1i530gr1DeutuEQFpGVVDViMk=;
	b=lKZ9LeXxwYKYStN9OpegM65caAjplSYELRYcUJBgbaugcgD2arrB/ko9W3OFbDFbbE8+sulxZ
	jAk7JoizZvEuam+puoFHejWnCvGRdArR5YC7oCybHL/+sbSYkxcjUffBujTKjQRXidwaskmWIPD
	/D9T8hAePRWITIin+aUTtS8=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dHFmf3BMvzpStk;
	Thu, 27 Nov 2025 20:17:22 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A8D01804F6;
	Thu, 27 Nov 2025 20:19:31 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 27 Nov 2025 20:19:30 +0800
Message-ID: <9fab5f94-33f2-419b-b0fb-200c7dbc8912@huawei.com>
Date: Thu, 27 Nov 2025 20:19:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] KVM: arm64: Support set the DBM attr during memory
 abort
To: Marc Zyngier <maz@kernel.org>, Tian Zheng <zhengtian10@huawei.com>
CC: <oliver.upton@linux.dev>, <catalin.marinas@arm.com>, <corbet@lwn.net>,
	<pbonzini@redhat.com>, <will@kernel.org>, <linux-kernel@vger.kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <20251121092342.3393318-3-zhengtian10@huawei.com>
 <86v7j2qlc8.wl-maz@kernel.org>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <86v7j2qlc8.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_041944_413423_78019FB8 
X-CRM114-Status: GOOD (  11.46  )
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



On 2025/11/22 20:54, Marc Zyngier wrote:
> On Fri, 21 Nov 2025 09:23:39 +0000,
> Tian Zheng <zhengtian10@huawei.com> wrote:
>>
>> From: eillon <yezhenyu2@huawei.com>
>>
>> Add DBM support to automatically promote write-clean pages to
>> write-dirty, preventing users from being trapped in EL2 due to
>> missing write permissions.
>>
>> Since the DBM attribute was introduced in ARMv8.1 and remains
>> optional in later architecture revisions, including ARMv9.5.
> 
> What is the relevance of this statement?
> 
I will remove this statement in v3.
>>
>> Support set the DBM attr during user_mem_abort().
> 
> I don't think this commit message accurately describes what the code
> does. This merely adds support to the page table code to set the DBM
> bit in the S2 PTE, and nothing else.
> 
Yes, this patch only adds support to set the DBM attr in the S2 PTE
during user_mem_abort(), and does not implement automatic promote
write-clean pages to write-dirty.

I will reward commit message of this patch like:

This patch adds support to set the DBM attr in S2 PTE during
user_mem_abort(). As long as add the DBM bit, it enable hardware
automatically promote write-clean pages to write-dirty, preventing
users from being trapped in EL2 due to missing write permissions.

> 	M.
> 


