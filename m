Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE15E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7ZdFIOQHwqPMa8tmn8WeXqIrLZITf12PwojoLtVGX4=; b=H8NWKU1z/XHIJynIa4rD5NZ80Y
	zSK7iXa/cvySczRfSHxGqwEHo5ab78hloKUTj3NseeD6HJrno5i0G3aV5idKdSfzaiTebnp1+7acA
	/VPmc5OnvulBEjXpvy+kyK8UnL1qQeWUMWReOneCq+gpn96t5H/DZ1B3F0sxYU3k55btNjIK1HKcO
	0xSe0qQCtigh1uTdmjL33sqrAAYbaGlCM4oEY1OhueG4/+ZL0yOZOiE+YiV8sPXHoi6nTQ7bhzq98
	gOzZ6I0j0w/U0Ti4mnRm1Av7ZM3L9Vp0oLZkp9vfpEqbjEyXF+x/kWBIReqfNJ22gpy2YD2yiYRSk
	NTLMdeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIaK-0000000EJyD-3OEM;
	Wed, 11 Dec 2024 09:00:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIZE-0000000EJk7-487H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:59:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00A31C0003;
	Wed, 11 Dec 2024 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733907572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ZdFIOQHwqPMa8tmn8WeXqIrLZITf12PwojoLtVGX4=;
	b=inqpUsRSkcB94b7GwsAZU21kVVmqOTI5L/EzRdBn2l1edxocTCTwL/1DjHvKKl+mggFx00
	fNfHWoIT0JqNCHI5IrLq89sAfDkIxUEizzwXYoAzfsI1+ETRMTuVt5XHoaG+f0BdP18b5s
	3WcDWQ9AVc3t4Z9jKVtLII5FTG5dihFuyLgXJGherdEzYefBDYRAt5vfORUpMFM49zJRVN
	nSorMiqf7toaKTsXLKHpsSZWQRgw6yfUCmURYPVbnfJZWL5e76boJ0ZIE/qcTOShiA9UBN
	8ltMQx0Q8+5N2Fi6lKAvOjJWdSlZDTdxG/etmfwyeZhv8ASwtw1M4ShI/WHaGQ==
Message-ID: <6c7cb07c-af9e-4f69-84df-2b59a57e4182@bootlin.com>
Date: Wed, 11 Dec 2024 09:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: j721e: In j721e_pcie_suspend_noirq() check
 reset_gpio before to use it
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: vigneshr@ti.com, s-vadapalli@ti.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
 kwilczynski@kernel.org, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, u-kumar1@ti.com
References: <20241210154256.GA3242512@bhelgaas>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20241210154256.GA3242512@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_005937_290904_6B952FA9 
X-CRM114-Status: GOOD (  17.63  )
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

On 12/10/24 16:42, Bjorn Helgaas wrote:
> On Mon, Dec 09, 2024 at 12:23:21PM +0100, Thomas Richard wrote:
>> The reset_gpio is optional, so in j721e_pcie_suspend_noirq() check if it is
>> not NULL before to use it.
> 
> If you have occasion to post a v2, update subject to:
> 
>   PCI: j721e: Check reset_gpio for NULL before using it
> 
> s/before to use it/before using it/
> 
> Did you trip over a NULL pointer dereference here?  Or maybe found via
> inspection?

By inspection

> 
> It looks like gpiod_set_value_cansleep(desc) *should* be a no-op if
> desc is NULL, based on this comment [1]:
> 
>  * This descriptor validation needs to be inserted verbatim into each
>  * function taking a descriptor, so we need to use a preprocessor
>  * macro to avoid endless duplication. If the desc is NULL it is an
>  * optional GPIO and calls should just bail out.
> 
> and the fact that the VALIDATE_DESC_VOID() macro looks like it would
> return early in that case.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c?id=v6.12#n2316

Oh yes you're right.
In fact, the if statement in probe() and resume_noirq() is for msleep(),
not really for gpiod_set_value_cansleep().

So this patch is useless.

Regards,

Thomas

