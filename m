Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B898F3C986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvX0SGdTDgx9is4OThGZv30sDL1OeUbOOJkKXMALxvE=; b=hvBAU9xc82zEt5LkoQKBkBZAak
	YUAbY00wLwUW0Zq0Mia32K/LiXxbcs4LtAXCqI3icutDbKAUdIxwPGKDHbGYILa9DIOLfx2eZeDTd
	vwccsjAAGK9P9mTHMJAL25RlLFpXC6JwxlcSWyBMT+Y6xHXiyGdiZUu81kbCS0lqHAN0JTZkIMO99
	UHQoggoqGE5EcpW/UsqOEyvt7C8+xxLmC98/QciULzMhfPOs6LvGVXvhEKsPgJnEfWrVAZlU8MAhK
	TDnE6UfH88prFEX5wbOvPZ0i8Q/VZ89Fl2Lx7psT3UgPhcDAOTOjbAa5hodh+A8Yj6OieVx/tB4Gd
	9q8jXDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutdk-00000002Fsm-0mRd;
	Tue, 24 Feb 2026 14:43:56 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutdh-00000002FsL-3uWY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:43:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8249cb73792so4969198b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944233; x=1772549033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvX0SGdTDgx9is4OThGZv30sDL1OeUbOOJkKXMALxvE=;
        b=Qr/zGgBhqRMeUXTAwufqOy4a3lkv6BD32pMHlZtPY2UmAbas2HZcJG76z0812/ij+G
         BAT5WlOG5pp/2O77ZZHzFCbl1BYl129Pr9u1Wfwfj+MrJ2AGJURVCaxqDTi8FbmH+9Ys
         7I8lPLImVev1JJc3djXRUJvNOwe+svhOKs21pdRFNSRp9Vyw2FXHWPAeQlN8SwvVj1L1
         uHJgC0YGFfSPJ1VaJjRTQbJ8b7nvLdkKtMxYz9LFlguJBV9itYUJel4SAJTpHppRagGz
         ZJANrfZBEAaFf5TS3AdR9qpbmA2Pn7vFs6QCbwhjYKc6yx5M9ldSJqm3WLXzUdC+G2jZ
         iL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944233; x=1772549033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvX0SGdTDgx9is4OThGZv30sDL1OeUbOOJkKXMALxvE=;
        b=ShKb+VtkA/NwD9R+kVOWMkREd1qDkBmMjZb5vejZA44zBDdPHeKlG1fPHF6IwvxPP1
         bUQjAhugrpX7Qxra6H8Dj5ydhe3Eb7EhCfCgEkwAYDdAyDs7uENs4zbj0rMpaDjwoRld
         h/W9RFGaai3oL8KqAy63nQqE+gsss+kuZcAZjYyclWo/mj3PLWaY87I8ZjNzjKNZeWi7
         BLK1uwNZa3keyTUfJBatgBy48WOb52GKryp0i6XI4UFRsEXKosWQI4aHPTaa/HxKW4Qk
         JWliQdza2UbWjb2sQc6o1NzXSSbMUAuusY64nck9gEhTQE+3x+9DOI4Gi785yWOim4rs
         Qjxw==
X-Forwarded-Encrypted: i=1; AJvYcCWaRNiHVr8u9TGCG5OdhF4SpvpOQ8ssGdjTQ0dN4SjfpvVrGiCCgrltOHNPsdII0p19CXzqHTRvycghOSgMFyAc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2oeoer+TjZwLowsOVql3InQce/GEfKXkOgne7q0QVGjkXX00r
	d6LKDjFrt74Y8v11fJPayGFB44/smR9QvELI3kb/wYk7hcPCJjca5izjh+O26w==
X-Gm-Gg: ATEYQzwgk0Mt1IK03qSxkOaDapcH8vbgmRU9wVXIMsGG+vkBK4FXVUJf0bxKdia1LGx
	Qq8Xp3YXAP/DH9OTesuuTskKp+gMXFPrwZv3XTpptOgtwFIIGF5SBAmdKiLIkSXac6Fd9MFWash
	nPYUL/UsD8hJofczKQ4Ah/4XuMd9EDty9v0mSxafZ3/dKdli997hPOKpCfIkLpEoTLySqiUP3wU
	N4q94HBYS1VT3tcRy84YJXz2sJNSzQsfMGovJ179XFSqlieeaPCQ8NjKoJSRM4IHbLqRBhG+HMi
	Ysi6dKiqgG4KgC5LtNCFLNzhyqF2vsMS8hMMYT1QwBVKi9CDAsAUswhUZ0CxbFEJ/tNbVZEMMiy
	e0a8B53xwSD2lBOWXkyfcj3YNB52OyIfhYati8pkYxVGwB9S2isC1qBItyM0ikgrDVLMth1Kdn7
	uEWvlESEogCjXoRPZLeFKR4ODt9XCrIItR0gkNoqqEYZjwNw8aapu4oHYuVF0IfoR9cpmUr6R39
	2giTXVCMoUS0r8cAgo=
X-Received: by 2002:a05:6a00:2382:b0:824:3725:1493 with SMTP id d2e1a72fcca58-826da90766dmr9980214b3a.19.1771944232918;
        Tue, 24 Feb 2026 06:43:52 -0800 (PST)
Received: from ?IPV6:2401:4900:8f4d:6bb:6d92:919c:951b:7d96? ([2401:4900:8f4d:6bb:6d92:919c:951b:7d96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd68c0b8sm12123724b3a.17.2026.02.24.06.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 06:43:52 -0800 (PST)
Message-ID: <27eb620e-3924-4a78-ad31-0412e938e7e6@gmail.com>
Date: Tue, 24 Feb 2026 20:13:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: microchip,sama7g5-chipid : convert
 to DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
 <20260217-arm-microchip-v1-1-ae5d907e10e3@gmail.com>
 <20260217-fleshy-giddily-80987f509638@spud>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260217-fleshy-giddily-80987f509638@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064353_976209_4954A467 
X-CRM114-Status: GOOD (  12.04  )
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


On 17-02-2026 23:21, Conor Dooley wrote:
>  Akhila YS wrote:
>> Convert Atmel system registers binding to YAML format.
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>  .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
>> new file mode 100644
>> index 000000000000..4227f308d43a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Atmel/Microchip RAMC SDRAM/DDR Controller
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
> This email no longer exists, think the new one is claudiu@tuxon.dev.
> Look it up in MAINTAINERS.


Sure.

-- 
Best Regards,
Akhila.


