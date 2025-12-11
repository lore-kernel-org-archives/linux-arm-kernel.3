Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559AAD41C1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAvAduq0/fXRtJhO0coRhdPgTbJSI1bNLnmdQnPpfuY=; b=xtdQoIpm9B29myPcGMhMMVq8sN
	nqT5djuyeZy+kSz++0cP5n9ENTAK2HLJ3s6P4OKMnn/AJxwdmsIrKfOcx3UeiDbre4HL+lm/luNNJ
	AzatoDtiytXCpMq8+YHXkJK93A6o5Jn6wnEFnBBdqGMVg70185P9cfhWeN2pEbi7NbtY6n3yM4bPa
	YmoOZzuPBDLOTHOW5og+Pl6psh1o2PlvzMfwbcLN/309tmWrlqbzPSeMBNKIdDNuXjH7TnlEEuyXw
	L7u3Z4kjv+jDbjMeXiuotoRnb2QaTt5yCUuQ+SrYzRuSJqBTbFioXRcKcAA/QmVJTbGlQAiBfLbr5
	2Kay6uGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeuC-0000000GXTi-3VhY;
	Thu, 11 Dec 2025 11:32:20 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeu9-0000000GXTI-12vi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:32:18 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-64472ea7d18so760734d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452735; x=1766057535; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vAvAduq0/fXRtJhO0coRhdPgTbJSI1bNLnmdQnPpfuY=;
        b=Z9s6yr+ETkQbZiFb/kCYVeis1GFjLnuXvd9GcDA05snG12zZyp8lz1F/ycQjr1biZ1
         j8Mys5Ngurg3mWtMmYn7NSB/5WJ7oK7US/vXDGkHI829TmwDaklN/1+THNBD7Ou/XMTV
         lyjvnjAYZGxT0ceoRJXgMxaxzJ2KIy3p4F2MUoyRpKDaOdR3ICMYbJXFQzFGJSPs3ePw
         mHf/opxLjnCn15/UibuHiHUrcc5gVPKbCOiYy438LENAXvvuzMhDjNQG9p0nEtJMfa3u
         TOO134qxEAZ5k+W7Lk2mPoysY3bZyWcfqgNrTec227soLSu/hfyp8z/LahNuBUu2NFtP
         hvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452735; x=1766057535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAvAduq0/fXRtJhO0coRhdPgTbJSI1bNLnmdQnPpfuY=;
        b=Z5jPsM571R0tq60aYc8rsMR+4Ck39Ad3xNUrl9v+hc0F4G5KiSYIUKROYF0oMHZFoA
         Z8MSyqG+oZuXEARg9oX3B4fob73ykq8NxSCBCo2LrQpCysT6WgqjkZMuR3OMKvwHtHom
         Oync3c3xO/yF7YbIXiFOfU7pVKDeGvHA8XBvxGiIqnDr4ZpCyJgTarB+AOLDtQeMtrpR
         XQNBY2eqMcOysz/iJRx0K4DIMyC5WJEY7yAm/RvSm611zo07xIxipXIc/YAGPjpnsbrO
         5KuoMeDen5G50ZUtpytgtWWM2ymTD0AbY6v7pCF63BqeXnYainIgr+zLwCyMK9WO2tbf
         cf4A==
X-Forwarded-Encrypted: i=1; AJvYcCVfPv8ewiZRUFWYimatM7gN8SBJdrPUXRiUp3KmpyCmg8Eh7nfVTkhFu6BM1qsTomixjGaqoQcLNTITCiDw7/eI@lists.infradead.org
X-Gm-Message-State: AOJu0Yza90XxcEM8MBk3iTZl3PDqcDYh4ce75sviDhb+3AjanQrLvzlX
	DvC88TtggubbJlOxPKRWstRthpVb7YTFr28Wmk+zVsuVLEumUG322IPmzkAjDxEGW/3jjaFrr8m
	ojf1axL8Nq78pdx37tsUPbpbhispTxsnLZG8Uw3/lQ4WCS3OZLPpj
X-Gm-Gg: AY/fxX7+VT/aUMeTtwW5gJuSmGJPDTE6ngSGDeLfcNil0Ux7aCeTDdJhAeiMG58c+eG
	DKfCUpCyHhRo3McLE9SMl6c86fDk8WhGHPzeTY2tMP5NZxQgnsHElIUoE8rSXYgDLtWAOPipkkO
	jz1qeIctlsVvqlRYk2kzS0fp1eLd55oHx23V4EILWMqtixZjxvH1ib6ZE3axkBVcqrS/PFYOmyW
	x4p50XjPUw4OV000yhXVMUwyLX/Dsa/uuJNiFVsSUeXAwpo0F/5160JO/mf+yR7NmvFfCsqLHbb
	Y95U6Ss=
X-Google-Smtp-Source: AGHT+IG8bNJ7GVmxCtKmkFoNf2sieoYkv2mgOPVq2xJndKf37hgXCewb4eZsd1D0ffqnRQUAE3M4kyCHgtlEMcMmN4I=
X-Received: by 2002:a05:690e:191b:b0:640:db57:8d95 with SMTP id
 956f58d0204a3-6446eb3aa4emr5006636d50.63.1765452735377; Thu, 11 Dec 2025
 03:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:38 +0100
X-Gm-Features: AQt7F2pSIRmWc3gz3aUnvZCl6QhFMFW_pPE_bkwFhLy-FhbClf3aqE2_J1pJY4M
Message-ID: <CAPDyKFrbS_3XRTSuexFxTpP1ydgvfFvXNv_tninnTqum7+92ZA@mail.gmail.com>
Subject: Re: [PATCH RFC 06/16] dt-bindings: mmc: Switch ref to sdhci-common.yaml
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033217_302982_23D5CFCE 
X-CRM114-Status: GOOD (  13.73  )
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

On Thu, 11 Dec 2025 at 09:47, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Enable use of common SDHCI-related properties such as sdhci-caps-mask as
> found in the AST2600 EVB DTS.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 9fce8cd7b0b6..d24950ccea95 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -41,7 +41,7 @@ properties:
>  patternProperties:
>    "^sdhci@[0-9a-f]+$":
>      type: object
> -    $ref: mmc-controller.yaml
> +    $ref: sdhci-common.yaml
>      unevaluatedProperties: false
>
>      properties:
>
> --
> 2.47.3
>
>

