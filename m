Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B7CD232E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCATHpfSTDghhKkbSXzztYNXKOhyLxQs2uh8jItG6fI=; b=wU4A71lipQ94Kt+YBZIhQVVEUJ
	TGheQIhwWYa2sVVxWGhy/vfgDmEZygZEB2LEqQ9Z9SGWSjKXKDYlWS6uoFtfWAGsep8LzP2qY9LQe
	/ps/nuj/4O8JPU9t6EfVZQruzpq5ad+WppWo/hF9okWVvnW/ovjKj6MDu0CpEbSg/9gAH1N+hnMyA
	Ku9HtUzd5DJ8Le2zopECCI7XoXkU/4HirnWOlWrRngvqa8FOJghliBhPXvxkNj0WaKpuabzgDRFZ5
	JlofcS2L32HLtW7+ijLKlFmbysWv+B4dYNF8BMZU+ynV1XTCSpHx1ABvxT1/ZLfW9nURsB6EAiTFu
	Mzsxke6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6Rz-00000001dy2-0rst;
	Fri, 09 Jan 2026 06:58:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6Rv-00000001dxA-32ZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 06:58:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2123413f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 22:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767941897; x=1768546697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCATHpfSTDghhKkbSXzztYNXKOhyLxQs2uh8jItG6fI=;
        b=foqoopoVLfyL2RGjXkpyyckYGKAdFrPOgF3m1Lv2n81FPguHkzo85rGWGG/z487lrW
         Fq6HhwX9ZowPK50zErd7gLLFhguJknjh1pc1sQ2sRrzqDELZmvwpd/z40gDBKelqD6mQ
         SiZpSJVZh1UnEupUMuM/G9bwKgRPzI5VaVUcN9wtWmMnxVEEKqprizGpdNC8vemUIsRp
         zsJy742gJBwzp8CNVzTPqHX+vTOQWEL8YipdT39m5fGB0nSGiQYgQsPc2LkfLxJHQTTS
         k7Ufb3B2TvTzL8ekVa4DR4DxcTi+G/NGtCfntPF9lHzDLPMQJwqVZeJ6VU0p8GD9uP17
         x2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767941897; x=1768546697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCATHpfSTDghhKkbSXzztYNXKOhyLxQs2uh8jItG6fI=;
        b=owJrwxY5k+je8s1gxcEndbfe7/i8zwl3a72ZA8DAGOREOxaTHzB86yIrL3WlQ4An37
         kAEL4D6Rj1YSpLkG+rDCrtW3iTPhysSdETkgGGtRrxRgDKYfA9PjLAc3P7pNs+VpuNSl
         KqvYJ8qGhvqn0uXQ7v1IPJljkCyfobRx/9AKOhWwY/UxXxKYRf0mwrE+sDQgm5zPMxAq
         5g39K/A8CiKbR+MLKK+GlpRYQg3psXrAHHIk79oUQS+BP+E3+rdBr+j3/KPN3oHpk7Fr
         46ZUDBsp52VGZGQuGMVqgVuM/dt028jiIoDNQWNcnDUftLIcgOA7psC/akbdo/g4yYWD
         XMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn7JO0Kflg0ZD2oRWk99xwKyUplMrK/JjvYLcLH7wenQojLdCPlz4RIoLkaE5S8fAvnBdzsyVcAVaSwGhmpyz/@lists.infradead.org
X-Gm-Message-State: AOJu0YzYMMX6bYsaEWd6Vm6vtJyNUJMeohxaxyxPA14por09MFa51l8M
	PD9D35hYAcaI1BB7heOOw8YhqVnurB3/24Ohg+gKv3GsNvNqTtdCXI7Tbpre/V6H35M=
X-Gm-Gg: AY/fxX6FvYt506VbcspQs9PLI13yw8xzopNwE/VFUl5FIAO0m7yswLTBgrhp9SziaLH
	2VBJG6lMYDAsU9V2knQBflVdyIPYxH7mD0MZUGBo7BZ1PsR9nupRQZj3+K4qLOeASsbAh9mfxJp
	2aAbhxVpHkqdp/attt+gXnKAdNG+2unQptpdGuBQHQe0R1GQ1m5Ngq9dOTEoRdATJMdVhL5wnIU
	Du+dpAfr0uj4wzq1hj7lXdUmGY86ds3BFto6oxrA8crYztyXT6p/8KT51qKPZ3bLipwt7vkx1Sk
	BbOAp0IetaTVh5oH/p/nOpV9kf8kz2aG6zhEevODbrd01//zA3STa+SXScUdxae4dPd/406WYeE
	s7b4heo2EDtSXfR+CHR4RhlZ0lO2YIv6h5NR0Hz2dLV09+Kd5nTeqOtGhHEScJGpcMTTDiT+nx7
	eXuvC6U2SjzkMDk6PZMw==
X-Google-Smtp-Source: AGHT+IFhRTj7HfF5EIev9x72guOLVjFUDE73P62Uejq5IzaIZTiIGw93PXzCWqNli59STc4Xn69Qdw==
X-Received: by 2002:a05:600c:1f8c:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47d84b40955mr92197345e9.27.1767941897174;
        Thu, 08 Jan 2026 22:58:17 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm202744775e9.13.2026.01.08.22.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 22:58:16 -0800 (PST)
Message-ID: <2c3bebff-41ca-49f2-a8bd-e51d630ee7fc@tuxon.dev>
Date: Fri, 9 Jan 2026 08:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] ARM: dts: microchip: sama7d65: flexcom nodes upgrade
To: nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260102170135.70717-1-nicolas.ferre@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260102170135.70717-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_225820_096746_20541B2F 
X-CRM114-Status: UNSURE (   6.32  )
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



On 1/2/26 19:01, nicolas.ferre@microchip.com wrote:
> Hari Prasath Gujulan Elango (1):
>    ARM: dts: microchip: sama7d65: fix the ranges property for flx9
> 
> Nicolas Ferre (4):
>    ARM: dts: microchip: sama7d65: fix size-cells property for i2c3

Applied to at91-fixes, thanks!

>    ARM: dts: microchip: sama7d65: add dma properties to usart6
>    ARM: dts: microchip: sama7d65: add fifo-size to usart
>    ARM: dts: microchip: sama7d65: add missing flexcom nodes

Applied to at91-dt, thanks!

