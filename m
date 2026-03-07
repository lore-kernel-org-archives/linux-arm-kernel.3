Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A73F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt8RfuXfLilpcqlvNT92IvW29HEK82voPpFW48omjd4=; b=W6ENW1qiGNAFwtQ2l9rl1CyJ70
	nnx6wGSRkWDxI6tqzMscsB2iAxbyaBRTzlxny9UB9wc6yvtOaL7DAcWnOHF3lhaVZwb6lOQF1Bhwj
	5pOwwC/UQTyspj38BbP7Z6F0iVsqTyaQuXgBIGx0T+wKFJsfkTH5oO9A1mA5IWWdWdxpKJwQ+5sOO
	WVPsQrmDeVv0jsatS071vNkm1xLkCoKE4KcXI4hLeFrqNN2ejWXUsQ000mglPuLQ5gIAbCZEDxHEd
	ardt1tc+9920UoKqDaxzUGSQ/IfYOq4uxbyLlmhAmkJEPnikhO4xThsPcxlkGzy+/0FaEA7CT40Xf
	H8fVZmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysfr-00000005GHg-0J4A;
	Sat, 07 Mar 2026 14:30:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysfn-00000005GHG-43qF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 14:30:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so4227935f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772893829; x=1773498629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nt8RfuXfLilpcqlvNT92IvW29HEK82voPpFW48omjd4=;
        b=DQay28EvES5vm/87PGTwObXEJDqZ2QAkFN/gUMqg0pCwAOKpLL7qdLPrFtT/hRztZv
         1NgLakuk5EbUh+wOCcJeZxSqAxPWwfDstDtPTHDbIISz/j2545tnbXcTrMa758irfUyq
         re69acUCw056pOwm3pMNluz4ns1B+RD+H6xjWSwtK+Z+wt+4xKK8VnfPjwqtX9DiKgi4
         kh1GrXm8m4U712tMjpz8WADvlngaEImbY+dGpmne/ovOB4RKhRPPZY9+NH0lReykINGK
         jNNpZaGEz44tr5HAwvHTE7P9XvbzYShwOJwubsr6TP3pf1WxpLhKGCZUSvXuty9UScPA
         RVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893829; x=1773498629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt8RfuXfLilpcqlvNT92IvW29HEK82voPpFW48omjd4=;
        b=AR9/JS9ZulwnMq7oslHCxgp/HMFMYyS0hLcucGiXcDXuT7HkLbUTAJ3LRJglafrxcn
         auFhoq72zSrRyaC9w1ZpWlcoIJURGKxLR6ZaKHF+CN3lIOTmEYbl/GYS4x5rZifQMGAB
         Vhbe3SnqKikEwIPouvzubhP/AnZLRS42pzJy7iCU8qBtf3QlNrNitBEUURzqDT+V4E9i
         0l/sQWSVNRb42YKIfQSPd3xjZAEdSKInI+6RKneVYYXjwlAz/4Sw8XHpXFb9K5Cz3kiO
         SjoTVvc2wiehZxHUNnF8SVPvjS70nVXClV0uEtpl1apLcgxZmkGOBibrxOk0ySBNp4UY
         Y+zw==
X-Forwarded-Encrypted: i=1; AJvYcCV6JOzVLrAAI05kn3Izsu27GSt9sv4ZYYO9etQnDkb/P32an5juBzoJ7WPOun4VyVNjuDWtIKyn+CKKGWEGKq8z@lists.infradead.org
X-Gm-Message-State: AOJu0YxcLmxquP/6gWeYwH8QR8kLcSCRm3EdndxmRxt5TevjFIku3wfD
	GDokd7ktYNr8d64swcLT5slHsxUWSEnCtrrKarlDrSoLcra/axFUMGql3BL+5+xRY7M=
X-Gm-Gg: ATEYQzzlJBtdJ6RcF6HmtDNM4sQnmN34StEWx/mqoPe1w2aLHUQ8SwMKvNqhaXFIOWr
	TzVdrrcEJCnd468+mbgcd68EbrvEQvTSgk7/bmm9uO5d8RDc3mFHSFI8BLjy3izOxzD8kBzF8P/
	j6SQPTfKx7yUcB3/lKJJrCLuCaWmvM+4FmM+4mrhoWcGByxkv2UF0o2VzZj3f15zAdz32bU+GH/
	f5B/EhZ+lzPw45bj8jYeXnAn9UvttJHne7p0WyXE7Fdc/PpbQzRZKF3lpbt9+LbrgqIyitiXfVT
	C/9VDIm1fl2SPqzIGZQ1vJ70/S/ertGoH/f3Hz707ioGipC+2+Y3RzaCS6zrsvbDOD6ojEPP2PN
	0o9ClEzN0JEkxxnNeSti9VibsKnnl2EKXctj2ylSqTT8VVupsdHJuy56H0IdW291XujWNI+w83K
	baqVDUSgWfgWiZ/BkL2iOeS0nlTRuBzYd5hyCqpjtq
X-Received: by 2002:a05:600c:34d3:b0:483:bf23:1915 with SMTP id 5b1f17b1804b1-4852690f5afmr96314755e9.2.1772893829028;
        Sat, 07 Mar 2026 06:30:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae00absm188167565e9.4.2026.03.07.06.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:30:27 -0800 (PST)
Message-ID: <5a983df1-fe80-49ab-a37a-58b6c4989548@tuxon.dev>
Date: Sat, 7 Mar 2026 16:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: microchip,sama7g5-chipid :
 convert to DT schema
To: Akhila YS <akhilayalmati@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-1-7e2ae1c5b5d6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227-arm-microchip-v4-1-7e2ae1c5b5d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_063032_212860_548C87ED 
X-CRM114-Status: GOOD (  17.54  )
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

Hi, Akhila,

On 2/27/26 17:14, Akhila YS wrote:
> Convert Atmel system registers binding to YAML format.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>   .../devicetree/bindings/arm/atmel-sysregs.txt      |  5 ---
>   .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++++++++
>   2 files changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> index 5ce54f9befe6..4ee18112586d 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> +++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> @@ -1,10 +1,5 @@
>   Atmel system registers
>   
> -Chipid required properties:
> -- compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
> -			"microchip,sama7d65-chipid"
> -- reg : Should contain registers location and length
> -
>   PIT Timer required properties:
>   - compatible: Should be "atmel,at91sam9260-pit"
>   - reg: Should contain registers location and length
> diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
> new file mode 100644
> index 000000000000..4fdb068be929
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel/Microchip RAMC SDRAM/DDR Controller
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description:
> +  This binding describes the Atmel/Microchip Chip ID register block used
> +  for SoC identification and revision information. It requires compatible
> +  strings matching specific SoC families and a reg property defining the
> +  register address and size.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,sama5d2-chipid
> +      - microchip,sama7g5-chipid
> +      - microchip,sama7d65-chipid

I'll keep this alphanumerically sorted, thus "microchip,sama7d64-chipid" in the 
middle. I'll adjust it while applying. Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    chipid@fc069000 {
> +        compatible = "atmel,sama5d2-chipid";
> +        reg = <0xfc069000 0x8>;
> +    };
> +...
> 


