Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725FEC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90tc0lSyWtKHI8QpJtp+rcsL8Nux7GNqdacUEsbn9iU=; b=hnLdaYlC1BWBJVXLMyhv4vbaiL
	kkouAJZ3h4kby6ZuHZQucqxYEKOPzQhbjJwLqEzmayNCLNjkcezOkgG+DoTkAJ++8TEcp2L/e/EmV
	YOu1h11uCSmUUtmnkfZctPxy9kYZf9Mjz2mZ5iMrMqELQnjQTpqrX7z29L4IOQ0oG1lP4sdqzYWs+
	1XxNvCq1NIQa9IPqnZROl1LKbj1soHoCoGqBKZvAde7BLK3Y5wNG/idfAQlllLhk+2Nl+rwTAO98n
	26P0GIUIPw2Qs4um+wQYOjbx8E2HkURu13Dwg8V7uUvDSatOUS877fHrqVmUBXdZfXUPWyQLMeaMr
	Q9K7k1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJIe-00000007MPm-0Uwj;
	Tue, 18 Feb 2025 08:49:52 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJEV-00000007LNP-3VX9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:45:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so4324130a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 00:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739868334; x=1740473134; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90tc0lSyWtKHI8QpJtp+rcsL8Nux7GNqdacUEsbn9iU=;
        b=BA4yBd/7G9sr16BNKDnQj1xoJDHpuinGkMZ/qi8UBqk8nMSQfKEM+5rQPKT85km8Bx
         9aPUl7T7TICuVsJwBekH3tIaht6L/x85k82xcWPg2PsGEO7qmKi4oKRArKMuNO+eyEqG
         Or/dXegjKx7jIgLlypmqxtZ5Fsy+oJCbnrjb80Wgz3IPCVTzE+QwQ7MyTBxK3OGR/LAd
         altNC+34AKVShsWXQZS4qZ1eyZCDoTTwSzOqlGY8JvGZwbo9m4/nR2Civ9/bCzkrNO2J
         eZUUN5eizSqLBJE5d3hcIYNsXD1mnx5ciGPLaUKZTrcswsP3+5k+QhnCUjdUVEDUu9fx
         Q3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868334; x=1740473134;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90tc0lSyWtKHI8QpJtp+rcsL8Nux7GNqdacUEsbn9iU=;
        b=F67RBuFOHciqQMeY836Iw1/6XMjn3UrBUju+iBlOHG38ZGIfodNaPP+o0SnuebYRk9
         JvMTqDqzQATtYuNiqjYxgo5xA1UiZquOZOvdozUFext9jKrk2oIfL+goIzv8rdd/jqiK
         p0gtrgWJR6oisI6NDGphxpiAKLJPJuI8u6k5NrhXddyBL57JKdY7ibOJgcDxSqjrqF+2
         pke9mUTxnvZq1T0lq+JBaQ+AlQkLduC2B43PG8w5xtSD0TbsSMcUxyxLdhwcLtXEflWY
         2oYRlQuI0s4IlE2/eGLusPy0yHhFToNMZvIuviwG/8aekdRpysCHnUVYBw5ATkZkHfDW
         t0kg==
X-Forwarded-Encrypted: i=1; AJvYcCULQAz9IwL7p6BFObVj3WeeYmX7B2wIFQzhqJoKfH8fBHeZl9L+1hSddvOBwm0XmIanMukEJ0EVjdivhmsD4PqH@lists.infradead.org
X-Gm-Message-State: AOJu0YxRnjOhiA1P6BlJHtHAzJ2cmIoylynagPyFq8iqBVd36VFvi+rw
	3Ur7IFjZgTveEnDU8GaHP3mV9fMSgdcZe7AhNWUWlXTFeglOUHmmaMHnr0k+2qE=
X-Gm-Gg: ASbGncvUMGB8Cav7xHVysbgPfIouuGQW9omOPdZNG5dnVhY2lbj79tKWQG0n3lR27zR
	9xhzwlt8fGXn8woYHT78dsIek8hVTxLVkcmYOtY7L9JJ3PH5UbTbXzgeIEUinEaw3CbvYDKfnjy
	XShKFtljvMBxIkz1IxzsGNKmp+ehFHwCSlAgYyG6l3HHknPUT5ObQ3isyIUufgfZ8PjBekFGEzp
	wH6Fzyp/isr0EVL2quOribg3ef7Zp2liX6AjxWTtBhGoCIKwQdRMpfxg78q6/nsZwK9AZslPpaE
	JY8E5a3FoA8eMWQz04HLjfU=
X-Google-Smtp-Source: AGHT+IE6QhNP9qus60hH980Or3o9glxOLiLFh+HKOIb0j8s7OisoSony1uEEFy0/ugn7AUW+SZW5ZQ==
X-Received: by 2002:a05:6402:348d:b0:5dc:882f:74b7 with SMTP id 4fb4d7f45d1cf-5e0361747fbmr14622769a12.30.1739868333880;
        Tue, 18 Feb 2025 00:45:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece28808fsm8201968a12.75.2025.02.18.00.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:45:33 -0800 (PST)
Message-ID: <24351fe0-c4ec-4225-9f92-b26392a858be@tuxon.dev>
Date: Tue, 18 Feb 2025 10:45:31 +0200
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
X-CRM114-CacheID: sfid-20250218_004535_878068_5434C46A 
X-CRM114-Status: GOOD (  11.75  )
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

Hi, Ryan,

On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for the following systems in the SAMA7D65
> SoC:
> - DMAs
> - Chip ID
> - Dual watchdog timer.
> 
> Ryan Wanner (8):
>   dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
>   dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
>   dt-bindings: dma: atmel: add microchip,sama7d65-dma
>   ARM: at91: Add Support in SoC driver for SAMA7D65
>   ARM: dts: microchip: sama7d65: Add chipID for sama7d65
>   ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
>   ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Enable DMAs

Series looks good to me. I'm waiting to see if there are comments on
bindings before applying the DT part.

Thank you,
Claudiu

