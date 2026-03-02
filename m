Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614E9EA4E18
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vG0eUB+BXVNy5l5QbQ3naGo0+KpxvXNf2LpxhkuGQ8=; b=PRqTPIRSTQLv3tdXelVexfewrK
	x8zAS0lte8Bl1wOqgy2/ZCAjB29ueWt4cCtRsBUhfXO4Hr/rV02XJGbACDH9ZHgUfgSamu11WGh4J
	McCz9uKacloAycXbENns5CrSz7NaHWAbnra2EvTLDeS8k39GdZ64UsZcyR07GE7EnBAFmKoIu6r0G
	6fTzAIqjqlbdl0IdG9uAvcBv3RrEm+kYJqb75yOCRsNLEa98c41ixPp9nSj36rYcnY/mzb0J9EPh+
	vLodx3j1s7icGkx/BeUkugYBO7fWzPF5BTsWknryx2ejCHUYzlsHET7tZXu2Dh4+7pNQ+SYXNlirV
	m1AD9zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4mK-0000000DIQ4-0vWJ;
	Mon, 02 Mar 2026 15:01:48 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4mH-0000000DIPJ-1jfh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:01:46 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12758ce1e8dso5341246c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772463704; x=1773068504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1vG0eUB+BXVNy5l5QbQ3naGo0+KpxvXNf2LpxhkuGQ8=;
        b=kaaKJhdBnTN7IGC4jnLCNMyEgWP624zaAszXiXnKGdPIOVvUl7og3cY7tfEuRBsGEQ
         aUQrMr2qqjkCfECpZhpshRzc1drHhEiDTKKgBiUciwBy15AfYBXw/kWFrkg2U50TYEUY
         uQ0OhtMV1DBjyz1JgJiGmlg7IdNqdckr0aYCR4kaU9PytV4BHjaRrvZuNX4wurtc25VS
         yJalZ4n9DRbFfBHaOlwIN1OYnXvNV7jlIYLjHa2OEykJJXCoRmOppHgrfKdDXGajBFn2
         TuyLg6IOVyBeUsb0f+AObinaBdUUKki5N5Bo/XN6dgcXHZ3Bv00IptS3BPDuq27obItq
         EMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463704; x=1773068504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vG0eUB+BXVNy5l5QbQ3naGo0+KpxvXNf2LpxhkuGQ8=;
        b=eeTDE+ten2QGSZMr91Jq4MA0BxjYuF4+F1+fRUzaf3K3rC63MkN2DwG4VrymtLvQJE
         6EEiqEVsowSZjjo4+RZ+HeejHSjXm/yVAoCABU5g+fn3sk0JMThPGuui+SAr8EyV7CZU
         hEG+pstEXY2AEyJkn52Q9JgvQzKLf0Ne3slyLP/Gb7coX9kYdBHMaow9gUgcNbfW95Ff
         xZzcdQy0/Ycj68zUoFf5Tex42foVL96q+wYERLYMKTy878LzeucEn5fX4u1QRqM2oDjX
         gf2vO87SY+FvjwcgUoe2KVM0Y2UMwsxql4DSyBXdV5oH5sgEJRCczDZ4tELxu6adY/Cf
         r93Q==
X-Gm-Message-State: AOJu0YwU2LEz2bCAKWIJuY9wOe8XNxL8uMgfwHmEQ5ryHG0I3gXXPLLF
	Gp1G/fYOK3RAjea7MtEBEeHbdI1dNQ1N8BLEreH44MPrrUTpefOyGfMQ
X-Gm-Gg: ATEYQzz5u8VqFyHdngryk0nw2Il+eW1O2ZcusW21wAkVANjpxbBq8Eqv4lDmYnQX5m3
	TiJCSno2zKLAKPJQK+uRbGw5m1zNAuDYyVad4/o0/VuJ0g/LcM1BVPHAnyuq41T7tYc2cYlrbXB
	uHw8hXO8/akqbTiCBuubX5gnN1tl8g82s4WhOsxdJXxXWOqx9kq9cJfopKFIriuE9A4pQl6AFZ2
	APq4+j9vLL+8GHH+AQ8MXCFqou3nmjg+cSFTFV0cDQcMT+ryhIkda1SNuLLwpeDK1aTKXzK0x/d
	fdZ7jgVHc1/5zmvOw+lj2t6PR46jE54jMOrBs7SWGq9Wh7omxpDvRrF9tG0Naf2PPb5Xzo+GdM0
	Z0v3fcu/VV3f+wtcxx+WD8C1f59cKvELbK876/fZh15FxRgU2HRuIXqGOaRvQTIeY2qT6GkRIbg
	krYQ5i2lMvj85gfRGQdbJSsu3e6OZkOxlADpLWed4Sz2qYjex7oUMa7bPYpsydUC7LSBdfaRpV
X-Received: by 2002:a05:7022:523:b0:124:9acd:3b15 with SMTP id a92af1059eb24-1278fd71cadmr5654701c88.39.1772463702082;
        Mon, 02 Mar 2026 07:01:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43a18sm17528376c88.13.2026.03.02.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:01:41 -0800 (PST)
Message-ID: <f124b200-09e3-4e73-a100-f47007732e8f@roeck-us.net>
Date: Mon, 2 Mar 2026 07:01:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] dt-bindings: watchdog: Drop SMARC-sAM67 support
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260302122540.1377444-1-mwalle@kernel.org>
 <20260302122540.1377444-7-mwalle@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260302122540.1377444-7-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_070145_496473_5213A01F 
X-CRM114-Status: GOOD (  14.09  )
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

On 3/2/26 04:24, Michael Walle wrote:
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time and revert commit 354f31e9d2a3 ("dt-bindings: watchdog:
> Add SMARC-sAM67 support").
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> index 0821ba0e84a3..872a8471ef65 100644
> --- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> @@ -18,12 +18,7 @@ allOf:
>   
>   properties:
>     compatible:
> -    oneOf:
> -      - items:
> -          - enum:
> -              - kontron,sa67mcu-wdt
> -          - const: kontron,sl28cpld-wdt
> -      - const: kontron,sl28cpld-wdt
> +    const: kontron,sl28cpld-wdt
>   
>     reg:
>       maxItems: 1


