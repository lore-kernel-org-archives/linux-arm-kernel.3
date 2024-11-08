Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDCFD5E127
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 03:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPFUr8UiBLYMQDSvTLu33lC34iUO26uZjwaaeMBWM0E=; b=Q1rTfYmyiP0EZo0HIeCQkH1vAG
	w5BUf7sUxAX464MRPgycPHqjFGeO0rx4pqBB6TjIMt8kQmwOpUYXdJA4Nd005wjJsPMFArvsqUbfn
	Ogp3V5OYvZky/0R4rcGaCFfm1T4yWCr343bJkp8zdxOe5Fq3b5v9QCh6SWhVr40FO0DQ7ar1aTbWf
	66wP0rhhvVONTJZ7gMElhh2hnEmZgL8INEYkRtfr8W73/vIBdWX71CXjd+Mucrb48Jv2LILHi+lR+
	Yzd+RtHQ3jBT0+tuj/u/FWWbPBQT3Zz88ObXrWJrB3dQSvDq+RxZvdnAkUhbrywDz4sEzHN7lMZKB
	O80o92lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9G4q-00000009BdU-412U;
	Fri, 08 Nov 2024 03:54:28 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9G35-00000009BSn-3LkL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 03:52:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xl4lc1hH7z1ynvJ;
	Fri,  8 Nov 2024 11:52:44 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id C3224140138;
	Fri,  8 Nov 2024 11:52:33 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Nov 2024 11:52:33 +0800
Subject: Re: [PATCH] acpi/arm64: Adjust error handling procedure in
 gtdt_parse_timer_block()
To: Sudeep Holla <sudeep.holla@arm.com>, Aleksandr Mishin <amishin@t-argos.ru>
CC: Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Will
 Deacon <will@kernel.org>
References: <20240827101239.22020-1-amishin@t-argos.ru>
 <ZtCfKEIfJW7X8UWg@bogus> <ZtCgyuQ4IRr9Mx8x@bogus>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <9d53d1f4-1f65-be5e-f68d-18799080a2e5@huawei.com>
Date: Fri, 8 Nov 2024 11:52:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ZtCgyuQ4IRr9Mx8x@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_195240_008505_7C2DB4D7 
X-CRM114-Status: UNSURE (   9.14  )
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

+Cc Catalin and Will

On 2024/8/30 0:24, Sudeep Holla wrote:
> On Thu, Aug 29, 2024 at 05:17:44PM +0100, Sudeep Holla wrote:
>> On Tue, Aug 27, 2024 at 01:12:39PM +0300, Aleksandr Mishin wrote:
>>> In case of error in gtdt_parse_timer_block() invalid 'gtdt_frame'
>>> will be used in 'do {} while (i-- >= 0 && gtdt_frame--);' statement block
>>> because do{} block will be executed even if 'i == 0'.
>>>
>>> Adjust error handling procedure by replacing 'i-- >= 0' with 'i-- > 0'.
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>
>>
>> (For some reason I don't see the original email in my inbox, might have
>> got blocked 🙁). Anyways LGTM,
>>
>> Acked-by: Aleksandr Mishin <amishin@t-argos.ru>
> 
> Sorry I messed up, I meant
> 
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Catalin, this is a fix, and was acked by Sudeep and me, could you
merge it for next release cycle?

Thanks
Hanjun

