Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CA2CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwviYPQGB1I/w7NU4rVUl6UMm8yXDWLDOqexuNMZHj0=; b=n2/xFkBr9+Jbi+Xt0Muqw8wn1q
	ZSMHrIVW80yD9hlnFQXLg88H7ruNoV1ZQ2vQ2F2alAwtcbh8BzD4fnnVONW5Bidk9NlwMeTuoznNb
	Q3dTBhQzWHOzcAYaI62oEnVHoSkhC5/AAtrv0CY4hgQyQeu/MfJiW9ubzAzsCxJJxdpNhZKXbhjQn
	WM5cKMQm1btSVmLxHN66t20RjEy1mvpa8INBUfTK0YKQwd5oDFqTRFAZ+Gtbui8Zi+tUvqwjDqulx
	QIPuYDVODOLx5RKzWfGZgObnrznURBkg6U71sv+E5y/3JRIPYTcrPbIW+mFLEToLCpj+n8nxHzMWQ
	rBhdVb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKrM-000000052Dv-1OqX;
	Sat, 16 Aug 2025 17:38:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKom-0000000524v-0IMJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 17:35:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb7ace3baso494087066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755365744; x=1755970544; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwviYPQGB1I/w7NU4rVUl6UMm8yXDWLDOqexuNMZHj0=;
        b=I8Chx9QJ5qzj3r/UjrNWmvbrkYjCbkCFIiDcSzy3vuYKekgNvpJJzNLcESrvyn1aI6
         GLlyfynbKBd36KfGlBOD2XKRlAtgJuPtRgIOs+2+IdXmqbZx2h2JgXkub4jAh96Qc2vM
         ts4Hm0k4j0yZlZFD0Gx+iYaUKWK1btvQ/uYc/7FNz8w8qH5a46zR5/P7XDvRgrIcQ7UH
         8zaKGq8yJvN0/+ihwaBpUjxKosTvDOzTOp20zV6jnRVN7DWuxIcFkyEy034Ybj4TZWwK
         g4aPKf67lnTOBZXQyQgajFrGNPlt7D+J6GvQD12/o/mYnbjoB61Xe2ACSL+Y4vNdcwXD
         6nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755365744; x=1755970544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwviYPQGB1I/w7NU4rVUl6UMm8yXDWLDOqexuNMZHj0=;
        b=jHizNfDI17WMMVkw34LmSOWY1UXr5+g/tWuPZ/eh7aHit8E4k8uwWuoWIOAz9rHgKg
         s1b0z7PYFFW1C5ytLVPtxmLIgnYGJtIzH4Xx9SgmSd7qtDzOSsKgG74pMd6watzGfmTa
         mTFscS6Z93b4hmH/C/oUI7Pb4qY1F+V1s+G+gTS1uc9kk72PNvh4rQ2zXmib8erUFUde
         q1RBeMjqUP9rrYtwZvH8fe2idkd3Qva/hk3mPBZoL+ZI0CUp8IJrQ+Ev9DIrtMcocUv1
         fgZ56mmTM0ln1HlpcMlE/HpqVnyoXzv5k49E5r1eWFLYdNYhdsHh/6h+oJqqfqOJgsTm
         bn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVye6sHLpk26zthQO7gXHn5l/1akpIkyj1E6t/HzG5oJW2ePnTjed308Ze2/UxXBmysjXIoQVzVutyVi4Lf7bja@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/GbKKyg2bwnEh3IeeucaATF2hCOa5pWdFT6H0PpgxkdImgbVQ
	o793Ip4GElgqKBxfGkhRuWNzRuUBVkzr7ZIV4IWd/U4ZgYTOESEMnAin
X-Gm-Gg: ASbGncuf5nZlvoYIIS+G6ud+0w3u+h01PeF0t2Qg3crrJj4OaWJ4hd2U98NVR8fKeHJ
	SczuBes+6urxfucZqdjJblr68F7BYteGb0yitIl3uqzqRPMjCUAWpYRoPntXv0wDArN27nyI3T3
	p571u5cLB7UxPO38e4Sjke423wUc25ZHiWEF0605IBzzpNHIoDa2iC+3H+A03b4lXC4VRj10WAp
	YS0FfROd1fLr4iUkHIncsVeVyq2fq93N9GB/8lV4+BsqpAzrHV0C92sX91xFwdqmnPXzlCsLh4C
	uT5PUO6YaAgaR8ZcMkU83xK9zTldLw0d8mhhx0Zh5iUAb5HVMY42SeCEAOkiCRYTIVctLN4vq/1
	i+liGRS44+tX3wAqRYVGKoob5pJjZoLXJgXgMpEcuppNBUDA+4xeJBvwy+tP0hUPKy+kD6ezTnA
	IF
X-Google-Smtp-Source: AGHT+IH+TMwZN6wLewjxiueXv8jiO5h9FGdUKa87VCAkSdSbxDlmS9D3F/+XFbuGxMa2BrgQCBB8yw==
X-Received: by 2002:a17:907:d2a:b0:ae6:c23f:3cf with SMTP id a640c23a62f3a-afcdc244436mr599984966b.16.1755365743786;
        Sat, 16 Aug 2025 10:35:43 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce78d2esm417010766b.52.2025.08.16.10.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 10:35:43 -0700 (PDT)
Message-ID: <0cd105e7-505d-40da-a0d3-1f8ada8f2ca7@gmail.com>
Date: Sat, 16 Aug 2025 20:35:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4mjOmi4BM2zOPcR6GH=4ngA3FisotqFXXGAbHOghQ4x8g@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4mjOmi4BM2zOPcR6GH=4ngA3FisotqFXXGAbHOghQ4x8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_103548_115764_B5387267 
X-CRM114-Status: GOOD (  22.10  )
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

On 8/16/25 20:29, Sam Protsenko wrote:
> On Fri, Aug 15, 2025 at 2:05 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Hey, folks!
>>
>> This patchset adds serial busses, implemented in usi, for exynos2200.
>> It's missing spi, due to me having troubles with reads when testing.
>> Serial_0/1 have not been included in the patchset, as it seems like
>> they're encapsulated in usi blocks, but are the only implemented
>> protocol and/or do not have a dedicated register for setting other
>> protocols in a sysreg. That'd at least require patches in the usi
>> driver and bindings to add support for.
>>
>> About the naming convention for usi nodes, I've chosen to keep the
>> downstream one instead of relabelling all to avoid confusion when
>> cross-referencing the vendor DT and to keep consistency with clock
>> names. They're labelled the same in the bootloader too.
>>
>> Best regards,
>> Ivaylo
>>
>> Changes in v3:
>> - drop the serial_0/1 patch
> Why did you decide to drop it? As I understand, having a serial
> console enabled can be quite valuable for this platform bring up.

On the only board that is supported (g0s), serial can either be accessed
via a special usb-c cable, whose way of working only Samsung knows,
or soldering to uart pads on a tiny masked jtag (?) connector on the motherboard.
The latter I'm not sure exists, as I haven't checked on g0s. (it does on dreamlte).
Using uart is not really viable for debugging, framebuffer/usb work too :)

> If you don't know how to add the related USI node -- it's ok, can be done
> later, as soon as the serial works without it.

I can't test that. On dreamlte a similar scenario exists, however usiv1
does not require the clock gating code, so not encapsulating it in
a USI node is fine. Not sure about g0s, however.

Best regards,
Ivaylo

>
>> - add r-b tags from Sam
>> - increase the size of all syscon to 0x10000 and not 0x3000
>> - change description of last patch to be more meaningful regarding the
>> usiN and usiN_i2c mess
>> - s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention
>>
>> Changes in v2:
>> - add a patch that switches address and size cells to 1 in /soc
>> - adjust all new nodes to define reg props with 2 cells in total instead of 4
>>
>> Ivaylo Ivanov (4):
>>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>>   arm64: dts: exynos2200: use 32-bit address space for /soc
>>   arm64: dts: exynos2200: increase the size of all syscons
>>   arm64: dts: exynos2200: define all usi nodes
>>
>>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
>>  2 files changed, 1398 insertions(+), 37 deletions(-)
>>
>> --
>> 2.43.0
>>
>>


