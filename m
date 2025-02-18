Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CADDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ch9WkK3xb+NyXSKj+cn4pbQshkuRqJJ8wERBuOfV3A=; b=r6Idr+aoixn6dS4JejX9HcnXlC
	sXagYStdbnvZ3azKzshChFtBR257f8b9HhbRMbAFqO19GEJcseUs/CDoRmJZcyZ+Uj8vfCtomArS8
	L80d00qSFoPeHBOBa3YcnPIm9Y22RV1XXWIS/JfdW8+8z3BT8zqKMXI5XyTG3etPJ9hg8t+de1odq
	hSwFNL6SCs13i5RDrFJRzw1cLFRbSOesVPGpnvSnFFw0T1q+mbsCeTL482sR6TDs+nOVhVllhN+Zo
	378yFsBxEFlKGYqU3y0LqCwp4W14mWV5agQDjGK2NxGbW33TFw03nlXCnAR0OinVdDGYi1OgTNztS
	3+0blZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJHD-00000007M9l-1jjJ;
	Tue, 18 Feb 2025 08:48:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJBi-00000007KlU-0u8H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:42:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab744d5e567so962560666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739868160; x=1740472960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ch9WkK3xb+NyXSKj+cn4pbQshkuRqJJ8wERBuOfV3A=;
        b=f/PNkQv62SOO79nJQzYS+/xg/oNOjBc7LjPIBkEvSZ2CIi+m9zkZzTiTylAk74nyZN
         XORLQzEo1/XjlXu3EjmxHojgj4AcDLji08Lqr1a3ZaQQvpSEQdkpk86e4+Wk1vwk6sfr
         Bvmj28O3hNcBOyjNvHb3F5WuxlvW9M7GQmAVx/nth60v746SB/MEYn5YFSCzEnh2963K
         sy7/EgKNw8PWkc3W5+dBB+dE1gYoMnld7dAGYOBP/Z3tecW1BCal83Qjwq/df6a4HVgb
         wGB+LRUx9eXQPp3d+UM91IE6zo2q7gg+6yAfkpheE5jMbasSNlzyiPyMcd8MA8lN51Jm
         Ee4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868160; x=1740472960;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ch9WkK3xb+NyXSKj+cn4pbQshkuRqJJ8wERBuOfV3A=;
        b=IOm7K01QLpyznkWUcnu4jMahdx0zjOQrUTSZm0izrBowMt8LiRylnjvx6L8vd+DQ77
         lphyS+KwuXP2VODpFl2NoKbuzTDbdDRuNI5E11J2WZ2qr79WLkGgVEVzCs223h7Zn5pD
         l/Skzrxm9BVy+aj7uZzUywL1zdFPz0lgmykDV5cYP/ZxJmU1fJYJW28CJ4yPS7eMKBsk
         z9CSbMnNW/Xu5T2CFs17/umN18TUJRyTjp6LC9sr5NQiP2Iq6yU106TyScHboIPLRgcg
         oq5LG2SNo5oEefP7WKwwAjb1++bhkm9dVgsPq0xaGV9gfOqoTWovTDyloP1ZBOR3p+9z
         fAoA==
X-Forwarded-Encrypted: i=1; AJvYcCW3hgeUxXro+KeOY2N5aYVM/kXq77G9tKW80boD6SpbguV0Lni+UhmH2VbpPkUFVWUzwCkcV0mey/2Ds56+1+AQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPDPKu5W+oQRI6hcxDyAoRxM02GEQlv/gxdxckdr9r6F1YDiAO
	NpzJjhfn6Q0bZs0+A3SWsWNjh00zM0pLLG+K5eeu8+UU+9Xyra+O/eNxmE7WWS4=
X-Gm-Gg: ASbGncuPGzADggCi5F5cCF6YWqHwiWHqjjpZY4jNfngJOQiMssr5wFmfBbenJVzpGWi
	eQIWOe4+1Nz3hkinWenSDeWnFIikITkD5hm9L+2iqEiViLyvNMRDQx0UEIs+4jQatW4ETEbmrYC
	4zUKhcIpIMfDQlkAiX/NrXAHQ+uzzL8uDJjDsxKEhnpO/aJjNRftq3lGcZG7Y2/nFk/Z5+G/xsS
	G0kA5GZg1WmjrmSMHw63PLzdrj+2ScK23R3bVGnq+xuLLPtSLO3gUmEjmBk59JY+i0Ab5Io7oaB
	GIrd6bReRHQ2IumD88Rs5gw=
X-Google-Smtp-Source: AGHT+IGhI03tdLg5oc0plVNCSO2LiVnGx57Sn+cYCVSUBsfb7XkEiF5iSWvlCx7bfmCKQKm3J+y6hw==
X-Received: by 2002:a17:906:308f:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abb70c7a410mr933973166b.24.1739868159537;
        Tue, 18 Feb 2025 00:42:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5337673dsm1007937966b.89.2025.02.18.00.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:42:39 -0800 (PST)
Message-ID: <a1ebb518-ff69-4dff-a8b4-7c3b716450a5@tuxon.dev>
Date: Tue, 18 Feb 2025 10:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <3c55e634f2993ac5a49e1b8bfceb2333e175d376.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <3c55e634f2993ac5a49e1b8bfceb2333e175d376.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_004242_258197_C57FE369 
X-CRM114-Status: GOOD (  12.63  )
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
> Add microchip,sama7d65-wdt compatible string to the dt-binding documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> index cdf87db361837..e9c026194d403 100644
> --- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
> @@ -23,6 +23,9 @@ properties:
>            - const: microchip,sam9x7-wdt
>            - const: microchip,sam9x60-wdt
>

You could have keep this new line after the items section that you've added.

> +      - items:
> +          - const: microchip,sama7d65-wdt
> +          - const: microchip,sama7g5-wdt

here.

>    reg:
>      maxItems: 1
>  


