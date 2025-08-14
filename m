Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9717CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eKDxpRJVTIzyGI66oWlYnjcg0q+lXbGUZBFK9SZ3r8=; b=ciAAQmKu/VZ5lAXgxkI3MW325p
	qrTWkWtrIKh8BgdlhmKR8jrsq2BFB5hFDfHOXYEWyee9yxdUPE3oTv0ZUqtWgTwea4hkiUq98P2Zu
	EoYkRDZNYpmNwmXVggJoIt+eTsW+gVOlPieBVYZkaHcrKTKRfUz5vQTFoeiMaVytc/K2gAv5wNwbq
	m6wUph/5tGwc+0P0HH7BeKOqOX6VbfsRMcXcRcoY+9WvKPGtRVk2FWvGNM9JHOboshc275zciAIdn
	Dbd7Dw1JLpNNPKA4EFjTHugOwGJWXFdXO844ITL6dAsDVb0Az8vxLtAAEaroYwxF1t+rBsdcMa4Xs
	Vj0obVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma1Z-0000000HUP9-2ptD;
	Thu, 14 Aug 2025 15:37:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZ8H-0000000HIbx-09Vp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:40:46 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b9e415a68eso547841f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755182441; x=1755787241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eKDxpRJVTIzyGI66oWlYnjcg0q+lXbGUZBFK9SZ3r8=;
        b=K4DX7TKWK5aRT06My5dd7QqN9yB0ZJU8NZXk5cH2dNvuMvLa7L3b1ZPK79xLEBGke0
         MRLMllSnjIQaCT3FBRCuffb/gac9HrpBJNe1/JyY5ORE1Sdf6XNOdtg/0MVtal6QE+c4
         8HvRGtAuWnhBc8NMoKzHbefk/jnFzSoQBHBkMHhSXx68lwBDJhDt2lG+TyqtfZCcW18/
         /Gb8aHxfn07ZkFLtbBJ/qHm1jPOL6d0qhOsvH0E5H2VvSW1sAzQDa0oez1idiqgaaoho
         8adWy9p1RQ650/lmo1egT7y2fOf85tD2XJV1w2WhG4klQOr8Df2Mn3E6Ts1YrcVN3Mj5
         y13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182441; x=1755787241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eKDxpRJVTIzyGI66oWlYnjcg0q+lXbGUZBFK9SZ3r8=;
        b=cHkuqBk5oboo1ibj2j734N2wkQlf3W+m5VcWgf465/eDVSRS4ep/xZJ4X7p/9xhAlP
         H8mKlA9AGMFxDlUr9lpnJNriPrpUzt3kyRHl/0Vkr443y9EZQPsZSncSuUiUxT/IYkty
         /biw7GC4FqO1p7z8IRou0Cium99cs9DfhRPItdaMKR8SLOsgYTQ/4uQ+zz616sQl/9ZT
         xFmgYzGDbNdAJHb/Jowp8/HV5viDpanpqTywYyXwG1sL2LK1UFCqtpDybQV+exxoi7fe
         9xSgvj9zi1NCr3czyqz6hQyJXgiXPcrEr9apk/DEhIcd80uPf0TzJFYQxIiLSWJa6ovP
         ja0w==
X-Forwarded-Encrypted: i=1; AJvYcCX3x7MkDCZtlqWCBa//M7KuL+n6/i7GhLUqqNNcW8t06IllJuGNp3F9XO05Lz03oYN/xRfax0FO9MxsybZbA4Z9@lists.infradead.org
X-Gm-Message-State: AOJu0YwHf2DYqG8OZb36rJm98EwUVnpfOO1AmLauIVghYuk8nsnU9YME
	378f9+6Eel6d7KRqYKOWMmLYPWYniOmhYwJXCvRdqxCcMLljyjcEY16g
X-Gm-Gg: ASbGncuZ0iIqmsyTqM+qglMisg/T6JMcOEK32BvLjhT8FoFgt8BmUsAsSuAVkFflkaR
	Xi9xIZWeIEdwh40q232+ejFcSxMRQpRpIc016vMTfgA0NAgw6EK+IAczePE2DxwAR/UpkA/9AwI
	GrPa2JNenwU3vACdnMSAtJySS08iqxvT/NLs5EC0RKoMaMLSGCzcCz4+kAYh3Zed/otP2yfJADt
	k1/z3SfpbjHHp3J2YOwDNNmMU6ditTQOV9UyFiJY1BQPPDlvbAesUtDMLpgiBszwyU+WocAgNf8
	MQyJ5oOnigTiao9rhul6hh1zUFKM5CPzdC/9PsTbwkTpZCuRdQdAeqQFeUuDRhQoLsnGn21DAHf
	5JU8jNf9D7L8X3EHDdBby/Nr3c2lPum4IV3aC0qKIrEcXdZfmNd2vWM8GFD1i/J73KJkv290rfT
	1QuoFxVWe0GhNL84vJaCLWJ8vQQ7ifIESVbnLH3ZPz1P+1QgzKB244GIGwQqfwItE6
X-Google-Smtp-Source: AGHT+IGIl6W6nr22Y4YoVoUfpGIRuQbb/HUttEupcp6PwkaGiEDhgt7ofHOiURySJSgcpN1jAaaG6Q==
X-Received: by 2002:a05:6000:4006:b0:3b7:98bc:b856 with SMTP id ffacd0b85a97d-3b9edf5b3bemr3100715f8f.41.1755182441060;
        Thu, 14 Aug 2025 07:40:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:941b:4c00:f383:4db2:82a:81e9? (2a01cb08941b4c00f3834db2082a81e9.ipv6.abo.wanadoo.fr. [2a01:cb08:941b:4c00:f383:4db2:82a:81e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b1d4220sm17216425e9.0.2025.08.14.07.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:40:40 -0700 (PDT)
Message-ID: <05cc39e7-9ec1-4ac1-903d-873f77c3c79d@gmail.com>
Date: Thu, 14 Aug 2025 16:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
To: Julius Werner <jwerner@chromium.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_074045_072182_28630E60 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Julius,

On 30/07/2025 20:29, Julius Werner wrote:
>> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D
> 
> Should this say DDR4?
Yes, absolutely.
> 
>> +examples:
>> +  - |
>> +    ddr {
>> +        compatible = "ddr4-ff,f", "jedec,ddr4";
> 
> This is not a valid example for the way you're defining it now anymore.
Yes will fix it.

Best regards,
Clément

