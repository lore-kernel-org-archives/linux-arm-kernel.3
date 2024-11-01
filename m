Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2715E674B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUxatgIjseNyDqt3FqqOob4pJSJxFWPR3CwFmtzwsvQ=; b=LzlwWDHxRCftr7Orj3Q4t1yZqu
	V61I68ntBekStuYhG0DiMVkrGynlM/n9/uS7N8hdsTrRh3bcLc4zryarcxJ0c9XMlSP3olhbdWY7r
	eDh0p+PT9ixgD1BX66FPEFPxjk1xRwi9sYNsQ/WxN8JRjAerRH6F0u/GJl+NdMGUqZEBxaFnYZzRZ
	HAR706P1e7j4BVOX6xz88zBt6MCqwMbiyGIvpotfY1zSFw6l68QrK0uER6o11jgH3au16KVPnU4TQ
	ZiqKwwyHbkHwhPyUIsSktMOz9Rlmqd/at5Ut0R5Dxmd9ARS37MGbfoQ25tmsKnAfNj/eWZ4cmI4Yi
	Wou0vXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mb2-00000006CFz-2cRu;
	Fri, 01 Nov 2024 08:01:28 +0000
Received: from mail-m606.netease.com ([210.79.60.6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mZ8-00000006Bnu-3InN;
	Fri, 01 Nov 2024 07:59:33 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 183987c6;
	Fri, 1 Nov 2024 15:59:18 +0800 (GMT+08:00)
Message-ID: <eb96b240-f3ee-4057-b016-c746d48cc1b4@rock-chips.com>
Date: Fri, 1 Nov 2024 15:59:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: dw_mmc: rockchip: Keep controller working for card
 detect
To: Ulf Hansson <ulf.hansson@linaro.org>, Robin Murphy <robin.murphy@arm.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20240912152538.1.I858c2a0bf83606c8b59ba1ab6944978a398d2ac5@changeid>
 <4920950.GXAFRqVoOG@diego>
 <CAPDyKFosf_+m9j8YgHa-PsC2SV8+Aou2O6bTbMfzGBpQ2sY8YA@mail.gmail.com>
 <69d06c04-cc8c-4435-a622-33d5dcd1fa24@arm.com>
 <CAPDyKFoU=AoQqXov_-qFo8xjEbiDAk9mtTtCR9HAYz_gg-bnzQ@mail.gmail.com>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <CAPDyKFoU=AoQqXov_-qFo8xjEbiDAk9mtTtCR9HAYz_gg-bnzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwaQlYfQk8YQklLSh5PTUhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a92e6bc62c103afkunm183987c6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6Hzo5LjIjTE9KSUhIFxRW
	GkNPCz5VSlVKTEhLT09MQk5CTE5JVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITkJMNwY+
DKIM-Signature: a=rsa-sha256;
	b=Ns2PAmM3r3IVo0z1BD9bWzhY49ezgnto/lCiZiqHcWvBOHPb/A16zDxfwiJa5XmD9Kq+7evbQpnVKcBtIO8uqQFV6WquR4xpX94n/2J949wt9rM7N+BKjxsdqrHzVtftHH5tHj1nP850u2tkMsiaKiyObzVPr06Dc1mNbEPFe5Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=UUxatgIjseNyDqt3FqqOob4pJSJxFWPR3CwFmtzwsvQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_005931_461890_DB2D3FE4 
X-CRM114-Status: GOOD (  24.54  )
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

Hi Ulf, Robin, Heiko,

On 2024/10/7 17:49, Ulf Hansson wrote:
> On Fri, 4 Oct 2024 at 19:34, Robin Murphy <robin.murphy@arm.com> wrote:
>> On 02/10/2024 10:55 pm, Ulf Hansson wrote:
>>> On Sat, 14 Sept 2024 at 13:52, Heiko Stübner <heiko@sntech.de> wrote:
>>>> Am Donnerstag, 12. September 2024, 09:26:14 CEST schrieb Kever Yang:
>>>>> In order to make the SD card hotplug working we need the card detect
>>>>> function logic inside the controller always working. The runtime PM will
>>>>> gate the clock and the power domain, which stops controller working when
>>>>> no data transfer happen.
>>>>>
>>>>> So lets skip enable runtime PM when the card needs to detected by the
>>>>> controller and the card is removable.
>>>>>
>>>>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>>>> So for the change itself this looks good, i.e. it fixes an issue for baords relying
>>>> on the on-chip-card-detect.
>>>>
>>>>
>>>> But for boards doing that, the controller will be running _all the time_
>>>> even if there is never any card inserted.
>>>>
>>>> So relying on the on-soc card-detect will effectively increase the power-
>>>> consumption of the board - even it it'll never use any sd-card?
Yes, this is how the controller works, the controller needs the clock to 
make the detect logic work.
If we use gpio to implement this card-detect, it works because the GPIO 
controller/clock keeps working.
For the dw_mmc driver support, we should support both kind of implement 
due to the controller has this function,
so this patch is for the card-detect implement by the dwmmc controller, 
the controller need to keep working
- only for sd-card (so not include the "non-removable " device)
- also not disable rpm when "cd-gpios" is used.

For the power consumption, I believe it will increase, but very very 
small, we can't even monitor the change
if we use the normal equipment. The driver should make function works 
first, and then consider the power.

This patch is to make the dwmmc function works without gpio's help in 
dwmmc driver,
  and has no affect to the gpio option, people still able to use gpio to 
do the cd.


Thanks,
- Kever
>>> Good point! A better option is to use a polling based mechanism - and
>>> we have MMC_CAP_NEEDS_POLL for exactly that.
>>>
>>> Moreover, on DT based platforms one can even use the "broken-cd"
>>> property to indicate this.
>> Except that goes further than is needed here, since it would fall back
>> entirely to software-based polling for card presence. In this case the
>> CD function is not broken in terms of actually detecting a card, it just
>> doesn't work to wake the controller up from suspend because it can't
>> fire its own interrupt while powered off. In principle all we should
>> require here is to periodically resume/suspend the device, to provide a
>> window for the interrupt to work and normal operation to take over if
>> appropriate.
> Well, I would not object if "broken-cd" would be used for this case
> too. I believe it already is.
>
> Another option would be to look at a compatible string and set
> MMC_CAP_NEEDS_POLL based on that.
>
>> Of course the really clever way would be for suspend to switch the pin
>> into GPIO mode, and set the GPIO interrupt as a wakeup to trigger resume
>> and switch it back again, but perhaps that's a bit tricky without
>> explicit pinctrl states in the DT :/
> Right. A dedicated GPIO pin for the card detect is certainly the
> preferred method, if you care about not wasting power.
>
> Kind regards
> Uffe

