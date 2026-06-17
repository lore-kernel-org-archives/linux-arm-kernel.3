Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635E3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCIh60LRye+N284J4p7MbAH9a0i1PCeBDLVzI3j+pDY=; b=UlcX8bPsAsLJdEDj7eVkcbAkBH
	OpouEJhcDz9O9135LNdJaRYxqV9QpZfh/NEOddb//W4a+QZmq3uxW3QvZj1SSCiiWdQktjdCAHsAV
	uH3kscU52SsPY+Ugxdhi553hMnbEJkCK/p4MSuoV/9v4x05FGFbFERzKj/TEUENDyclgwzp2IVD/H
	NOpS6XPxQ7PeIncgVcfj/37Q5u6F29rpx+07ZLApjI4tXrrN58kQafKPUdZHQYYd8uCt8eogAH8Th
	Ti4gZuOY9mFREm9u1RzPTTQGLOlD/YK4mPHX+fk3H6235KW+WJOwxcCSLkLO3TCHLpXtFVkZV9qRC
	PuCqFDdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwDB-00000000Gms-2tct;
	Wed, 17 Jun 2026 19:46:09 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwD9-00000000Gm0-2HYP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 19:46:08 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-13981833e13so198022c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 12:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781725565; x=1782330365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jCIh60LRye+N284J4p7MbAH9a0i1PCeBDLVzI3j+pDY=;
        b=PAzd9LoNVEnrdLQhbT4Cp/VMnQF3CX7plyMJyxbRmtaykrTepLJJ+Nb92GabCi2BL0
         ZeeXw1ZWyGoTd2jjHYLbTuLA066yhXHA1v7YrDQnMPhcClx3bf+gCiqB7+DZxepL80bm
         V5047MyMkhVMZ8clw3xZIRMcT+j7TulyBssSFdpc4vlAWEwRRpRb/tc1dTNUNV794cc7
         aXcPUq8yj4noFHXyeucwp/aRMAVW54SrmNdKWKEUskgUu76ApNGYNCwG7RKONgakLc8j
         gJyJBrND5uUHsNRWMBx2ZL0DqBKWJunFsaVjbANec7XpKxM5ZXFMGTVcYxkGMnq7MMOE
         W8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781725565; x=1782330365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCIh60LRye+N284J4p7MbAH9a0i1PCeBDLVzI3j+pDY=;
        b=mBTF3SFx8mOzsk8NtEGRvbqyVndCi4FKDg836h8/5K+SwOZP1jUgHiFuChGrRpMLKj
         oJB9OPkgDpaOAnaE2O+j5J71TWyKqON1kG4+Qb3rJYORoR25kIziFyCBG1u5IDAEwTQd
         QCohxWwResRW3q++KVbMbCuje+QN34qh0uB+jDEc/YpK7/Mt+kHGxTRRbSzJ7JQLdlbE
         BpdffMBtoAuDjD9LZFe9vXmBnTsFdKt6Z4wsLgCleirM6n93CNj6h9TXnCjjvvAZxJVG
         EJ7h1Y3t1NuVDFXDmjB5WooGA1CLkDUdzGsEINHsXlD0nA9Co0jjCKzpqzlLcto3OSIx
         PMuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uqDQWbH0E0UE2R6liNNGArbF++ehSN51gbHI+a8I1LaNloX0q2/sO7izyVUGn4kMJSLOx7vVh5h9lce8M2wvm@lists.infradead.org
X-Gm-Message-State: AOJu0YzWTGMILkjEQvZ2kO/7TvDg2iB/ejmQiog57h6AduDJztbvCr2q
	oq+pD3+LV0WvjM7bNfdeDd6Q5FR5TFqTFfPr/2K5fSrLhDBIZgAS1r+C
X-Gm-Gg: Acq92OEZD9U0jekTaSwA22c0D7zU08Zl4HWiKLMLbH6Q7WUGCif8tx+aaXrMWqo2Y8z
	nEEHbTi1HYY7BeRGAcQRJ5C4FhZxk+/kbepFx98vDbvmq3ghEpDpSQjImtuZvTeCOBWtz4uNV8V
	o3ezRPYILVHnqCxB19k6NmyA7UNQUWaiHqtx3Fzae0Fp7JPSI2Obdv41oYQAaUp7FI9l+S+oy3q
	SMe2vADIYOA0i75zPcb+Z0KwCXxfPJIf/K6Jyww5HZi+GBGmoD7IxXfooM+SkbfxZq4EVh484S6
	nRRNtDsej/QBB0haTqcPUWQRtMSc0GS5+aoETgBEqa6WNepF1Dbdr7h7VyyCNBPHNy0flPR4Lbw
	w5JEM8iJBqOLoJE0z5mjpsrS4hMeEuZGG1hElBleSTxGRthJUkYrY3w3dUEcfRdjhh06iHFQ+7n
	ygSvHXCaJGwOOXCUngh3WRi39lcFULtJHbKgF+GEHP1YLRTDrvgtrIWUXGN7JEkeCAbVD34d7O
X-Received: by 2002:a05:7022:fc07:b0:137:ea00:3f49 with SMTP id a92af1059eb24-1398f6cb641mr2356917c88.35.1781725564958;
        Wed, 17 Jun 2026 12:46:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm24167978eec.27.2026.06.17.12.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 12:46:04 -0700 (PDT)
Message-ID: <13836c1e-8f38-4cd3-aa7f-da7c9caf15d5@roeck-us.net>
Date: Wed, 17 Jun 2026 12:46:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: watchdog: mediatek: Add MT8127
To: zkh1@proton.me, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
 <20260617-mt8127-amazon-ford-basic-v2-1-6859e29e72a8@proton.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-1-6859e29e72a8@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_124607_583351_DF4AEE6E 
X-CRM114-Status: GOOD (  14.15  )
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

On 6/17/26 06:36, Zakariya Hadrami via B4 Relay wrote:
> From: Zakariya Hadrami <zkh1@proton.me>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zakariya Hadrami <zkh1@proton.me>

I don't know if I am supposed to pick up this patch. I assume it will
be picked up with the rest of the series, so

Acked-by: Guenter Roeck <linux@roeck-us.net>

for that.

Guenter

> ---
>   Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 953629cb9558..e6e4546da0aa 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -40,6 +40,7 @@ properties:
>                 - mediatek,mt7622-wdt
>                 - mediatek,mt7623-wdt
>                 - mediatek,mt7629-wdt
> +              - mediatek,mt8127-wdt
>                 - mediatek,mt8173-wdt
>                 - mediatek,mt8188-wdt
>                 - mediatek,mt8189-wdt
> 


