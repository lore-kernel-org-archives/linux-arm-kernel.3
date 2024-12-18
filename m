Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C88E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS7Pk4ioEjURDID5iONvHn6fwf9tn79746Vbx+cJWGo=; b=2XJbzkx4ChPEGeRLQKIs2VaSeT
	amyGQUcFvikFq2U9We2PG3ZX2CWHKPRMlzTUjzxYKoh26i3qPXY/1+FyNFDnjRwdsT+6RO96jSCXg
	6ZSSyS8N2+tJpvW5i6wr9M6u23Y1vdkzzxTeEIlw4s/QVtNIAtw53bMfvAgjxU2u7Tf+bZ7or/5/d
	6dyrV94RGtShXTTGbuNCzPhXUum/var88vFDFf1xtGnIA4YxewCgxi+NFR2ONpw1T0FQuKzQxQrXm
	mfwbuNMFm0JBazD34bMi4/xP/jekI35+jaXypwoG3HfLolpylZnWTUcgZytmDWMatf9pZ6ty0Huvw
	bRs6gdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtLf-0000000Gcfv-1nOt;
	Wed, 18 Dec 2024 12:40:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtKZ-0000000GcS1-1YXF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:39:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43634b570c1so33791435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734525549; x=1735130349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS7Pk4ioEjURDID5iONvHn6fwf9tn79746Vbx+cJWGo=;
        b=Q2ZlD38iGjotI313bQQiABKoSvycnL+kw3ccXtQKgvN0qhldawtVS9kx+/4iM8av2v
         AfJuMoziWEV1GsrYeC30yqHAwXrRvUfoDoKh1HKr+8T5iAJfMaq7PfivBYqq/sSTbCvM
         Bk17xS1NzsA9RxXZ8CqQJ5lyF2FUZrsFLvLD1ZhfWUgPMFcZTSiizdlctOv+m/AJSWpr
         UWsdM2H2PV8W5habisrv/gBXnsLH/OxHHyJIfOg2KnwsqiPdxc1yBGZj+h0HBu4Mc/ms
         CcYecSAPAh7WdbzTPlWL16Vw7HWkLXPV9eC0VO5Oburh8xVAu2E8aHyvOkI1cw8m+Dry
         lfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525549; x=1735130349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XS7Pk4ioEjURDID5iONvHn6fwf9tn79746Vbx+cJWGo=;
        b=lC4oTW+46FvvcREW4ACGlbSecCptzzdp77mDF5pUwqF6yJdypkN0kPjs9gtvQTz94K
         NAmS0mC00dIdDU18xZyOcpqKsLunOtvG98ggg7D3Ya+Y/+NoNx5iP0Q8802AJSdi9ERV
         VVU53Qq9uTZkkhtm2pApZHjVZWOqrNwNABvELAyqb6oDI4jhcQKzS+prLguCuC5dl0y7
         6cWqU7BGZ/MQdeFJLx45lefby495I0LcRdCka31DX/+LcSdDz9oDU6HSgithyIScRpBa
         jt8r7lGk0RBCRu7hGtT2DfaiV8cxjPYUDjPPv0uN1qeKJeRyaV/nqIQMuvcoKrG585fu
         vy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUohK/UCddVS9wtoZ2mf6SHxzpTYpH9PXLxD47zRgNu+3PDCRM1xt7juqYdoSLeQVBix27n15aDoFxmmohEIrD0@lists.infradead.org
X-Gm-Message-State: AOJu0YyS3u7OMVy294IuIZ0uaOt4zz2l7iao3U4LHBF7EwVTD/2UiBDD
	r9v/yjyIrY0gdq6+4R1mbItul4Z5yuwynVI8tpmKnYobs4VmdW4yTDTU4LmyV2M=
X-Gm-Gg: ASbGnctygh988v2xTqRJRAr+tGfxzgVruaempQDl//rmD5Sl8raWNgo38Yfe4MXrIaa
	ZJEcHmBvK2+u0VYIUX8sHzsfbG4b57xtrP/c2h/+M1bzEgqY31OQCT9tppvy1JtYXtjRRVvkQEx
	MH03DCQIAieLTWiGyZdkJU7oUfULOK8RNkkRgdqXgBLGDVbPI0Xo242QxU871+LYBkf8sAJc25e
	1lZGUCgU7sQ3Ri5KuECCKTouRsGlcDLNOr8NjTK4T5B6XQgbV8ZxknrfR92HuQa
X-Google-Smtp-Source: AGHT+IE1tLl1Dcj53ZXYsfNVMFp4tWjeeQ7FoBjB4ziYdja1dw78rhY6qRXK/NpCpyfOFic1A6GtHQ==
X-Received: by 2002:a05:6000:2c4:b0:386:4acd:4d77 with SMTP id ffacd0b85a97d-388e4da5dcemr2689138f8f.44.1734525549534;
        Wed, 18 Dec 2024 04:39:09 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b441bbsm18961965e9.40.2024.12.18.04.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 04:39:09 -0800 (PST)
Message-ID: <878f75cb-e85a-44d3-aae8-22ede6e7afde@linaro.org>
Date: Wed, 18 Dec 2024 12:39:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <wlvvuq2ldv4funye2ylnccq7soyrqkqggg36oimnvmhxbbjvnl@yyy4y5nyruzn>
 <CADrjBPq4mTsvCivBJPmADP3pfUORBV8hGeP5GrTg9YxASJLHXg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CADrjBPq4mTsvCivBJPmADP3pfUORBV8hGeP5GrTg9YxASJLHXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_043911_413915_575180EC 
X-CRM114-Status: GOOD (  21.79  )
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



On 12/18/24 11:23 AM, Peter Griffin wrote:
> Hi,
> 
> On Wed, 18 Dec 2024 at 09:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Dec 17, 2024 at 09:40:20AM +0000, Tudor Ambarus wrote:
>>> +description: |
>>> +  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
>>
>> If there is going to be any new posting:
>>
>> The Samsung Exynos mailbox controller, used on Google GS101 SoC, ....
>>
>>> +  generation and a shared register for passing mailbox messages. When the
>>> +  controller is used by the ACPM protocol the shared register is ignored and
>>> +  the mailbox controller acts as a doorbell. The controller just raises the
>>> +  interrupt to the firmware after the ACPM protocol has written the message to
>>> +  SRAM.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: google,gs101-mbox
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: pclk
>>> +
>>> +  interrupts:
>>> +    description: IRQ line for the RX mailbox.
>>> +    maxItems: 1
>>> +
>>> +  '#mbox-cells':
>>> +    description: |
>>> +      <&phandle type channel>
>>> +      phandle : label name of controller.
>>> +      type    : channel type, doorbell or data-transfer.
>>> +      channel : channel number.
>>> +
>>> +      Here is how a client can reference them:
>>> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
>>> +      mboxes = <&ap2apm_mailbox DATA 3>;
>>
>> This ordering assumes there is channel "2" in doorbel and in data, so
>> two times "2" and of course the same for all others. If this is
>> configuration of one channel, so "2" is either doorbell or data, then
>> type should be the last.

ha, nice observation!

> My understanding was each channel is either configured for doorbell or
> data, but Tudor can confirm. With Krzysztof's feedback addressed:

For the ACPM interface use case, mailbox is always used as a doorbell
indeed. Regardless if the ACPM interface writes data or not to SRAM, it
will use the mailbox controller just to flip the interrupt bit without
touching the mbox controller data registers.

For the other cases where the mailbox controller is used to (also?) pass
data via its data registers, I can't tell whether the passing of data is
mandatory or not. At least not by reading the gs101 mailbox datasheet
that I have, it doesn't describe the SR registers. However, Exynos850 -
which has the same registers, says that:
```CPU cores can use these registers for sharing data```.
"Can" implies that writing to SR is optional.

So I assume a channel can work in both modes and clients use mboxes to
specify which mode to use. Shall I still switch the order?

Thanks,
ta

