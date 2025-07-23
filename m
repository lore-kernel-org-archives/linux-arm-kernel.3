Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FEFC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oLVQ+wEF7L0i9K+mBIHWmF3qtu8o6QfrkYubSnBjN0=; b=bwL1ZHmQZzBQvHp+rW559zwxQo
	aVceZaCXvMgcrvZ80ZzSQ074vZ2d7qVZXlVeNgc8mJ8cbsX4+dG4U7mE6UvOQvh89Vu2RAdfGy6dI
	7v6Z4QIGBuBX7OfOUZWsqd25XyZzURtz7uMfZn37UBD2pDCg1Tu43GSeIAtCKyxI5SZyHlk7g7iWJ
	NL6SUzDd4oDyxsCdUgdtJGHvkX1+xCbBmEW2DdUVik+6T6QRpLUgibM0bmC39TSAjX81EMkpxrUZe
	RFp7d9OrCQXxtEZ5qrUObFcfjpf9ZrN0QAYmrPydJz2r60Z3xgOanyrQGRjOcdFP6hfmCkT6lJFK0
	br0P7KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecOS-00000005VRM-2z42;
	Wed, 23 Jul 2025 16:32:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uecM1-00000005VBP-0x9y;
	Wed, 23 Jul 2025 16:30:06 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so129067a12.1;
        Wed, 23 Jul 2025 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753288204; x=1753893004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oLVQ+wEF7L0i9K+mBIHWmF3qtu8o6QfrkYubSnBjN0=;
        b=i1FDjT5CKzGiK9VlqxB9F6iR8vWFLT97xMaFjUJ3bb1UBEHK5BcMFt65XjMvNRHBFK
         yOgWPn6ivSxRrIbGu+nDhoPJSWwtOWPf/ZrxIU5e6i4n23y6nKPtsX7xC4FXHBjbfMmj
         hDT5cTE35MGhwNFnuA94JhQisSJ4nhj26xvn730reX3fIfkkml8kg6zZ0KAEFV5H/9kn
         duX7UQuIh8Uc4a7zIzOgNNnH08HC8/fG+YGIkBQ5UZHakkxi+vyA6SGpSBJT8Pylscd2
         47xFy52gosW6qQyjIWzcwRLYtjW8xk4Z2CsXl6gzcg9+wUjBOkM/WnXfxfOx5MKVGgMG
         T5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753288204; x=1753893004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oLVQ+wEF7L0i9K+mBIHWmF3qtu8o6QfrkYubSnBjN0=;
        b=ZC/4MtHQ80UEal4Une3IXbZlBjFwXvuKTcvVVL/mytmYeNMQ3h19bhWDGPMkILXdWk
         y74b+mOcO27+4XPEL0Qy8j8Csg0+JeEJNQ+RxUxz9xmNIkrb/CSFT92a9JvoWC9MOsjM
         MjCfvRvPu1JBLH5aa0rtsqItkQXpJPtfulsXxGDfzulFcZFiWBXHSuy62sRxbq/S6hIa
         OarLGuuGi2Y8CBJkxZyCA/4BIHVPdUoh/7Lm2ACc2fH9S2EJDt6+4uRC1PBg0ymLVKkP
         HDhrKCOvDjS4hx42Bdurf8gBuo2Ef0AFDm0E3CdYBrNOIJi6aD25JGwXmqWUQgK4S6hg
         ehZg==
X-Forwarded-Encrypted: i=1; AJvYcCVOTbgVo67Xa23HtSSqP6MRHtsRrywqMiuHZwm1KzqSIvHQY/zZh+nqnlBWobxLRrWvvvKWt9nVoDbRy8sbDQlVzg==@lists.infradead.org, AJvYcCVbfc7rVB4kMDMtsM/RD1okfxDAKuJz14JEqwSpvYd5IUL71ABGw/FTUc76pbBxLTgP4CzKxU1YRAwJHhXq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2PFEhSj9+y1wPyWsUyq9EUQpqgfZd4NuXgPtJWvk91NQ6RmjX
	6ym2hIntrScLCMZbQ8XzNJ1CHKRKBJbD6y5KvmeYol++58JSpGVStIUvUAMZ+R+GnWY=
X-Gm-Gg: ASbGnctd/FNerYcgWtcbeBCgNuPTQsiPXfuT3uPmgLN9o4/r4j/KrS7z7QqKyyXDlvb
	61HsQqzIR9uJ7HTM9siP1BSkM/kvKcBssiCv8v056NIGe4PYuKYsN4NPaXu2pjtM0Gja/XMyhL0
	9t5A5r2cpKmmh15BvwEB9fxHPPUGh+x0N1wKJTYls6x6c9M6cTMXuufIJj0h4hz1sBQTWcfkVHr
	qi1byoLYaxftncdVPJEvwVBucuV+OAFY83XmFhSgRBTPKZ6FZ6tXlnaSIBv5+rR+pslyHZSD0rf
	Zu15Y02zbi82kppl2ovIMxjaudVN2w4scgyU6bFOHqeBK9KcumD1rc5/PqAoJXKBL2na84kiV8f
	WY6CPhWD+GhK7ExSoKW9uO2dhbItUJHLx7amGojU=
X-Google-Smtp-Source: AGHT+IE8R/cLesETtxNTKi6GADIN03ysXQ0xFDkmBNduvgzLi3IKVKIBX5o6E4+QQ7bIBNKgOSkiiw==
X-Received: by 2002:a17:90b:3f8d:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-31e507cdcebmr5060289a91.25.1753288204285;
        Wed, 23 Jul 2025 09:30:04 -0700 (PDT)
Received: from [192.168.1.143] ([49.207.192.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519b11d1sm2037415a91.5.2025.07.23.09.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 09:30:03 -0700 (PDT)
Message-ID: <8e5e1d09-0706-42b3-8ae1-00a0e2f5139a@gmail.com>
Date: Wed, 23 Jul 2025 21:59:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML
 docs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ribalda@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com
References: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
 <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com>
Content-Language: en-US
From: Sanjay Suthar <sanjaysuthar661996@gmail.com>
In-Reply-To: <CAFBinCCmsw=XGPtrk1XbphOu=OwhxmAiZ+2h4x_M-_f64Vo-7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_093005_268246_3F6ECD40 
X-CRM114-Status: GOOD (  13.05  )
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

On 23/07/25 01:08, Martin Blumenstingl wrote:

> On Tue, Jul 22, 2025 at 7:06 PM Sanjay Suthar
> <sanjaysuthar661996@gmail.com> wrote:
>> Fix minor grammatical issues by removing duplicated "is" in two devicetree
>> binding documents:
>>
>> - net/amlogic,meson-dwmac.yaml
>> - iio/dac/ti,dac7612.yaml
>>
>> Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thank you for spotting and fixing this!
>
> To my knowledge nobody else is currently working on amlogic,meson-dwmac changes.
> Meaning: with an ACK from the netdev or iio maintainers this patch can
> go through any tree (iio, netdev, devicetree).
>
>
> Best regards,
> Martin

Thanks for reviewing the patch. So you mentioned, now the patch can go 
through any of above mentioned tree, Is there any Action item left on my 
end related to this patch? Also will I be notified about when the patch 
will be approved and merged by the respective owner?

Best regards,

Sanjay Suthar


