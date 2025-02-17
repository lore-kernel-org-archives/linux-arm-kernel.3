Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9938AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7IRtN8hL7QiRgZjNciVRBb2qAyw0QTuXI/KIuAzjG0=; b=3XZmxet94DkEH/
	AAvULMoIOSkXTvvuqx2a+GDD+UJgmwa37OmS6CZtkf50TJ1L24nMnMmIi8peAozh+L9lkwhx3hcsz
	L1K77bJcgZaso7Dt6T7hoxyt2MmS5Jrx0mVyby3FOjpuzpcoshCZJ1hWqLriWCKm/zZd+mcQwieG9
	fiBi7ObcmwY5ha0VzEryTjlwIHhkxUSPX6DHwryCoAKcaerjDLOxzok+XIMisSvD8pFgdHQDI6C/p
	bLLuJCj8eJtfCgDXG++ACCLe5N7l1FORsKtSUqjsSny9maK9ZysV57FVQ9PW3yhDSmU0dg8yseahx
	95L8GpAgT+5Apkvf+qwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuhU-00000003UPJ-3G9C;
	Mon, 17 Feb 2025 06:33:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjug1-00000003UCp-47Gm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 06:32:23 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abadccdfe5aso408094866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 22:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739773940; x=1740378740; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7IRtN8hL7QiRgZjNciVRBb2qAyw0QTuXI/KIuAzjG0=;
        b=nvBBvJA7EzFTWADEM1UYXPvWvMy4kiYFXgo9KtKv7K/ox1NY6CCcaCHfRoA9o2gce9
         M5Z+aP5TfJEFArxLhI0gWsZaS8EfiKvRk64iqYE27WZE5+pB/tE/8eW/Zlmdm8ja9CVA
         KuivMe74fVDfs4XL9hCzzptEOK/w41muYHdgUjfWh6wX5KyBoQ79AiXtYfKZoFq/dlkX
         j8fGoIww2T4PN6ajU/305J/wYqb0y/ZgVyuRqaHVStcTEQ97vP/Vm/aVYpSeKfqWbwVH
         xa9TJuvc9wJm/G3KsH/BOPDP0SQmNZSrUmiCLn67w8PXv3ip6CWVjvAXq633gOLfrL7j
         Lrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739773940; x=1740378740;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A7IRtN8hL7QiRgZjNciVRBb2qAyw0QTuXI/KIuAzjG0=;
        b=ldUSN9/xAjMC1+DF48posRjFDFABCsphjusLnlvYUIBTVZ+O7g+5+3Uq5JciEabsIK
         jCMWUtwdZ57qaSLN8ALWBoHBtOU1WKpeRVs8Otn0CkyREa63GujIGpHYNevtuhWkN0Az
         fnHafDN7XWlEdGXMUGLIeONqV/HiJ9Xz1KKMAegCr/sMWY7hl+IRUlNJJKJedy/x6B9W
         sB+RpDMaiLCw7oq+LHvM0Qxp6J7bd0jL4JVprRHryVEx5SSN8rrqaM1rInfTkgl6yu2L
         IVQEc2l3h9hHOahthTTmY8n6glB+cybtee8ARnh1VcKeTs5jsTeCFeeDvmmc0dCMwzGg
         yKuw==
X-Forwarded-Encrypted: i=1; AJvYcCUZkRqkeeH5EXHxQo358CzfgLPK15h5o8cvbCkwmKYoicS6AiHsiL3YOQyFm1M4NzHkVqUbKHObMPLyjR6SB5Dr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0mxK6XcqsOhtwn4KTAaMF7h001/oPsTP2SXKQ2NLiKS9rgb5I
	mbwDl6tKjX3pJu0RVdaUeIE/QF6KxKIIdUjRKLJ2y08exE0Tdxv1JvOG7FwrLTg=
X-Gm-Gg: ASbGncu7tQ4NE0CvkqeKSPX4jpGTLUb0n3b+jXPpLeIekfncBUhp89ucuTE3cck8Erm
	5DwNEv6PI2EwR3GFg0RrlsH/dll0cqsNaPCB5BcnvlPGm9MT9uqpuT7uRaumDXm74jvUPoH0jzn
	Ej4PQmsvRN9aQ86/n4QB2oTWtzowW2jUZeqwutEbpAXsbP0867HGwwLPLmyROrRTyF92nUUmvTK
	gbQ3/lViyytmWLxZ1qeinbwFkIanCJ8vkOKfyDflRRVm2pETJd+saVFzd0bDThRQbfp4KPBRUHE
	//OzKWOUCRbvu1/3LmZsui8=
X-Google-Smtp-Source: AGHT+IHc3CgKCuw/Tn4up00Ngrqvc2HyPAuBwXc68KPmWOuZltnaa+t67OP6B/OZ8Mij+qQs5NbX4Q==
X-Received: by 2002:a17:906:c154:b0:ab7:d10b:e1de with SMTP id a640c23a62f3a-abb70a957aamr879561366b.13.1739773939801;
        Sun, 16 Feb 2025 22:32:19 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb86c9320csm315074866b.55.2025.02.16.22.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 22:32:19 -0800 (PST)
Message-ID: <75a6f8b9-bcfe-44fa-897f-6b800000ef10@tuxon.dev>
Date: Mon, 17 Feb 2025 08:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sam9x60: Add missing address/size
 cells for spi nodes
To: Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org
References: <20250110144159.379344-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250110144159.379344-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_223222_133007_D1B7CB4C 
X-CRM114-Status: UNSURE (   6.25  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "moderated list:ARM/Microchip \(AT91\) SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On 10.01.2025 16:41, Alexander Dahl wrote:
> Complies with generic spi-controller and atmel,at91rm9200-spi bindings.
> Fixes dtc warnings, when actually adding spi target device nodes on
> board dts files including this soc dtsi.

This is already covered by commit:

f0127f66528f ("ARM: dts: microchip: sam9x60: Add address/size to
spi-controller nodes")

Thank you,
Claudiu

