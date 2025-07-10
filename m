Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0656AC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc3P5Oeg2bmqCJNQbYoEMD7h352Kk7u8cbR4u9q01PQ=; b=volaWNsFj5qj5hmSp54zCuN7C/
	FG5fwNQYnozTNwv0VmLHG4eXiA488Wf2arJ5P9F6kDeqbwvyfn6UYAH45V2SE9/h/Z2pNyfjyatCx
	T1f0AhNkGzyvnya1M2cdXoVA+IATIO8W1bITGFPDa91IJJKu6+ejLnZoiIsSssMtyT3F649lBczyo
	ia0s0RhxrsGeI7CG37ZwqMfANPSmYJdULHTrKlkjk/+D8jyKh4Kj96iycNzBVlt0Or4mURKTLI5z0
	zHfmy/duGUSknjZCxpI0vlG8ICl7DWSbTtXFSL65R0q7vMBFGF7yhpyJC4yviQlWvdMi61gdlvTZY
	Egr4qaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmuS-0000000BDyY-3Y4A;
	Thu, 10 Jul 2025 08:45:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlmo-0000000B1aY-23DC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:33:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae0b6532345so322011966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752132820; x=1752737620; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dc3P5Oeg2bmqCJNQbYoEMD7h352Kk7u8cbR4u9q01PQ=;
        b=FQP8CSZEkKDI8HU/HUiJTX8kMIHtXXBqYkzXKOkcdCsncSdU6zj39ZDRbuH7NvbQyx
         OV2rx6gUNFrItIRlbjW7AmXUgT6GVzlgmeOLoVehZADHVqVNzUKp6a5gOgvwrySBqYjS
         N4PMAelaY+u0cevTk6k6uhBh89733tSG1RfQ47MscQD1OzyWGg+TzBOtsWWZiWfzqyXn
         IgyI6aR20TbLTY/KA1Otpoo0QNJlUGoxzTWJyyOpw+LKnTMga9FlWp4leeBlX5Wbfbdy
         gY8e3Ph04Wq4/mbc5ktZI2HK1dEqzm7RBA8QYyEdJ5Am1nGkKXXhpAfu/ZX2thy6spsX
         lMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132820; x=1752737620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc3P5Oeg2bmqCJNQbYoEMD7h352Kk7u8cbR4u9q01PQ=;
        b=SWkK9uGVwmyOQqP7ldz7O5qdn+HmEsSu9OjCFLEhKlpQs9bKY3ksLiRP83my8499Dv
         Sil6nZXnyeD6cp/wwz8auUH4cgY+20C1EhRkhzfPTb1xJtAZ0WxbqVm59YLolCoHF62e
         zrHkNpVNGj3PPGAPNa9V9mhNQdGMr3MVrGnVjpVPUt8nsJyiFUvll0GfsKra0l8DQkgM
         XJHZbt0vsBKtoLt6Yoh1hfpItHKfurp7hdWP2n4EEvr1AePZn/3SETQWf6cGVcwDyYj/
         /pK/v55w8ga9QS2In8oHYSwqJPXXNsZVckYW1Zqf+QaLX5AVATKWBZDdhZVVP0DmRKh4
         mL7g==
X-Forwarded-Encrypted: i=1; AJvYcCViXhZAXAUtJdcTVRQXpk6CsEk7pK2EQ4oCfF1PJrSZYBt5ApnTKTEV0tkyqz2rO3I3veyCtE70PYSDrxFuye67@lists.infradead.org
X-Gm-Message-State: AOJu0YycFP0LCB0yknatyfh/uYv/ZBc7ZqqlmATvAJnmgc7iRX0dmpXX
	INMMSopFkp62g+rl3XY0mydM+jecpSDtZ+laHfqINvz9nKdh+5VbFO2zX75JmfVCdcE=
X-Gm-Gg: ASbGnctIDMnYFEHfgt4DoNOhPv6U6jpEvT9fgU0CTG/jPoUezFc1c9kB5ZP/rJp0qGW
	iDAfDwO8pb9gbTzr2bBRFAFpTRFrDqJZWbCByCa2Cq8ZaKQN0WPBWE9X/vdpla8QnXnN42YGLmk
	LzLPvUwfGMU0gTfsinCLoZdJ0dGrp40Osvvq9TW2AzMnzPqmoNqzn2HepjQK4aAR43wws9zxiV7
	YT1edNlEyjytVWWZ8qzR+GQzEz7mBVzthkfP+a06N3M9pX9lWlJ+GZGd6oFOiric7983AfmVGGH
	peec4fgTXrtrYJZDt0ea+j0Vk37iY3dvFvI5ArjRKBPjlMdmXU6nR05jumC3sGfn/d/R0g==
X-Google-Smtp-Source: AGHT+IFP44qvVL01Qb6g5roOyXaKEqhnKPzl7FYoVy33V/zCBqQ1uZivmGf2cxu6nX3jQYwA8oqa8w==
X-Received: by 2002:a17:907:c88a:b0:ad5:6174:f947 with SMTP id a640c23a62f3a-ae6e24bbf63mr210305366b.22.1752132819879;
        Thu, 10 Jul 2025 00:33:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df311sm80484166b.165.2025.07.10.00.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 00:33:39 -0700 (PDT)
Message-ID: <47a9830f-e0cf-46d7-8f8d-344901bb6236@tuxon.dev>
Date: Thu, 10 Jul 2025 10:33:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Update the cache configuration for Microchip SAMA5D
 MPUs
To: Mihai Sain <mihai.sain@microchip.com>, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625064934.4828-1-mihai.sain@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250625064934.4828-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003342_722061_16759A2C 
X-CRM114-Status: UNSURE (   5.82  )
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



On 25.06.2025 09:49, Mihai Sain wrote:
> Mihai Sain (3):
>   ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
>   ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
>   ARM: dts: microchip: sama5d4: Update the cache configuration for CPU

Applied to at9-dt, thanks!

