Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B66C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=; b=U2vZ3+sUVwyTBM7TTXVVOefjw+
	FMIv3/IP7BV4FctTbbLfKD8hwE9kphHYv3mUtbjlFhIDE3AbqAWcaFSpR01heqCO6M6OZnyI2MVe+
	sFqGmUoMeOoIdxM4/9wKY8OOzVwirc4FJg8MysW4HOY9GyExZXe45eSVYRqzYUKic2OZ24wPa3MOR
	FTKpUa5H6Fwf3zJfKthveFxJHx7Z1lm6FN5A8L+HOMkZn6Ye1XEWjxCXtd3S82BEgfCHzlMI4CAmr
	v4LG5EEOzIlmxQ7Am/Zdj1OzZAr7lVHuRsD03Xybx1KMyhvlhri9Ps2O9KfY5lef2IG4MyWZOsOla
	ms4CwrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qmn-00000006Zok-0XOz;
	Wed, 09 Apr 2025 08:27:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PVr-00000006N3q-3ERC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:06:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22580c9ee0aso69732005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 00:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744182379; x=1744787179; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=;
        b=U2vCcACrmF143V/gOGvahmZxiiTGzCcyBi7b6aWSbZTW2y266YTyn/EYdNeR+HzYE2
         igW87gl/M+PJAqSNsfmHeXbehx8MfLpW0JRIccErdvkDZ8v41PJfZ9v7MnDVfMBpL9KJ
         OKhiyLxe4KuY0JPoUCkY4rVs1q9WnnvFoBoEBJghlR+umzQEusmFNRUwHjwoY00GABbw
         pM0+E0E6WPmhO9zw5bLbMWPpVf7wBui8OeHWCiCEUtoOioS6h9SXwsfCdSKT1q/X5Bmp
         kelyWYfXBCCBtLQPSVevb9foJtl/SrLnQD4c3dlyzNB1PeX13CC+CdXw+q9fddLehLR1
         a7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182379; x=1744787179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=;
        b=i5rsLG4WEvzoSI9q/PKJb7QCKkxPtG8tP34u49dc7n51Zv46eC/JbpX2/tgWMIdQYG
         6KLoXh0REryHOaXYX63/DTSEZ+72g4wLPUaI49aeNfykuYp02fQvQ9LptMOMOfV2qtpY
         e3HYN5jySjNUMhXXEWviYFZPH5p6Aou7jEiF2NbU1dRMzk1iV/Vc1dwsspXXSMgxv5Qx
         FIZYe16rC8qspn7p2ZsBOSJnYqZzqzDdrxfNCjZOXxR5A/tk7Qf1uCNiNyX7zr/HqWIx
         APGcZUI3OHbYzypiHGuFBJn654ii3hs5AVqGD1XSy5nvFgAWVKCAoi1qrJkoXihJzrL6
         1D/g==
X-Forwarded-Encrypted: i=1; AJvYcCXWjc5UWQy+xx1OQuAUVajKf8ojIftA09DsY4fm2wGEdo7RJXrNrfvZMJg2UEXtrn3eWc89u3zp1blMiEPTz8qT@lists.infradead.org
X-Gm-Message-State: AOJu0YyZIyANbquZ/zi9DRUytZOU9KAK2NsGiMOHX/VJToFYEK6UL0U0
	FSj3f+cyGGeVKd5aPJa07yhRCP23SSRDFc6l7A37P0xNAYi0R3XUtkIwhjLOBg==
X-Gm-Gg: ASbGnctOO6CO7hBKUygHtFVwD2ogdmi6Vsf+UvD3mzD27L8HWI6nQFAoIZoHLWQp1WS
	s6wjgVh3sN6IEZzQtA8uFPbjIAYvHraazJIDvDAalSUmqJAJcXIwbcNPrpl3fb3XthkFIAxb6VN
	ncvPGHRS2XyLTTTniaTGzbC8oZl48vf1u6/1GIQLOvAsT7I5ikhBZY1fAEQopG/bQ06Ha+b0sVe
	oK3EmJvoIAYyEp85oaycHbWG/u3IREPxnI6m9yMywPlDtx1yfCtDZJXtO+9gNPO9KORoFU888rO
	Gy6Ax5YWDhAojjCNmZTbotWZ0G1+O/jwOnq7qClJOB7r2hOAciA=
X-Google-Smtp-Source: AGHT+IG2IBbUsP4jpyoBsAQl7I0S2iGdcUbnYfvvANGYcDIZAtyYHJ27CyPFx40ttshkAUckDfLO7g==
X-Received: by 2002:a17:903:3bc6:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22ac2a2991bmr35596635ad.41.1744182379003;
        Wed, 09 Apr 2025 00:06:19 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm4544815ad.170.2025.04.09.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:06:18 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:36:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include
 placement in DTS example
Message-ID: <3cfkeludmigojzadrgyxyidiydb3mx6yqjcvmgpbhdk75cflog@66i4zpvjcwzv>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
 <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_000619_910255_9A8C5784 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Mar 24, 2025 at 01:52:02PM +0100, Krzysztof Kozlowski wrote:
> Coding style and common logic dictates that headers should not be
> included in device nodes.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> index 844fc7142302..d35ff807936b 100644
> --- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -81,10 +81,10 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/sifive-fu740-prci.h>
>      bus {
>          #address-cells = <2>;
>          #size-cells = <2>;
> -        #include <dt-bindings/clock/sifive-fu740-prci.h>
>  
>          pcie@e00000000 {
>              compatible = "sifive,fu740-pcie";
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

