Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C40D2C56C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=paV89RvxdsC2HVqjH1FMUpyp7lHhnrvot2ef/7eVtiw=; b=SaWUzcSx+2egbbTTSWcKudZ0Tb
	AA97PDLvGukdIW5g8E5T7Tm8zx6oDIIhtG1EJR7Jxu+/z+dvVrTIsoa2Tk5K83StTr0RVXJkpHL0W
	ICGZrV6ZvBglrCFtd5ih52SgHCgJr6uWiPBbXJ8gxsbQIDpVL7LOGcc47BmIYnkJFB5goJYQNGmv8
	3N6UjKpCJXL153Xz2fNYR35qRoxHIRCaSXAGbnDv3APuqHpNeDgLChrwthsSrlJ5bhcWRt3/8BFkX
	xUOn69Dp1dR1fVlqB38T29Iol1YdS8qTua6eBuGQhUyGUoUfdRzPiav4tVVFENNbJaTW5VIdYrj1U
	SlMUVeyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vXZ-000000008rE-0NPY;
	Thu, 24 Oct 2024 10:58:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vLl-0000000072U-1pXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:45:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a99f646ff1bso95296966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729766751; x=1730371551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paV89RvxdsC2HVqjH1FMUpyp7lHhnrvot2ef/7eVtiw=;
        b=UDhakfu7Q8f4ebKloeqIheJq07SSFz/QGLQ8CqSh+uZZKBKQTkt0i91b8uTxlaR9sC
         z6r4GlSTNzsuoaJlq1lS1b/6Ypx9WonLHEYdHUCcnc1MKtVgLiJjfPid3/Qp3m0hS/ZS
         Yks3MxgwMg+DtGRh7eHNQWt9TZyb1h8czhsifEL0URLyvNtYZKD3RsaOH1Q951UV40+w
         Lczl32cG4pyT94sGx2Quk37vekwa7OGIuwW8GhTjaWwQ1THnwXX8L2Les+2L9PbenlPJ
         drabtwD0RSGBXTJmY0byIQauU1NXtXhP9h3Eoa5vYaHQtGVKoKNfGorsezQmKAWUoJXP
         kDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766751; x=1730371551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paV89RvxdsC2HVqjH1FMUpyp7lHhnrvot2ef/7eVtiw=;
        b=it7QsRJPNH6gYu2jGrAqKF/j46ylcnnY/pkD0OOFLolchYnpClLxVDvpSTtTiubGse
         CzwANHMaX3cGX+00DVuzsKVZlp6ooQvuGipTVpjYcfut1TgCFXli0S/qVACn59+GC53F
         FL+G96M9SNgxNmEAy2AONppZhUHDy2qWFPEV9w4XDz2bJjHNKZOTi1ykdYugIsEj6UDQ
         hClj1LFhmxaFh4LttckCLOpmWGd4Vk6YaXO6hTDoWCbhK/5Vx7n8PLZGmyXjUb6E31NJ
         dfLpxufDE6CiAK6fDxfJUwY/UVRz6G3Xck36gOQiu9kezgj28gIHBMAwR0QeLhKfNv9R
         VR6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaF8MEitbhhaCbKEnsF5jp/oic4O+PUpVQQYiMXkn2tnXRE/Z6vMEQcDWfc8Bcp9/Rg/UaML1d5cdWOM0s+l2M@lists.infradead.org
X-Gm-Message-State: AOJu0YxJIhTapno6IbpsZVVT+hZF5jv+cn6htQ01UocXkun8tVE7I1M5
	s/3aMUWKtOa5JL6oGPzGAY/Oc7Bn5NpraMc+qBoM/Vsy1p5ifbHgEsvEuE+HaTs=
X-Google-Smtp-Source: AGHT+IHpyMKEbievVC/pWQ5zz9JH+qLFmDjSkNqofQg2esfN+uFZv9ZvGJ1cy2jkeWMeNyVTRyRiMA==
X-Received: by 2002:a17:907:960b:b0:a9a:e2b:170a with SMTP id a640c23a62f3a-a9abf52b269mr553713966b.0.1729766751358;
        Thu, 24 Oct 2024 03:45:51 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.110.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559be8sm609419966b.140.2024.10.24.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:45:50 -0700 (PDT)
Message-ID: <a2065dc8-10da-42e9-b093-b0b541ca2305@linaro.org>
Date: Thu, 24 Oct 2024 11:45:47 +0100
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
 vincent.guittot@linaro.org, daniel.lezcano@linaro.org
References: <20241017163649.3007062-1-tudor.ambarus@linaro.org>
 <20241017163649.3007062-2-tudor.ambarus@linaro.org>
 <CABb+yY0_NSLAs-mP=vHeNsfKRcS2hcFWmWfcvsr=nFcXQOi5uA@mail.gmail.com>
 <a7274a6e-1da3-47f2-8725-b0c534bf6608@linaro.org>
 <1df84f83-40d7-4719-a9f9-dfa10d25c667@linaro.org>
 <CABb+yY0H4cATB9Gz2EitnR6R179aKDzR1N87fz7Hq9Hm-_8Rmw@mail.gmail.com>
 <779fc372-a4d9-4425-a580-2173a0f6a945@linaro.org>
 <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0bhjRYLwyo-t6djttP2bq_irX+Rad71wDX++nQV69cAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034553_521655_18E7CF83 
X-CRM114-Status: GOOD (  38.87  )
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



On 10/24/24 2:27 AM, Jassi Brar wrote:
> Hi Tudor,
> 

Hi, Jassi!

I appreciate that you respond quickly on my emails, thanks!

> On Tue, Oct 22, 2024 at 8:27 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Jassi,
>>
>> On 10/21/24 5:32 PM, Jassi Brar wrote:
>>>> On 10/18/24 8:49 AM, Tudor Ambarus wrote:
>>>
>>>> The active request is considered completed when TX completes. But it seems
>>>> that TX is not in direct relation with RX,
>>>
>>> TX and RX are assumed independent operations (which they are).
>>> TX is sending a message/request to the remote successfully. 'Success'
>>> can be indicated by any of the three methods  TXDONE_BY_{POLLING, IRQ,
>>> ACK}.
>>> You seem to assume it should always be an ACK where we receive an
>>> acknowledgment/response packet, which is not the case.
>>
>> My controller driver indeed ties TX to RX and considers the request
>> completed when the RX completes.
>>
> Does your controller require RX or the protocol? I suspect the latter.

The response from remote always happens for the acpm protocol. Same for
the plain (no acpm or SRAM involved) mailbox controller that I see in
downstream.

While the response from remote always happens, the RX data is optional.
Clients can choose whether they want the data from the RX ring or not
(see `struct exynos_acpm_rx_data`).

For each message that is sent on the TX ring, it is expected that the
remote consumes it. The remote gets the message from the TX queue,
advances the rear index of the TX ring, processes the request, writes
the response message (if any) on the linux RX ring and advances the
front index of the linux RX ring.

> Anyway, the former is also supported by TXDONE_BY_ACK already.

If we want to focus on when TX is done and really be strict about it,
then for my case TX can be considered done when the remote consumes it.
I need to poll and check when the linux TX ring rear index is moved by
the remote. Other option is to poll the IRQ status register of the
remote to see when the request was consumed. So maybe TXDONE_BY_POLL is
more accurate?
TX can also be considered done after what we write to TX ring hits the
endpoint-SRAM, thus neither of these flags needed.

As a side nodeto IRQs, the acpm protocol allows channels to work either
in polling or in IRQ mode. I expect in the future we'll need to specify
the done method per channel and not per controller. IRQs are not used in
the downstream, thus I didn't touch them in this proposal.

> 
>>>
>>>> Is there a specific driver that I can look at in order to understand the
>>>> case where RX is not tied to TX?
>>>
>>>  Many...
>>>  * The remote end owns sensors and can asynchronously send, say
>>> thermal, notifications to Linux.
>>>  * On some platform the RX may be asynchronous, that is sent later
>>> with some identifying tag of the past TX.
>>>  * Just reverse the roles of local and remote - remote sends us a
>>> request (RX for us) and we are supposed to send a response (TX).
>>
>> I was hoping for a name of a driver, but I guess I can find them out
>> eventually.
>>
> Do these usecases seem impossible to you? Many users are not upstream

They seem fine, I just wanted to see the implementation and decide
whether the request approach can be applied to them or not. I think it can.

> that we care
> about as long as we are not making some corrective change.>
> 
>>>
>>>> Also, if you think there's a better way to enable controllers to manage
>>>> their hardware queues, please say.
>>>>
>>> Tying RX to TX has nothing to do with hardware queues. There can be a
>>
>> Right, I agree.
>>
>>> hardware queue and the protocol can still be
>>> "local-to-remote-broadcast".
>>>
>>> While I don't think we need the "Rx is in relation to some past Tx"
>>> api, I am open to ideas to better utilize h/w queues.
>>>
>>> The h/w TX queue/fifo may hold, say, 8 messages while the controller
>>> transmits them to the remote. Currently it is implemented by
>>> .last_tx_done() returning true as long as fifo is not full.
>>> The other option, to have more than one TX in-flight, only complicates
>>> the mailbox api without fetching any real benefits because the
>>> protocol would still need to handle cases like Tx was successful but
>>> the remote rejected the request or the Rx failed on the h/w fifo
>>> (there could be rx-fifo too, right). Is where I am at right now.
>>>
>> No worries, I'm confident we'll reach a conclusion.
>>
>> It's true I implemented just my use case, but that doesn't mean that the
>> "request" approach can't be extended for current users.
>>
> Sorry, I am not sure we should make the api dance around your usecase.

No worries, it's fine to disagree.

> If your usecase is not currently handled, please let me know. We can
> discuss that.

It's not handled. I have a list of requirements I have to fulfill which
are not covered by the mailbox core:

1/ allow multiple TX in-flight. We need to let the controller handle its
hardware queue, otherwise the hardware queue has no sense at all.
2/ allow to tie a TX to a RX. I need to know to what TX the response
corresponds to.
3/ allow multiple clients to the same channel. ACPM allows this. Support
would have come as an extra patch.
4/ allow polling and IRQ channels for the same mailbox controller (not
urgent).

I guess that we agree that in order to allow multiple TX in-flight we
need a completion struct per message/request and not per channel. But we
disagree on the ability to tie a TX to a RX.

How can I move forward with this? No better options come to mind right
now. Shall I take the apple approach and move everything to drivers/soc?
If any of you has another idea, shoot.

Thanks,
ta

