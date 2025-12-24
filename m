Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24336E7544F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=; b=otXMEh73KYkvR7DiPmC0Apfsz3
	0c9vzkAOvRkCbJfbvwz+uR7MT9qUWhYbmPj/0/X3QxsXldEGRsABGU3GHPV4lbyjmdZQzMSy3fx0P
	nT9FA9mJwT+L4N1IYLaUYUJHB2ofMnqZFnjnL144JHtTS318iBDC1CaWQCyJ8fK9g7O4Q/G5PSqEI
	r5rcstgrROolwqpawsH9saXekYHRE7w+2Cr2UCHppRgs/SxSGuX9oA/MJEDms0jku+kX4ZR1R0ztY
	zqow7Ztth63Yf07a8HBT/5JhbnXlhLIrr/IgPfy+mVAbhWUBGvSY//Lji8cjo0pN0ccJ/1smuQ2jY
	7qAgEAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUD4-0000000HL0O-25uW;
	Wed, 24 Dec 2025 19:07:46 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUD1-0000000HKzv-3f7K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:07:45 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-64472ea7d18so4143617d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766603261; x=1767208061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=;
        b=GTdjRPh6xBGkSlQ7+CfVgy6P6p7+rU/e1qxzJlDRop20VlhbcVacbs150Rg1azx8d+
         h+C4CSJqrnCrSf2xupJl8VKNVQkRGUf0LCHSWRX+K4pQqTzIBk1RLlCQ9DIaIAxkF4h+
         krOBZQ1kJfkatdApX6sVQsI53Ziefn5tOOg1MW8rJGyqMKH8AGR/eVN9NUGPDlBvStYz
         T9ZvNQjXEgwKyt4uvhY4xtQTztLH9ruhLLRcEVJymT0+h9CrUGvZggk8rIUVz+pG7yRd
         MyDIShIjmgDEvVSnzYfur8tZ4vb8u/kh4Uzqfz8UNwq3AZMUmJYDPdq4t1P343Kxv1UD
         HEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766603261; x=1767208061;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzIVnDZpOLjchy2wgbEcpJaoavN6zFZmqhSGhoRwcq0=;
        b=VKQQWcavTL9hQE+zZ+jvUqe6P8UEO9FW4zxoSLFCYnhyXZtWiUHZ3q9yNc+CpuZeNv
         D3ZotxQi4XnhJSjvehOkRUxoh21okRyN/anyGdWAsw4GajBdSa/43bxjj3uQ65zN10Zp
         V3hlxXKUYnF3tslLe+/v230iITG7HDrCDxAyTB42KVMBNLAchd/sz2ddhX2CyLT/z7gB
         c24GliEdUtj+jUrWTynq5MwM47gP693QI8IyLQWowebrV+Jt4YZbzdruZ93Qbvqztpo4
         1qUJx3Ol4ER0qQoQrb/LHCGkLv10dZqFdFpRw6YCeOWoy2DIwGpdsRX0Rk5d9akP6PUb
         RFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWzNLHo3cRsQuRVAgptBo+yq0y4NsVJCMrF72COey19uwC0DWkw9Ldz4QOjIQvFIH4Ih3KpiKPy6QpmJY39nnFo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3HYkMHLwMbiSwih3azl7HhLGjgZ4pL9dn/Uim2PtgpAcdCSft
	Z6KTETkqk1VN0MW4t+y7Qtb9kdT6TRpeg2TbqJJcHm0pyKF68iJ7abOtaFE/BwWb9w==
X-Gm-Gg: AY/fxX7M5frf6bPpuizcXGOTs6BN6gYRx5U69nAlp07dJcn8C/bRCYtDOm2chf+caTD
	YyAFJS+tujSNuE/zFXD+NMHp8cr56mZZK97Ea0wxej9F2aMl80aldW26EsS/1PWgYd71SL3vI8U
	YQjDk2AAbo7uhTVsNC1E1hXcJd1rJINWVawsRierzn8sFb6Bpz4BuPNLYiOJ4bjC6ap6B+TJwYZ
	fp69ehOwaztNl3gHWWwCjPmaJxYSx44Q/45Z8lC/tuCPiwNQFRub1gSrwvwd1ik5yfOVqtOpIJ0
	ynyGhzxTca3karNiqoWvWAtGCguabLwgBaNwfj+2Pcp1MlWyIx4WX+byCmLR2zAKVPqFtpZ18TX
	SsdpY95kSPLgoSUOxJpu6H2bCA4jPh5Q70CK7jA8Ts/kinXOYN7nPIgnC8WfWUEYCPMn1VlBPms
	FGuSDEi+33d7k4zOBF/2cDCSpgvy8r7VfPJnS0FT5ClwjNgpKst8YPzJxsoeI=
X-Google-Smtp-Source: AGHT+IEY4Bkjt/yYbrhofiHe25t6FYtL51Cgg0/pcmheFBExP5e5Z7qmADlL5vL1uqS/fVBKeLgjpg==
X-Received: by 2002:a53:bdc5:0:b0:63f:2bc7:7074 with SMTP id 956f58d0204a3-6466a8aba62mr11525267d50.60.1766603261316;
        Wed, 24 Dec 2025 11:07:41 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:6872:f79a:c2ff:4f4f? ([2600:1700:4570:89a0:6872:f79a:c2ff:4f4f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a8b16e2sm8621687d50.2.2025.12.24.11.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 11:07:40 -0800 (PST)
Message-ID: <c3599851-6e19-4ed9-9ce7-703746b978e7@google.com>
Date: Wed, 24 Dec 2025 11:07:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: mfd: maxim,max77759: add charger
 child node
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251218-max77759-charger-v2-0-2b259980a686@google.com>
 <20251218-max77759-charger-v2-1-2b259980a686@google.com>
 <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <411802b6-517d-497e-bf7b-183e6e6d7a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_110743_943483_6D373FCD 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Krzysztof,

On 12/19/25 12:17 AM, Krzysztof Kozlowski wrote:
> On 18/12/2025 23:49, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> The Maxim MAX77759 MFD includes a charger function. Extend the max77759
>> binding to include the charger. Also, update the example to include
>> charger.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../devicetree/bindings/mfd/maxim,max77759.yaml    | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> index 525de9ab3c2b..1cffdf2e5776 100644
>> --- a/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
>> @@ -37,6 +37,30 @@ properties:
>>    nvmem-0:
>>      $ref: /schemas/nvmem/maxim,max77759-nvmem.yaml
>>  
>> +  charger:
>> +    type: object
>> +    description: This is a dual input switch mode battery charger for portable
>> +      applications. It supports wired and wireless charging and can operate in
>> +      buck and boost mode.
>> +
>
> I do not see any improvements, so same comment: this should be folded
> into the parent.

I misunderstood the folding comment for merging the charger binding into
mfd.


> Please read DTS 101 slides or writing bindings or any other talks...

This gives a lot more context. Thanks for the pointer. I also reviewed a
few recently merged mfd (with charger being a cell) patches as well.

I realize that you're asking me to remove the charger node and re-anchor
its properties to the pmic mfd device. I will update it in the next
revision.


BR,

Amit

>
> Best regards,
> Krzysztof

