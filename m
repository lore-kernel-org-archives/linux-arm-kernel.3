Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511F5FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEivCrRLEaWubps/mZfSJBqMglR1LXHtXAurk5Wm9Cc=; b=tu4lVAos1DtuyQjDJhwjShEOWO
	2pwkmO1sUFgm9x+0GM+ggtWrh5NnkGG4BHgN5/AkNCbCN9nXatCRfUBJ35SlNhXonFB8X/E/hVy8J
	ueqOvnTAWewpBb9A9QCy1WIJ0UQGF15nsmZ1fkMLIix1fQwCFbw/770K03RkyJAnMsY4V5VD/V62I
	pcJc0ajX0eSTYv1vqtYWsFsUmrGCVgNRtzXQ8v0HkxVWoTktAg8qenapqJ2T3Ak8Dj26W/ZbFZ3X6
	izpe1Dd07jV7vm4w6lXnNzmvLXf6dWWfg19yvio0uiYUx5QebOyCwTKPd3irlKAlKpT9cHF+KQ/0I
	bNIjhkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcS-00000008an1-1TrZ;
	Fri, 27 Feb 2026 15:19:08 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzcO-00000008ak3-2QyF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=fEivCrRLEaWubps/mZfSJBqMglR1LXHtXAurk5Wm9Cc=;
	b=fjZ2GVkVN90vPOj+6lHylLNlax6CPw93DXU+VKgMTKFI5RXke/RMWERoTb4b0u
	VtvhAM4iPjcmS/xFZOg9Bqc6zJI9aB/LBKjZvnBGZM+5Fg/kwxSmUofoLdtbT/MT
	bNOTmqyG/Y2PrOYx6WRiKvXDxrFGgkTZChoXgFwUB1L8g=
Received: from [192.168.1.104] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3H2C3taFpheHENA--.55136S2;
	Fri, 27 Feb 2026 23:18:15 +0800 (CST)
Message-ID: <0bc7875c-106c-48e1-8d40-72919ca227c4@163.com>
Date: Fri, 27 Feb 2026 23:18:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: aspeed: Fix driver probe failure
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jammy Huang <jammy_huang@aspeedtech.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <20260227123837.70079-1-haiyuewa@163.com>
 <8060fe77-18ec-4aa0-90a1-50eee398a55b@kernel.org>
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <8060fe77-18ec-4aa0-90a1-50eee398a55b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3H2C3taFpheHENA--.55136S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW8Ww47Cw4xuFWDGF1UGFg_yoW8CFyfpa
	y8ua1DKrZ3KF1YkayxJa4xtFyUZws0yFs8trW5J347X3s8Xw1FqrWSyrWv9rWDJrs5u347
	tFW8K34vgr4YqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U59N3UUUUU=
X-Originating-IP: [101.228.113.192]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC7xheyWmhtbi8bgAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071905_070151_4B1E2D76 
X-CRM114-Status: GOOD (  15.12  )
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



On 2/27/2026 8:59 PM, Krzysztof Kozlowski wrote:
> On 27/02/2026 13:38, Haiyue Wang wrote:
>> The aspeed video (be compatible for ast2400, ast2500, ast2600) now needs
>> the reset DTS handle specified, otherwise it will fail to load:
>>
>> [    0.000000] OF: reserved mem: initialized node video, compatible id shared-dma-pool
>> [    0.000000] OF: reserved mem: 0xbb000000..0xbeffffff (65536 KiB) map reusable video
>> [    0.377039] videodev: Linux video capture interface: v2.00
>> [    4.809494] aspeed-video 1e700000.video: irq 57
>> [    4.809977] aspeed-video 1e700000.video: Unable to get reset
>> [    4.810341] aspeed-video 1e700000.video: probe with driver aspeed-video failed with error -2
>>
>> Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
>> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
>> ---
>>   arch/arm/boot/dts/aspeed/aspeed-g4.dtsi   | 1 +
>>   arch/arm/boot/dts/aspeed/aspeed-g5.dtsi   | 1 +
>>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi   | 1 +
>>   include/dt-bindings/clock/ast2600-clock.h | 1 +
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 

Seperated into two patches in v2, please help to review.

>>   4 files changed, 4 insertions(+)
> 
> 
> Best regards,
> Krzysztof


