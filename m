Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F13CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRJlnjgoFe7mDl6//dS8Gjps/w53SHPBrqnYZwHQd9U=; b=eESPgPsaDE/hdtCrsTT7azNnkF
	J9Gh5bkcdOE5RlgwcT2WZkDQs79CIjgwOWWPFDFZLQdNh1bfz49SU5fXhWsM2blpV89LyBw21+tPw
	vsFU2VimtQsRJQbLuCwACWtPZsfnoNkpkTKSmTwac9q5ceKfNoC0VYB+nSZqjIrkMUWoiSiiAN9fm
	qoQzSsUga5HmCcaQkSnF48lilmlbxcWgXaWpSwOQFp/qii2I85s0UEna4XuN6AZ3nHeISRgv/VAG2
	YlouECGhTYsHnN2P3SO2hoEei5e8IdTs9PDOFqTD4RGAqxPi2r+bgiAtw/z+wiN2H2XRpm6PysJbI
	CPyMPcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTQU-0000000ECDZ-0xFv;
	Mon, 11 May 2026 16:24:14 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTQQ-0000000ECCt-3sWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:24:13 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-479d37e7d7fso1484332b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778516649; x=1779121449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRJlnjgoFe7mDl6//dS8Gjps/w53SHPBrqnYZwHQd9U=;
        b=RcY27gcIlbLXMFJ9q137JQAiSqjWZ5NdOIqkSPboxXY10DEsovDxnz3aTM3eUIiyqZ
         m1rt7tskA+sOjmHrWkt3JARM4wQuhAwAiQMuabH0K0TApWZC8Ta6QM6UNUCZZg3fYZLq
         D+NheJRg9bJPXvKSQAbANVbip2wftkCBkSGdkQdZ+0DZX+eHDixIr7/+xCMvb9h+frFI
         nhjD3uzbx/9BUgx/ct/t6FFRzSOyG3AsgxRb4naC7qXEHHJpecVosMWh/IIB9sVfD3PO
         KUMnq41Hn7+9u6WeIl9jyW8bZ8J3XpqS/0IH6RFZbPoFYX5cg9+bdKw3m2SM1zE544Mo
         IkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516649; x=1779121449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRJlnjgoFe7mDl6//dS8Gjps/w53SHPBrqnYZwHQd9U=;
        b=E43En74SiWKwa8Ol2NY9TvnDwyrpQtnKt72TO/wejdkv8CuQfyGQnmm0vP2jkJ2VBo
         Wzsl7ttfACHKf/yPeuZgRTDjri/4e7ES4GocceLUPgzrswm557joey1ESHsBKAQEEa28
         34oYejhh7IHj5sx1DiCyyPtP7Vqn0tkmkYpJMFfx8DedokNHb8Becba68g4s3DogOD8n
         LMByvrcS+WLX0GTkLK/SpUKx2xg7dXIzeQ7PcvHLpsYYZwKGE3BlEg8ytXPunSN01Kl/
         hno5Vng1IBvDIvWzvlhTNTfI91PHZ0MJAoCqMlhRMv86FL030Tga2IVvFgE0wXshmFiw
         k1oA==
X-Forwarded-Encrypted: i=1; AFNElJ+9aaUF5VJgmOR5nCribzQX8qOMu9wuVqNV9zyF3mRP9yxiOzqMPI1Lir1Q6z6v+2hWGMgldJUKGH3qmUVRlYM5@lists.infradead.org
X-Gm-Message-State: AOJu0YyJNSCP3/5vpKlB7STGFivpPvGekB92j69I57FFV7kbI+rX8Y4k
	yb3rIc89+tXbWrtWDPonPIAuaf88qpAr7FyCiJdq0x4S1+nmnxjeMNJzN0m7iGZbT18=
X-Gm-Gg: Acq92OFBgFE/LzX92iFFarNOJMP1UZhZL4vOw4sBFQErk+eDMY6885xxh7cg+pGXBfH
	lwY41tfk4redGamtq2YayqmBFD8drZBtZK+dKwYAMNelxmAz1UQhI2mzj7jtFBvHVTG//FuKKdp
	3+aSZsW/0UtxE56fwAoOkRfJIA8EHrZ7nPKqRfxZItShlUYhIx8CHbCzj2OLAhSurbltrhSbV2Y
	oejIBOTNYm+GTyb2pdPn7N6ktlaOjAzEV1F30o/NorEkdsY+oQ6ty3HsQ7BvYk/QDqDW3i3yt7L
	0ZWvfOQyV6EQzEvOArbDnFCXQxB8bMEfZ5L4UBDhdQz8ei3S5MAjkmaf5oZe9YKLeOkaSemghR3
	kSjhfwcEoI6pBMcHrwWh8+XWczIaHIS5fJuDcLIJHNmK10yJGB8gMgQHKXo+b9dQpEG1uB9nfsm
	VcNgcQWZsU+o+AN1KKPKZu6vQQKD9Gk5saDunor6jaRBIOvo4qRUntP9IawmZ+oc5rKd8Y7/w=
X-Received: by 2002:a05:6808:e656:b0:467:2a6e:adad with SMTP id 5614622812f47-4804220b8b9mr10538869b6e.11.1778516648981;
        Mon, 11 May 2026 09:24:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:591:4577:3439:3a1e? ([2600:8803:e7e4:500:591:4577:3439:3a1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367c04e66sm7104662a34.8.2026.05.11.09.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:24:08 -0700 (PDT)
Message-ID: <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
Date: Mon, 11 May 2026 11:24:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: Jonathan Cameron <jic23@kernel.org>,
 Pramod Maurya <pramod.nexgen@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com>
 <20260511171554.6541042b@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260511171554.6541042b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_092411_003373_C16E88E9 
X-CRM114-Status: GOOD (  14.06  )
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

On 5/11/26 11:15 AM, Jonathan Cameron wrote:
> On Sun, 10 May 2026 08:01:36 -0400
> Pramod Maurya <pramod.nexgen@gmail.com> wrote:
> 
>> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
>> from the legacy plain-text format to a YAML schema, enabling automated
>> validation with dt-schema.
>>
>> The new binding covers the same hardware and compatible strings:
>>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
>>
>> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> Hi Pramod,
> 
> Something went wrong with your sending of v3. I have two versions sent
> half a day apart and no idea how they are related.
> 
> Anyhow one of them got feedback from Rob's bot so I'll assume we are
> getting a v4 and wait for that.
> 
> Jonathan

I think Rob will have to fix the bot to make an exception for the
legacy bindings. This should have been called out in the commit message
as requested in a previous revision.

https://lore.kernel.org/linux-iio/20260220053941.611415-6-sai.krishna.potthuri@amd.com/


