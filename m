Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D8CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=; b=ivBAlLRBxmGjqVEeqtdCMQ2NZk
	NUYLjxqxioYw1+XqY3uCBdw+ebGgE7PA60Yf8MYOjXeiLes/oPJAevLfe202jiNcUgbx46eSwdoWl
	hQqw0PqrdtIDu+vbd+/4su4WhzIRMD8KpBRpzP2tTuXQ9WLMalJDdOGwPwbUWgnvS4CQvG+Uhz0Ga
	k/e9llKa9iYD8+HlAr23BBdw10VZIwgC7pCoF/uJFB2tmAfFx20Ts6iWcO8C1KzhYGr7d57YJRSct
	kWHmCY5qEVdyVOPfhXN0jrkQOIoB/Sqy4KMpNM+J/PLjYAiCgFqrCT45e/BvHvqfTonIMie13pxSC
	a/9E5bhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIub-0000000GwbL-2Mai;
	Tue, 05 May 2026 16:46:21 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIuZ-0000000GwaR-0Bmv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:46:20 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-7991db3dc98so58196317b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999577; x=1778604377; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=;
        b=QVJOkllR0+zMENBkgfv9k2SMtS23GAUa8KIU0Si6ow7qNZI2dGUwBazhvBmgQG9PPP
         yYiBcMMSIhfphRQ9O/2pzss9XtfAP9PlN0bw2F6Hus4OTeuBPIkRfi09YWPUxRfGTZne
         Z5SUCC2GyAnul+5d4joGn9oJQ1t5PkvUX6eCfU+05MoweRstV9QIeptgrZNcBGKW3way
         SHbf1ZsAOKW5Jp5r8W1D8xlR2wf/OXSncRfMFUpoM28KspgJtI5+3nDv8kQYAzISyML2
         +ID79vfLXxzqS/jfFa8yIGt3VgQkiWgVrbdvx/2f58jn0nd1Ooe/MPJNIVuGMNthpq/8
         DRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999577; x=1778604377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=;
        b=EBTKX2KzE+WF80bVbPzQYikkz834ZteOGtfgVlDIS8Tf9jQ1NEIQcZ4zT4mtLD0lHE
         VrmlqtbR2PTEh3ftGLlxd40BEth3ne5ty90z//6mYotMGUhNx6vdE6lkqZy0PiRdKQRA
         1nyskaT0HY9YQKAggwqL2WXdYryXIXLKRPV5Igq+aa2bYF/ta1qpFtlYDmvfmd2Lbyvb
         Ve70nKDAfFEpjr+aPYFKIofGcFJSdsn0hsUaNbsTVzVcat3aI4Iny7Zf77CbQzXoEIGK
         fLsoxOEjMyWoL3NUqhohw7KDtOzAnMUm8X+3Cb2ah1yLUo5dIl4YVtSRatDqmM0CKxdn
         Myug==
X-Forwarded-Encrypted: i=1; AFNElJ+VHWXzX5hevCLgTxIKENCj3uu4Tw3RjFotdy/WVFIGLV3ecw2ymlAhEJpV4m8XjKTC0xne/ldmA3Bn2hIR4plT@lists.infradead.org
X-Gm-Message-State: AOJu0YxhB6DAa3QD315j5IZMQC6TrL+sTKRXqT8EXv/Nj64aFi0HQbeM
	9Vi0sLLXRMeEhACC6T3WxfEx3hlV2m1mgOeZGC8IxzNOyJZiHHBRFcuJlGK5OJTbMVk=
X-Gm-Gg: AeBDietOS9IKqGYJUvCKU2ZvZbfPslyBhlepPxbSK8MFpOIXAA2hL2cdc8iLftaZZoP
	J8qrvik5Ekpv0Hu4OktLmk1ln1gCe8CvpvWSeK0tuD42wxeA5FSuH/GOhJSXN3cLSprM78c28BN
	F87L77UKDq1eiLcVw4IHzwC6p4HHX7gVdPkc5G/e5Gy7rXz4YIziKNkUCOtgpOQWYY43VTxCZ+b
	y/nQ9axBHuDuEX0ZymXyQCr2crTVBDklSjM6Vojf14NRu5VeJ2aPLXNIxZOE5BWgWjd50gMllcG
	N0MnrBEBU1IWQXiFNBbqyhlrDK6cvA9Q6VFIfcCcPtsDb/zIW6Q4yDbN6UIqQ2QkBxbF/Ff5+eo
	+j1ztkuJCrxe5SFw3Xv6Kw8rATZUC/1Dpi7ptyuBcdkLrcsdqL8DwH2TGnjxSYA+h5YABKz9fyU
	AwBdgQuFh/FYJyJoY77HXLhA1QlJl9bppF+jnteGl+tGk7qM1VIVKJJIvT9lfTQHWgRSdRPOmSt
	Q==
X-Received: by 2002:a05:690c:e094:b0:79b:e346:fcfb with SMTP id 00721157ae682-7bd770df5b9mr144294337b3.32.1777999577197;
        Tue, 05 May 2026 09:46:17 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm66872617b3.20.2026.05.05.09.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:46:16 -0700 (PDT)
Message-ID: <e582f6ef-aa4d-4d7b-9d4d-7ea0445d42fd@riscstar.com>
Date: Tue, 5 May 2026 11:46:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <afodG9uuopgfvSmu@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afodG9uuopgfvSmu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094619_094870_A4848517 
X-CRM114-Status: GOOD (  13.97  )
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

On 5/5/26 11:38 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:
> 
>> +	/*
>> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.
> 
> Minor typo in the comment: I think you meant TC956X instead of TX956X?

Yes, I'll fix that.

>> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
>> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
>> +		if (!res->tx_irq[i])
> 
> Typo: res->rx_irq instead of res->tx_irq.

Wow, that's important...  Fortunately we haven't been getting errors.

This will be fixed.

> PS: I was able to successfully test this series out on a Rb3Gen2 board.

Great!  Thank you.

					-Alex

> 	Ayaan


