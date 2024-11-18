Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9300AD49234
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS/g2Uu8h88uKdC3kSKMEY90IlJiDjaSvhZlfRQ3+U8=; b=kyPIh7g+iyKD6wGDeVDRLW5M6P
	2GgydVOzG39e5b/y6UaPPkPARGSgux+KyXJfJnti0hXKkDN5My95qvRI8AW4K/7K5xxmD8VgmC9x2
	o3viI8t0dNYonSORYmFmcsjShKmQxFG2UEZ0nEk+u0JAJXdWu3WBDoFRu8PMFTCXhGNmw5ZB3Y42R
	QH95xfq06cO3z5DxJoLqx+qbrj0xiHX7laGjBhhKqv6zda9KEIr2NbcW0NwX+/vrV6zX/iAvyXoIT
	xr2nGvznb+yG8T2/E1q47E6oBQH29TC8G3nQG7ZiYIYDnmZFHk4FsTTexRuLJQ+7qiqFKQ+cwN4o6
	U/n/6q5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3ai-00000009uez-34rA;
	Mon, 18 Nov 2024 15:23:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3Zm-00000009uVR-2dJN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:22:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso24918015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731943324; x=1732548124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yS/g2Uu8h88uKdC3kSKMEY90IlJiDjaSvhZlfRQ3+U8=;
        b=lebXmGa2ZUTpOOf8mOt5iRR3LnpZJfM4uCdoCCq1FzVW/QmGPCq7sz8PRtFJu1tIF0
         3S0sJohJs2evXZh40l/odP1UenebhxybqLSOVGBsGCWcdnsfSwvrQ0t6pc9jWfL1Fq3k
         RiLAPNqu4TPZIKwK4/36KA4d3FBDlwHoNwLBwgIFDWAIomW6wEjAzVYTcDvrsULQ/XRX
         plXP6SbDH6yDxhX485UbPpI0N4mcvEnFzdEvvouoBHZeEjg0MtM03RQYB64cuo4cKZMC
         Xv1FdphiSUE6NsMuCR6z8lGdYCFMxPBxsKLZjCdWHQBeg2ZJvd3HoWVe9uTqJvyLysmH
         v8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731943324; x=1732548124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS/g2Uu8h88uKdC3kSKMEY90IlJiDjaSvhZlfRQ3+U8=;
        b=t0VcUj/lB9/pRvQAufuU/O2ZZ9fi5TI6U/6hhh8ezHYkCuYRobx6Jo6qh6dogkkGEM
         cyJUikFh1iIccoq005ODrY8A1QXsux4MUnLTK+ZZzOPyEQkoFZIEQ8riEQkmPwDXxtD3
         V3ABIyzFOU2qSSJ1F5OIvN9WuKO94BeItEECQvQnoU+VlZAqNkR5d/AqneBA31MUcZke
         aI9Wec22BD0EKjFLBjUiqAZa8cgZQ8aR5IXcOPJNDwP+DGm1q0RwKWX5TKwa85Z2Vrrs
         jSnWKEvOk8qo4ukMWXIOQVPJp6oN10mj9JuU0TF7HOlwBjB4+q+0dDgiEF+u3Kb4bUIV
         Rurw==
X-Forwarded-Encrypted: i=1; AJvYcCXkvyAOfru+M/VrFwh5XAU8WoDdVE1ThIxnsdp5Pdvo9Ik2vMNfwtOe8i2+EjBq27hxdEIwLYMGjSsU6cuqzbD5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9kMJ8U1mIZrJKg3TKMqa2ICXulNYftHsmWha5hA5iakv8HcUn
	8yaRpEYgdQ7yoKEmyi3oM220m47G4GM7iH/TjPl1MAOaxa3ssVjAbIOHJfOooQY=
X-Google-Smtp-Source: AGHT+IF5i912SxZj9aROjXMiBc6XZF1g7Bx1Z3E6lXHo6tsdVujyqT7a1uumivdREl9IH5QQ7U8UBQ==
X-Received: by 2002:a05:6000:69a:b0:382:2386:ceaf with SMTP id ffacd0b85a97d-38224fd034amr12681351f8f.27.1731943324150;
        Mon, 18 Nov 2024 07:22:04 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382308532cbsm9147678f8f.88.2024.11.18.07.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 07:22:03 -0800 (PST)
Message-ID: <603407a6-93c7-4d45-b171-7bbc871a3569@linaro.org>
Date: Mon, 18 Nov 2024 15:22:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mailbox: add async request mechanism to empower
 controllers w/ hw queues
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, mst@redhat.com,
 javierm@redhat.com, tzimmermann@suse.de, bartosz.golaszewski@linaro.org,
 luzmaximilian@gmail.com, sudeep.holla@arm.com, conor.dooley@microchip.com,
 bjorn@rivosinc.com, ulf.hansson@linaro.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, marcan@marcan.st, neal@gompa.dev,
 alyssa@rosenzweig.io, broonie@kernel.org, andre.draszik@linaro.org,
 willmcvicker@google.com, peter.griffin@linaro.org, kernel-team@android.com,
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org>
 <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org>
 <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
 <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
 <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
 <a2065dc8-10da-42e9-b093-b0b541ca2305@linaro.org>
 <CABb+yY3W3Cv7a6wZhvJe80xn5sp1Y_A_nbY_=cj0U4Z1YC61vw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY3W3Cv7a6wZhvJe80xn5sp1Y_A_nbY_=cj0U4Z1YC61vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_072206_685464_0638DFDE 
X-CRM114-Status: GOOD (  24.80  )
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

Hi, Jassi,

Sorry for the late reply, I was off for a while.

On 10/29/24 3:59 PM, Jassi Brar wrote:
>>> If your usecase is not currently handled, please let me know. We can
>>> discuss that.
>> It's not handled. I have a list of requirements I have to fulfill which
>> are not covered by the mailbox core:
>>
>> 1/ allow multiple TX in-flight. We need to let the controller handle its
>> hardware queue, otherwise the hardware queue has no sense at all.
>>
> As I said this one is currently handled by assuming TX-done by
> depositing in the h/w queue/fifo.

This may work indeed. I would have a TXDONE_BY_ACK controller. Its
`.send_data` would be a one liner, where I just raise the interrupt to
the firmware. TX ring would be written by `cl->tx_prepare()`.

Then in the protocol driver I would do:
ret = mbox_send_message(mbox_chan, msg);
if (ret < 0)
	return ret;

/* TX-done when depositing in the h/w queue. */
mbox_client_txdone(mbox_chan, 0);

ret = exynos_acpm_wait_for_message_response(mbox_chan, msg);
if (ret)
	return ret;

> You will have the same perf as with your attempt to have "multiple

I'm still forced to pass all the messages to the mailbox's core software
queue. I also don't need the locking from the core. For my case the mbox
core just needs to do:

if (chan->cl->tx_prepare)
	chan->cl->tx_prepare(chan->cl, data);

return chan->mbox->ops->send_data(chan, data);

Would it make sense to introduce such a method?

BTW, what are the minimum requirements for a controller to be considered
a mailbox controller? As you saw, I'm using the mailbox controller just
to raise the interrupt to the firmware, no messages are written to the
controller's buffers.

Does message size matter? On my device the ACPM protocol is using
messages of 0, 2, 16 or 32 bytes, but it also allows the possibility to
pass a pointer to an indirection command SRAM buffer, where one is able
to write up to 412 bytes.

> in-flight" while neither of these approaches handles in-flight
> failures. We can discuss this.

Do you mean that there's no retry mechanism? The crypto subsystem has
one, we may look at what's done there if we care.

> 
>> 2/ allow to tie a TX to a RX. I need to know to what TX the response
>> corresponds to.
>> 3/ allow multiple clients to the same channel. ACPM allows this. Support
>> would have come as an extra patch.
>>
> These are nothing new. A few other platforms too have shared channels
> and that is implemented above the mailbox.
> 
okay

>> 4/ allow polling and IRQ channels for the same mailbox controller (not
>> urgent).
>>
> It is very easy to populate them as separate controllers.

Do you mean to call devm_mbox_controller_register() twice for the same dev?

Thanks,
ta

