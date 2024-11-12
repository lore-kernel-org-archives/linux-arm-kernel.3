Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28066D41D66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5BvAkAKztYW6xCj+mZI8U7st+LWYK/vV8FsPRMq38w=; b=fXYh8/FISFxoVheS4+8lw3N+3H
	5CFNV0LDAbXkKttH3H3FoTnuyjmk9gwwVNJjGaYeXAV/l/ive/EkCS6aZ+Lsa9lgds6CLru1x0KFx
	KKg7yeGUO11p+/cztB5ceqmI8P5SCTOypFpx9fGL/VWrNqEkXirr4ueojzz4cZh178F1KDGXBWV7K
	X2yazyyH8OeekeVyPmXlc9+/ywe4s3Rxq2C3dOxHnbDE0BlQie2KhgtqhSMoNyizpntKS41q8A61B
	8VC9ARb17d0wH1/QFAbvc1dBh76Gp1v97/nPskwM0a3vwOhNFyltbhDbb8KPzQZ+wOWQ7oqfVaa5a
	gqBHQwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlsJ-00000002Zha-1Rid;
	Tue, 12 Nov 2024 08:03:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlom-00000002Z0p-1OXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:00:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so4333517a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731398407; x=1732003207; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5BvAkAKztYW6xCj+mZI8U7st+LWYK/vV8FsPRMq38w=;
        b=NNHLVN11ygaqag5/uBCU/ylUE604v5Usjs3oL7005kJQp4MWnVWqE6iSMDQAb8OhVY
         YbqTbxRLJZgtj5vdEhSeUCAINZ898+KlsTlfi32c8dfHjQ8p+91GcTEgb1eT44WgfC8Y
         blvVzxKJHMh/fofw3LiDyZxp9ak3EunX9Dw8yuC49G57e1FZybgOwxQ9axbD2gUDOWsO
         T/0rYdS6MX7EeJ4t9I6cNIsbiiEL/5yJIrPStE5XIl9wYOyIedkNcGZRBtBGH7V+hB7w
         FU+gdZ/K1NEMfmX0Ua1uVWlsO26P9jmDErJxJJVGrfffMEOShPhmvM/sS2InHMwe1SRW
         Ntgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398407; x=1732003207;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5BvAkAKztYW6xCj+mZI8U7st+LWYK/vV8FsPRMq38w=;
        b=CgG6Cr+m/2jRElWcCf1W9musYLh6NlxlrjNsgBtuAdZjDZI2O2iI7dUAJuxeeoRDNi
         1fPoPWhkGwvt/TCU9GFqfRz5oHBFlvp9yJCUC/fYlEAXFF+2z4s1o5JYwbzN0zRHulYn
         wpLPSu87Y7Npxfnieo7fhEG/iom8bVkJWyJ8/kCzN5xE1N5IpyFL9rafjtJ/p5tRIL+o
         l2bc17sFpw4ECtjNO07WwAjKN9LwEmB6Z1/LRfWl2sMaHHnA/WZiJ1sP12BQMfOIfBRv
         uVOOlYhrZ4Yr6BdJNfbYEmp9JpgD70evPDrQK83d9eHurrczJoyaNh5ywI5RmZXUl7So
         SdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq4MzgVitfzyzvw8KgR1aEqS605zDm5EkB2EN0ubhKmLlMPtt2mqmikA+Ex1W+KiQAgHyQqn1WobydOCGJDoN4@lists.infradead.org
X-Gm-Message-State: AOJu0YzZJFJsxWZAllSvLFfoV4GaaZQ74UBFTEBPvviXF0x1YhQ3e1SV
	F34ILPg+JLBZQBP2B36fj5WeHZXgaEQMScE23oq/zObQv4RnE2Ma46DEiYam4A==
X-Google-Smtp-Source: AGHT+IEl2XL5FCKVfnW5u6LivJkD4NnNJy29pjQKJz1cJx2jS0MCN9K5ShRz8rqcump7HIgEqbQkbA==
X-Received: by 2002:a17:90b:3808:b0:2e2:b2ce:e41e with SMTP id 98e67ed59e1d1-2e9b16824admr20274247a91.13.1731398407154;
        Tue, 12 Nov 2024 00:00:07 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde1b8sm87828335ad.60.2024.11.12.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:00:06 -0800 (PST)
Date: Tue, 12 Nov 2024 13:29:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: lpieralisi@kernel.org, thomas.petazzoni@bootlin.com, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	salee@marvell.com, dingwei@marvell.com
Subject: Re: [PATCH 1/1] dt-bindings: pci: armada: add system controller and
 MAC reset bit
Message-ID: <20241112075959.jatez7wwiukymj2t@thinkpad>
References: <20241112065229.753466-1-jpatel2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112065229.753466-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_000008_413289_DBFE092D 
X-CRM114-Status: GOOD (  17.98  )
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

On Mon, Nov 11, 2024 at 10:52:29PM -0800, Jenishkumar Maheshbhai Patel wrote:
> Adding Armada 7K/8K controller bindings optional system-controller
> and mac-reset-bit-mask needed for linkdown procedure.
> 
> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>

Please send the patches as a series if they are all related.

- Mani

> ---
>  Documentation/devicetree/bindings/pci/pci-armada8k.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> index ff25a134befa..a177b971a9a0 100644
> --- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> +++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> @@ -24,6 +24,10 @@ Optional properties:
>  - phy-names: names of the PHYs corresponding to the number of lanes.
>  	Must be "cp0-pcie0-x4-lane0-phy", "cp0-pcie0-x4-lane1-phy" for
>  	2 PHYs.
> +- marvell,system-controller: address of system controller needed
> +	in order to reset MAC used by link-down handle
> +- marvell,mac-reset-bit-mask: MAC reset bit of system controller
> +	needed in order to reset MAC used by link-down handle
>  
>  Example:
>  
> @@ -45,4 +49,6 @@ Example:
>  		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  		num-lanes = <1>;
>  		clocks = <&cpm_syscon0 1 13>;
> +		marvell,system-controller = <&CP11X_LABEL(syscon0)>;
> +		marvell,mac-reset-bit-mask = <CP11X_PCIEx_MAC_RESET_BIT_MASK(1)>;
>  	};
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

