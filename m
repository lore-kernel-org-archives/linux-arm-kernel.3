Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7458D4A615
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+AGXRtrMXkyrXKzRmoE9z026WTEqpV4D7gQD8MxXK4=; b=ZtsdmbObe2Kl8u6ilbLIrl7DxI
	JQpaeZ5/B0w5PoFwSUIQhqmSaTfqEEGDdC3Zhm2FKvGS6tFNwlJ37/kbzRvClb217wuIyNPJvLieH
	XqvTpStVXtTz5pUb3D684H09JjR3rkI6Gj0JD6WmivOVQJG3fje7+QcuRqq30P9NxI4fxqt/uz2YQ
	awXpWRUXu54FOY1bIIMB8rexVI0qO3FoBCjGsjmBJkhBByQ/UXi7SoQ/H7j1F/Ls18crkOZJQMc++
	FMnjbptxmOCXnVhk9nToet8HzENem8HzIBVAshkvJlNR2t/3Xtqwtc1Zy6fNafb84rZb6kozZ3LUI
	VzmI6vdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfyR-0000000DqVE-2maa;
	Fri, 16 Jan 2026 09:18:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfyN-0000000DqU2-3Dl3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:18:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so10718135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768555106; x=1769159906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+AGXRtrMXkyrXKzRmoE9z026WTEqpV4D7gQD8MxXK4=;
        b=i2A0MzGi6MTP9VmY4hT0pGuFygV+CZmQhd1P7cO6opMi1eiy15BVBVWZMonh54Hhyg
         HVuWOWm7ExgPn0a1/bmFjx4F+9viHPiJKloB7yiPDe/HuVNA6SXDcfGQyETXPBMddwiB
         vJ0hj4+oF2klPksfmZ851CLHAu+wucnA5vUoBn62F0OrXymTRtsdMO+w4RlLI9/kl+sS
         uOzXkYkBQ6lAnU6UrcqKtYQCD61i3kEdzEoxNfHgDxiKrX7SBDpuApHSyPmSxbNb3Jw5
         S5xoCWRL8VgKXiIwJd34PwDEj2KsJ13nhep7cxMlYxBzG8JwiGyKaEES2rpC1/zKUr8x
         tUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555106; x=1769159906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+AGXRtrMXkyrXKzRmoE9z026WTEqpV4D7gQD8MxXK4=;
        b=KR+YxrW0RthvakGddShGz446kPk7akJSa8N58wXFuA1NYN3Xdxkhnii9SLU9gIuYaU
         6QXuXb4iDZJZlEJM4EhdjLxnKfJIIuTz9Kz/OR34fEehxsoQCR30DtKic8jSPcapC3S3
         ulpoLXHdt7djPomnqfxuQd3lNjQBX4/COBMZtI9IKSN8JasPZycGutOYkgXubDuhtSRg
         sO+Nmm1oWn69zVcFTxdQqqJKM6p79A6krmUpKvWirxaBSj/SzI0LxbgMMq/2lZvN+OKN
         PDso0Tl0Hmr+20MLJXLPiDNvvK2MoOJOMvEyvxlJF6pXMwwLQIxa+LRtHa+fehBNK028
         HZsg==
X-Forwarded-Encrypted: i=1; AJvYcCXd2jNrnNiPY7busQrwc0enV4fLh4WH1FMBrv80j0eLYrUnP1zVZqHCZUAYl08lcVlkVBH7wiy3OAGgiJwpA4n2@lists.infradead.org
X-Gm-Message-State: AOJu0YxZcZqGeMOl/ylI9cbRf1N1m8NjvvPMLgOXU/66bHPyaW2re75s
	x01BkQrJwO04HV7DGuF9loeby4JVnZxedzTP2iFKhMQOkRuIsXeAHZ6FytySzkdwpvU=
X-Gm-Gg: AY/fxX5jh/kxKgEawQ46W+74SSneO7RD/DkX2xDYDKRDHIqYEhkdrF5gm+DWcxuKUwH
	3T306k/xHjSHmyZu/v8MaBlwaIcNMFs1T0xKJFRQylOP2gXAyEzFxXHNQtnXOE+5kFxRsZkQt8U
	WSAlnpxh8jx/aHDdvqsms1X2I7qSyRH/CCHwMBz5i8om0eon6P7kVSG0+XotrnPmrRJYW76kerF
	0SjgkP3gVhXHttnukqGFnWliUUy/tjysUTc75DR4EUj2r1gly41EGCDrBvZVxzVV973PqffnnnG
	f/iVQdAolIlrjgAmx4KJdx+izznChScZtyGuDHs3Da9GACN+EDo/3k+gEm26xr1wutCNd7afq93
	UxFPmKtOPmGNqt6OyU4n6Gj7l5Fb8x8z/sK9XoHEUWPgBg+AnqBC8JoPOpddDRpqdu/fxlZcvfp
	nX1OgLKJwNp24CcRvZtA==
X-Received: by 2002:a05:600c:6209:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-48023ea2fc7mr6725565e9.4.1768555105706;
        Fri, 16 Jan 2026 01:18:25 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm87551575e9.10.2026.01.16.01.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:18:25 -0800 (PST)
Message-ID: <d3dedf5e-ada3-4d33-b1a5-7556ba80ffb1@linaro.org>
Date: Fri, 16 Jan 2026 11:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: mfd: Add Google GS101 TMU Syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, willmcvicker@google.com,
 jyescas@google.com, shin.son@samsung.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
 <20260114-acpm-tmu-v1-3-cfe56d93e90f@linaro.org>
 <20260115-slim-denim-potoo-cad9cb@quoll>
 <200d34bf-150e-4f8a-b400-2f54863502ac@linaro.org>
 <e2f028d6-774f-4773-889f-7d56b833067e@kernel.org>
 <fcc5405e-189d-4195-8db0-3acf35bbc0a9@linaro.org>
 <26d86470-aaa2-46e3-9940-010a903df4fd@linaro.org>
 <0176a63a-6b04-4e30-b718-847133882050@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <0176a63a-6b04-4e30-b718-847133882050@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_011829_496646_A959866A 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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



On 1/16/26 11:14 AM, Krzysztof Kozlowski wrote:
> On 16/01/2026 09:50, Tudor Ambarus wrote:
>>
>> Because of the hybrid approach I'm arguing the ACPM child node does not
>> fully describe the hardware, and it's just a firmware abstraction.
>> So option 2/ would be to have just the TMU IP block described with a
>> phandle to the ACPM IPC:
>>
>> soc: soc@0 {
>>     tmu@100a0000 {
>>         compatible = "google,gs101-tmu-top";
>>         reg = <0x100a0000 0x800>;
>>         clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
>>         interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
>>         
>>         /* The "Firmware Phandle" approach */
>>         samsung,acpm-ipc = <&acpm_ipc>;
>>         
>>         #thermal-sensor-cells = <1>;
> 
> Yes, this one, I think it's the best representation.

I was leaning towards this as well. Thank you! I'll start reworking the
patches.

Cheers,
ta


