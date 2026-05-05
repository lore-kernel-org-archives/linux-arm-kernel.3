Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C05CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 04:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B2CunHCGpiMjcTDIPvkA5wnx3g/cxDEDO4exp2ZkTA=; b=vvTXzyVwNbW07qmZ47Zm/ce7q/
	YfLWuOrFcvePAF9KRlLDhX4+frEG1tJhcfuKG++kZowb9RVbM9ioRQ4OurAmTYIQuEcIeP6xKEHdS
	R3hNEWfZxZOz1a28JXcs0L1FuF2DrlgLFsnurZPYGo7RpQ5DBGON3A64vqY3YjJMX3DBfVkYyFEWt
	b3sxx6V4X1oNMvVgQQZwTpkAEiuOLKrxyD+Q8cOb4hds78N3JRRcJf8V4SHNiWb+NjymjxhKG/8JS
	zIGENPUk4qst72ov/iR6xBbYFw/isjjbBSxHsmSwccWjTsYPN5dludmihYIA7IzpDZUYiTXpmbi47
	mXpoTwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7Kl-0000000F6Go-0Bns;
	Tue, 05 May 2026 04:24:35 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK7Kh-0000000F6FH-3qKQ;
	Tue, 05 May 2026 04:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3B2CunHCGpiMjcTDIPvkA5wnx3g/cxDEDO4exp2ZkTA=;
	b=VBoDHIY4WJJi70YRfo0kb2nK/+cju4NajjJmVjFHGt7bThYMY/JDla9gJih2UX
	KZEWKBLXh/MbVlXiXid8BOx2ovYOfsu7WpBfnOLNrzg2JJJjL5dc2c5mpWgtzOZx
	WMWtVyyYMzkssQTjuVe2VJeOtqZUuZud/YB6NXldV8GlY=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3T+7RcPlpXxPvDQ--.4818S2;
	Tue, 05 May 2026 12:23:46 +0800 (CST)
Message-ID: <9be240fa-ab46-4b58-9240-5e96cab8a097@163.com>
Date: Tue, 5 May 2026 12:23:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
To: David Laight <david.laight.linux@gmail.com>
Cc: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 lhjeff911@gmail.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
References: <20260430155456.36998-1-18255117159@163.com>
 <20260501093050.3f97cd3e@pumpkin>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260501093050.3f97cd3e@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3T+7RcPlpXxPvDQ--.4818S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw48Cr43ArW3JFykuFWfKrg_yoW5GrW3pF
	48GF42vFs7JrWFkF4xCrW5CF1Yya4fKrWjga4Ut3s3ZwnYvr17ZrWkt3WrWa9rAFykGFWx
	KF4jy3s0k3ZxZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4OJOUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxUqzWn5cNXchAAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_212432_321321_47BD75B9 
X-CRM114-Status: GOOD (  13.16  )
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



On 5/1/26 16:30, David Laight wrote:
> On Thu, 30 Apr 2026 23:54:46 +0800
> Hans Zhang <18255117159@163.com> wrote:
> 
>> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
>> macro across multiple SPI controller drivers. This improves readability and
>> adds compile-time checking without functional changes.
> 
> I don't think these changes are worth the effort.
> The readability doesn't change much - you need to know what a slightly
> more obscure 'helper' does.
> The extra compile-time checks are pretty unlikely to ever find a problem
> and mostly just slow down the compile.
> The generated code is likely be slightly worse.
> And, with the best will in the world, it is easy to make silly mistakes.
> 
> 	David

Hi David,

FIELD_MODIFY() is a standard kernel helper (bitfield.h), not an obscure
one. My recent power domain series using similar patterns was accepted:

https://patchwork.kernel.org/project/linux-pm/cover/20260430163213.44695-1-18255117159@163.com/

The PCIe maintainer also values this kind of code simplification, which
encouraged me to send these SPI patches.

The macro offers compile-time overflow checks, and I've verified the
generated assembly is identical (GCC/Clang). I believe the trade‑off
favours readability and safety.

If you still prefer to keep the open‑coded versions, I'll drop the
series. Please let me know.


Best regards,
Hans

> 
>>
>> Each patch modifies a single driver, allowing independent review and
>> application.
>>
>> Hans Zhang (10):
>>    spi: amlogic-spifc-a1: Use FIELD_MODIFY()
>>    spi: amlogic-spisg: Use FIELD_MODIFY()
>>    spi: cadence-xspi: Use FIELD_MODIFY()
>>    spi: meson-spicc: Use FIELD_MODIFY()
>>    spi: nxp-xspi: Use FIELD_MODIFY()
>>    spi: sn-f-ospi: Use FIELD_MODIFY()
>>    spi: stm32-ospi: Use FIELD_MODIFY()
>>    spi: stm32-qspi: Use FIELD_MODIFY()
>>    spi: sunplus-sp7021: Use FIELD_MODIFY()
>>    spi: uniphier: Use FIELD_MODIFY()
>>
>>   drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
>>   drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
>>   drivers/spi/spi-cadence-xspi.c     |  3 +--
>>   drivers/spi/spi-meson-spicc.c      |  5 ++---
>>   drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
>>   drivers/spi/spi-sn-f-ospi.c        |  5 ++---
>>   drivers/spi/spi-stm32-ospi.c       |  7 +++----
>>   drivers/spi/spi-stm32-qspi.c       |  5 ++---
>>   drivers/spi/spi-sunplus-sp7021.c   |  3 +--
>>   drivers/spi/spi-uniphier.c         | 13 +++++--------
>>   10 files changed, 27 insertions(+), 44 deletions(-)
>>
>>
>> base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b


