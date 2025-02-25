Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CB0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESHe5tOObnpKqqZ922yCUdfxuhB0YSTVuyOcdcMSVyA=; b=aab5JztdSHRfTQ7JH1Ya47hJWC
	1g5RXKfrbJlpyjb7dnMDHM7jDSrMPdvXNhFIOvq34CpJnyjiZkjDCwcp7KTTVylO6hxS4jaz+wjA0
	vUAmOvRVEdCuD4aWPedzHkNbi27HXMijfpyFxg1qpE6Ia6gnKtuAMh2q7YHrnLlekt/iRSSufwHL8
	EnvVM0qVHN53y+kAZW05I/iVfL/pRS1bxE3gWFYtG50Nvv6AJlg5rUFH7edS/l+5T95sHZNb78pcz
	8TZcKbILym18w5jNH/uwyoxUCZqjCh9Z0/wwRARkQaFTtA26VA+51EAZ4V7klS3N2BeaaV6fLZeIu
	CuHRKesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy5O-00000000Rh0-3kz5;
	Tue, 25 Feb 2025 16:47:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxrr-00000000E7W-1Vvw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:33:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so55504185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740501190; x=1741105990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ESHe5tOObnpKqqZ922yCUdfxuhB0YSTVuyOcdcMSVyA=;
        b=H6ndC2Js16KPrd1zUHcjn4XNfv80Td94uc5uFAS+LoJf94leqywz51tZ4yGnTorXSX
         S7tRuRWEXNxr1sLobjdAmS9izCCDbUwybAzZHp0xvItuzgaIUKQRCRHeIiUlpEc05B1a
         gMNLKBg1pobZYZJnEMuQTYG1L1q97arxN+aqniUXLAbkojDNVFbvTVGr554t1Tb8rW2P
         FDQ/+9pzFihDij96iYujlV7Xsr9/vM6tK7odg8lZJ6yu76Fkdgm58ZeNNvfsjLRJGtR8
         KhbI9oiEDwFzncC1WJE4wcAMXlj54h0rGhIBX9Ks+R97CHwRP88qno6SZwxRPCoL49Z2
         LBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501190; x=1741105990;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESHe5tOObnpKqqZ922yCUdfxuhB0YSTVuyOcdcMSVyA=;
        b=tAnp02zYcftnapDSE1GDX6i59TAhsMTiMzqLKYlRziYdG3HNdP24d/dmMeneDBoK7M
         RlMoLMEo8KL3YS+mXoGZ8JR4+/y/QdFZ/G3eGANgN4L7TfsIpy8fVTrUe+r+ugjQXD99
         5BvoGZQxnmvLbwdrHyXiJi+mPcZcCUgRNqV5Si1Ve5VbC895juzhxr5WN7SN2GFCwtWc
         SPHGK3c3jc2eKn0zKdO5tdh1OlZjyJ8hBx8SJ0yfkR+TaHAW5byA+149O9Uia4sau2WE
         X9BIdinanXKz72PPoMj0E6iurgLOEYkh2rgMjExThgPeucdUxaVwoNzLDeLY5x4fuPPI
         0bEA==
X-Forwarded-Encrypted: i=1; AJvYcCXu4iCKQJn137xSAnII7CMAiTvaaUYsTtAGZuR16dHWuCJAqCiMJmCgIq+s165U8rxxSIvv8FviOIpG88Ewqi0t@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl5fOahlwoJtaTMy2WocD2r3l4cNEsERxMOmZ7i5tD13Ww5dDS
	q7x/3x/ScPwuskxjMPslumEKhDErhG+D8q/kqFJrpN5qeOFFM+UKKy8dAA7saaA=
X-Gm-Gg: ASbGnctxenpHAp+aUU5X+IXoZheH8MJALyzzUxDVNKMh4ScVTfPdQXzODkZiVPuC3ZE
	smQo9tr+vCGU51jidqe2ucbYd82kDzaVQTt7QqZc2S6fXrhYHbaQWpvLUFIpz6WQpVbMuTFalN0
	nYiGvV9pCugH0pIeS9PYTs3BwJu1QJdr3QzI7Q+0vJvny64e1hEsqBy27rGXXyTC+oo90nFSuue
	33HsPMHTbUehTJLUorrf/cmoQO4OqD2nQISc1dqR3jfigF/r6hRkXHIY1RBJOHGF16r6YY13BB3
	vM7i1aRsjLncFdNUgevQo3rYBaCIsWkB+A==
X-Google-Smtp-Source: AGHT+IH8putBj58H1Qc2/Pc5IYBftrUEfWyIiIH/BzccCEeS7d12VbdeMMF1dKqYrd30iJtTHLg91Q==
X-Received: by 2002:a05:600c:350a:b0:439:9b82:d6b2 with SMTP id 5b1f17b1804b1-439aeb34f86mr181448335e9.16.1740501189564;
        Tue, 25 Feb 2025 08:33:09 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab153a7bcsm31838645e9.13.2025.02.25.08.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:33:09 -0800 (PST)
Message-ID: <09eafe54-c262-4db4-b11d-0644a1f90a14@tuxon.dev>
Date: Tue, 25 Feb 2025 18:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Add System Components for Microchip SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_083311_489756_0D0DC0EE 
X-CRM114-Status: UNSURE (   7.44  )
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



On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Ryan Wanner (8):
>   dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
>   ARM: at91: Add Support in SoC driver for SAMA7D65

Applied to at91-soc, thanks!

>   ARM: dts: microchip: sama7d65: Add chipID for sama7d65
>   ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Enable DMAs

Applied to at91-dt, thanks!


