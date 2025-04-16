Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23491C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=; b=nehkx/y+6MaP0CWvu/0xouSVZq
	alJrXytWyUc7AuyPOzjInwPCCYt9k36ZptSazhh0lVGG/UDDpdVEk7QGyngQzf7pZaLUW0i4xnLmO
	WubQlAxNEOfEu1qMkn9FJEbmnXvrQfgaiFJ4MchncWvJtIIoc+DAZCMy73mzQB1n3sydDM+AZJFRr
	KcEd7tD/L3WeQ0ivnIFyZD6ul2XV6Taqyu3VLpcbQdOZ055lwvcICWtI9BHNOW7pqi03ODjIuf6Vb
	stOcjS8+oGk6wgs5pRfS34yUEPTJFuVGJGcl8UqXs8L91sc4Uh47vv/RAZtzN9fiGp5nS0toFqAfV
	9pIIRd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xUr-00000008gPT-1QV3;
	Wed, 16 Apr 2025 07:47:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xOo-00000008fCw-0Jtv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:41:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac30d4ee128so93824066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789292; x=1745394092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=;
        b=NyBimBmzyeIdChUW7/PYK6nVW0fwvW4HDC0xdUQhnFHeNwqEtLxaoT6EXzOyKBSi10
         ugfymjmJ+9yj/htsV6aaPaMw3e9wHRQ+g/gM41Abgl0+FHrz2dcUP0P4FAEklND8LvVm
         Bhh1RB+Qbtl9ArSanm4RFj5lpeJOOz7nF3OydCUinzXrN1eKS9M0qYj55O60p9jpnBtZ
         myp66vHQACayIzFsaqMviSVgHDo+sWZh55cWocIC6SUDqzF2qwrx93ACCSvO9CmMmNmM
         Ny2d/rSnRabOrYFb/q1YDeap2I4v3MZ/p9Gl3p09bQeepv3snaXkkWp7ytIOMfw9KfZm
         76iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789292; x=1745394092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=;
        b=h7aDbW/6Orlyx8IwqF5mO1UJcna1elYwwO8ojlXjR3ik06u1kxS9jQnNZ2opCbWH+X
         +sqWGxQIjpPN3hWgEoHt4mT2Jetub4UlCWXOw9sxDzirEnG7XmRh4Ze5pXk8P2Hb9nYf
         wtEfAtl7jeQZE+oZ0D3ZpqIKilFGHoc4/eRHmf7Lo29N3LNawkXOUreSv0H68EF00qJ9
         skgXE2OeosyYPfWGhfbhIwgL1rv/z9iDEqC4NCpyb16bp/VkEdykBgAzkb7i+7CqOxer
         tR7Q4oKfGMwjEv8Qsovp0defZDgZ7/NnQ62GwBDNycqXp9QVRSF9Y9ayHxe8WaMqmXPP
         K+EA==
X-Forwarded-Encrypted: i=1; AJvYcCVdn0MTxqxAUDMz5IP1TGs4zV6c1b5g9DpDIwSyrZagyW564IN7eYQdvQ2tlmuH1M1+m5y6wvtZotJ/qmiVwLxz@lists.infradead.org
X-Gm-Message-State: AOJu0YzUpebKujsqy+7adQPln3pnkHGqnqguD7A76TzR/CH3mwEKWgPy
	fc+BfUiTLNwuL19VeBgqMXpoLRpJz9ZRM2N2FdusHhbDj/gROpLrhfHJQn02KwrTz2dXn7Wn5f8
	u
X-Gm-Gg: ASbGncvDLKAxwTt5Pr+brytiMlmYKA73v+0xpvyoIccU/CxtyljYP8fcW8pWUPgVO+6
	dyU9CQMzpYUSMqtsC1FEWWOhghNKzz2Uhat4Pbpa0ZGEzpHsRoZxb93k33FCWKkXcCHkbChvuZm
	GCP33GXyIwCQKxease8UJOUjdTEOrqmRvolOPGAQxIIWUGzDVmhE7xKPslSFvnYeen73vlxdVgR
	k2Sz0hIv2K2E2i1VBRPmuzMUPyw3aq3HJr/jZa1tJty0v0zm2wilBjEAg3cATd4DQe+mGpSYqkv
	Cvu4dTDce2EAeAW04Y3SKL6qp1jOWRzRHuF8hNCJlLbUSyT+gMkZ96RFcF7tz860ciOhzB4pYS2
	vkRE4ORtbWISL2nU=
X-Google-Smtp-Source: AGHT+IE8h6ZIusbOx2fa72lKxk2qdTusNLhfSvFACqZPuu8uuX7bjmdba+8fMR+GvnuolveGcRCPWA==
X-Received: by 2002:a17:907:7e81:b0:ac7:3910:17b9 with SMTP id a640c23a62f3a-acb42c8e771mr17201766b.16.1744789292298;
        Wed, 16 Apr 2025 00:41:32 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cce01sm74205266b.160.2025.04.16.00.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
References: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: Align GPIO hog name with
 bindings
Message-Id: <174478929099.20468.14418379313255979226.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:41:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_004134_141884_5C38C573 
X-CRM114-Status: UNSURE (   7.11  )
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


On Wed, 15 Jan 2025 22:18:01 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
> 
>   mt7622-bananapi-bpi-r64.dtb: asm_sel: $nodename:0: 'asm_sel' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 
> 

Applied, thanks!

[1/1] arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      https://git.kernel.org/krzk/linux-dt/c/6e3b067d3c5e00dea2e38c609fcd247baa74dec4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


