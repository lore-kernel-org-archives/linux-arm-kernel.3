Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5721ACDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLwOaOrVN63ocBzK4TrquFSTvMxdhRBEVjhLSw06WEg=; b=qRj/vtkRcrBSYh0RrZX5WDOAj7
	02TaGJd25iGwldZMVZ1Is/p90FBi+XLHRSMP16khud3N3/aB83HhwWGjcnie82VSzfIIUnOrOKasB
	pJ66b71bHdbcdK+zduX+eZ+jEedT51dZhWMLz4FMRBI2Y8wERfP4eVGlM+5SIKeCO+KrWBaCu0c84
	osX53PsmrdYWS7Vhw8wT/oxmrW1HX3S6pTiYSj+nUw6w+dYblUUz48L8vE4L2S8Mv+xXP8opu0C+A
	6/SK9CNkafJCPyHnLZsRI0is3vVZDwBBnpMP6MG6+zWwEzZdiON+A8iG1TxosQ9zeMTnBn++uqsQN
	Nzskg/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0o4-0000000AfAJ-27Ri;
	Fri, 26 Jun 2026 07:16:56 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0o0-0000000Af9q-0DNC;
	Fri, 26 Jun 2026 07:16:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF51B1BE7A2;
	Fri, 26 Jun 2026 10:16:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782458207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LLwOaOrVN63ocBzK4TrquFSTvMxdhRBEVjhLSw06WEg=;
	b=jyzEzToPHt0FZEmcxepLe+ZA6VMW2QaCJLe96oEhXXdQhSolX3SH2aWIN078Or7/guip9m
	82ZEJ3DklV52hmqI5FJndHqn9PIWo4eumBRO7PBLUc72cWVkTz7o4dW4o6F7oqqoNRg6Ev
	wIqMLPn0iDCNqC5LioVBHo/WriwYTTAwiBCvM2c5Pjl9wFs+/OQTMDkQXwpcD9MDj4m9oW
	2cAxU05OE0rPKjDz5vAke6MfDIVXYPz8EGK7ENdztgc1A9/lzV/Q/FL0dRIrvZzlV5wPlu
	UdwruCzDc8Kd7uWA1HZM2Wq5mNsK1N8M7a7jL4uXmIYQCljl3Uil0QPGYpgBqw==
Message-ID: <0a9fee08-8945-4c7d-8bea-9efb7d921f10@baodeep.com>
Date: Fri, 26 Jun 2026 10:16:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625115718.1678991-1-v@baodeep.com>
 <CGME20260625115817eucas1p10bfe0898d6cb2f6f51cff36a031946f9@eucas1p1.samsung.com>
 <20260625115718.1678991-2-v@baodeep.com>
 <d8d407d5-ba6c-4197-9cf0-2fa7e6e17155@samsung.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <d8d407d5-ba6c-4197-9cf0-2fa7e6e17155@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_001652_603153_B9D7D6A4 
X-CRM114-Status: UNSURE (   5.51  )
X-CRM114-Notice: Please train this message.
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

Hi!

26.06.2026 08:54, Marek Szyprowski wrote:
> On 25.06.2026 13:57, Viacheslav Bocharov wrote:
>> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
>> runtime from the underlying chip's can_sleep:
>>
>> 	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
>> 	... if (can_sleep) mutex_lock(); else spin_lock_irqsave();

...

>>
>> The lock type was added by commit a060b8c511ab ("gpiolib: implement
>> low-level, shared GPIO support"); the sleeping call under it arrived with
>> the proxy driver.
>>
>> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
>> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
> 
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Thanks!


Best regards
-- 
Viacheslav Bocharov


