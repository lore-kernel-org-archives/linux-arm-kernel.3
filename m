Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79648C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=; b=pYpQf9nAXZoBnps2/O8xG20bcv
	7U/+7bhOOOY9YAbJoZ8BD4jTEkZ8csJ8c0ZXbDwbwObbXCXOk+/puc9ClUgH9jxy21ZQClgmWBYHc
	ftfoBm2K58Q8HVeUwa3f8G2A3XE3EJbQTVofbTE2ty/HEfFqYdXPg6+/zcHcCuvCROqCBzvP5nLMI
	0hFD5auuYyBlOb+1cbM+yDvegY76f3FVDIGC1DW4KEOhrxMCYc11G6FoSe95VnT1b/NhJBZkMsirm
	7ZhEEXDWIiYPcYXDARzIJ4LiKzrkmeIiLluu9DaU/wGX305/f2rGa1bLHETX6MZGsguZ1ishkJ6IS
	olFenvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iZy-0000000H9Ss-3rd5;
	Mon, 07 Apr 2025 09:15:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iYC-0000000H90X-3NmK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:13:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so8301297a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744017231; x=1744622031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=;
        b=GBJUBMZE91LJlH2y7xg6kJZWzbz3+bp6dWcDG4HRhV01HNctEAnf6ANAQGsUpiRRx5
         pAM0SJ8OZudC5X8G53xHO1BHOHgSJco52ftncEW5LU9OjbUz5fljyz4eTy+m9+xwcOFz
         Ns+aBz9PiFOJWiM2tcABuk+GrHtx/Yo9g9kzVwlfkvO7YQZZQgZN0BTnGhyKSwnudItv
         ABYdLzGKUs0Gs8Y62+I3yNLyhP3FOydt90fj7G0QnfGd1BjABw2Jwr15ZlobxsMjGx9s
         /SaauX0fhbOK88/ItOhFC4mvlr+NGGYhHg//XFX0DHjtYtDsS5rQB6TkY/xh6jqzls01
         37ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017231; x=1744622031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Uk4aOu80S83390MO9VGJ4kqxev3EQy2D7fW7X8p3w=;
        b=CFMmp8pDlpuGyldLRYKhheeyfrLFFhS0isT5x9ZetTv5nvsHqQ9D8CZ6y037XCMt0C
         WZjKvxtF0jgDJmMvdbLZa6yRJU5RVkOXXwbKhlOaOAFBUCZ9QuXzXc2IG3Q2B+6GZCNc
         tYf8jpg33iTD3zRXDwi1eYI2zVonv5V78m7vImHLtzc8yAwHA1HVPdUyBVLgoAYX/FQf
         tiE9aW3c0T19bGMYwUkBCn0Xv00dVAJ9ShvXpdciLPpurxVmMXjCwkAkGHHao8x68OJV
         yTPh1Covxi3scRmRHcPYKcxNfK1RJ7UIBN7D19Oos1gEZGfP76JxSJboLQAQmZXpGVyv
         l96A==
X-Forwarded-Encrypted: i=1; AJvYcCWGjxmG6qJrDQmX6ghevm7B/ENT7RXiXrEU4rWSJmEw80jFDZ/0s+1ebsLpOXaJq5RXzxy1NRJzjCdK4QqQuRU4@lists.infradead.org
X-Gm-Message-State: AOJu0YwVUlIasUoAc/hRFJs6uqLpJeiKsxVMc3KmlZdKiY/oKD3IJQS1
	Hy6uUQgAQKankE43gGYzjVqlh4MAttA6IphDjYKMH6GUcPj7LeJi
X-Gm-Gg: ASbGncuPorTnmnMjo3Yz7oXdcTqFZpRylEWAN0teuEFgzR+Y2d2RmWRGcvaEBxyQbgW
	jXuYQf+sRUnQwJ1pWY+LXUKlEbPmBHj+h6IcKpDygFlbfqsL34TyeQljZpGjABCIAKo8ACxQsvG
	ePlG+DoirZsJc9BJeVDysOQzbJTLauY/t3Bz/lkocS+bsatjdzn5mM+uLLTlRBFixqx0rayyFZd
	wnCrW1df5sD8ilOFDwvPifryZfAWLfBYY0WE+zWITJF2MxyqYbVmwmpPeBWcurzonq4Yg9JESnw
	EOGxGj8ZrTTJ9ZauIAWTFSO/gJk2S6NiJVfqlhLrPgttPFnHOoxFjw==
X-Google-Smtp-Source: AGHT+IFT3ocNy0hfSa6LZN537JBXUdT2MD+recEeiEmTsR3iPDKF8z5UKZctlOPeKBh/G3Xz3E5JQA==
X-Received: by 2002:a05:6402:501f:b0:5eb:9673:183f with SMTP id 4fb4d7f45d1cf-5f0db8352a7mr7676899a12.20.1744017230310;
        Mon, 07 Apr 2025 02:13:50 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f08771a1c6sm6490830a12.11.2025.04.07.02.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:13:50 -0700 (PDT)
Message-ID: <020081ff-9393-42b2-b0e1-67eed9220aa1@gmail.com>
Date: Mon, 7 Apr 2025 11:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: stm32: Document Ultratronik's
 Fly board DT binding
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250326094429.2397365-1-goran.radni@gmail.com>
 <20250326094429.2397365-3-goran.radni@gmail.com>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <20250326094429.2397365-3-goran.radni@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_021352_860665_E2E867CE 
X-CRM114-Status: GOOD (  12.51  )
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

Hi,

thank You very much for the feedback so far. Do You have any update for me?

Best regards
Goran

On 26.03.25 10:44, Goran Rađenović wrote:
> This commit documents ultra-fly-sbc devicetree binding based on
> STM32MP157 SoC.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index b6c56d4ce6b9..c1cb54ffb210 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -175,6 +175,11 @@ properties:
>             - const: phytec,phycore-stm32mp157c-som
>             - const: st,stm32mp157
>   
> +      - description: Ultratronik STM32MP1 SBC based Boards
> +        items:
> +          - const: ultratronik,stm32mp157c-ultra-fly-sbc
> +          - const: st,stm32mp157
> +
>         - description: ST STM32MP257 based Boards
>           items:
>             - enum:

