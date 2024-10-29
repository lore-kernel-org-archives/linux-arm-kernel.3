Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4FAD5B870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 04:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKPs61B9fUxgsILR9lbpLsjUUSLbpl0zrjxuEPmlMb8=; b=EOgCVdjs0JMEyt6nC24TlBNULO
	uvnjzZbpYZGUor0olA5chb6oINajxSMgroqius6VoKcBJVOCpivyJTTNzneIqsnyAo6VYeGwL0tTO
	hGBum4Bb/9wanpb7xnS8p5b+zTiO4uxLFU2C45gc0Jiivi4Je0W53PWAMl9euANQUiEjORPIdV9jt
	TEgZR1PHElLo5AmqeA1vdcouzswA/+Yt667iPvU0wDzkLwi6eILf+a5ZniVx5xLAQd4xIEB1ah8qa
	ddfsZ/NvxKLVR3WpfUq0QiB1ZgMXoFSWBFM+a6xDiPBIsgGHvoWyWpU/PeEonij3OaYLskl4ezTPU
	XgOx4UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dOu-0000000D8yJ-04ll;
	Tue, 29 Oct 2024 04:00:12 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5dNG-0000000D8hs-3WIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 03:58:32 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XcxJs71rnz2DdVN;
	Tue, 29 Oct 2024 11:56:45 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 737D31A016C;
	Tue, 29 Oct 2024 11:58:16 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 29 Oct 2024 11:58:15 +0800
Subject: Re: [PATCH -next] KVM: arm64: Fix possible null-ptr-deref in
 idregs_debug_show
To: Marc Zyngier <maz@kernel.org>
CC: <oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<sebott@redhat.com>, <wangweiyang2@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>
References: <20241024083350.2828920-1-cuigaosheng1@huawei.com>
 <86wmhx3l34.wl-maz@kernel.org>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <f14c747d-6dc4-839c-def5-ea4f0f726e37@huawei.com>
Date: Tue, 29 Oct 2024 11:58:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <86wmhx3l34.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_205831_064354_09B3B1CA 
X-CRM114-Status: GOOD (  16.91  )
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

On 2024/10/24 17:29, Marc Zyngier wrote:
> On Thu, 24 Oct 2024 09:33:50 +0100,
> Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>> The idregs_debug_show() maybe return nullptr, we need to check desc
>> before dereference it to avoid possible null pointer dereferences.
>>
>> Fixes: 410db103f6eb ("KVM: arm64: Make idregs debugfs iterator search sysreg table directly")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   arch/arm64/kvm/sys_regs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index ff8c4e1b847e..b1c59773b9c0 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -4135,7 +4135,7 @@ static int idregs_debug_show(struct seq_file *s, void *v)
>>   
>>   	desc = idregs_debug_find(kvm, kvm->arch.idreg_debugfs_iter);
>>   
>> -	if (!desc->name)
>> +	if (!desc || !desc->name)
>>   		return 0;
>>   
>>   	seq_printf(s, "%20s:\t%016llx\n",
> Can you show a case where this happens in practice?
>
> The check for NULL is already in idregs_debug_next(), and I don't see
> how this can actually be triggered.

I haven't found a scenario that can trigger this problem，this patch was
discovered during code review，I will try to prove it.

Thanks for your work.

>
> Thanks,
>
> 	M.
>

