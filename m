Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CBCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXHFXu7L7X5+W85+6JMWjYQ7nh2xx8JsX3L6W7xEiLY=; b=umtL8tR0x8fukVEfLgFueORQZx
	7lJugZDm0QaZQBKqrd7ydkQPsYuN6b+RkX15bWMD5W2EqefhC4GEmjho5AO2KFROkQxhstau68KxQ
	VwuzSgAAg7PBAgaHzAvhxwHBDs3PbujR6m+mfJT5N2hQQlyuzIPJxp1jmgOseZtqfEPOh5L5TLbEz
	GNZT/hG2cmpa6QjFyuHJB+HrVNgcNvOMMX79+G/QU+yO1RQO1fC5cfHvVxRSmRLhSUXDR+qqLshEJ
	P+9GqaiWqmJ9G+mwTsl1iV6+gAVd+tmWJbwBtk9TBp7i6qGZD4IyXnQEOiY0W4Kb0iF7oGJp/Fg1W
	vkQAX2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb3g-00000003lmw-0Yka;
	Mon, 08 Jun 2026 14:34:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb3e-00000003lmW-1tk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:34:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45eec22fab7so2226555f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780929268; x=1781534068; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXHFXu7L7X5+W85+6JMWjYQ7nh2xx8JsX3L6W7xEiLY=;
        b=WfGZh3dl1W7CernD2Yxq+wJBG6loAMxFGzi1geK5WXiogMW210EEXjUZgSbakGFFiL
         tFipPCCzh7jXaduxco6BIiOyghg/4mFDuZ/FHUJrExD2GTPziOHIxxwnb1qO7F3oGHqT
         qpc11FJ6f9F2BLwdQn12a04ULlPuzHRmM9Cg0ijdngTydwcVzGFNsOb1Q2ZEQlxyEJ+5
         /VvGDWZvNyhoyC8J16SHe9mt5R1Ha354B/kFDWPzA8HXAOKL39t9VO5scOlaDiY7KbVr
         KXNX+J9jzPVES6+s7reBRWtdro4+aip/C36QAWzdtmRmVEkGYx3GQ6qhGnuqB7gV0l39
         CzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929268; x=1781534068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXHFXu7L7X5+W85+6JMWjYQ7nh2xx8JsX3L6W7xEiLY=;
        b=bY5/5KHl6wev5cHfREj78sLlPImRa91+L+kVcTrDfIJqaFncUt3dby1jgv3jt6kyEO
         jqqDG6A3qv3nJcZ9ZOQlHVKlwGo/hC92BpRvPSdJ7TZSn+KUl3Bt3eEWXosCMgNfp4Ls
         SO3UKSktFSufUkxJi1eieT2l3lHUFKQLmwh9VaWaR0lnG2V8GxowfOOIK7vUCBOi8sL3
         7piOhOUObY9hd52xMSFxrg3Ora4ruIZQWYdZcJL9DhfvFNtRh8xVoEQLkRHkp16dgzh0
         Q7IpQ8FWJuDmgupHy7awJrQXCs4wn8nwrZIEklhzHrTtjcjoinT1g3zzlF/2ZwAi1fqB
         n49w==
X-Forwarded-Encrypted: i=1; AFNElJ86pDy1LPckwsKR8ZxxPlnwznlAGA2KEVTIKyXK8QzGaf7OGK2FfnF0KUFKK01bgadN7HhU/A078xHt14ZO9S9a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0jWu/ODgU98IlctBxGKFvlnwPrZCN/5chZGnw5nDm3VOzgmhN
	20eOQyGQz0LTuuFm5NcMh7qoCrGuaZH5lDcBYWPpiqpeK7Szx58ODysGoBTxkP8oRl4=
X-Gm-Gg: Acq92OERZPY6Hb/xWeVLSeAdPz8mbVDd//tHwCsV7YT81I8CYru6RVz5vDs1ZQakGYO
	UJsU+qLLbkyAItMhMd49ZBEDQIBIC+HlSXnQSsHhDm9/EbiLXADnYPbwwreUCVwOjIqE6kureWP
	8pD2vXnykortbNetivHvipOURe+ZUKPOyJKZ+nmnm0iC7jcX5TIC1U6+xkh/CXs6vt2zSX753O4
	4PblOw9mBm5tQxFqZnhMolUvZmgDXxTtJrtUdIQnmY7/4q6bMzSotbNu/KDUxg80fddEpXpGPtz
	B0/jrjX0BBZteiXwwyLJ2IsYWTEY66dyMElM4EtLyMARhxxzRAUr8XLYzweHUBcNjKKsDlhdpCh
	8H0V4rCfpyeHR8F3YzU+0QL1ZQJYRuf3DH1x0MiUP7yITouqc7VXMA4MiacFLRkiUIBBiZhI/u2
	32kBH2jrcMsDRD3sO7HI2NlsBY1Kj2lffld05z1yoKcw==
X-Received: by 2002:adf:fcce:0:b0:45e:df08:b18 with SMTP id ffacd0b85a97d-4603075ca65mr16848230f8f.32.1780929268183;
        Mon, 08 Jun 2026 07:34:28 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm95437467f8f.27.2026.06.08.07.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:34:27 -0700 (PDT)
Message-ID: <cc544c9d-0587-4d07-bc47-83636584fcef@linaro.org>
Date: Mon, 8 Jun 2026 17:34:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Juan Yescas <jyescas@google.com>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
 <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
 <9b6fce56-6a94-44fe-ab55-5394ec6065e4@linaro.org>
 <DILX9UGAMXLN.2WVL25FJ87HDK@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DILX9UGAMXLN.2WVL25FJ87HDK@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_073430_542415_5E9B24DB 
X-CRM114-Status: GOOD (  17.71  )
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



On 5/18/26 6:53 PM, Alexey Klimov wrote:
> Hi Tudor,
> 
Hi!

>>>  	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
>>
>> EXYNOS_MBOX_CHAN_COUNT is globally defined as:
>> #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
>>
>> Does the Exynos850 have the exact same number of channels as the GS101?
>>
>> You may move num_chans into struct exynos_mbox_driver_data alongside the
>> register offsets so each SoC explicitly declares its channel capacity.
> 
> Here:
> 
> => md 2040000 <--- sram_base + initdata_base
> 02040000: 000063bc 00000007 0000650c 00000013  .c.......e......
> 02040010: 00000000 00000007 0000000b 0000000e  ................
> 				^^^^
> 02040020: 00000000 00000000 00000013 00000009  ................
> 02040030: 00008000 00008008 0000800c 00008010  ................
> 02040040: 00000010 0000017f 00007800 00000080  .........x......
> 02040050: 0001f800 00004000 00000300 00000010  .....@..........
> 02040060: 66633931 20613261 65766164 00383130  19cfa2a dave018.
> 02040070: 00000000 00000000 3a393000 353a3133  .........09:31:5
> 02040080: 65462034 31312062 32303220 00000030  4 Feb 11 2020...
> 02040090: 00000000 0000001b 00000002 00ff00df  ................
> 
> So it looks like the ipc_ap_max field is equal to 0xb.
> 
> [   12.972113] exynos-acpm-protocol firmware:power-management: calling acpm_channels_init
> [   12.972216] acpm_channels_init: acpm->num_chans=b.
> [   12.975541] exynos-acpm-protocol firmware:power-management: ID = 0 poll = 1, mlen = 16, qlen = 15
> [   12.976522] exynos-acpm-protocol firmware:power-management: calling acpm_channels_init
> [   12.979336] acpm_channels_init: acpm->num_chans=b.
> [   12.984133] exynos-acpm-protocol firmware:power-management: ID = 0 poll = 1, mlen = 16, qlen = 15
> [   12.993849] exynos-acpm-protocol firmware:power-management: ID = 1 poll = 1, mlen = 16, qlen = 3
> [   13.001756] exynos-acpm-protocol firmware:power-management: ID = 2 poll = 1, mlen = 16, qlen = 5
> [   13.010519] exynos-acpm-protocol firmware:power-management: ID = 3 poll = 0, mlen = 16, qlen = 1
> [   13.019317] exynos-acpm-protocol firmware:power-management: ID = 4 poll = 1, mlen = 16, qlen = 3
> [   13.028073] exynos-acpm-protocol firmware:power-management: ID = 5 poll = 0, mlen = 16, qlen = 1
> [   13.036805] exynos-acpm-protocol firmware:power-management: ID = 6 poll = 0, mlen = 16, qlen = 1
> [   13.050945] exynos-acpm-protocol firmware:power-management: ID = 7 poll = 1, mlen = 2, qlen = 1
> [   13.065791] exynos-acpm-protocol firmware:power-management: ID = 8 poll = 1, mlen = 2, qlen = 1
> [   13.079592] exynos-acpm-protocol firmware:power-management: ID = 9 poll = 1, mlen = 16, qlen = 7
> [   13.088398] exynos-acpm-protocol firmware:power-management: ID = 10 poll = 1, mlen = 8, qlen = 1
> 
> That's what sram + initdata provides but I guess these are implemented
> number of channels of ACPM firmware (when APM communicates with AP CPU).
> The mailbox hardware register though can process or consume 16 bits or
> in other words HWEIGHT32(GENMASK(15, 0)). I guess this field should
> indicate hardware capability of mbox hardware like max number of
> possible channels? I'll change the code to use HWEIGHT32(mask) of
> corresponding register then.

Exactly. The mailbox controller driver should model the underlying
hardware's capabilities, not the firmware's specific usage limits.
Since the Exynos850 hardware register uses a 16-bit mask, exposing
16 hardware channels is the right move. Moving num_chans into
struct exynos_mbox_driver_data alongside the register masks for
each SoC is the cleanest approach.

> 
> Or should there be a call to acpm firmware driver to query the number
> of channels? Or should we get it from device tree?

There is no need to call the ACPM firmware driver. The mailbox
controller merely exposes the available pipes.

> 
> Does gs101 have less than 16 number of ACPM ap channels?
> 

I don't remember, but regardless of how many channels the gs101 acpm
firmware actually utilizes, its hw mask is also 16 bit, so exposing
16 hardware channels for it is correct.

Cheers,
ta

