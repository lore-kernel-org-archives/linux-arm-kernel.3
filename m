Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B602E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKNHQWTpUdMTuuuYQmeQEhaz3fxhEUu13oWLNebrmjw=; b=MWojUkCG4bP+LmOmfBVIQsU1B/
	WpRmNLVwBbENj6ZXXOkwMohB/OdWudM9RS9DeUDYTUGso7RdkIJ1WpKvqvg4arBBvBaOMuFGSwkS1
	/6q8hO38y8n22X9Cg5KmQ7zqDRtkI2NinlK4R2t4rms8IfntdyRYue2V0dZQxt6JX122cxiGqj/ew
	bHQmlwQEn+aJFT+ZA4HM2F12MkEMx1mcp8g61ipx3Bz8ji1viT4ZMKrUh/c9yRfmNb9407R0lLBK7
	yhlnMgYvLYwvZJq6QAfx/dcmFLTqusYvcKe6q9fxPpjXRHstFe+2Gm8Kzdr+zYWhIc8WDzN5eeXEX
	TxOvEtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObVs-00000004pAy-2Wgf;
	Fri, 20 Dec 2024 11:49:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObUH-00000004ovk-3jpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:48:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3380E1480;
	Fri, 20 Dec 2024 03:48:37 -0800 (PST)
Received: from [10.57.31.233] (unknown [10.57.31.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E8043F58B;
	Fri, 20 Dec 2024 03:48:07 -0800 (PST)
Message-ID: <f0c15466-a27f-4cc2-90a1-476ec278d870@arm.com>
Date: Fri, 20 Dec 2024 11:48:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
 <Z2VJIh2+Z40bZi1e@e129823.arm.com>
 <ac537889-dc0a-4d2e-870b-c5a33279633e@arm.com>
 <Z2VXc/R/nOLGz+Cg@e129823.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Z2VXc/R/nOLGz+Cg@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_034809_981292_F150CCC0 
X-CRM114-Status: GOOD (  11.62  )
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

On 20/12/2024 11:39, Yeoreum Yun wrote:
> Hi Suzuki,
>> On 20/12/2024 10:38, Yeoreum Yun wrote:
>>> Hi Mike.
>>>
>>>> Notably missing is the same changes for the etm3x driver. The ETMv3.x
>>>> and PTM1.x are supported by this driver, and these trace source
>>>> variants are also supported in perf in the cs_etm.c code.
>>>
>>> But I wonder etmv3 needs to change. Because its spinlock is used only
>>> via sysfs enable/disable path.
>>> So, I think it doesn't need to change the lock type.
>>
>> ETM3 can be used in perf mode, similar to the ETM4x.
>>
>> So, you need to fix it as well.
> 
> Yes. But etmv3's etmdata->spinlock doesn't used in perf path
> its usage is only in sysfs interface path.
> That's why I think it could skip too.

Ok, which I think is a problem, since the sysfs mode could overwrite the 
"config" while perf is preparing the config from the event parsing.
And we would need it there. So, for the time being, we can accept this
series, pending other review comments and address this issue separately

Suzuki


> 
> Thanks.


