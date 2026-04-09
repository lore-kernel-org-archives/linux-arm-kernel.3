Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161E1EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74KMQDyamsOqfkVKpW+KmRC64tMrk0EgM043WfdM7PY=; b=kfqKA2xyCM+4Abv4tp4whRNZEp
	ZeieAKpIIJ2rQm+3WvDJn6NJKU/HEhJt/+Pc6gfaa01cQd7E7X9VRbrZ5qcxa9N8ViD4rHcBjYujj
	CXbe6nfrAkTCsHbqgIwpUAA5lKnv+RLUYitVFx1rwihZj+LMtG4rvE47G95GIBjcJbXzx49eCkcPO
	f1D94eFWSEutaj8wu9UnlfxeaogIJGAwZTTX+tLC3ny2QimAu2JTgy43NnZVeuz9swQ81b8lCiojW
	kx7Mxzg2J8f7muyYUlXbLeGJOO5PdzwfgBFGYaRKY64yxU5En+b/1GNeKQp5fuuUF1btTZLQZp8YS
	+criCHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo86-0000000ALNC-0cRY;
	Thu, 09 Apr 2026 12:05:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAo82-0000000ALLl-3EZc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:05:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488b150559bso6361395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775736296; x=1776341096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74KMQDyamsOqfkVKpW+KmRC64tMrk0EgM043WfdM7PY=;
        b=LErs9n051+nzcY5gbH0jq20bZ4Oe0Lxm6Tv+mST3GVdtWBf5PR3AasLWSXO79j3twN
         yavSSzcyTFNuK5MN5u7LQ0Cnym8u3+aA8uVKtZSUtKU4LUY9U6dIlxXykuH4fn0HN1SD
         v5u3apt7bXrI2m3YSBhPAprZRMGphyCOI8UcKy9N4isTgeXkyRtpMu2TqgDJBnotlgUF
         Ab2/vWq/ol1C2K6B0p5dQSLAr6BYF4v4dPVJ7u9Cy89ydCEKfyqxpGDi8mhSKuk9xlyq
         9Q+kj6gjZdyfzaHKOrAvaZQtydZ/P/X9Ivx6+M7mnZttiG135SXvmn2jqtm+cguZJFRv
         uKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775736296; x=1776341096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74KMQDyamsOqfkVKpW+KmRC64tMrk0EgM043WfdM7PY=;
        b=S0Zoab+DUmSCLF/a9iCH63ma4YZLg24IugcvDWaEVQ0C2wsLZQO4Yq2O/AV8z0KkQp
         WI8NW8y3WUH4CKgyuDkgkE68/dXPVRggRhxivj2RoGazSWIpTQ7e2zSf+ZWvJGCAAD16
         ABjAaO1rk4ABH2DjHjvIvnPepQdr9dfklbkCZBNf6WE+afjVzw2FyvGD2OtpEnn/NKqq
         clbhCrsX4aIH8pIFGeNAMTUZWvJ7VoQPsV2Z/+mTYJyIWSxs3LkZeep0UNdedMNtRJ8n
         dng/f+DOyQRQcuxrAcu9u2wi2TMxVQLztv7+VUZYMXop1rQwwzaiP2pjt9uYb+ubL1DO
         CZSA==
X-Forwarded-Encrypted: i=1; AJvYcCWmttPtfcJdPUGjhTUdzCKdz7Y4BDCs3D+vU3yKAFaD2uRRCxSYr2LtgfewKoVRFgYmZVtjHA8A49P+ByPUrtCI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5zf3dOLMZDVl+8roYfBk4tipfiuZqKmkUdngbxr/LoyjTxYSB
	pRTKiAh3Ia8XMhUgdz3iR4/tO6A0ZMDDuPvYS1RI9rfaKxUH//wvyrM2oyQ94JrmtcE=
X-Gm-Gg: AeBDieuxo12KP+9Mc8NQoMVtx5tQxBpagZXB/cXNdGBHVGwYXLGRS0u5QzZjCBtS83G
	MoDFBVH5m+gdCsWTVWFa3VGjDzbAW7UUnR4ANtaD88UuFFOs7FAIaGB+NdmxPnrTrHF2rZde/pk
	IkV0xkw6HIGy22fG58jfjn1KSCfr/S2W8jFi0YlTzy7xGCNH7NHruUfm82DGZCTOlJCkkmCWjHu
	FzetX1oyq+0mQEpJQlZr43a9WgplmOZi1Da2VO6bZD1MGrTz/Cl8Y9UvX6WX/rGu2a9VgYOykwc
	lr9E7VrQG9qruTzi4bqdg9XoVEGU93bZbxoL9PoE8CJSrI31aob/phUFsVkdybwQI9jXw52lv3a
	wgn539cz03+wCBqmut816KsdcVBYgCvB8C0tlzqD2ZExf1i4GsHFjOqoQ1sSlpby5Gucl2r/9Mt
	xC1gDxo6GLudEpJ5wn5X6x1JVbobv9ezJT8lHqdqqJQw==
X-Received: by 2002:a05:600c:3f08:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-488996d2323mr413895265e9.3.1775736295947;
        Thu, 09 Apr 2026 05:04:55 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd2181casm73225225e9.11.2026.04.09.05.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:04:55 -0700 (PDT)
Message-ID: <c796e077-e061-44c4-a8e1-dbd8d3c14caa@linaro.org>
Date: Thu, 9 Apr 2026 15:04:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Juan Yescas <jyescas@google.com>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_050459_228144_02B1ECEB 
X-CRM114-Status: GOOD (  28.92  )
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



On 4/8/26 4:08 PM, Alexey Klimov wrote:
> Hi Tudor,

Hi!

>> I find it strange that the SoCs use different registers. Are you sure you're
>> using the right direction? i.e. ring the doorbell to APM and not to AP?
> 
> Well, I am not sure I correctly understood the questions and comment. So,
> this all was tested with ACPM TMU code with 3 temp sensors and it seems
> to work and sensors react in the right way.
> 
> Downstream clearly does the following (see also [1],[2]) when sending
> ACPM msg:
> 
> static void apm_interrupt_gen(unsigned int id)
> {
> 	/* APM NVIC INTERRUPT GENERATE */
> 	writel((1 << id) << 16, acpm_ipc->intr + INTGR0);
> }
> 

Indeed, it looks alright, thanks for the pointers.

> I am aware that gs101 downstream uses INTGR1 in apm_interrupt_gen().
> 
> When I use INTGR1 for e850 then I observe acpm timeouts. Hence, out of
> curiosity, what's the expected behaviour when/if I ring the doorbell to

If you raise your own interrupt the APM remains unaware and the AP times out.
You also have a spurious interrupt on yourself.

> AP (to itself as far as I understand)? My understanding that it won't
> work at all in such case unless APM firmware does some very fast
> polling.
> 
> 
> [1]: https://gitlab.com/Linaro/96boards/e850-96/kernel/-/blob/android-exynos-4.14-linaro/drivers/soc/samsung/acpm/acpm_ipc.c?ref_type=heads#L423
> [2]: https://github.com/samsungexynos850/android_kernel_samsung_exynos850/blob/0af517be2336bf8e09c59d576c4c314446713101/drivers/soc/samsung/acpm/acpm_ipc.c#L426
> 
>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>
>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instead of
>> a shift.
>>
>> I would rename irq_doorbell_offset to intgr. It aligns with the register name
>> from the datasheet. You won't need to prepend _offset to the name, we already
>> see it's an offset when doing the writel().
> 
> Sure. Thanks. Let's use FIELD_PREP.
> 
> "doorbell" naming was chosen for readability and maintainability reasons.
> It seems to be more generic enough name that better reflects the workflow
> of what's going on in ACPM+mailbox machinery. We can rename it to just
> "doorbell" for instance.
> 
> From platform data it will be clear to which register it is set, INTGR0
> or INTGR1, to align it with datasheet (which is closed anyway).
> 
> Regarding intgr vs doorbell name, the intgr is a bit unclear for a
> reader if it means interrupt generation register or something else.

interrupt generation registers sounds sane to me

> But if you prefer, I can go with "intgr".

I think I prefer intgr, yes. If you choose doorbell, you'll have:

writel(FIELD_PREP(data->doorbell_mask), BIT(msg->chan_id),
       exynos_mbox->regs + data->doorbell);

or maybe s/doorbell/doorbell_reg? But that would duplicate
exynos_mbox->regs, we already see that doorbell is a reg offset.
Doorbell is too generic for my taste.

And then how would you refer to the interrupt mask register? You
already have a doorbell_mask in the example above. 

I won't push back too hard, I'll let you choose. If you can find a good
naming scheme for the interrupt generation reg and interrupt mask reg,
then fine.

> 
> One more option is add a comment, smth like /* Ring the doorbell */
> before that writel().

I'm okay with such comment.

Cheers,
ta

