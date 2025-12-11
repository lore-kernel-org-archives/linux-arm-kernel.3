Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A6ED41C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=; b=EQIm0/NEa9gcGv/s6cipWvfcjS
	2hcpkiCQFpVLMX0C9xaq5XvmgKWkTM+js9qrYjccXkpU3Du5grerthyz07+XZsD92rv7j6PEnmXif
	30YcoVcNj+Vl9xiLZ/w6akf+wfPkYvDktU+/4+ETcxbfFUenCVZMPaQiFzSq03myNO559KM9inicy
	llO/krsUpkMGpTUCTFGySVQISsgNkB9nfg4ErpK4eiFwDz6Iwy66gjrUV+mKtoQayqFUKVrV8veAz
	znl8RSIFL15SUW7luceCqJdiLg0kYVv0yyzvYFICsAbrWdFDRV9RGp5tw9ugEHDLfsW2xs0pSqvgP
	i//yhhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeuI-0000000GXV5-0YJN;
	Thu, 11 Dec 2025 11:32:26 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeuF-0000000GXUO-2h5S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:32:24 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6432842cafdso735388d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 03:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765452742; x=1766057542; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
        b=eN8eMs06F5zoM5cU9mowATS5OEUgnnzOjhPxGmJgIbAmnJwSurP7ZJLRSaqhm/1RE3
         a/qAz+5kFLZznPfHdifPFZOlcK1stWkbEi+Irg190nJqK24374hx1afoCJp1NlIMyp8W
         w7Mvy/R8pC6e6EbmluMNq072wDgXxksK/BHFJXPfItfrvRXN6UCWiZy0qVT0K8c2DwEP
         tBY9QfUrNmYgnGkqttTJcrAOHqpfoszRlkUGvkntgpU/4ERW6C7HE3q52GV73/gwbyQ5
         IjbXJ1C+M3flC1sPSSr8g3jZm21I5pVGcYejFcIBXR89et9+Z2doXTqk32RGt+WV/gsP
         M+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765452742; x=1766057542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phiy9ied8gdfxveKkebHqanag2hE7Otb50tt4bxl1+s=;
        b=bc6AyHgGBPor6t+StQBIOXmClgjWiwJK4mnMpqHACf7d58GTNL2rjal+7qAeL7vtGK
         gKlGXoaa32Sd7YUtvHvdZ7Hu/YUcIA/oooDNxXXCAnHWJBzhKNYb3OQ6OLb2BSQ9tsmN
         w7akMlggzYmb8PKdTBUw0I8Y1VKjF5cjvE/Z5iLUPfOm2HCniulnXIo6Mpzx6kI/gI5r
         7xhOPd5dObXuVwQ6+ceybIKrqIu0JlRpvita03zytghWzDSm03B3rgwa1g0uoADwyEqz
         /PQB/ANKxI2/+dEXVNsVSvd/1FDrNgQQOdLCxGMDbE/TPG46TWr4oTLBi78UK6PFGgTw
         r45g==
X-Forwarded-Encrypted: i=1; AJvYcCXSBMbTBQMjWyaObBb1OWbTVzxTyI8zlU8D2rx8IpvY6FVbNpJoINpMSdgtSx9O91CkqBh5HS1TeR6N6d3F5Em9@lists.infradead.org
X-Gm-Message-State: AOJu0YxCYQoc689098YNAzj8gw3lUt/H/YvNh8nPGol3RGUUssA7gNZ7
	gMAgs26sgUMYR64jq8ymnM6rKip7yiFzuWTeTOICLDZ1J5vhtLA5+BgRL6H1aUal1z2TRRK8iI3
	1yShimO2OOlauhNbA7IzDyBsXbpy/Ne5oO3uadADq2w==
X-Gm-Gg: AY/fxX4QgTE3q9FW4veCDMuZ2y4nqDsQwmGE53jkR6x6JFFStZzaHyUxi8KWp+yQcDm
	HOcLLxgJyp7mhBq7KXdSWSpyAa3XsnLrtBe6J08zbgGydMdPwoVcEe3LQ0rTxiFMMumMZh4TZLE
	To829dU98mxhfwps5S5zPAl72npZKwVh8Re7PY793O6HLWuU+q5O7GetW2eZ5BqylyDUSOjrX/S
	SgQ3I5UzMj7oeuMlTTexa7fhLPJW5cljeTvuQ1sDwPZCAJ0j/6/FKs93mRgZcqd07Loc/Ak
X-Google-Smtp-Source: AGHT+IGcqwaxtfJMJnD56RcASi/uVKO/lK/0JnQ8qMBQTGtHR3OnnoyAdnC7R6PIycF4XsJLibnnvktvbwIlYjUAVZY=
X-Received: by 2002:a05:690e:120e:b0:63f:96d7:a350 with SMTP id
 956f58d0204a3-6446eb4a92cmr4347837d50.66.1765452742333; Thu, 11 Dec 2025
 03:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Dec 2025 12:31:45 +0100
X-Gm-Features: AQt7F2oiHWORIK5IUrdndTpX-opjO6A0dESgetC9ddqm2QKKAaLxTanuvA5lEio
Message-ID: <CAPDyKFqZQUurBNSNUBKE7rgBf+UHxKiYBWt+xxSY+dh7PgdPPQ@mail.gmail.com>
Subject: Re: [PATCH RFC 07/16] ARM: dts: aspeed: Remove sdhci-drive-type
 property from AST2600 EVB
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
X-CRM114-CacheID: sfid-20251211_033223_684763_2E5CFDFF 
X-CRM114-Status: GOOD (  14.57  )
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
> The property isn't specified in the bindings and is not used by the
> corresponding driver, so drop it.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>


> ---
>  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> index de83c0eb1d6e..3eba676e57f1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> @@ -314,7 +314,6 @@ &sdhci0 {
>         status = "okay";
>         bus-width = <4>;
>         max-frequency = <100000000>;
> -       sdhci-drive-type = /bits/ 8 <3>;
>         sdhci-caps-mask = <0x7 0x0>;
>         sdhci,wp-inverted;
>         vmmc-supply = <&vcc_sdhci0>;
> @@ -326,7 +325,6 @@ &sdhci1 {
>         status = "okay";
>         bus-width = <4>;
>         max-frequency = <100000000>;
> -       sdhci-drive-type = /bits/ 8 <3>;
>         sdhci-caps-mask = <0x7 0x0>;
>         sdhci,wp-inverted;
>         vmmc-supply = <&vcc_sdhci1>;
>
> --
> 2.47.3
>
>

