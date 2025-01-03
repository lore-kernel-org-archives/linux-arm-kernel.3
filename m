Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD5CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prlV2TvU5zVcPEfYRIyZX18nmF/95tzaSDwvnloLIJU=; b=ySkQTxg2KUFWptERxg1zz2SZqm
	qn5Uyn2ObVbcjihWfrDTJcmcyk/5TdtB9eB/ITfVtJumVK3urQ0S7VJRCKx0Ars0q/oQazyl6QDfa
	d2+y8CZz1RiilhdZ1KHijrngvKLGNnhOknwkAH7B8hmuf7WL4PG6OaAa1qqXB4FY8bP33VoPFtQrK
	7HsPEPTpt3nhcM9SDIxURUNVKBhBXQlS6bLgfSRXEP3bY4DuLvuG20QBhg3/fp5lpooARkdqzxFrw
	eesiw82NYLDWvckihuGAOI5qSIGJaIB+MmEg0unU3+nS4ZvM07YyjcvJK/qzhQbaqeLqd6h7R+X3y
	e6Ge5D+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeSE-0000000Cful-0oDo;
	Fri, 03 Jan 2025 09:58:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeR0-0000000Cfpc-3Xeq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 09:57:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa68b513abcso2249491466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 01:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735898257; x=1736503057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prlV2TvU5zVcPEfYRIyZX18nmF/95tzaSDwvnloLIJU=;
        b=XNevvg5nZlpVmfm5F9j4ejCgvJl1PoE5jdV15Vt0ibX6p9lx1uS3zdQu5NpSqEfhKm
         M/mfAUrVfQuoXDLBdAIKNCCmIl4I1V6Cuf4AhtXXsCmiVudQkApx40+mQaeQ2pL9BWGD
         ShbQ/9y6qvFCy6feJVlhu06it3gIvA0xsOKA2sHZsjuZkSyDyqvXHsHO811G7dX3UVes
         0JU+6UIa0U1/vuZbPfWH9h16rt3ApGoKQFBm9arkCozZl4PJ2aEIuW4rpAaRAtl0FphE
         fxCWjw/7NbJqocowyM6rakd52SY8tduejKHioTu1A9g9JE01csyuPzBjxlaZddwNPQAL
         jGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735898257; x=1736503057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prlV2TvU5zVcPEfYRIyZX18nmF/95tzaSDwvnloLIJU=;
        b=BNuaXWRPW4SAxt0NpBKubpmaG8zPTbp5w4bEmHgS4sj9Yjx4YUnrC5zWhGm8/lyFvk
         utCMIRtPkzBJ3n7gqA2MqeO/dULpbwR3vZ4+1PMYcebUmA5hN6+rsWIUOLSIYriU71x3
         s40G0kjMJ8LwxiZ6w+4lMAZFcxepzH4OI/hwC5q1/mxd41tOWgUk7Vcb+KDw2ZFJ3eLH
         fQqQRI4UrueiKm/H7McMTsTungJgYf6HrsQ22GqJs4ywxOkp5/REsNJV7mtyttHUBdbx
         tt9kQfKEnwHCd932CDyuWhv7annH9yxbCcI7RXwA0aVD3PcpxmtHaTV1Q6KqnrEp024L
         1Zag==
X-Forwarded-Encrypted: i=1; AJvYcCXdA+Vn1j1hCg7dV6AnSBHgwva8A65byJqYYTCk0ZBF3nt6lo3kIJxhifJ/sqzht28pxzjahhYxF0t4nm0DLyWA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8NE1to0l/aTJVCQi7mTjoinIQaVPc+MapeQZJm7PU9/YK1qte
	8PdneMtbL6VGXiID+H95z8eRfomln/mHA7hUarVQpbPYh0RbB0aaS3Xf9sWIln0=
X-Gm-Gg: ASbGncuoxu+49W1y7/qG08l8RqgthVzEj2V52Qke5VsGtVYgp7eUxhU1O+Gq+d9HJpo
	RSp96SpXhj5DFW17jC+ImuiZ3H0/VcR1Mo8sp4vG52TMKBB0e7tmryzJ/WDv7ZFsBwNWKNhRVkx
	HB8eGNOgfF83Q9GV3qD35PfG1YqMZJ/eWg90JVzgrwXqhQoPZIyjhiZr4Lm4+obeQwTc+i+eHdL
	WrdAqE2aoVmzjk/DhZDm5i+6jrH5W2DE71JTGOph2GRfmjbUMpdbNZy29kxeYZr
X-Google-Smtp-Source: AGHT+IGyDXQ+HgPYFHz8VW5+Bs9O2MzkymXRY5w2NBWYv3oVRbFZjUuoY+qPPaOXbWoe+EmxsTm/0Q==
X-Received: by 2002:a17:907:704:b0:aac:23db:af61 with SMTP id a640c23a62f3a-aac2874937fmr4797144466b.3.1735898256883;
        Fri, 03 Jan 2025 01:57:36 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae432bsm1877719766b.88.2025.01.03.01.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:57:36 -0800 (PST)
Message-ID: <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
Date: Fri, 3 Jan 2025 09:57:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
 <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
 <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_015738_905126_7CEC6D2D 
X-CRM114-Status: GOOD (  16.08  )
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

On 1/3/25 3:39 AM, Jassi Brar wrote:
>>> Looking at v6, I prefer this version... maybe modify it a bit.
>>
>> Just to summarize for the readers, in the end I chose for the
>> controllers to allow #mbox-cells = <0>; and for the clients to still use
>> the mboxes property, but just to reference the phandle to the controller:
>>         mboxes = <&ap2apm_mailbox>;
>>
> This was already supported, see drivers/mailbox/bcm2835-mailbox.c for example.

Thanks for the pointer. I was referring to the bindings patch:
https://lore.kernel.org/linux-arm-kernel/20241220-acpm-v4-upstream-mbox-v6-1-a6942806e52a@linaro.org/
> 
>> Then I updated the mailbox core to allow clients to request channels by
>> passing some args containing channel identifiers to the controllers,
>> that the controllers xlate() using their own method.
>>
> This is unnecessary.
> If you don't pass the doorbell number from DT, each channel populated
> by the driver is just a s/w construct or a 'virtual' channel. Make use
> of 'void *data'  in send_data() to specify the doorbell.
> 

I think this introduces concurrency problems if the channel identifiers
passed by 'void *data' don't match the virtual channel used for sending
the messages. Do we want to allow this?

Also, if we use 'void *data' to pass channel identifiers, the channel
checks will have to be made at send_data() time. Thus if passing wrong
channel type for example, the mailbox client will eventually get a
-ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
misleading.

Thanks,
ta

