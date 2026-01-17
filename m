Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17141C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 02:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cm5Wp8stDwRLzC/ClhKyPOEbBhpVhy/nTFwwMOc004U=; b=ig1cgh+CwAyd5iNNmtKDa39wdi
	/WKyyk0aWVEmgK7ibTY+X9DLmopk5eVxkBm8HNxELdr45O6G35x9HPYMyuy8Et0MS9GsiPm+U3XpW
	s81OHYtEZwJixRFL6wbOpA1iRZdcdpoFafkM5r+OH5DtM94C13JbV1W4MBj7uZ65+nUJ4QhPlEcej
	w6/iuZgHBnqn6nEnEyz3YvqqnvmMIVGth7hOrhlU0SebFYD9DYbRyurQhDEkbfLPN1f+J7ATCLFpn
	TPlUB36GH/gzjq2HtXPK61yBTrASy08AypEJGfLFyxgZBRm+0NJG5Q7atMkKU1pv/nrVSoxL6Ex00
	16GWnLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgvlg-0000000F7Lo-29cx;
	Sat, 17 Jan 2026 02:10:24 +0000
Received: from mail-m81206.netease.com ([47.88.81.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgvlb-0000000F7L1-3qp8;
	Sat, 17 Jan 2026 02:10:22 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30f8e2691;
	Sat, 17 Jan 2026 10:10:09 +0800 (GMT+08:00)
Message-ID: <9c9d2fa3-46f3-43e6-95d0-6b5ec6b6ea78@rock-chips.com>
Date: Sat, 17 Jan 2026 10:10:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Aishwarya TCV <Aishwarya.TCV@arm.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>,
 "xuhui.lin@rock-chips.com" <xuhui.lin@rock-chips.com>
Subject: Re: [PATCH] spi: rockchip: Use plain request_irq()
To: Mark Brown <broonie@kernel.org>
References: <20260116-spi-rockchip-threaded-irq-v1-1-c45c3a5a38b1@kernel.org>
 <f8658bd7-7381-4770-935a-6a98ea3f652f@rock-chips.com>
 <a5b6c607-9b8c-4fa6-98c5-6ba848f7f2e2@sirena.org.uk>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <a5b6c607-9b8c-4fa6-98c5-6ba848f7f2e2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bc9b7932709cckunm71430622777bb9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh4fS1ZPSU4ZSBlMHUJPSh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AEEmPEne5H2CrfSGk3MDyhTd86aNBKC5JSFR7RBvuYjSennkbK3awJVCTgx8pT9ednbNr/KvuS6Vxo5OXdio86J7dws1sFFjvBTooExUQK3bD7bPA5UJUCm/G5gxCse/2SQF6NJakFZsK9pctoB9jlXtFnkxWaeB7Y9Ikgz522M=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Cm5Wp8stDwRLzC/ClhKyPOEbBhpVhy/nTFwwMOc004U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_181020_810987_901F64A7 
X-CRM114-Status: GOOD (  15.47  )
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

+ Xuhui from rockchip who may keep an eye on spi-rockchip related topic

在 2026/01/16 星期五 23:37, Mark Brown 写道:
> On Fri, Jan 16, 2026 at 11:19:39PM +0800, Shawn Lin wrote:
>> 在 2026/01/16 星期五 21:23, Mark Brown 写道:
> 
>>> The Rockchip driver has since interrupt support was added used
>>> request_threaded_irq() but not actually supplied a threaded handler,
>>> handling everything in the primary handler.  This is equivalent to just
>>> using a plain request_irq(), and since aef30c8d569c (genirq: Warn about
>>> using IRQF_ONESHOT without a threaded handler) the current behaviour has
>>> triggered a WARN_ON().  Convert to use request_irq().
> 
>> Is it preferred to use threaded version if latency is not a critical
>> concern ? I guess the original intention was to use
> 
>> ret = devm_request_threaded_irq(&pdev->dev, ret, NULL, rockchip_spi_isr,
>> IRQF_ONESHOT, dev_name(&pdev->dev), ctlr); ?
> 
> TBH it looked to me more like there'd been some deferral of more complex
> work at some point but that didn't make it into the final code.  In

Ah, indeed，rockchip_spi_isr() directly performs R/W pio in hardirq
context which doesn't seem advisable, so probably some better
improvement is needed in the furture. Anyway, fix the warning right
now as $subject patch looks sensible:

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

- Thanks.

> general it's better to handle things in hardirq context if they are
> appropriate for that, and for a SPI controller the end requirements are
> coming from the device so you have to assume they're going to need
> things to complete promptly.  There's overhead from scheduling a task so
> no point in incurring it if it doesn't buy you anything.


