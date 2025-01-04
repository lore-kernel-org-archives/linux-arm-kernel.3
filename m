Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99XGlWA8sYUvn+NZcnWiPdOjfGCgXUnJjJ+Ku/Ii050=; b=JEpoeRKLI5gw8JoJaApBcdNEnS
	psAiQf49enmFOC2JtedrJ3m02/Q/eNUNxWCoJU40kmj7cZD9NeZC+jAZoFqPYgSqU3sMQxY5C7nTs
	a2Xic31cMMU6iuPjq3yHZVMSyQKo+ZVU9PNC3xIvqy9IeLQLq4zCFn2MekZHp5JzNvGI5AfezWZ1A
	v5nmcrMKpCSTrNpO3a/hkJ3RxR0sdBnwGohWHiernw939Es2bLtwZ2bk9RuqQoKZD8fWfrHQeFfwE
	i5sx2RtzSlwuRfp6bBgMUR9SeJltFoHOqSAdeZhpvTYOzyu5mZSc/SA259ZEEXHz53mBl14elfHuJ
	dtpZDTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0Ya-0000000Enda-0DwU;
	Sat, 04 Jan 2025 09:34:56 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU0XP-0000000EnVT-0GlP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 09:33:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso3389623a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735983221; x=1736588021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99XGlWA8sYUvn+NZcnWiPdOjfGCgXUnJjJ+Ku/Ii050=;
        b=AbT/Jb+N55bkRaIBSJ5H8e2n1tlupK4x2Ph7bwAe50EacMRLWL708RuiG4ppvmZkLJ
         pa1yZHJdmGDoP80L5/HGBX0wi4lv5S27V3X7/1IG80r1psYS9m/7TlBmDPz7xQzOv+9b
         NSwa9MnFDSyJ0mcYSp6f2RahSxoWC8Z2CWgvSbmYUx3i4PW6XMFoxXa++Mgfc2Y5ZQcZ
         JnY5VlRIXEHqF7aKVbc7Keuuf9qcF9i9SBAoqNWC8jjcODBg0rwFqvnAiYYL+hdCYQNK
         dnsK7I/z4XyTSvsiGAIw3IYJFWOYmMs0XdSemABg6uqOm0zX2SAKrEjYIeEKCzEHC4rs
         j8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735983221; x=1736588021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99XGlWA8sYUvn+NZcnWiPdOjfGCgXUnJjJ+Ku/Ii050=;
        b=GIlPHv1c3p3wMlcJ/kEue6cHPeyviYN0ngmfz9dxGKXaiDBIRFQJOBfvisLGSpJnMo
         poUb6eNBscD9pzyhVHGmJNyk5gEaRGiCPLstfvomPvmaPwnzDLct+vr+TqyZwhC4j8EM
         DaNzQa8r+6igt78S/JfM/6Voe6uw163+yANveHIWcE/BqWPdHKXi8nszXDixrr1b5ovo
         mJBmslZOOsbd+F+YkR/qCo+Uqw7VOuaF9pKrZw/QAhye+7DX1hgTtnKdJO8af/qvfLFz
         igNL0bWG2p8eaF7fPY7ej1XYeuL3lwUaiJ4gIEldNiVwFo+qT2EqjsY1DHKa+hAQtD6n
         Q9LA==
X-Forwarded-Encrypted: i=1; AJvYcCWdtjfTzfWOoFkPPAU0QxqwrZ1CqfJH8L1MHm4KrzaOIYwfzkfmOEUYdOYmYZAwimEK8tr/W6/wZi9AdzMyiPO8@lists.infradead.org
X-Gm-Message-State: AOJu0YxbRCwpunXZBswn1P6srzXS4HZiALix0zO22LuEfKYSQL45bV41
	UVpfJehvttmE7DALQJcOu/PMjGGvGAPMSxQiwrMswVzrKJwfzd02
X-Gm-Gg: ASbGncuzfhpB+SIXXKxZxhy5gfkzFb9Q/Wb6F5lt4QfKmd4HXsB+jzkyT+Q0g6sw8Rd
	IjpEBtXCcYPnHicWuvNQYX7grLSkO4eEG4tdbA1Iwfn9+fAq+aKMq1AylFgUa4hRk2fxDSJLQy7
	IkEiheQgw6/WQX9bs5MLUq0CHsJSMjCjApxzGfry+Yhq33isHO4xTM+TYXc2z/KgpA+Ddbg5LJb
	vofNJjj5nGR692RBJc5N9leK8p1EsKt2qTDWM1hZPgKfMLK2kP3g49iJjUnuo60qyfE
X-Google-Smtp-Source: AGHT+IGX0/IFZOKoUPpoqkbpi9w6cuTkdVo0i6Iyxp8Ed0KKnV+HFLaUTSEipHiUzf+2RWIqJN22GQ==
X-Received: by 2002:a17:907:868c:b0:aac:29a:2817 with SMTP id a640c23a62f3a-aac2ba3f550mr3655918566b.26.1735983220534;
        Sat, 04 Jan 2025 01:33:40 -0800 (PST)
Received: from [192.168.0.3] ([151.251.251.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f621sm1986086266b.40.2025.01.04.01.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 01:33:40 -0800 (PST)
Message-ID: <489b8c8f-b817-4ecd-87db-99499ae24288@gmail.com>
Date: Sat, 4 Jan 2025 11:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
 <bzjuy4idp2o2cgms3zaftrxxz2rg2adhv6gneedrxjpxswgznn@wycin7xdlddz>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <bzjuy4idp2o2cgms3zaftrxxz2rg2adhv6gneedrxjpxswgznn@wycin7xdlddz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_013343_111133_EC7B084F 
X-CRM114-Status: GOOD (  21.59  )
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

On 1/3/25 10:21, Krzysztof Kozlowski wrote:
> On Thu, Jan 02, 2025 at 10:40:14PM +0200, Ivaylo Ivanov wrote:
>> Add constants for choosing USIv1 configuration mode in device tree.
>> Those are further used in the USI driver to figure out which value to
>> write into SW_CONF register. Modify the current USI IP-core
>> bindings to include information about USIv1 and a compatible for
>> exynos8895.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../bindings/soc/samsung/exynos-usi.yaml      | 22 ++++++++++++++-----
>>  include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++++++
>>  2 files changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> index f80fcbc31..50db63a8a 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>> @@ -11,11 +11,21 @@ maintainers:
>>    - Krzysztof Kozlowski <krzk@kernel.org>
>>  
>>  description: |
>> -  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
>> -  USI shares almost all internal circuits within each protocol, so only one
>> -  protocol can be chosen at a time. USI is modeled as a node with zero or more
>> -  child nodes, each representing a serial sub-node device. The mode setting
>> -  selects which particular function will be used.
>> +  The USI IP-core provides configurable support for serial protocols, enabling
>> +  different serial communication modes depending on the version.
>> +
>> +  In USIv1, configurations are available to enable either one or two protocols
>> +  simultaneously in select combinations - High-Speed I2C0, High-Speed
>> +  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
>> +  I2C1 and UART.
>> +
>> +  In USIv2, only one protocol can be active at a time, either UART, SPI, or
>> +  High-Speed I2C.
>> +
>> +  The USI core shares internal circuits across protocols, meaning only the
>> +  selected configuration is active at any given time. USI is modeled as a node
>> +  with zero or more child nodes, each representing a serial sub-node device. The
>> +  mode setting selects which particular function will be used.
>>  
>>  properties:
>>    $nodename:
>> @@ -31,6 +41,7 @@ properties:
>>            - const: samsung,exynos850-usi
>>        - enum:
>>            - samsung,exynos850-usi
>> +          - samsung,exynos8895-usi
>>  
>>    reg:
>>      maxItems: 1
>> @@ -106,6 +117,7 @@ if:
>>        contains:
>>          enum:
>>            - samsung,exynos850-usi
>> +          - samsung,exynos8895-usi
>>  
>>  then:
>>    properties:
>> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
>> index a01af169d..5fbeb426b 100644
>> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
>> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
>> @@ -9,6 +9,14 @@
>>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>>  
>> +#define USI_V1_NONE		0
>> +#define USI_V1_I2C0		1
>> +#define USI_V1_I2C1		2
>> +#define USI_V1_I2C0_1		3
>> +#define USI_V1_SPI		4
>> +#define USI_V1_UART		5
>> +#define USI_V1_UART_I2C1	6
> Conflicting values with USI_v2. This is the same property and the same
> driver, so I expect the values to be unified.
>
> Rename (copy) USI_V2_ to USI_ and then just add yours at the end.

I see, that approach could work too. Although I'd much rather keep the definition
names the same as before for USI_V2.

Best regards,
Ivaylo

> Binding then in allOf:if:then should restrict with enum which values
> make sense for which model.
>
> Best regards,
> Krzysztof
>


