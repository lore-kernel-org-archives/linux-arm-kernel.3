Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHhYe6pzYBYGqwKCCAoMr63vtu8LUhyKvXIdPxuXhzg=; b=jCEAwSnm046D7j7J4PrcqEeQkr
	RHWIdosAYhcSV9SI8sFn9UcAcypi5DfoxbRpQAhxzKjj4D8jaianDzysjNiMbLPW8BJF4O59JISI/
	D+g2/aJxHUhdBaJXrU5Mz2YjUgFMbi4ITPb5HgiyeP7s3R5ljHuzYuQBaExBgAp4m/WElR/IBtmKs
	piZZKnYpoI31FIBL3ok7IUqT7rk+lD+5YiuI5mGgjU6PCJ6Mf0wv0yHDNj4Ub7Rh4gjFD6uDhiY5q
	dsse3dY3ZrUog1aQeQx27bAPWVCpwKSoVM0z20rvtjVft0iJxZM7RihS8fsUJG8SH031KN1/KoXFL
	nUKTVssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs1R-00000001cz9-3Yli;
	Sat, 07 Jun 2025 11:47:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrvu-00000001c8W-2t9E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:41:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so5059625a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296513; x=1749901313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHhYe6pzYBYGqwKCCAoMr63vtu8LUhyKvXIdPxuXhzg=;
        b=UWbeBlQwfeJx1eWhv4ydRP9FxPYUkOzzFo8AolwvNnxuyBAtwdulscpT1a4oDuoVpm
         METjoRfLOhV/aB22OIkazlH8yxK5V4029rR852UWHkc9/EsFhmYK0fD68elfLn4U2Q3a
         6BOGWM5jTlr4/Y/TPpQjbKgQjoKGEuMxcvtp9fqI9cmmwz4Q+g2kb4HDQnMoi3K2c5HW
         e+ZmGrB18IN0zFyJciUzW+KmP1zzm5N2F36iqTmZSP1VVDTHopqq9fzKhnpGOongty28
         piu4DIPlUQELvbZKHura7MRKhKlBLKTDHBFezEsR81op16mDxhpvTwvXBtnQaZ26rkZV
         wHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296513; x=1749901313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHhYe6pzYBYGqwKCCAoMr63vtu8LUhyKvXIdPxuXhzg=;
        b=eU/NCOpEmoS7A/VO624WkJu3X/FeHGilssInYIlI1Ks3Rv0kcXjNxBK9sFYehIGpoC
         AuXVG/KQDU74VfcQHiVVGCbnX0FlgqGD/XfFNElTIsZExV8SZN+sBK5Hqrc5VzDS+DhZ
         /0HTPEKK/l/2CaKSuCVRwb1fSRYHSqWvx5VIokUNWzg2/kJJWe3bgCN/3ZUWFL4mPE0B
         3F/6d0vJikf/G+6GtxneXeHx2MO1yn3VJsq2B4rP5FD0Bpj9QweLfWCpCOniF/+VuSd8
         A0+YscvGsR0n0/Ca0Or6+dXkmN3/3k+M6eAlqnCbXodTxwXbieihoDXKsE8r5VgmChWc
         GqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhSDPHYniRCJ13JAb1GpdndX1C/R/aWIsGiQOps7JLYbgMrzyJRD7zcEXK/whSENzapyGRTVbiWakQCqqx8NlC@lists.infradead.org
X-Gm-Message-State: AOJu0YzXdkXV3Th/TJP+znE+R66itFbnX/cOfK9TBUPpJf6+N1eUGAdj
	FHoo1Kuw37J1ZySYgCNZFhblMRI3mDxNVXItWBie0989rZ4e9wGvbMOyaSWwloRJnwb8BBGy/Oc
	yIQA8
X-Gm-Gg: ASbGncvzcyvHmznP00dNOPF2YBdzM0Ki5elQWMhCM+7CSBM/G89LZqYBQ+oSh0LfTjx
	XL91EAr5YIaYJvJ9CLEGuW2yaltInn0HAcnk9chPKeJE7j8XGz18XW4Bqbgn26QdNzD1NeJJP87
	Vw9ltNLcAbxHWKwDiQqq7hCgvL0rxpsEzx3EN5awaLUGsGnzkstuh3ChT5pJrvn6f2KkPJo0zp2
	sLKez2AFJsuluXjMYrlGBKzqPx7uy1Bn+yLEOg90cWh0hg2WHJ3wm9ec25lHK54uoj27kmBXlUN
	q8et4sOn81/iXL+HZq7I3WbNSiG8phf4N0EKSLCwYesmQKHjClIxS9aqJKYJ694pg7+m6T/M24t
	Uc9HyDw==
X-Google-Smtp-Source: AGHT+IEHOrHRiEO3rlu+EznwzAVzUrSE49TkufXjg7ZU/CfkAver/3Sye31MfxSallpfyQfqoyrzfw==
X-Received: by 2002:a17:907:7282:b0:ad8:9c97:c2dc with SMTP id a640c23a62f3a-ade1a9fcf5fmr648072866b.15.1749296501262;
        Sat, 07 Jun 2025 04:41:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade38c11d28sm137366866b.12.2025.06.07.04.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:41:40 -0700 (PDT)
Message-ID: <84184dc6-2f6b-43ae-ae44-c081b8d510fa@tuxon.dev>
Date: Sat, 7 Jun 2025 14:41:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: rng: atmel,at91-trng: add sama7d65 TRNG
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <68e45a56e70e0b0b001870905917e8f7ddac61a3.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_044154_731602_F34E199F 
X-CRM114-Status: GOOD (  10.85  )
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



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add compatible for Microchip SAMA7D65 SoC TRNG.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


> ---
>  Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> index b38f8252342e..f78614100ea8 100644
> --- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> @@ -24,6 +24,7 @@ properties:
>        - items:
>            - enum:
>                - microchip,sam9x7-trng
> +              - microchip,sama7d65-trng
>            - const: microchip,sam9x60-trng
>  
>    clocks:


