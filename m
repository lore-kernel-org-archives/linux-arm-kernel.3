Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F5EC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKxSQoBGw54Y+lQ4k5H4EjBxGSd128527Jyb0EoThZM=; b=WL6XE9FNEKK2I5EdDPPABnS76I
	ws//bvqU7+beILI1rEFTRiQOzV0jvGK+MabwuMz7zFxFIoum1Uf+w6ZbROqsRh8eq35yz0ykik+n/
	sfD71cNldvPZY5LVQwBfc+4vTMZWD4R57uVsH2lqF4wdRNCQB8kO0u6OxTqyNCwEHKzBMZsnyS6EP
	/rIAHbtem//CB+2aC7RASeWuTUosF00pDfXBlJCzSTdn6M98Sdrp1/lhATFQLMWKtZurmhqL4xYST
	t8SIy4ilN9mcR1ZbOiRqM2dO+xiouvB4+khY7HOtt9du0+SssDGzXf24R9+MA4n6uTf8iFOqWI2v7
	17RucERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyMY-0000000Aivm-1WPI;
	Fri, 28 Feb 2025 11:17:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxrv-0000000Adqa-2jDX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:45:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso1558643f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740739522; x=1741344322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKxSQoBGw54Y+lQ4k5H4EjBxGSd128527Jyb0EoThZM=;
        b=YrRCLiTOFNzDsuJ60aZwE3c95uYoCP5USk4zWWLCS2ArWbd6CD6IgWABN8d6IrEfsh
         +WoBYh4LxcuY1QSQkcINWRTnfsy6v+jQV3/YS/+oEvBNn2NrOlLkh7yQlY2FS3Lc/2PM
         p/zs7VvWXyshm8ZW9VhH/uwLsLDkis05cr9iGfc/RciRP4BQiVdiAKOLDFKsSoYYzB9Y
         XUen6EGy62QEaAhHadHs6QfPC7jQIx3Iyn4PJrMgu5uQG8qXCvZZ5aXkMYWW5Tim2HXt
         ttVKPOzsVwZDpTUDg1E6QS8ZssjxOkUkqUddfvqEJ+RllZK+MCBrURinMq5cL0nISOmE
         RJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739522; x=1741344322;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKxSQoBGw54Y+lQ4k5H4EjBxGSd128527Jyb0EoThZM=;
        b=XjWWg2ybwFYSooAZDtWokPcSYTzWOMM4AKbDTxu1u72Gt2e6pQtJBBi+OFbrhHbRqo
         iocMduL+1n8rjnVfu57Ayb2zC/Q92V+ELepUE6iJ0/d55Ek2mDwjy9DqaJtdRRgzTB/i
         gJ9mVGlJOFaNrV/mQ5R8kU8uMS/VxhYIL5wZej/l7xCqJFXl+3I6qxMlCtVM6UmCV4zM
         Nuut2aUCPwU8lKuHq7Z9d/x6AHi6RVfMV6SlaHH7xWVEh7bjwxrlNIMnzjxvU4jNigR3
         E+e0zicUWMFrXPflJk7Vde+BES6uVk2mqBkHmZj+mjPGKSQnH05zDcmu9s+iXWGL2PLa
         wSog==
X-Forwarded-Encrypted: i=1; AJvYcCWS7O9sJ4VFnlW7L+A6YiwhTT7yiMyeq5BRHy3TakZBVgjQZMAkOvCARLGJP8EdmUBnvZgIusX8KhVQw78MG1c2@lists.infradead.org
X-Gm-Message-State: AOJu0YwdL+e/oRWTltfSHRy8ofJ2OB+xjIXlsFcplBpq/ljR07HsIiEJ
	LJlLGHKNfwRSVmUK+hI5zAcDfd9jZTLbnNGsKfvQV+CqvXjuqLMjDtxp7MaaxiU=
X-Gm-Gg: ASbGncsLqnnHkGwSzxWi1B84choQFcabd0EONkdB2ld1CJNvae6DMkenBSdMaamlowe
	7XE4JETuLX5fBK6uEz2JbCWdF45t/u7iMq0SHa4IFumNeVFUQLjoCI6rZCSBZkkjKglj21WeUUb
	y1Wp4QHoX3VvOhP+DCG9nw7UpmWxW7LE+M+dTEto7s608P2NgBiOTr7Y+GvguyCXyxuqTzzoHRq
	0rIdlKRXjC4mN1R956DxVQcbH1Xc6j41gDgyojPElIHRfhnNPnY0HXh/qJ/o+TFYo91+YaOs6QF
	+wZoL6HmiG2cIxtN6oYopyODDgfAPO+AFKE=
X-Google-Smtp-Source: AGHT+IGA8C/Oyk3lPD53/6NcqMxjrN9/qHSMa0fAU2vOWBAuXi/WKijGjjWcS14XZg9IhC+2eaUOzA==
X-Received: by 2002:a5d:6da3:0:b0:390:eb32:3fee with SMTP id ffacd0b85a97d-390eca80548mr2338870f8f.49.1740739521706;
        Fri, 28 Feb 2025 02:45:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b2fsm83499395e9.10.2025.02.28.02.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:45:21 -0800 (PST)
Message-ID: <f1a6e60a-1cfa-4f61-90ef-b71f4a92592f@tuxon.dev>
Date: Fri, 28 Feb 2025 12:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: soc: atmel: fix the args passed to AT91_SOC
 for sam9x7 SoC
To: Manikandan.M@microchip.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Varshini.Rajendran@microchip.com,
 javier.carrasco.cruz@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Dharma.B@microchip.com
References: <20250220055302.284558-1-manikandan.m@microchip.com>
 <109244f2-89af-4e08-9723-db6c6b0b26d1@tuxon.dev>
 <7c409d23-f607-44ae-8fca-70e10a7094db@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7c409d23-f607-44ae-8fca-70e10a7094db@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_024523_708182_68E61DF8 
X-CRM114-Status: UNSURE (   8.61  )
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



On 28.02.2025 12:05, Manikandan.M@microchip.com wrote:
> Hi Claudiu,
> 
> Apologies,
> We've just received confirmation that the sam9x7 SoC does include an 
> version ID [3:0] in the DBGU Chip ID Register and this will be updated 
> soon in the datasheet.
> Therefore, we can continue using the AT91_CIDR_MATCH_MASK for SAM9X7. I 
> will send an updated patch with the new Version Mask Macro.

Thank you for letting me know!
Claudiu


