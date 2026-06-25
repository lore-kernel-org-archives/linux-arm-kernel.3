Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1186ACDE007
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mXIj+mN0okDzD2iEIEK87JUucdAnGmmd68jsRDhCyI=; b=cxOa32C/iGAVXJQF7CX2V1XB5V
	qp36Gykt156Py4wU+0p/FgGlOhMR8gCvAFb3jJPOdLe3d1XG5jsYs739WsvZt1eIbahPq1Ov4+S55
	yX4xNlFbvgWcjtIhgh2UYl6UEfV7uEb+DhqRXXt1E37V5rgBlc/jMJZQ0cs+OUqzSd0kzP0ZniQk2
	ThAZh2BHVEwIfcn/ERa8wGnfpvkG1Iar4TDLLtIOfcIVByzxrsQ2djACrnUVGAen9OUkfFMH8FB7M
	ylwUqzBvERajaA8x6vyky3+YsbJgxjnDNkDHq3N5bLYrNmqCjgYQv+SrEbGEHl5wqrp3rEqOqZ6ZY
	VZLYIdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciq3-000000099N7-3844;
	Thu, 25 Jun 2026 12:05:47 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciq1-000000099MP-283W;
	Thu, 25 Jun 2026 12:05:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EF0D1A0C8A;
	Thu, 25 Jun 2026 15:05:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782389141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9mXIj+mN0okDzD2iEIEK87JUucdAnGmmd68jsRDhCyI=;
	b=iHUltsGXX/Iok1BcHLC8NxNAXZxiLB+f7d3VPaStvR6pB8Z9s3jDvPszknOwZwAJFsv/SJ
	HFGmAa/Kypg57bgHOa4XwhwnZZie1Y9j7TsMAt0cP6PC+1G5EhxOZXsZQyqI0OFkbOGkUx
	neQ857sOVo4ggIOzoT4h668BIdiHwrcauN7lTfDDXkbC8eGDCwCXGoEbk6z0f/1YjPO5zK
	6zvUs+KbcYqJgZ9X9Rs9T+ThfEwVkeWwZ61fZDSBTVsVzBWALbKYy0KUeRaqCaZW5nvQzm
	enUSEkzFyHe6r9+KCLS9ZHFgOYc6J0tepzgcTtxA9WkCJGejnRM4jfSZel/PVA==
Message-ID: <49c2aeb0-39b9-4bbe-833e-b18e38167f8e@baodeep.com>
Date: Thu, 25 Jun 2026 15:05:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
 <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
 <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <CAMRc=MdP8Wf6QRXGHpb3KJW2KMidSe-0LeyKKTYix=wYKZcPuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_050545_722234_88BE75E3 
X-CRM114-Status: UNSURE (   9.67  )
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

Hi!

24.06.2026 10:25, Bartosz Golaszewski wrote:
> On Tue, 23 Jun 2026 17:16:44 +0200, Robin Murphy <robin.murphy@arm.com> said:
>> On 11/06/2026 9:26 am, Marek Szyprowski wrote:
>>> Hi Viachesla,
>>>
>>> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
>>>> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
>>>> the underlying chip's can_sleep, but under that lock it calls config and
>>>> direction ops that reach sleeping pinctrl paths. On a controller with
>>>> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
>>>> runs from atomic context:
>>>>
> 
> ...
> 
>>>
>>> I've checked this patchset with these two reverted and no warning was reported.
>>
>> If it hadn't already been fixed (...)
>>
> 
> About that - Viacheslav, do you still plan to submit v2 of this?

Thanks for review. I prepared and sent the second version of the patch today

> 
> Bart
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


