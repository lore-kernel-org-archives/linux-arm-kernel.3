Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B5D1BDEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL5KkaHYcHYSWz5JR4tNjnJI/ZRJgGAc7HAWIuIWV80=; b=OOsAg4AfEU43U1sZ7nVfciu0z9
	D1D3DdFl7p4O0V7WdZdF6/dnuDoC+ZG0eLQwN/188iG37z8toqjqoRu6mKTDXWTk0Wh6ZthRqYkNP
	YuhZtOTfoEU677VkjHm60k1+z/jMRDwggfaXikeTjPzQiNBBxdZMAtCZr6ImZPpoOXmdvU+KFlwQo
	4EGVyfCO2315OUB76gJN7dFmZzop3LQ9jbKOHtNYrbYuORKlgtZBMlxSLcLWkKVp5OD23VaGvbeX9
	G+i7Ikn5LHwIMXFgaRNCmidNhjWHt/OKUWmDfl3FQ7grIuLq3CUbEeGnRuM43qVoXux+OHWiTnIfw
	tX7DI+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t83a8-0000000F0n5-23YO;
	Mon, 04 Nov 2024 20:21:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t83YQ-0000000F0Tx-20yy;
	Mon, 04 Nov 2024 20:20:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so5301306a12.2;
        Mon, 04 Nov 2024 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730751600; x=1731356400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PL5KkaHYcHYSWz5JR4tNjnJI/ZRJgGAc7HAWIuIWV80=;
        b=MJBk26Y1JEN2eURDIHxRGxyYoSYL8G/Jo58vemV51Or7KAJiUoGUZpf6QedkK+OPMp
         Mj3oZO9Ri6oXfWd5Mo9KwjGADpqOiMyzUMakiKKMy5QjAujobBFpm3sNlTOKjtInOq3L
         oeF/FhOVtErflpZLNrS1lX5c6zOeLkVcJ2ldEUtZ2geS7guyOhHd4rzZFJs9JPRqdoeo
         znnUHtrVk2c+HVbZBR7bOuu4crQD/w5QZGY5bLva/EQqdjJ34mV2ZWXqA2wn3zMCY4Jg
         uYbsMUyyFCli9J4GNhwUQSlnBsSGcdPyQAfMI6gvqXix88YMliWXyzJi/AKXFNZbzpOm
         Gx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730751600; x=1731356400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL5KkaHYcHYSWz5JR4tNjnJI/ZRJgGAc7HAWIuIWV80=;
        b=r9Fq4JcvEViRWp8ZEwFu3XT6NHqPZgx6QbEj0rMc9ID8yTdGFPLbOZ/2LTJ3oeCgqB
         8r0Uqc0e1z7mXwDoZ9PrSb/hveLweVBcQS64lCOi8PAYDIUPvtWf3nbZJIoDaT6JkC5K
         NESpFvhRgaX1XnsR8ACr88GeG4F0L9MRrC3jwt9sGDEaRLVykN6gehBVFACu6l1xzOs3
         ZTNJLu6GIv/GLUlW80IoLb3zk8ClD2MtBTgo78v70WXoV2lTs0GojwSnDUiTkMNpqtc/
         K6Xj7gmKWeu7tzm8/Ap8f3w8JWM61HCszhGBcZNZImM0TzNdks9BL6PoLG+7nFUNWluM
         QWug==
X-Forwarded-Encrypted: i=1; AJvYcCXDgjN8FYweFmegpIbxIlFDD5jbC/TEjDH5k8CATbiAIeCEiFzoUfhKUkStYbkTfl47hTolNGB8jPm13Rsb@lists.infradead.org, AJvYcCXE7+kRNoLYUYXhdjIhG4850F6uFLEyrj4mWqJas0qq9HmK/TxBO09GyHWryPlSUsVNnaSMszTtidvZgB+aFta/Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFFMpMktPh3oiLe7YdZk7sqUvtELP+xSBRr9sF9raexofmvwKR
	0WG1Ul2ApkAVjOnA1AeDdCt81fH/YSH2X8B0rdN0G10mzQAwtuOy
X-Google-Smtp-Source: AGHT+IHXtRvhD5B7CEvemZJBPO8ju1v/PqOpVbjDT5dKTYG9+66K5/OIGPeiwGURsAWbNapVtBB1DQ==
X-Received: by 2002:a05:6402:2753:b0:5c9:62c3:e7fd with SMTP id 4fb4d7f45d1cf-5cbbf8b1d2emr28411216a12.16.1730751599818;
        Mon, 04 Nov 2024 12:19:59 -0800 (PST)
Received: from [192.168.1.102] (miroral.stz.ddns.bulsat.com. [91.139.249.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6ac08c9sm259291a12.42.2024.11.04.12.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 12:19:59 -0800 (PST)
Message-ID: <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com>
Date: Mon, 4 Nov 2024 22:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com>
 <20241104-lend-lark-ab46a268213a@spud>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241104-lend-lark-ab46a268213a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_122002_569191_F518FE2C 
X-CRM114-Status: GOOD (  11.18  )
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




On 11/4/24 21:03, Conor Dooley wrote:
> On Mon, Nov 04, 2024 at 05:31:08PM +0200, Ivaylo Ivanov wrote:
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> FWIW, you could drop these two if...

I see, although the point of this was to keep it the example as close
to the original usage in s900.dtsi as possible. Anyways, if a v2 is
needed, I can do that.

Thanks for the review!
Best regards, Ivo.

>
>> +        cmu: clock-controller@e0160000 {
>> +          compatible = "actions,s900-cmu";
>> +          reg = <0x0 0xe0160000 0x0 0x1000>;
> ...you dropped the 0x0s from here.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.


