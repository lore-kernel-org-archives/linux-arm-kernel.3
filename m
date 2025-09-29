Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B8ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HWtjlVeP9SWCpKiQq9t3W3n3XGxDg3Htcl9KL67snA=; b=XcCv8+bwRnxEgPGljevSHI9gWX
	PtqQZYcQeQxJ/oP6+VCOU8CLpFFf62E6vO/4BYLYN1H8NeANgrq71YXWKn1EDFHkYf7LZtw/2zhmK
	k6w+iS+jxd5RKRw7OhjFkYmEtPkSyfUMG3q2EtLrynO28mJLh6Or8KWlDqd4+OxXPNEACCrJOE6Z7
	h8aszML5flSoM9cTE3ZwmPiQlaaivNZKDU1/yoAJ2Mxqham+OZSO2NtNX4YqqQImqPQi7mPwwyWZL
	OEn7DjbzY8qYg8J23K1TALrI2ODgVU9Lm4hYl1TuBfCdGIZ7jaeNOHIrMbaGRsY17O+FbvD6T8kxh
	pqOA4NCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39np-00000001sBe-2YQz;
	Mon, 29 Sep 2025 09:04:13 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v39nm-00000001sAZ-245n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 09:04:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/HWtjlVeP9SWCpKiQq9t3W3n3XGxDg3Htcl9KL67snA=;
	b=hFqxCdsEfRxs/FrcxYa4h9sSffmskYQpWXOj8ApJEsUTmk86LI/ialmiYmGTL18eGQy99luT8
	HPrNDS9CmOr9U4HVet1tsGDllEIEsbFAzhgec5mvR1c9ZPsZq/WHYoPiwSJPKu6LkEZ2rkGzM7y
	67jd7anWvZ9AjtvIkNfDHQM=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4cZwGv3b0Yz12LGD;
	Mon, 29 Sep 2025 17:04:07 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C615180488;
	Mon, 29 Sep 2025 17:03:59 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 29 Sep 2025 17:03:58 +0800
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
 <3bbdc50e-a55c-96ed-a8db-6bbce1760ee4@huawei.com>
 <TY3PR01MB9983E784E31A612B9BA23255D51BA@TY3PR01MB9983.jpnprd01.prod.outlook.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <b8ab020f-8298-cadd-70ee-9325c32b968f@huawei.com>
Date: Mon, 29 Sep 2025 17:03:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <TY3PR01MB9983E784E31A612B9BA23255D51BA@TY3PR01MB9983.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_020411_101720_62B83504 
X-CRM114-Status: GOOD (  15.22  )
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

On 2025/9/29 15:32, Kazuhiro Abe (Fujitsu) wrote:
> Hi Hanjun,
> 
>>> Hi Hanjun & Sudeep
>>>
>>>> Hi Ilkka
>>>>
>>>>> Hi Kazuhiro,
>>>>>
>>>>> On Fri, 5 Sep 2025, Kazuhiro Abe wrote:
>>>>>> AGDI has two types of signaling modes: SDEI and interrupt.
>>>>>> Currently, the AGDI driver only supports SDEI.
>>>>>> Therefore, add support for interrupt signaling mode The interrupt
>>>>>> vector is retrieved from the AGDI table, and call panic function
>>>>>> when an interrupt occurs.
>>>>>>
>>>>>> Signed-off-by: Kazuhiro Abe<fj1078ii@aa.jp.fujitsu.com>
>>>>>
>>>>> Looks good to me.
>>>>>
>>>>> Reviewed-by: Ilkka Koskinen<ilkka@os.amperecomputing.com>
>>>>>
>>>> Thanks for your review.
>>>>
>>>> Best Regards,
>>>> Kazuhiro Abe
>>>>
>>>>> Hanjun & Sudeep, what's your thought on enabling the use of regular
>>>>> interrupts here? I do agree the spec talks about non-maskable ones
>>>>> and to my understanding that's what the idea was indeed.
>>> Do you have any thoughts on this matter?
>> For the real use case, if the system is in failure state, for example, the system is
>> panic, the CPU will not handle regular interrupts, so what's the use case do you
>> have to use regular interrupt?
> This driver is designed to operate with NMI enabled.
> 
> However, on current ARM64 platforms, NMI functionality may not be active unless
> "pseudo NMI" is explicitly specified via a kernel command-line parameter.
> In such scenarios, we've included regular interrupt handling as a last resort,
> anticipating rare cases where some cores might still be able to receive regular
> interrupts even if other cores are unresponsive.
> 
> To reiterate, the underlying assumption is that NMI(now pseudo NMI) is enabled for use.

OK. Please send a new version, I will ack it
if you address my comments.

Thanks
Hanjun

