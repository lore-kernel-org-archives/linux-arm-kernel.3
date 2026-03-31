Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DF710F92FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=; b=EYrQGltZsZWKBcS1VtwowIUCRy
	AqVHm8CkilAXUMbzAfJQMCS7RT5lsjYg+lpH/fPVzY/RtTua/IrMp7Bhu43tjeW4COe5UZj18mtu3
	WqPqBcLJfH29vud1QCsfHDeu8TQjgEbPz9Oo/qBMunSrqfVqG+VLJntPaRyWZqhSSlmF6p1QBBy4O
	BaEk8oWMPErHBI+ZTxMDUteH4PtosdLP+IU2oeOF1M4eDuecu1r3ialVFg3L2CT40aFhuSTb/DshL
	jk9T8I4XK3dtyl99a3l/TZxv2lHnmK430VTSbQWqMDzTF8yDrZ2fQYCdXGzxnhQ7fea+twa6fl7D2
	kiAXlwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7fsG-0000000DXHb-2KLf;
	Tue, 31 Mar 2026 20:39:44 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7fsE-0000000DXGk-0PDL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 20:39:43 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-12732165d1eso8507509c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774989579; x=1775594379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=oxxUiFCME9cSa69fYAb6e/FZG7KYYC8QlbJqJR1vK4y8RGW67VGLMdJpYFaYWRB+ON
         085jUuCCWktYYTJr7iIbz6aXNLHuvQxRttllCiNVdRm+VRqwQgIFbVacsyP89PAkUT/r
         aykmpY+i4qRjCAQIDD6/HAcIav8C4bldDh+M9ZvUD0XtyGVcCr7qNl2P7hEQzShMrlG0
         ewvrjhCCgN+NEGIhn9wQrnT2zOO0nAhwF0tr0kuJN617z9G1UwrqaSVS4Kgl6O78EmsZ
         bso7FMgoHNhBnNqvpeSoM7Yell+OgloyiPFpwxx7KPrXmVFdg0j+rfbfQ3mpx8CB43b8
         4N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774989579; x=1775594379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRCQMa9zMGlvIHkM8ghTZ/x9mDeTjIV8vVymtj5kVU4=;
        b=geL7SyvJjHFizh6D8P9yIE32S/92zJY53LwLO8xCg09o6/eCYBiHkvPtG7GiCJ8Kxw
         YRiJ/b6orGKAW+PHJoBV3AVJYaf9PACs0bYngya/Dk8JH/Wjd6T27bAjAVWFzlFD4m6G
         kHOHLEtPhMeWoOtJ36mjbyJ7OIYwXqkFKqMDscJ7TJjr6yVw5+0A9UG+524/PJ+DsCi9
         QeFGz1t9B6GzzGsfQ/+/aJClnQLN5t5OSnsQWaHO1kkES+HTpI25iewbiKkfjlZVJzMA
         zrXd5pLkR8PWS7B0IL80vlS9//8HrJCfpTn6xEKVipxe5xzmuMGfbRgUsgiRIXh37LCI
         IUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkllpUqIqvN02jL4DpX4slaH4b655yX/1wFFXhk0pSOVKYk/JyqIzbb2kH7iUWT/7y5gGt6rTpY2ZtMKwF6ay1@lists.infradead.org
X-Gm-Message-State: AOJu0YyTsbu3UdHZ4Rd1QZxr0r8gRxMDzGQs+TH9qHcljerDYeO2C/Vk
	uDoutrPZH6/2xcRg6ntji/uHla7+oftBaxJhYE2GEVEwds4k7yFap29qDsfRP4qiWg==
X-Gm-Gg: ATEYQzxc7pjJzcTMkmXQRgwB8EwjYpRRZo34beQTmd/s85Pz0Bgg9ufu1YG636lfs1b
	J3SAMKcBnbFbMM5DwiLXIj0PX3IdPfr2U8R3/ib/X5ztakXQssxRn+Y2cxtRSpnhkbvqwZzuXzy
	D0rrrPen8SUb5tYwJwYMDRmY3H7ryxSYvAlgoK2eux6YvAwBmghlpMEjHI15SxyWAn0yDYq76i2
	j4gzjrexPcUV2rsWb8HymfP6gp4TfPxS5XYyx9FkNMApZYdaVODcOPxZNhDjNTDDN7UhJiOGQAo
	h41WXuZyI3dJYBgc7SYsBFdQvpz9zzF20Dbpja/7jAi9KfX8z++AsCERQDwnSmcVze+ILJRuaGQ
	qU68KzxBCdnxi37OpJhqUw80Emw/uLfUe6qUOi521wwpDgpj/+9LmH7+CL/2JVTQDA+YThnVlPS
	cKyWAF9jJYg2z7uBAq9SdLNssPGP5z4NxV+VsHQ3t5P+EmiTYERZi/CbwExYJg9zTkbfebtLpKG
	9V36COLaxLFGdfs6/ndggvxOg==
X-Received: by 2002:a05:7022:41aa:b0:128:d494:a1ab with SMTP id a92af1059eb24-12be649eb12mr512442c88.15.1774989578723;
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d? ([2a00:79e0:2e7c:8:6a92:85c3:5cd5:d23d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm16792226c88.10.2026.03.31.13.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:39:38 -0700 (PDT)
Message-ID: <e5384261-7a9d-4c24-8387-6002268f5c1d@google.com>
Date: Tue, 31 Mar 2026 13:39:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
To: Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
 <20260325-max77759-charger-v9-3-4486dd297adc@google.com>
 <20260331123138.GE3795166@google.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260331123138.GE3795166@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_133942_204547_93E07176 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Lee,

On 3/31/26 5:31 AM, Lee Jones wrote:
> On Wed, 25 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:
>
>> From: Amit Sunil Dhamne <amitsd@google.com>
>>
>> Add register bitmasks for charger function.
>> In addition split the charger IRQs further such that each bit represents
>> an IRQ downstream of charger regmap irq chip. In addition populate the
>> ack_base to offload irq ack to the regmap irq chip framework.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: André Draszik <andre.draszik@linaro.org>
>> ---
>>   drivers/mfd/max77759.c       |  95 ++++++++++++++++++++++---
>>   include/linux/mfd/max77759.h | 166 +++++++++++++++++++++++++++++++++++--------
>>   2 files changed, 222 insertions(+), 39 deletions(-)
>>
> [...]
>
>> +/*
>> + * enum max77759_chgr_chgin_dtls_status - Charger Input Status
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
>> + *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
>> + *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
>> + *     Vchgin > Over Voltage threshold (Vovlo)
>> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
>> + *     Vchgin > Vuvlo, Vchgin < Vovlo and Vchgin > (Vsys + Vbatt)
>> + */
> This comment is masquerading as a kernel-doc header, but isn't actually
> kernel-doc.  Either change the formatting or adapt the formatting to use
> /** and use W=1 to check it.
Thanks for pointing this out! I'll fix this in the next version and 
ensure it's a proper kernel-doc block.

BR,

Amit

>> +enum max77759_chgr_chgin_dtls_status {
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE,
>> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
>> +};

