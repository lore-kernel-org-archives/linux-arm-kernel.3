Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F56C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8bf5RcY8i16rD0QiWrZhv6qgVFg9w2YATA1BYWElLo=; b=VzllDNC2+bZ7S1wSvZh9jp9cvn
	9zDpFcjD1QRDVRZbmRTw3m2MCLspegxMoefW2RCPwUEf3AQjln4P5jcNXXeF2DVCOi7KySuDla+JC
	Fv3q/bw3JOv5JVArDuc65hrSOvrGifHyhPdShI6FPsMDlN8+vbdMxjM6M//YknL/EFwnYYJM0YH8Y
	cgOiM0Dc3vLhFRUfnfW1SfXBDzOvQ2VcQ4qIk+tMl71Yhx8wTXqrJbefT8u6JNKn17a3Kwe7FXUP1
	nzIU5su1kZ6VsQplsQ9B9aSsPqlLnNvexZVi2Plf50T9aiv2wao7hGY3JLS9ZPKuEt/htnxPvcALG
	/w6/Hwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teK4U-0000000D6Si-0tq6;
	Sat, 01 Feb 2025 20:26:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teK39-0000000D6NY-0Ct6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 20:25:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2166360285dso51788155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738441506; x=1739046306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v8bf5RcY8i16rD0QiWrZhv6qgVFg9w2YATA1BYWElLo=;
        b=Vyj62coNL+dxX3nxXPCcuzHnV9lsAccrmAheVarBP51bbrVVLm4rQUdlR3tSP5D0II
         sION0KrbA7SgBWHopHqc8vlCiOkyfxG5XDJQ46I6FmGJK7lnG1+8MdEL/9fUW2DYMm7E
         vu1uvxwt9kRadzi8TZSzoEjRP7uSA09xl6mMqjJF+Kv80IJ/QcrThQhEWeEa6bhxOk5H
         h6bunaH/iSl4XUN5Tdq6o+49ZtcAhe/GOODQ0BJqlfnD7kPpVPbPZVDeMOMqrTq9EjWG
         rcSXzIO2T5zLOoBXMujuOqSJqL8jeqMiS2RQLhNHU9yhdx8r8YSe1RqKzLMRsKxzAdCW
         ZWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738441506; x=1739046306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8bf5RcY8i16rD0QiWrZhv6qgVFg9w2YATA1BYWElLo=;
        b=nGeKB9RzuWqVZzKnEBmS1f+YTOpXesV2jUd6tkkHRETZrTtDEfwec+ZdlxUrd+HA1T
         QNSghWXrG/UKqoMPfBBuQo5+xyD7GIHeVv+ChxyQCyADKrsdccwwTJVDu16NInlkph0f
         wOzh6aIZ3FgKkgrFpIcjc+Og2mwU+VkYbyifbzAxnsgfkqIQbeFzuLgEwrEHHmYXGnCT
         6jZs1MpDPeflLS2+JW+s3BGo0NbjcxiU5/7sKrvq+WQHKIAxNtL90K4F2HFvmcgRGGMa
         JekXwlma38Kg2j4NzV3mj+NXJSkUeObJwE01cUA2+a0L7xBRfu9c0efTSuwYa+JoipYk
         OvEw==
X-Forwarded-Encrypted: i=1; AJvYcCVHb0KZ8kZldpzpQhfx7cEmR/cc7yL0qCPPEdw0Upy4sHGIOnJlN6zpuQnJCohO5sO/h5TiFkwiJJgrIxibyj5t@lists.infradead.org
X-Gm-Message-State: AOJu0YwcxDGLl50/s/dXJ7Cj1PBlTno+P9MGLmvBWyrtkBuljR3bnCE+
	7XdrTkvxdzn3M6sVwtTrXTKjstxmhMUBTrtuHQwzczvgMe0RwqjZ
X-Gm-Gg: ASbGncty8EZrh4ufL/P8v4uMUNkBI70Mzgz3vU/N6/4/prVLDef6zF5HfKD5PgGH42X
	dGYBAc4wCpHa85r0GR13KjfSWKF8wqHvtQX+jn7/QlkEYgsDqTYIypu2g/k/rWSaQIIx5SOag1T
	gbj/cK2CLWMxTt+Mb9yrJNyL+H6ZMZ86caHhbM2BfLdURwkFWvk6xnpLQW47qskSEa4o18yyrix
	O8tMYjmHC1WwZVA4K/nNA9da7YVgtliQjh1S1+PfLjeM8FNjYwRlch+Npqugdy3O+LMeyj0ImEH
	mLXcpM4Gv1xy8iDOnTP+/N7vq6SC2HUFZ2Sw5IreOOO1Yk4gRpewro3KJOaTRfg5
X-Google-Smtp-Source: AGHT+IHuUQac2dADA+dcQYq/xnMmFYr0AojLl5JbY4u3LHnKk5mKteXK47vQgExRYAE/vFAnj51spg==
X-Received: by 2002:a05:6a00:3924:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-72fd0c679b4mr23294882b3a.18.1738441505935;
        Sat, 01 Feb 2025 12:25:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba418sm5551561b3a.105.2025.02.01.12.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 12:25:05 -0800 (PST)
Message-ID: <084020ad-5f58-42e3-9521-413ab8175717@roeck-us.net>
Date: Sat, 1 Feb 2025 12:25:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Yanteng Si <si.yanteng@linux.dev>,
 Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net>
 <35ac46e5-1a5c-4416-a6c8-1fd42ea47d37@lunn.ch>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <35ac46e5-1a5c-4416-a6c8-1fd42ea47d37@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_122507_101296_62BA33F6 
X-CRM114-Status: GOOD (  14.49  )
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

On 2/1/25 11:21, Andrew Lunn wrote:
> On Sat, Feb 01, 2025 at 11:14:41AM -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Mon, Jan 27, 2025 at 10:38:20AM +0900, Kunihiko Hayashi wrote:
>>> When Tx/Rx FIFO size is not specified in advance, the driver checks if
>>> the value is zero and sets the hardware capability value in functions
>>> where that value is used.
>>>
>>> Consolidate the check and settings into function stmmac_hw_init() and
>>> remove redundant other statements.
>>>
>>> If FIFO size is zero and the hardware capability also doesn't have upper
>>> limit values, return with an error message.
>>>
>>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>>
>> This patch breaks qemu's stmmac emulation, for example for
>> npcm750-evb. The error message is:
>> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
> 
> Hi Guenter
> 
> Please could you try the patch here:
> 
> https://lore.kernel.org/lkml/915713e1-b67f-4eae-82c6-8dceae8f97a7@arm.com/
> 

Yes, that works.

Thanks, and sorry for the noise.

Guenter


