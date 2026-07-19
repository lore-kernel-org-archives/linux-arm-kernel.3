Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3835BC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp0EInT0wMivQgvvCzTXJ0B0Xd14SJ7dh4reAVO+dDw=; b=DYGWV4gRGYhwoyR/gpYCrD4l9P
	VL1YF7FXDOHqdHC8WJ8AiYT3jVZxLxxn/jVePLnyuDBe2mD7zH8xmCRgipj9PnGT8AuAgklsJ0+Vd
	YRWikRVSAU3ris8SZuGvhHme2sG7CtLyVC5nWqiUqnuBqS81rOL411XPjTbnfiT5lmqsbhZtihOz5
	OvQQkgUN6g5kZbs9L2ZKJs225SR4hh90Q01Q9ob1n2/lGBW/Yk3OARcQpM2XN+vOPR86us1s1At62
	IzWyjrtzlkRCM0ZXiidGugASB/wNOrfQXyT/lXim4RV00hZ1ooWhH87uGvqyTgCSLN761j7Rb71un
	4bGlBr9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlQoA-00000004zsV-3k2G;
	Sun, 19 Jul 2026 12:39:50 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlQo7-00000004zru-26Up
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784464780;
	bh=wDCMcLB4SqxcRXKam+IVHADVUrv5oiJOZc+uyxtIoDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k1BQYx0ASsdm/uqD0Wpp7mvuq30Fu4DT6fOvHKLJtOHCiOEBQToUFge+7ydMPpRpN
	 d7git0v1dmg38od2Ucc/wq8p2afY8v2XjIDk5CPoA5IeekrLVQ+DVesyLtj1ixEwJY
	 nc+TxqFyHmgRXpIgNeJXuoqi/8LuZRIz33saQ0MGpJPmkOPSuycz6KvncNuid1o2wH
	 oBWpWVVPaBKMq6kNtKIcjGqM/+h/0ArT3WGHoNqFGFpo9wr/BwtDNslqTUg+FjEo1d
	 3HLYFGCNf6VIz1XiibjcJlm5MZSedpHHeGdLWO1Ib7icfopMcBEYNaNveiETRdYhm+
	 ehoSnBEVBOuAQ==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 12396BAFE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784464779;
	bh=wDCMcLB4SqxcRXKam+IVHADVUrv5oiJOZc+uyxtIoDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FPLavt4Bmm/S8OWaXTeJeLJQF5/mCjLsHuKh/OWB59KCWomZlSIiyMfa168+IsH3M
	 ueWfgL7kpZn3JtzCLH8NBHJJRN4kfUi1gHa00mJaARiarsfRfW9toz2RHx2iOjI75E
	 UmecweJx8Jy0dZh1zyTjwJEkgxCvltW43xm4YSvz1pYvoClNHeboEkzUCuAYmIFOvE
	 wRTT0mkDZbtHrq3oqlNcVCwW5fFUBsgSLtSEbhgdfe2HHDpMBeuF8Dbkdhk6P/P7sU
	 g0+cbNjvEQEnBuNFVBZUkSk+oS7uk1cnKQOuQeVxNpaUEMvB6H6l9LjLUsvZb2rPP8
	 Bf+EpKEVfahnw==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id E89D1BC86; Sun, 19 Jul 2026 14:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784464776;
	bh=wDCMcLB4SqxcRXKam+IVHADVUrv5oiJOZc+uyxtIoDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rQKuhDlIwuGM7EeDt9LonT33PGeAhZ/pNxR8sRZm6VIlWOzieTuXkbVTgT80DsUaR
	 vuCin1URC8iPqNHU+ntTjBmHCgI86X++kIBpp97lT/DbR2Cqlh/VZ972abPb9jRdcN
	 exvMBBi6UrOacaFZ7eLtECvafS6QSwIL+sBrjdPSajIJ1uKTI/XEgymSu4SkSL7gnM
	 2VkKQwcWGr9Td7+yMNvF8QnGo5bam0vdcd3anXnhBO+iHUes5iiM/3xwHbSXqNYfal
	 9FqwAD3EIvXgihrU51SPWNYQI8ICCHILhZ/9EL0IvP9167ZCWgVG3F9jGtyMDISvf9
	 kE0A5Lo0pwC4Q==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 02DC2BC11;
	Sun, 19 Jul 2026 14:39:34 +0200 (CEST)
Message-ID: <c0b47180-d3df-4b58-9311-d02734213716@lysator.liu.se>
Date: Sun, 19 Jul 2026 14:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] i2c: mux: add idle_state property to i2c_mux_core
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
 <e2d4fdf8-4dae-43dc-95ae-b9aa1884fdf5@lysator.liu.se>
 <alfZYOKCjf6CKN6i@gmail.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <alfZYOKCjf6CKN6i@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_053948_028564_8671157E 
X-CRM114-Status: GOOD (  32.72  )
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

On 2026-07-15 21:02, Marcus Folkesson wrote:
> Hi Peter,
> 
> On Tue, Jul 14, 2026 at 01:29:01PM +0200, Peter Rosin wrote:
>> Hi Marcus,
>>
>> Sorry for the very late feedback.
>>
>> On 2026-07-13 09:19, Marcus Folkesson wrote:
>>> Muxes treat their channels differently when idle.
>>> Let the mux core have this information to make it available for
>>> internal use.
>>> Reuse the same state values used by CONFIG_MULTIPLEXER.
>>>
>>> Possible idle states are:
>>> - MUX_IDLE_AS_IS: Leave channels as is when idle
>>> - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
>>> - <n>: Enable channel n when idle
>>>
>>> Default value is set to MUX_IDLE_AS_IS.
>>>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> ---
>>>    drivers/i2c/i2c-mux.c   |  1 +
>>>    include/linux/i2c-mux.h | 26 ++++++++++++++++++++++++++
>>>    2 files changed, 27 insertions(+)
>>>
>>> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
>>> index 681a201c239b..edf16683dc83 100644
>>> --- a/drivers/i2c/i2c-mux.c
>>> +++ b/drivers/i2c/i2c-mux.c
>>> @@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>>>    	muxc->select = select;
>>>    	muxc->deselect = deselect;
>>>    	muxc->max_adapters = max_adapters;
>>> +	muxc->idle_state = MUX_IDLE_AS_IS;
>>
>> This is insufficient. AS_IS is simply not an adequate default.
>>
>> For i2c-mux-gpmux, there is currently no way to dig out what
>> the idle state is, as it is not exposed by the mux subsystem. For
>> i2c-mux-gpio, the idle state depends on both the idle-state /and/
>> the i2c-mux-idle-disconnect props. For i2c-mux-pca954x the idle
>> state can be adjusted at runtime. Etc.
>>
>> In short, idle state handling is a bit diverse, and I think this
>> adds to that mess.
>>
>> I think it will be a bit of work to come up with a scheme for the
>> I2C mux core to accurately keep track of what the idle state is.
>> One way to deal with that is to introduce a new "unknown" value
>> that can be the default for all drivers that has not yet figured
>> out how to feed the correct idle state to the core.
>>
>> And that hints at why I think reusing the mux.h bindings #include
>> is bad. The mux subsystem simply has no need for an unknown state,
>> and adding that to mux.h is therefore out of place.
> 
> I see.
> 
> I think I will introduce a few defines in i2c-mux.c then;
> 
> 
> #define I2C_MUX_IDLE_UNKNOWN	(-1)
> #define I2C_MUX_IDLE_AS_IS      (-2)
> #define I2C_MUX_IDLE_DISCONNECT (-3)

Hi!

Please keep AS_IS as -1 and DISCONNECT as -2. Using different
values will make it difficult to get rid of the use of the
defines belonging to the mux subsystem in case the actual
value has crept into some .dtb or something like that.

Also, I think the right thing to do is to put these defines
in the i2c-mux.h header so that the drivers can find them.
I assume .c was a typo?

> [...]
> 
> struct i2c_mux_core {
> 
>      [...]
> 
> 	/*
> 	 * The mux state to use when not active.

This is not 100% accurate. The value stored here is never
actually used to set the idle state. The idle_state here is
only what the driver has declared that the idle_state is.
Perhaps word it like this instead?

	* The mux state used by the driver when idle.

Agreed, subtle difference, but...

In the future, drivers (most of them) could be changed to
use this variable to store the actual idle state. But, as
mentioned, that's not easy for i2c-mux-gpmux since the idle
state is under the control of the the mux subsystem in that
case.

Cheers,
Peter

> 	 * Possible idle states are:
> 	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
> 	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
> 	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> 	 *  - <n>: Enable channel n (starting from 0) when idle"
> 	 *
> 	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
> 	 */
> 	int idle_state;
> 
>      [...]
> };

