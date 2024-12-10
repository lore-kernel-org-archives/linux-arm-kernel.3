Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD681E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNaXJ8JhPRuTmwTT3LTe+sP5Z8UoA760Vogy1s7z9Rk=; b=sXfs10sJmTCe0jjThush5xnqIR
	1n7AEPVr8RdYnmIRLW4g0j2boLEPvd36o3J9q3jzbhqhmpaTluA36gRzO3C+EOnrriSeDAobD86ZR
	avF+sHqFck0GRb/gs56/o/QHqNvpYoRqilWp790ha9uY+2RzG07j8nWmIMSHIFdlC4p84Y76bN1hh
	Eph9bFU1F6gXLLgBng00c7P1vrVF1IYiI/J8NvxWODi5zwh69qmTnnEvECInQw0fv6vafuFwoPSx+
	UFPaPixALaEQ2XJc1qt7rXNUdoBU+1GLvHn/J0KLXfjZqsHLkiHuSSyJXTir8o8EAikbd5PAqb1pa
	2lSVpGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7BI-0000000CiBm-0ckC;
	Tue, 10 Dec 2024 20:50:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7AD-0000000ChtJ-2TzO;
	Tue, 10 Dec 2024 20:49:02 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so473480a12.1;
        Tue, 10 Dec 2024 12:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863739; x=1734468539; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNaXJ8JhPRuTmwTT3LTe+sP5Z8UoA760Vogy1s7z9Rk=;
        b=GV3vo9evHn0UdCPBPWkznHL1y1DuJuR7phqxRB2XZi+lXZZcmfjPckJ8oKvp/Ujz31
         e1US35u3H4Htl5ZzHPtnb4w3MOnG+Bs3ziVrBEKrSRv8Wxw27NO57DnCWiEgg5BGM6MH
         haVEF6oAtg7hTERJTSyy4lXMbxL9iuvncQgtRiw8tSbJabPqtd68rhoyjWEzjIE2Ys85
         nZQGSYyQBkn3OO2RkElWT/s/8/zddQGsIwV5RanKV3N/4vSooHezG9N+LDzFY2M3Ng0A
         ltd9DXT3qVHShuQ/y47UTeGhSeNwQo62rkCXc91zWiAZNtZ5FF0ua7GVjtkcdco+P/T+
         V6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863739; x=1734468539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNaXJ8JhPRuTmwTT3LTe+sP5Z8UoA760Vogy1s7z9Rk=;
        b=bVNb+lZg6QbMYN1flBRo3BTHB+fJxmdQY93yCTp4ROvkQaBB4eUhm4+QDak2gQHpBx
         ncLwrpPE5xxfoO9cftkQlNNbwbpDpIloast2Rj1oh+c7iqLNrpl6+HKrPnRLghwvZ+Jj
         XfeFCIwds9IjR/ULAD4i+Oj/N5XhFNFarcO+J4sHc54Ume/ErSv1g6bvx0ghHVQbyoTb
         klThV06tgQgbbSu3m4Sg1Baxb7qPjWxND4qFRjfZV8pOyEg0rOJ/KDD1/+gKiTlR4j+6
         JqH0m2SBXMnOgFI69rJA0tr297UkaFGfg3q58x/Iv2+kWpmf7C/Fj0Sy4EVZtPXxsH7W
         tSAg==
X-Forwarded-Encrypted: i=1; AJvYcCUcmmqxyeB4q4j67cWPHcBjQXT5FmZk0V2+70vkBe6ZniugvNdzKJyouvigwGlM3aDXPnhM6e10NE7g0PMoPyrn@lists.infradead.org, AJvYcCV60Y8sNPIXSjLG3IE/B4Lty98FYhCWxkji76R3AtP8j2+Xm/vIDqjYulLhO2RasANY2zSZgYdCBlsHMkOHXH4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5MMDZP2k5hXYy6xTRaUrMscEwlo/1R2HeeMVwxj3XXN5jL8Zt
	/M8qN//4t7HBuryVEcQuAbKZVjM1/gKUrNkXSHoQLXXUAElqipjd
X-Gm-Gg: ASbGnctEwzEr4BnoljtAjk4w3FVoOQj2ad/c91Ik+GbBdFat4F24kdv8fVW+DO4umtg
	+N/uhTxXOIzZdYeX3vEotea1U2CYp0T0SaaEeBmcQwNKg5wzSI6y9wq5VMGXN/bznHTcQFCzWbN
	1zFGvp+1Cswj0iGQ30SdHqmIDgmlrfmHQbD2U1QcD/677h/C34QA3AS1r+7UwSbkKkwre62DbD9
	w5eoDrxUPmiAxrBxiKabYcB7cvpaZyN2RDpthTbqg==
X-Google-Smtp-Source: AGHT+IGLMYMcvq7FgOuv7NZ8he4Vn2DR++ElkPFM38fkihjTAen52Se+4+I+zeFNB7FVdS9rJ+bpJw==
X-Received: by 2002:a05:6402:40cd:b0:5d3:d4cf:feba with SMTP id 4fb4d7f45d1cf-5d43314d465mr45987a12.7.1733863739337;
        Tue, 10 Dec 2024 12:48:59 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c74c3d5sm8097292a12.52.2024.12.10.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:48:58 -0800 (PST)
Date: Tue, 10 Dec 2024 22:48:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 3/9] dt-bindings: net: dsa: Document support
 for Airoha AN8855 DSA Switch
Message-ID: <20241210204855.7pgvh74irualyxbn@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_124901_630921_7789F4F1 
X-CRM114-Status: GOOD (  21.33  )
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

On Mon, Dec 09, 2024 at 02:44:20PM +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.

typo: configuring
Also below.

> 
> Each internal PHY might require calibration with the fused EFUSE on
> the switch exposed by the Airoha AN8855 SoC NVMEM.

This paragraph should be irrelevant to the switch binding.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 105 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> new file mode 100644
> index 000000000000..63bcbebd6a29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 Gigabit Switch
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  Airoha AN8855 is a 5-port Gigabit Switch.
> +
> +  It does expose the 5 Internal PHYs on the MDIO bus and each port
> +  can access the Switch register space by configurting the PHY page.
> +
> +  Each internal PHY might require calibration with the fused EFUSE on
> +  the switch exposed by the Airoha AN8855 SoC NVMEM.
> +
> +$ref: dsa.yaml#
> +
> +properties:
> +  compatible:
> +    const: airoha,an8855-switch
> +
> +  reset-gpios:
> +    description:
> +      GPIO to be used to reset the whole device
> +    maxItems: 1

Since this affects the whole device, the SoC node (handled by the
MFD driver) should handle it. Otherwise you expose the code to weird
race conditions where one child MFD device resets the whole chip after
the other MFD children have probed, and this undoes their settings.

> +
> +  airoha,ext-surge:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Calibrate the internal PHY with the calibration values stored in EFUSE
> +      for the r50Ohm values.

Doesn't seem that this pertains to the switch.

