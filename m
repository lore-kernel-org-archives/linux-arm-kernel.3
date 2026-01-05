Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8F2C79FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIl6SHJhWkfN0/1FLxWUZ38nXwKxplUrKF/eFOo1uVI=; b=tQa19snF/1m4xOg/i1WKVyWvrN
	yUxg8+5uKI0cm04N5Gi917YF6dbOldZXahsD//VMAdfPxcZ2OUi598YPw29lRookGjKxL88GNKCXq
	w0b7d+qZazpfqfJ//fDcbk/PZHZnZpX/TSBNjUlwWAVj/M4DGAjZ8vQ+yYv+CT+Kbr1kvXxcNyb4D
	ZzejgXOculMF+9VXOCmqpj0F6yIMFK27ahI/OYXssIYILyum6XAJxNdaY3N9/I33QNRquOniEBTkn
	7ThUjXPy5UhZEj5xUmHvv87O5mdgU2sTJpRPgliRkvtjJBSAvVdose2ZoevE2nhXICnDYSJCKkKWk
	WYj+BVFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcojU-0000000BsDn-0Oot;
	Mon, 05 Jan 2026 17:51:08 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcojN-0000000BsBG-2PaP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:51:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260105175058euoutp01c06e96c7bee6c642a52f4c29bd951339~H5xVyNGmQ3155331553euoutp01O
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Jan 2026 17:50:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260105175058euoutp01c06e96c7bee6c642a52f4c29bd951339~H5xVyNGmQ3155331553euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767635458;
	bh=UIl6SHJhWkfN0/1FLxWUZ38nXwKxplUrKF/eFOo1uVI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GiM/WJV48jrskVobEyKgi0zMxPnakTZILgr9xs5nLcJUMteqWX+UA4H5dn+8tQBfG
	 eEjBFYSdZHxP7pXQLzHJadNpHOS1agFolQJbMwygokqAGAwGse0W4jjI5xCvrsJ2u5
	 x9zG/eMfACdNYs9467DjD7I5LUrKcj9SYhQYX+LY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260105175057eucas1p274610bd996f1599b43d386f0afdb0fb6~H5xVeVD8s2877028770eucas1p2i;
	Mon,  5 Jan 2026 17:50:57 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260105175055eusmtip2bd9960cd4f35babf9088305da14604af~H5xTTw38e1923619236eusmtip2N;
	Mon,  5 Jan 2026 17:50:55 +0000 (GMT)
Message-ID: <d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com>
Date: Mon, 5 Jan 2026 18:50:53 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
	Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260105175057eucas1p274610bd996f1599b43d386f0afdb0fb6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42
X-EPHeader: CA
X-CMS-RootMailID: 20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
	<CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
	<CGME20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42@eucas1p1.samsung.com>
	<CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_095104_017774_FE3E2605 
X-CRM114-Status: GOOD (  12.84  )
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

On 05.01.2026 18:38, Bartosz Golaszewski wrote:
> On Mon, 5 Jan 2026 18:28:23 +0100, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> said:
>> Hi Bartosz,
>>
>> On Mon, Jan 5, 2026 at 4:05 PM Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> [...]
>>>    mutex_lock_nested+0x24/0x30
>>>    pinctrl_get_device_gpio_range+0x44/0x128
>>>    pinctrl_gpio_set_config+0x40/0xdc
>>>    gpiochip_generic_config+0x28/0x3c
>>>    gpio_do_set_config+0xa8/0x194
>> $ git grep gpiochip_generic_config drivers/pinctrl/meson/
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:     .set_config
>>   = gpiochip_generic_config,
>> drivers/pinctrl/meson/pinctrl-meson.c:  pc->chip.set_config =
>> gpiochip_generic_config;
>>
>> pinctrl-amlogic-a4.c still has:
>>    .can_sleep = false,
>>
>> Are there plans to send a separate fix for pinctrl-amlogic-a4.c - or
>> was the intention to fix "all" Amlogic pin controllers in this patch
>> (which would mean that the change to pinctrl-amlogic-a4.c is missing)?
>>
>>
> Yeah, I missed it. I will send a follow-up tomorrow.

I found that drivers/pinctrl/pinctrl-rockchip.c suffers for the same 
issue, although I don't see where this ".can_sleep" flag has to be added:

BUG: sleeping function called from invalid context at 
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name: 
kworker/u16:0
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
6 locks held by kworker/u16:0/12:
  #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0}, 
at: process_one_work+0x18c/0x604
  #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at: 
process_one_work+0x1b4/0x604
  #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at: 
__device_attach+0x38/0x1b0
  #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at: 
gpiod_direction_output_raw_commit+0x0/0x360
  #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at: 
gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
  #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at: 
gpiod_direction_output_raw_commit+0x0/0x360
irq event stamp: 81450
hardirqs last  enabled at (81449): [<ffff8000813acba4>] 
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (81450): [<ffff8000813abfb8>] 
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (79616): [<ffff8000811455fc>] 
__alloc_skb+0x17c/0x1e8
softirqs last disabled at (79614): [<ffff8000811455fc>] 
__alloc_skb+0x17c/0x1e8
CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted 
6.19.0-rc4-next-20260105+ #11975 PREEMPT
Hardware name: Hardkernel ODROID-M1 (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __might_resched+0x144/0x248
  __might_sleep+0x48/0x98
  __mutex_lock+0x5c/0x894
  mutex_lock_nested+0x24/0x30
  pinctrl_get_device_gpio_range+0x44/0x128
  pinctrl_gpio_direction+0x3c/0xe0
  pinctrl_gpio_direction_output+0x14/0x20
  rockchip_gpio_direction_output+0xb8/0x19c
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_direction_output+0x34/0xf8
  gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_configure_flags+0xbc/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get_optional+0x18/0x30
  rockchip_pcie_probe+0x98/0x380
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


