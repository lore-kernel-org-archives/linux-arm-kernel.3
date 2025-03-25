Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E74C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLcbLZvJtifJv/J5ywViJnQYYOl4Vdat9zGLi7egoHw=; b=gSA69oNLqiHTjjMGOlL+Lp4oZ9
	geOb3N19a2R8TTzjg+vEQZjEjl0BPv75JQG75pl8ELT9e5o1s6bPQdgezFYwTL7BTuMKAzAtwB3zr
	3C4HcR65ZVKpMMQ+XdevQ9nS2ZFYIgvE1pGh5i/6P+LbrPRx8BHFvjXDCDr7dCGn9BlgD6ItunZU5
	NBkkvxeoXlMBgQ4gau6SBXkqr3nQMNiy9gz64hvjafoAl4UtAu99HiLiMNN4R7S2rvVo28/dQpXoH
	BM19iiOUsBDRMMRK1gY2sAkcjX3/T2Nanw3I4792MO1U7ODp1Phhpufn7iJq9B6cv2ig4dGW1PSJT
	DfNmGB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9Bz-00000006k3Q-3JxI;
	Tue, 25 Mar 2025 18:40:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9AG-00000006jwU-0Wtn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:38:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso62774375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 11:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742927894; x=1743532694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLcbLZvJtifJv/J5ywViJnQYYOl4Vdat9zGLi7egoHw=;
        b=FlxacIxK5DQ3+eESOpvxIeN85226BaTvrJMwn3PfUnSDmERq+w1U60fkivk6vXe2o5
         w5W7jAYnXRikJzMEnia5/chiCC77X1F2JMCMJTZ3I4o4wUMSV4lmzez/iqIMKgyosfVx
         Chbuaon0MopQhrpO1Wl6w0+diDAJzewnKqk0K9gBceUUaBeO1RLTj+q6x+tLe8fPI9LS
         8nIKvRGEtgr1qU6Gqeq60LBBkPx3ZhFOqwgRzPcAPa0okvFJ7YCKl5RU8XCDLYMIYEN2
         TPTP5B+nqjVPVlQCBkMN6EGjGhQz43FXiUijdVaieqrvJJtOafCkHawdGlAntQsQDfq/
         37lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742927894; x=1743532694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLcbLZvJtifJv/J5ywViJnQYYOl4Vdat9zGLi7egoHw=;
        b=fQU+P2PGuThme95jXWGR3fzmLr65A4yFAR26rlNLttkb0CSAs1AYwNoMbr2fNcDek/
         c/q72LLVuZXc2BjHRqOS5U7ic6r4oJUgzhyk0idLK72oyKbO1JzG97eYZfSX+IzUg6BT
         snCXOb1PAC28x7LRg4vLxbYRpOYTSPMiuhTTXyhFXqY2V2cd34j0H0/at4NDHrvLDeI+
         om7BNgER16MpsSXZy5KSSW+lDT57x3XFHq5rFRKetragH3Oum72mT9DqZtFYf9k054ja
         yjzQsPpP2O9NZWEYW2aoaJovfs9vMtjo6f/kyKdx61zxzXOmliaNue/F6KyZnbMcdSAj
         cIcA==
X-Forwarded-Encrypted: i=1; AJvYcCWJUHXjsJixWSW8Z/S3RFjQvGZ9tLlV9M6g7erbri25We23PwMW6qG5lc8ilhJsgTDKYw73tmvZSGMbijjKd0Pm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0C5+8AJy8npvDWXvGETY0sXygO7CLvarq4dodp5A9h6jnso1e
	X3FSake2xIW5aKvb25zFMVz/zueFZGxabrslyPdJd9haXDuykCsEXDiPgl6swvs=
X-Gm-Gg: ASbGncssmRKps2g16ZqQhz5jLokb0GJXTw+CnvCCSNhIeCPM92C8d3xu/zqqj32fnmN
	ESRPmU9oG0Bh4o9IIxh8aHNGPOcNg8NYLpVsI3sls9dE0r/36gyR9ZasPIGyWm7c687WYi3QiI9
	JoHhbcUqIRrGriu7HnvrF3P1XISlycgEcx8oMJOwobwC7s2C32asO3M7tATErVc65AcTKCpo3y7
	cYRHd/dplnHY9oyE4tDHsCoHnLSLwBUDVohAwAEmPwNVcrESO/mkEXirVNjtuJ8SNm1cBKXI1UC
	U0BSr2I20ByMk/85eSje4Igj2hDz5nhuMh1p7c7r2V/CNqL7rHOqWXoCKvm8Xgj+56kfpM3JgJL
	0P6FehGUY
X-Google-Smtp-Source: AGHT+IFf9V6m1QJP5gr2DluaPBFse9Wgz2mRbvaBDSX2jJ61J12Lucuk0S6TaoKRAJlajSna0TvBvQ==
X-Received: by 2002:a05:600c:4e45:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-43d509eb3d4mr188811615e9.7.1742927894332;
        Tue, 25 Mar 2025 11:38:14 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm215617595e9.40.2025.03.25.11.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 11:38:13 -0700 (PDT)
Message-ID: <ff213c29-2a17-4776-a575-35e398e560ec@linaro.org>
Date: Tue, 25 Mar 2025 19:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clocksource/drivers/nxp-timer: Add the System Timer
 Module for the s32g platform
To: Krzysztof Kozlowski <krzk@kernel.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Thomas Fossati <thomas.fossati@linaro.org>,
 Larisa Grigore <Larisa.Grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <bb7e4740-9608-4534-9c19-3ac066e2aa8f@kernel.org>
 <1bf2d9ad-325e-4b1d-8440-ddbc90eabc67@linaro.org>
 <9ca80442-15c8-4f2d-ac11-8096b2cd83ad@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9ca80442-15c8-4f2d-ac11-8096b2cd83ad@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_113816_170018_D2352C54 
X-CRM114-Status: GOOD (  19.97  )
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

On 25/03/2025 13:30, Krzysztof Kozlowski wrote:
> On 25/03/2025 13:23, Daniel Lezcano wrote:

[ ... ]

>>>> +	if (!stm_instances->clocksource && (stm_instances->features & STM_CLKSRC)) {
>>>> +
>>>> +		/*
>>>> +		 * First probed STM will be a clocksource
>>>> +		 */
>>>> +		ret = nxp_stm_clocksource_init(dev, name, base, clk);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +		stm_instances->clocksource++;
>>>
>>> That's racy. Devices can be brought async, ideally. This should be
>>> rather idr or probably entire structure protected with a mutex.
>>
>> Mmh, interesting. I never had to think about this problem before
>>
>> Do you know at what moment the probing is parallelized ?
> 
> You don't have PROBE_PREFER_ASYNCHRONOUS, so currently this will be
> still sync, but I don't think we want it to be that way forever. I think
> new drivers should not rely on implicit sync, because converting it
> later to async will be difficult. It's easier to design it now or even
> choose async explicitly (after testing).

I gave a try and sometimes I reach the warnings below. I suspect the 
underlying code in the time framework is not yet ready for that.

Even if it could be a good candidate for parallelizing the boot, this 
driver should stay sync ATM. Except if someone has the willing to dig 
into the core framework to find out the race when switching the 
clockevent. I think a thread is setting a timer while we are switching 
the driver.

IMO, this core framework is too sensitive for this kind of change now.

Alternatively, I can put anyway the lock which is harmless for the sync 
code but making the driver race free. The async flag can be put later.


[    2.066807] ------------[ cut here ]------------
[    2.073190] SPI driver st-magn-spi has no spi_device_id for 
st,lsm9ds1-magn
[    2.077841] Current state: 0
[    2.077866] WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:319 
clockevents_program_event+0x124/0x12c
[    2.084972] SPI driver st-magn-spi has no spi_device_id for 
st,lsm303c-magn
[    2.087876] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 
6.14.0-rc4-00009-g1418f8fd0e24-dirty #163
[    2.087889] Hardware name: NXP S32G2 Reference Design Board 2 
(S32G-VNP-RDB2) (DT)
[    2.121868] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    2.128959] pc : clockevents_program_event+0x124/0x12c
[    2.134196] lr : clockevents_program_event+0x124/0x12c
[    2.139437] sp : ffff800080003e50
[    2.142808] x29: ffff800080003e50 x28: ffff00085f899538 x27: 
ffff00085f899578
[    2.150092] x26: ffff00085f8995b8 x25: ffff00085f89948c x24: 
7fffffffffffffff
[    2.157368] x23: 0000000000000003 x22: 000000007233f8db x21: 
0000000000000000
[    2.164643] x20: 000000007270e000 x19: ffff0008001286c0 x18: 
00000000ffffffff
[    2.171918] x17: ffff8007dd240000 x16: ffff800080000000 x15: 
ffff8000800039f0
[    2.179195] x14: 0000000000000000 x13: ffff800082a864f8 x12: 
0000000000000381
[    2.186470] x11: 000000000000012b x10: ffff800082ade4f8 x9 : 
ffff800082a864f8
[    2.193746] x8 : 00000000ffffefff x7 : ffff800082ade4f8 x6 : 
80000000fffff000
[    2.201023] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 
00000000ffffffff
[    2.208297] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff800082a78080
[    2.215574] Call trace:
[    2.218063]  clockevents_program_event+0x124/0x12c (P)
[    2.223304]  tick_program_event+0x50/0x9c
[    2.227392]  hrtimer_interrupt+0x120/0x254
[    2.231571]  nxp_stm_clockevent_interrupt+0x8c/0x9c
[    2.236545]  __handle_irq_event_percpu+0x48/0x13c
[    2.241345]  handle_irq_event+0x4c/0xa8
[    2.245256]  handle_fasteoi_irq+0xa4/0x230
[    2.249431]  handle_irq_desc+0x40/0x58
[    2.253254]  generic_handle_domain_irq+0x1c/0x28
[    2.257961]  gic_handle_irq+0x4c/0x118
[    2.261783]  call_on_irq_stack+0x24/0x4c
[    2.265784]  do_interrupt_handler+0x80/0x84
[    2.270049]  el1_interrupt+0x34/0x68
[    2.273696]  el1h_64_irq_handler+0x18/0x24
[    2.277873]  el1h_64_irq+0x6c/0x70
[    2.281340]  default_idle_call+0x28/0x3c (P)
[    2.285693]  do_idle+0x1f8/0x250
[    2.288988]  cpu_startup_entry+0x34/0x3c
[    2.292988]  kernel_init+0x0/0x1d4
[    2.296454]  start_kernel+0x5e4/0x72c
[    2.300188]  __primary_switched+0x88/0x90
[    2.304283] ---[ end trace 0000000000000000 ]---
[    2.309891] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 
7 (0,8000003f) counters available
[    2.320001]  cs_system_cfg: CoreSight Configuration manager initialised
[    2.327712] gnss: GNSS driver registered with major 506
[    2.340793] GACT probability NOT on
[    2.344401] Mirror/redirect action on
[    2.348835] IPVS: Registered protocols ()
[    2.352946] IPVS: Connection hash table configured (size=4096, 
memory=32Kbytes)
[    2.360566] IPVS: ipvs loaded.
[    2.363904] NET: Registered PF_INET6 protocol family

Or this one:

[    2.369946] ------------[ cut here ]------------
[    2.370044] Segment Routing with IPv6
[    2.374649] Current state: 0
[    2.374668] WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:125 
clockevents_switch_state+0x10c/0x114
[    2.378462] In-situ OAM (IOAM) with IPv6
[    2.381328] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G        W 
         6.14.0-rc4-00009-g1418f8fd0e24-dirty #163
[    2.381341] Tainted: [W]=WARN
[    2.391115] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.394964] Hardware name: NXP S32G2 Reference Design Board 2 
(S32G-VNP-RDB2) (DT)
[    2.394971] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    2.394980] pc : clockevents_switch_state+0x10c/0x114
[    2.406609] NET: Registered PF_PACKET protocol family
[    2.408957] lr : clockevents_switch_state+0x10c/0x114
[    2.408971] sp : ffff800080003cf0
[    2.408975] x29: ffff800080003cf0
[    2.415066] Bridge firewalling registered
[    2.422692]  x28: ffff00085f89fc40 x27: 0000000000000001
[    2.422704] x26: ffff800082a6f0e0 x25: ffff80008265c400 x24: 
ffff00085f89fbc0
[    2.468656] x23: 0000000000000001 x22: ffff00085f899480 x21: 
0000000000000001
[    2.475931] x20: 0000000000000004 x19: ffff0008001286c0 x18: 
00000000ffffffff
[    2.483208] x17: ffff8007dd240000 x16: ffff800080000000 x15: 
ffff800080003890
[    2.490484] x14: 0000000000000000 x13: ffff800082a864f8 x12: 
0000000000000420
[    2.497763] x11: 0000000000000160 x10: ffff800082ade4f8 x9 : 
ffff800082a864f8
[    2.505038] x8 : 00000000ffffefff x7 : ffff800082ade4f8 x6 : 
80000000fffff000
[    2.512314] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 
00000000ffffffff
[    2.519588] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff800082a78080
[    2.526865] Call trace:
[    2.529352]  clockevents_switch_state+0x10c/0x114 (P)
[    2.534505]  tick_program_event+0x6c/0x9c
[    2.538590]  __remove_hrtimer+0xb0/0xb4
[    2.542506]  hrtimer_try_to_cancel.part.0+0xc8/0xd0
[    2.547478]  hrtimer_try_to_cancel+0x6c/0x78
[    2.551832]  task_contending+0xd4/0x13c
[    2.555746]  enqueue_dl_entity+0x214/0x500
[    2.559925]  dl_server_start+0x50/0x138
[    2.563835]  enqueue_task_fair+0x1dc/0x5e0
[    2.568012]  activate_task+0x4c/0x90
[    2.571660]  ttwu_do_activate.isra.0+0x58/0x138
[    2.576281]  sched_ttwu_pending+0xa4/0x128
[    2.580459]  __flush_smp_call_function_queue+0xf0/0x224
[    2.585790]  generic_smp_call_function_single_interrupt+0x14/0x20
[    2.592002]  ipi_handler+0x134/0x168
[    2.595650]  handle_percpu_devid_irq+0x80/0x120
[    2.600269]  handle_irq_desc+0x40/0x58
[    2.604091]  generic_handle_domain_irq+0x1c/0x28
[    2.608798]  gic_handle_irq+0x4c/0x118
[    2.612618]  call_on_irq_stack+0x24/0x4c
[    2.616617]  do_interrupt_handler+0x80/0x84
[    2.620881]  el1_interrupt+0x34/0x68
[    2.624526]  el1h_64_irq_handler+0x18/0x24
[    2.628700]  el1h_64_irq+0x6c/0x70
[    2.632166]  default_idle_call+0x28/0x3c (P)
[    2.636520]  do_idle+0x1f8/0x250
[    2.639812]  cpu_startup_entry+0x38/0x3c
[    2.643814]  kernel_init+0x0/0x1d4
[    2.647281]  start_kernel+0x5e4/0x72c
[    2.651014]  __primary_switched+0x88/0x90
[    2.655107] ---[ end trace 0000000000000000 ]---


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

