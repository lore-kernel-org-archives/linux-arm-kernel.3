Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C6BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Kw4a2cbpYi6EVcibNkVqQEvI9GFueOoA0ipAsI1iyI=; b=lhlhy6Q4UgU+nuFabeEHz6YQ9Q
	A9UmlOWAU2uto+x3tDKakZh5bkgDABsucNTyDBUrKtRQ3C9b76+mFmjkienmz1+R5ArOfydN7pnQX
	FSOSFaVtVoWmtT0eCWLfmxBLoe2lM+NEmOdaS/8NTKJYDFcUu+QguOrKm/bo0Ip4G9vV9SX/io25d
	YoM3dUmGRRVG/nQ7eY18SOjF5qhg2veBwABbO/LmkUk2rG//CO11mVEJ6teBFTZkXJtWvblfiITrS
	zfE4wwgKi+7xXYrj97AaLEdpNw7/0bb22P71tLkNTg82VPRIn1Obk+VUh35mF5ZrnurkLc2Zdap4p
	Yc8s63UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8i3H-0000000H0b8-2qsQ;
	Tue, 14 Oct 2025 16:39:07 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8i3F-0000000H0aU-0SBu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 16:39:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3304a57d842so4461382a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760459944; x=1761064744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+Kw4a2cbpYi6EVcibNkVqQEvI9GFueOoA0ipAsI1iyI=;
        b=hnb/DKW77RYEPuck38kErOxlOjeIx8iM3mtRUb/6b8xUccncUl4zsxiU/+1we58M38
         ne4UqA+JiQ921GrmyLSTQlUJ9Tj0x8ELla0V7RagEl8t5P9D0eyikP6v+Uv+jWsWfDX3
         LnuJvlxm8lOH95ZdOP8FJo3h1BCcLdXzcuIEFBo3XvDvLoMZ0OxkeAiGL+TxYbvJdFcy
         IA2q79/Gq5e4H57gWC3F4LiajZnAToO4vC+Js4BPq+61ZS+YO+Yuy7acHEMga0j0/KmR
         7MoWPaDaIwx0hz/qoSjA2boAyxTr8U9PIXbeQodh1aJVnpRXIgyneSk+MbygrU3MKh35
         f79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760459944; x=1761064744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Kw4a2cbpYi6EVcibNkVqQEvI9GFueOoA0ipAsI1iyI=;
        b=QKHuNdPy5zGoXg3QJrxXkNdhwRfQ7haPbOqdKLu+yUhBk1/uQGr/XUjQxaRvat3cnX
         QK78U0bkWNpWnLJJijFuFUMCAGgmeJVrZWxd1p5H6x7zogl7SKGkeWXNlr4gW5aGf5io
         F/B2EzvNyCDJ3kWUZp4Vuq3cojL1Sm5BQs/1YYLh6oVUNh8glR8+CbjdjAG276++QTUz
         HjwRd7pKdFluT3eQkYaz5obzZmyL7bVGwv9wGfkYHbOOKuCZ3FOA4SB5Y5c3h/BtF3Mg
         3f0vLKl7wHH4gcn9mgnQ1bzDSDfDxVyBnK8w/h+GgzDIlSs2WwcVcr4C0bS6gdScLSaA
         aC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwtwe8K4Zf9r25HbsMfFwWkWw+ritt2ygGDipr9qTpPrvjwnPbQCOPje3AMTPMDBDavL1oEip49iIkB/Uzwwj2@lists.infradead.org
X-Gm-Message-State: AOJu0YwEB+9x1cZ6MoXY8GjNYDWdWnIhUeyDwrEW7NDdHodXoWyEenI+
	uUA86QaxM6TbXihopF48Rw9SWnQfMTDGKIBdrwSEYkemkZD4ZEK0NVTZ
X-Gm-Gg: ASbGnct4eDrPftV3Zw5AinUXqOGQZ5RjFcp3MOh67/SPJg563NGxUSmv22qiQhE5qKy
	n3RUeq8FqyXT86fNR1oXZyYJQh9sZngsquAwF4foDLMIEkkbJ2nuKzcnRRL7G8wijIJnUIrrA6x
	LlPX0VrgIi+/fmAkFKRHZPernQgOCObqV3wrgpjkQ1er0Cld2dKYe2A/siCHTTwGeeM0BVfdtaz
	UgvpNPEIFFcPXZg993FN7vuyFzxHNi/nJDYD23kZkLg+Hb/qSpHNCuSQwGgy+xpM989Tsa3RYEY
	LOoxAdGMnmG8yJWhsfSumFxMsF1Z/hNoI2eDLsjTSTzo7T19GqrdDaod5dhWsBf88olGltuQYsC
	20YI28H76d3MKiqPu2Bsyshseo+Tz2NzNmVbly/ajGsPziLq5tznSzRf1Epe3VuPUvVjhVq2VMm
	QlL681zVx7i4Gb0Q==
X-Google-Smtp-Source: AGHT+IE7dkO7t7zYTrn/rcvOU6CyaOeoWX3R6oaYLqTk74O3/dlsNAXvmuhzWnV7MaYaIVUdZmkXFg==
X-Received: by 2002:a17:90b:3d12:b0:33b:6612:67e1 with SMTP id 98e67ed59e1d1-33b661271aemr20674579a91.29.1760459944049;
        Tue, 14 Oct 2025 09:39:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df6a95esm12321716a12.36.2025.10.14.09.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:39:03 -0700 (PDT)
Message-ID: <7197bfc7-fef6-40b2-b3f3-182e9428dc12@roeck-us.net>
Date: Tue, 14 Oct 2025 09:39:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tao Ren <rentao.bupt@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tao Ren <taoren@meta.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net> <aO2kLyxGlGt12sKD@fedora>
 <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
 <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
 <f801a4cb-3d27-439c-82f2-d5ee5aa0d810@lunn.ch>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f801a4cb-3d27-439c-82f2-d5ee5aa0d810@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_093905_183648_DAC8148A 
X-CRM114-Status: GOOD (  17.04  )
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

On 10/14/25 08:11, Andrew Lunn wrote:
>>> If it is already in mainline, i don't care too much if it is wrong. We
>>> don't want to cause regressions.
>>>
>>> I only object when adding new nodes which are wrong. If we keep adding
>>> broken nodes, there is no incentive to fix the broken driver to do the
>>
>> This wasn't adding an allegedly (sorry, it worked for me) broken node,
>> it was removing one that worked for me all along. Obviously I do not know
>> if it worked (or if it is even used) on real hardware, but it worked for
>> the fuji-bmc qemu emulation.
> 
> It probably does work on real hardware, because it is one of those
> "two wrongs makes a right" cases. So i see this as a regression. The
> node should not be removed. It should hopefully get corrected sometime
> in the future when somebody actually fixes the aspeed driver, and
> fixes both wrongs.

So you are trying to force the issue by disabling the Ethernet interface
on fuji-bmc until the problem in the driver (whatever it is) has been fixed ?
That just seems odd.

Never mind, this is not my hardware. I just used it for testing, after all.
Again, I already dropped network interface testing on that emulation,
so for me the issue is closed.

Guenter


