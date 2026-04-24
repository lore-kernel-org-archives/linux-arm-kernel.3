Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EA3FB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wOOuJYHpYbOuEeycs12zNp1Rnfrdks0Fil+00MPKdM=; b=rctYxU1AuMIieKsspzby9czubi
	vV1brfq5RDAKukiGCZ0U4ixMNcQ14+usIuxNG1ad4s+HZd76Je/reDqgquBxOl6jZEoQ+k18RxjBx
	k/jd0u7Bnd0lAZPSOY8n3P+96LU9zx/50d9SetFuxICRkFdcq9pi9Ov+k4jZ0sPT0ODBp3fxZhwFk
	d3FYsEswLrpTdiGNg+I+W93KcG0Yb8mUC2rGjLZ5enEpTjYHrxue0ZyTg1ZcJ1fegL2XwBKU6ECqC
	3MnR2YJQHUhEVinFm82ZtJvX1WKya4EB7tSVf1LlmWit4oZCOsdpmAJBOtXNYBfyNbWsn5lJGamwE
	Rg5TYpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGALE-0000000CiyV-0blo;
	Fri, 24 Apr 2026 06:48:44 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGALB-0000000Civl-0iVp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:48:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0wOOuJYHpYbOuEeycs12zNp1Rnfrdks0Fil+00MPKdM=;
	b=DPpgY3/SfNnZvib1urs+Yfyun56s9Ml4uYUtkoTnCjHagEI862zCQ98Mm0uv7Kv5WMucEYxVE
	/0N5//JNhot9mldmWAhp0DwClZd9KdKYDAhpr6g38pR7C5MCM8CtB68TQPGZpf1drJ7UHRIafJp
	j5d1FwoAyQSHAjPU7KsNtrc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4g23Kg1SZnznTVg;
	Fri, 24 Apr 2026 14:42:15 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 08CAA402AB;
	Fri, 24 Apr 2026 14:48:28 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 24 Apr 2026 14:48:27 +0800
Message-ID: <0403d30d-e75e-4922-b8c1-8cae349f3dc2@huawei.com>
Date: Fri, 24 Apr 2026 14:48:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF
 events
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <yezhenyu2@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <20260225040421.2683931-5-zhengtian10@huawei.com>
 <acQj5grOdZT8LUGp@devkitleo>
 <e3253959-0340-4c13-a980-a599e090a6de@huawei.com>
 <acabezCO4B5BE40Q@devkitleo>
 <4e800c1e-25db-4aa2-b100-63434973de93@huawei.com>
 <acpfD3YjMpEdL5KZ@devkitleo> <aeeHNMqDx5Yipt_K@devkitleo>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <aeeHNMqDx5Yipt_K@devkitleo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_234841_714271_A38D50F2 
X-CRM114-Status: UNSURE (   9.72  )
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


On 4/21/2026 10:18 PM, Leonardo Bras wrote:
> On Mon, Mar 30, 2026 at 12:31:28PM +0100, Leonardo Bras wrote:
>> On Sat, Mar 28, 2026 at 02:05:25PM +0800, Tian Zheng wrote:
>>> On 3/27/2026 11:00 PM, Leonardo Bras wrote:
>>>> On Fri, Mar 27, 2026 at 03:35:29PM +0800, Tian Zheng wrote:
>>>>> On 3/26/2026 2:05 AM, Leonardo Bras wrote:
>>>>>> Hello Tian,
>>>>>>
>>>>>> I am currently working on HACDBS enablement(which will be rebased on top of
>>>>>> this patchset) and due to the fact HACDBS and HDBSS are kind of
>>>>>> complementary I will sometimes come with some questions for issues I have
>>>>>> faced myself on that part. :)
>>>>>>
>>>>>> (see below)
>>>>> Of course! Happy to exchange ideas and learn together.
>>>> :)
> Hello Tian,
>
> On the above, HACDBS depends on HACDBSIRQ which can be announced by either
> device-tree or ACPI.
>
> Do you think it's ok for it to be ACPI only, for now?
>
> Thanks!
> Leo

Hi Leo,

No problem with ACPI-only for HACDBSIRQ for now.

Feel free to let me know if you have any questions while working
on HACDBS on top of HDBSS.

Tian


