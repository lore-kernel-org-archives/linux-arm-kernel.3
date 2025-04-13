Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99ADC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=; b=Au9j5lFD8jWpGWHC/qtReFnu0v
	Dv42if1hLBCfRsqcfBxaObyLD8BY64en1x6gd44hNO+EWJzbAqLvNF+UIXtuV85mBpLZ0NrkiFzmA
	6RFgMiuzUTkys5pABPLLqApCoEYJQdSmGCBgYV8LrSBmrk1nmRfOyXO7StNiMf3s/seggmuFizU3c
	38YHe5isO/9LYnOApnujA0DRPnsf+AN3ldMgtnRBJPLEHFPc5j6Sl0DSin3CFnGVxoK0yf4/gxSHO
	HONoKo9RaiMFFFMus1EQv/WwrkoU9ZKqH5CRYziOXZyVMFTo91KgAzC1lEhPvCSOXOjtfUZucbKic
	SKNUtZyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40i4-0000000HP9S-0AqD;
	Sun, 13 Apr 2025 17:01:32 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u40fq-0000000HOwC-2T8U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 16:59:16 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-aee79a0f192so2323960a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563553; x=1745168353; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=;
        b=D5tqmSbNa1ieWE+99bZo/F8E4q8+8a3m5h4SbWrUb/Pv9p7BxkRr8IGzg01PPc3Qji
         +546G/ebO3F3aC/9Xm0u196MvRaW+AaHBZKUoMMQiYC8++GOXH2cSMh+iiDu/feTRIiB
         wE0JjD89pl5JQYzolauPHs3gO+cLEqwx91b/VlX4nn9VZch0X5X0mhD2JNKoJvwDB7JR
         TgwJSTxuz2F+HwDACJnFQbqusTQl9RXrvy3jpQEZE7e+Uj9rb070ellQw9vDqCGOHC9C
         zOqrMwfajkEsE3jYlt5tkMlnyU5cXiiTQthxULAJKkl/0KzAg/uoUJQHb4tXjDNRi/PX
         OVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563553; x=1745168353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=;
        b=oMCWeYyISsrWhsxpTdoS9tTWwQzU+jXW/I8WwrILuDKsDuKCmrA51uti2vsonraccd
         UiQiQHuXPaL3bWd1n3kILAZEwYMpekJSGFoIH5PLhmOGpfEUoLJ1TyMQ7ocLm0uM3yNY
         D+10d7KF/HoEU6HdNNKdpNROx9DzTIxlyKTfqgHzGxWtLrVvuZPvrsylYmm1DfKWxPA6
         snwVPKYnzgsjwrWhwsvYvZ6YN8c6FnrVwwvQ+ynD6ARgccY0rAQhtfw2ucJL9oMrCijw
         LCNNV5nSGge8XnIBhzNdT40NhRpDt7UiYeX4+bTzWkwgJXU344jePoSOdevc7jst3pwP
         nZaQ==
X-Gm-Message-State: AOJu0YzTqgbUOvETDEnj3RSZJPBHoqDBQ8hNuPCBvUACh6CiNmyOm+WP
	MVO86ttPrjE4n8KDACZ2P7azDIXU/h8yfy6Fu8eyu8Z+fRPa+g5g+Dqr1kAwNw==
X-Gm-Gg: ASbGncvAM7u45TU0AalIH2yejvg7ojKsWyR2/EIHvWqmtzWvufnYA2mhd0OyX8OGUgS
	lPEWqU4fQX4+4bZR3KjlFQcGHXHSuHNzdLtmRoUuwSD66xXSRWIOLUMKK51PbMbMY0azQVeGcsU
	a/xpafybwcno3dsA9EJ/tavnlcnxW2BtV487101vgBtUJbENBdLouTGTLvqFZWN2c3ptq7wcT6L
	hsmSn8l/ZeZRXn51LntozWHEHAbuCKg2CMgWfwMFSebwLVqDvI/40SWrC0KhhB/8zPwt94M17EZ
	aywupiDFTbg7JrvrQKv3yuIvHjkh39fnoBd3n4CLHx07uW8tqAgX
X-Google-Smtp-Source: AGHT+IEuuztzcfI3tZMtG2ip7jalzWCYkQqUAle89wyt0wS3flTIjrnot513jepB3231SBdBpBbheQ==
X-Received: by 2002:a17:903:19ed:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22bea4ade1fmr126350445ad.18.1744563553536;
        Sun, 13 Apr 2025 09:59:13 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aff9sm84440595ad.79.2025.04.13.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:59:13 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:29:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 02/13] dt-bindings: pci: apple,pcie: Add t6020
 compatible string
Message-ID: <754d74knq32vrefkukv4ec7id33d6rvhuf5boccynljfgmn6hz@bzxc7uiqdbos>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_095914_718141_98F1A560 
X-CRM114-Status: GOOD (  20.61  )
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

On Tue, Apr 01, 2025 at 10:17:02AM +0100, Marc Zyngier wrote:
> From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> t6020 adds some register ranges compared to t8103, so requires
> a new compatible as well as the new PHY registers.
> 
> Thanks to Mark and Rob for their helpful suggestions in updating
> the binding.
> 
> Suggested-by: Mark Kettenis <mark.kettenis@xs4all.nl>
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> [maz: added PHY registers, constraints]
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/apple,pcie.yaml   | 33 +++++++++++++++----
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> index c8775f9cb0713..c0852be04f6de 100644
> --- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> @@ -17,6 +17,10 @@ description: |
>    implements its root ports.  But the ATU found on most DesignWare
>    PCIe host bridges is absent.
>  
> +  On systems derived from T602x, the PHY registers are in a region
> +  separate from the port registers. In that case, there is one PHY
> +  register range per port register range.
> +
>    All root ports share a single ECAM space, but separate GPIOs are
>    used to take the PCI devices on those ports out of reset.  Therefore
>    the standard "reset-gpios" and "max-link-speed" properties appear on
> @@ -30,16 +34,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,t8103-pcie
> -          - apple,t8112-pcie
> -          - apple,t6000-pcie
> -      - const: apple,pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8103-pcie
> +              - apple,t8112-pcie
> +              - apple,t6000-pcie
> +          - const: apple,pcie
> +      - const: apple,t6020-pcie
>  
>    reg:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 10
>  
>    reg-names:
>      minItems: 3
> @@ -50,6 +56,10 @@ properties:
>        - const: port1
>        - const: port2
>        - const: port3
> +      - const: phy0
> +      - const: phy1
> +      - const: phy2
> +      - const: phy3
>  
>    ranges:
>      minItems: 2
> @@ -98,6 +108,15 @@ allOf:
>            maxItems: 5
>          interrupts:
>            maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: apple,t6020-pcie
> +    then:
> +      properties:
> +        reg-names:
> +          minItems: 10
>  
>  examples:
>    - |
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

