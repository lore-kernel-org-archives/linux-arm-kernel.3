Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4BEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCdihjYQTCflyJxm6dwPDa7f9mrC1RNKPnkAQB9Cuvo=; b=OwEgxV8nX1FXeEQHYtdmYLwaV8
	wvmpq030L44kMMy9Isf6KtwJQU8YoTgwukEn6gzuJGc6T1cjceA0f+ms36mHLkOcWFWXFAr6vN8Bb
	1E7klZ1sFsCbPrA2eVIztefAfl14O+2Zg+sIUJdVr78oBrAONszdTDYnLbx4FHtREEHeizQY9jsQ9
	HQGZRzAHFkpr5mus4jZg+9N6JCJB6+qKi06MLUTQld6c0kKoNtHpZubhQUInJheXwdIYgBagS+U+J
	4Rvje3MR2xVnpnwed6eFOUHHAurLADDchMRsMnWSb5BMZuZMTY8qVfxZrOgUKm3pKkgQYk9qN4xTF
	mxxBsgog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0myG-0000000CfVt-2bOH;
	Fri, 04 Apr 2025 19:44:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mwR-0000000CfOM-2uo9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 19:43:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2260c915749so18444535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 12:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743795783; x=1744400583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCdihjYQTCflyJxm6dwPDa7f9mrC1RNKPnkAQB9Cuvo=;
        b=MHgVXUP7B33SuJNTy41qchuQCgdVrcCAzqXJaszofeDe6EO8fKLJdPDpVAXF6QWUsq
         7q2znuXHEfwAZy+7nb4MWCCth6Byb8RehlTtgELHhxVReH0S2lo0+6pSUjB1UggKZEJ0
         /oHDskw2Wyd9kE5lPMcYhNHWNNgwvVswLlCDVP7BM3bOr1TdPGSpJtFbj5/dzMckM4bx
         wl5rxHXWijuUrxNDcjidsZVsqZK7+y6eFT/GV5EovTtSx3sPRt3CW7EIFy3PEU1x94gX
         7yQsHq6oXeupIpUuCjfiNgZOe8wbMg40BdBHvOfLyIP1o2UKF3QwLSUi+qVUqKVpM53D
         OZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795783; x=1744400583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCdihjYQTCflyJxm6dwPDa7f9mrC1RNKPnkAQB9Cuvo=;
        b=Ov/vwoRC0mrZ1EPuFo6v8dM1zPHkzPUPccbgZCwTZny3gnRdh4hL9DxUS1r9ZMdgjO
         HtleDfMt5Qy0P9k7GtwhZkgHvbIABo9ZYolvN5239OEvS3YO4tY2UTfpQT+nCohd3Uog
         LP6PuxjFpFazqs6uCMROmpbSX1cpdNrZUD+Yn7vaFtXWJVagpcLaPaMEGfqHTXIm60Kt
         FK4ZUMqsYomSWTKyl7TdP+wZ/2FDr4gkKU33pFu6Ld85VmyZVhs5EKdZC4zPsqTaMOX3
         uqVmJPsY5lxkq6zTkyskw1Vn2VSzDjbsRekqCbayTmoWT/CE2HzYsNQOjsSoQuTnQ59e
         T8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVHpXCwVwmRJ9Ivq7t6lp773+7xMqMOwjLVAHoZwPD+rHxjv1dvZQk6kgcAM8uQ1OebZ1kE4K+L23XYr3RwxD3L@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2acKQXRN7mzv9AnxUZ95pxzcu+UYkNKPgDN+rkmAK3Sr6+rlD
	B/3e8unE+reQEEjWEI9/kzlB2gUAav7jatD8PNc0B7zB9uEaVrcC
X-Gm-Gg: ASbGncu+DECcKxlKuaHjpIE50zLVAZdozM9T9hr6JCC7+AHIz9/8hqZWW6w/myL58kP
	ceS5IdRgPSgizezCLJeG3l8WLVTxT+xOEZVLGJtsCESHhNiwyvWT3Kt8bP6nMbgZIWFlabSW4by
	K/vc22m5+QIYh9u1H2G4uzUef3VdRGJVZbX7AX7SduwZbuhsQOWb2C/oXrYdFdboaaNTPdadter
	jrqhASVGyygGkJcP28mF+cUCSjUrw/nLSFCBhrGHvkliaPWqdvRDmVNA+EtAROFdSgYQJxmwYd0
	OXL5tiH91Xfhmgp0hpwPf550GkMoAmwiPjzejcRFtv1dZXNGijqgE4CDEzbfyfKbPKaJ2QBBJZe
	GkeR4Hj3ovR4ofizcOvF+N/py
X-Google-Smtp-Source: AGHT+IGmSZQUmzN4kMPir1/3DwusZurNYkOuuU+RMXFG9BLfGYFc6j2Dj8c8UT3R/eHzPGq0z3D8Xw==
X-Received: by 2002:a17:903:3baf:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-22a8a85a244mr65443215ad.5.1743795782746;
        Fri, 04 Apr 2025 12:43:02 -0700 (PDT)
Received: from ?IPV6:2409:4080:1197:5c59:9640:d38a:951e:d202? ([2409:4080:1197:5c59:9640:d38a:951e:d202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e1b4sm36482985ad.181.2025.04.04.12.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 12:43:02 -0700 (PDT)
Message-ID: <299e033b-05d6-4d85-8d01-2d7d0167432f@gmail.com>
Date: Sat, 5 Apr 2025 01:12:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert lpc32xx-pwm.txt to YAML
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vz@mleia.com,
 piotr.wojtaszczyk@timesys.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250312122750.6391-1-purvayeshi550@gmail.com>
 <76ovkshf4dr6egh72uiigsugdqsin6zwy3skksldhhh2goer6x@gsp3qkhqdtev>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <76ovkshf4dr6egh72uiigsugdqsin6zwy3skksldhhh2goer6x@gsp3qkhqdtev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_124303_733289_E4968FFF 
X-CRM114-Status: GOOD (  21.83  )
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

On 03/04/25 16:11, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Mar 12, 2025 at 05:57:50PM +0530, Purva Yeshi wrote:
>> Convert the existing `lpc32xx-pwm.txt` bindings documentation into a
>> YAML schema (`nxp,lpc3220-pwm.yaml`).
>>
>> Set `"#pwm-cells"` to `const: 3` for expected PWM cell properties.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> 
> I suggest the following commit log:
> 
>      dt-bindings: pwm: Convert lpc32xx-pwm.txt to yaml format
> 
>      Convert the existing plain text binding documentation for
>      nxp,lpc3220-pwm devices to a YAML schema.
> 
>      The value #pwm-cells wasn't specified before, set it to 3 to match the
>      usual value for PWMs.
> 

Hello,

Thank you for the suggestion. I'll update the commit log accordingly in 
the next revision.

>> diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
>> new file mode 100644
>> index 000000000..432a5e9d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pwm/nxp,lpc3220-pwm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: LPC32XX PWM controller
>> +
>> +maintainers:
>> +  - Vladimir Zapolskiy <vz@mleia.com>
>> +  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
>> +
>> +allOf:
>> +  - $ref: pwm.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nxp,lpc3220-pwm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#pwm-cells":
>> +    const: 3
> 
> The PWMs defined in arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi also have a
> clocks property and in the driver it's not optional. Can you please add
> it (here, in the list of required properties and the commit log)?

Thank you for the review. I’ll add the clocks property, update the list 
of required properties, and adjust the commit log accordingly in the 
next revision.

> 
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    pwm@4005c000 {
>> +        compatible = "nxp,lpc3220-pwm";
>> +        reg = <0x4005c000 0x4>;
>> +        #pwm-cells = <3>;
>> +    };
> 
> Best regards
> Uwe

Best regards,
Purva Yeshi




