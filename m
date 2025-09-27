Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982CFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 02:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI6gK1u+SSlZMGjiWcAQCjC134z2KdglVZTgaQtrcHY=; b=FycnzmZY/oOjMKDanNOWM7Qby8
	2YKJjIRZq2iDyFgZ9AL9GeXIMxkLA+z172Dx/ifWXAqAAXXLc8hQbmpV57TOtrUEj86TBDjV9fL00
	BYBM5Nb62cxPFs+MCUpyFq9/eZRyHyGgG/P2v+FSEFODnQZry1tB8zJ+i8Y/5o9tv7f9LPIo1ARBC
	IzCA1Gotfi4sjGqRS6mIAAkhTuJRykz8/gpoU4nnzDbI4eJILFWLZNjoSgVd5qmNlCs85Uj53QH8A
	FYffvf5J3qErtcPTVX8rcMP7NUTH6NyKLlCHFRpwF+V0c45lz9H1sPSNSTM21MsWOetoAToPBp5Lx
	bsjlm1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2L6R-00000006Vgx-1vUa;
	Sat, 27 Sep 2025 02:56:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2L6O-00000006VdH-132i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 02:56:02 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cYX7C19WHz1R8ds;
	Sat, 27 Sep 2025 10:52:39 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 48E7114011F;
	Sat, 27 Sep 2025 10:55:49 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 27 Sep 2025 10:55:48 +0800
Subject: Re: [PATCH v3] ACPI: AGDI: Add interrupt signaling mode support
To: "Kazuhiro Abe (Fujitsu)" <fj1078ii@fujitsu.com>, 'Ilkka Koskinen'
	<ilkka@os.amperecomputing.com>, 'Sudeep Holla' <sudeep.holla@arm.com>
CC: 'Lorenzo Pieralisi' <lpieralisi@kernel.org>, "'Rafael J. Wysocki'"
	<rafael@kernel.org>, 'Len Brown' <lenb@kernel.org>,
	"'linux-acpi@vger.kernel.org'" <linux-acpi@vger.kernel.org>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>
References: <20250905042751.945616-1-fj1078ii@aa.jp.fujitsu.com>
 <bd45c06a-77cc-2ab3-122e-41dee1aee0ac@os.amperecomputing.com>
 <TY3PR01MB99836C3D57503E70C8B8C9E9D509A@TY3PR01MB9983.jpnprd01.prod.outlook.com>
 <TY3PR01MB9983025D434CAA2CDF83656BD511A@TY3PR01MB9983.jpnprd01.prod.outlook.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <3bbdc50e-a55c-96ed-a8db-6bbce1760ee4@huawei.com>
Date: Sat, 27 Sep 2025 10:55:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <TY3PR01MB9983025D434CAA2CDF83656BD511A@TY3PR01MB9983.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_195600_479602_1DB9D160 
X-CRM114-Status: GOOD (  11.97  )
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

On 2025/9/19 13:05, Kazuhiro Abe (Fujitsu) wrote:
> Hi Hanjun & Sudeep
> 
>> Hi Ilkka
>>
>>> Hi Kazuhiro,
>>>
>>> On Fri, 5 Sep 2025, Kazuhiro Abe wrote:
>>>> AGDI has two types of signaling modes: SDEI and interrupt.
>>>> Currently, the AGDI driver only supports SDEI.
>>>> Therefore, add support for interrupt signaling mode The interrupt
>>>> vector is retrieved from the AGDI table, and call panic function
>>>> when an interrupt occurs.
>>>>
>>>> Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
>>>
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>>>
>>
>> Thanks for your review.
>>
>> Best Regards,
>> Kazuhiro Abe
>>
>>>
>>> Hanjun & Sudeep, what's your thought on enabling the use of regular
>>> interrupts here? I do agree the spec talks about non-maskable ones and
>>> to my understanding that's what the idea was indeed.
> 
> Do you have any thoughts on this matter?

For the real use case, if the system is in failure state, for example,
the system is panic, the CPU will not handle regular interrupts, so
what's the use case do you have to use regular interrupt?

Thanks
Hanjun

