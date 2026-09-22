Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD2C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4OeW3luyIICrk7TMlGAc08jfnsvhFPtK/vh0dt3e8U=; b=3WHI3G1C/R0CKaZKqTauTTzMa+
	d87F1V5IxIsnudfOjUTzi6fXgCc0YTtdIMHUbw/zgRwcSWZIibpRJSnUegOmG4CNh6cV44XJAGYso
	ezHsoXbd0Ex1OqdLIkfyjv7Dqi6jzvkO3os5VAmDrvSg7Cu+DxIRKVBTe00vb9T6WC/7gsOG+7SaV
	J7fvcFe9l+xJjNlU4YCS7nSa5UDJMAiDY2sx/6s7EnmMsWa1hbf+ysvTV0cRI3HRUz35W2GNR4yDO
	lAMfss4Ts2yN9ULhjH78vI++Du0fxQU/kBoW001NWK/xlHxr0isHvVr0rxLqZzx36nOX2NPsJbsdl
	LmJbqK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pdL-00000003v3Y-254Z;
	Tue, 22 Sep 2026 01:49:25 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8pdI-00000003v2U-16Ti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:49:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=u4OeW3luyIICrk7TMlGAc08jfnsvhFPtK/vh0dt3e8U=;
	b=XEF5AifigFLHzC6vPt7jWVXHWqO7TWWcV78nB/QcHJKH+wQYNSJ4PBgCX/HuDvg+1I0z2IrXa
	jThMnLDdz1DVJ7xjwM1N2r4i+3rTj7noDOt9HSYkB4YMxcNdPt4j9ZVsyzkGZJjNigM7EHNfuEe
	W5AohBmvbW1es3JjuhpjoMw=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hpjR63t71zLlXD;
	Tue, 22 Sep 2026 09:38:10 +0800 (CST)
Received: from whupemk200014.china.huawei.com (unknown [7.152.185.79])
	by mail.maildlp.com (Postfix) with ESMTPS id B3C0F4048B;
	Tue, 22 Sep 2026 09:49:12 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 whupemk200014.china.huawei.com (7.152.185.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 22 Sep 2026 09:49:11 +0800
Subject: Re: [PATCH v2 1/3] firmware: arm_ffa: Split the response out of
 ffa_msg_send_direct_req2()
To: Jamie Nguyen <jamien@nvidia.com>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Dat Mach <dmach@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260901192906.133670-1-jamien@nvidia.com>
 <20260901192906.133670-2-jamien@nvidia.com>
 <348dfed7-6aa2-77a2-a0a9-3aeed22f46b8@huawei.com>
 <20260921174941.2406319-1-jamien@nvidia.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <bd33caf3-76d0-eff8-23e2-a9e51136d5e3@huawei.com>
Date: Tue, 22 Sep 2026 09:49:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260921174941.2406319-1-jamien@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemk200014.china.huawei.com (7.152.185.79)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_184920_801082_7B7B2CE0 
X-CRM114-Status: GOOD (  13.99  )
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

On 2026/9/22 1:49, Jamie Nguyen wrote:
>> The kernel document was updated for this, please update the
>> rest of two patches as well.
> 
> I'll update all three patches to use:
> 
>      Assisted-by: LLM
> 
>> As you noted in the cover letter, the AML thread will stall here if no
>> response, block the ACPI interpreter and the ACPI global lock when
>> the field is Lock-flagged, so do we have some warnings if that happened?
> 
> There's no warning today. Would a rate-limited warning after a prolonged
> wait be useful here? I'm hesitant because that would also affect non-ACPI
> callers of this helper, and I don't believe FF-A defines a threshold after
> which the wait is abnormal.

Let's keep the code as it is.

> 
>> resp_regs[1] is confusing, comment here it links to X1 register
>> is better.
> 
> I'll clarify that resp_regs[1] is X2; resp_regs[0] is X1.

Sorry, but it was confusing me :)

Thanks
Hanjun

