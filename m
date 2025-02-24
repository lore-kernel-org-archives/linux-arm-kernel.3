Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39A4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 05:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqF2oB0fOJ00qITszHytsg//Jw5NU1rfZI3/hzZUwto=; b=h7X5qXRln6jrtb1Y311Cf2jCUb
	C2huEXfPn/m4h047d043EQr7LthwBkSYEQ6sB7zG/IbKzKE36zCGWGZp0sMnDfqOBc9n8yGXRHdIm
	y4Td9WiAU0F66u5s5IUef51VjlpIO0RdMY7SFMAVzvMZ3293PRgujuI+d5XGGgXcJLmVNb/ldWxx9
	Ii5k92NGH3Yq4LnHo0seLJsXZz/yTmYslAkF/1ZNSFgOycIPCI/sz13PIaKAHuH80cgAgPfsus9EY
	Baiod8d+wBNqcRAmn0arEMWHk/OTjkgrWM6G5cZEq0qkEfGpipmuUvVYpVHgPeL/IcK2MQzr7YUmI
	WkpR2JBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRHc-0000000CNtS-3OjD;
	Mon, 24 Feb 2025 05:45:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRG4-0000000CNoF-3DOc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 05:44:02 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fce3b01efcso4769335a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 21:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740375839; x=1740980639; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sqF2oB0fOJ00qITszHytsg//Jw5NU1rfZI3/hzZUwto=;
        b=apTyROOAUmkoBvayYNbD5xUWBmUqLmVikyV6ybqRvo6NzByzVcyJ2JimVgomXCwjgV
         AMhYkEfEVodNHnc5/9yqPGNMA6hbBzug4SFsLzlDc42BtFvS9myg8D+jtoHiC+prnRQM
         iuzKQ6mbYEtQ9kz2x9pbvN71OKB/NdVsp4d/KS10Vhv0DlekbMNk0I9jHWpnZr2W6qyb
         fWmdMUCa/gfH5YleZTvPHOJrSiVJLFKBkXVH3IzuXVQiFhF9QEFJa1ci0wHJ/5qLgw0G
         u53eJCcf51SbEjFs1XOTEE3qll3+1DPo/P0peyZXlm9KoOKY7dlqOl9J6voVbiPxZbFq
         6Mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375839; x=1740980639;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqF2oB0fOJ00qITszHytsg//Jw5NU1rfZI3/hzZUwto=;
        b=WFilVg8EwMj7G/4qhJpbbAVJ8gjVC/nLLYv2IIPgVqrhEVU9+4lcxf61D4dWg5KtqK
         lBZBsRuqDrUIKQ++vK8IKkxPVa1k00/OcxCGlfNALNbQC2fE5HRFF6ZDwevrh7wBreln
         bcxVlB+V7wlrwnyOQ5XBaVaIz9PCoZOakymIAcvBmoBiQRBnIp3rhyUysuQbY1U1TRNj
         Ghfo7g67Rr3pjNjCTlhZUOsHzV+xlsGnIfXUxsIItz9BPcKQqzm0+sAYNrTGvFlE7IFs
         KORPQthX0MoEZvf2fDIJceNk1vLjUt9UTyXvVWEbjF4MB/JiFOxf6OHeE6y/JygTneQe
         C1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA9BqMsZoNtfNgSexcSujfPzHtOYEoAOoW7R+ssBRF+fHfpLbBUFirRBsMOLVftkU9r3tqP3jEnwQ/Czo1XN5p@lists.infradead.org
X-Gm-Message-State: AOJu0YxR/pmw86Rn2KCPPBoRTLtzwzvAyFTRhvNejoLZ6tLFGduxIpPj
	iAW9iHSr8gO9e0f/TzPRQL4hMNSJcIPm7+6oHkkmZd0762Xc3BcUsofHiQbpsQ==
X-Gm-Gg: ASbGncv6r3gKKXspHUAR3HmgMR64SDZdz4CcjhM7zCpdAMOSL3+zQpNQwLsnVENtJ3D
	DYl2rizzmyhRxLUnOUdsV/AAd26w7MBOq1/qemNyDkhSEm/wVDDmP/FXkuhVXuT3Xe7PArjwnC4
	UuFv8D1ZKj5uZ+WDIVNTxeBr3s4WA3QjkT13H/JmRdV/Oy4mFhj0KkmVVpiutuhEMqml4W0duX+
	aQlk9q9wq2gsn1FWPVQcvFm4a752DUzb6BdUyz9iC0S5gC+XGFWUuSTgE1b63u7PUxEaySkyTuy
	gGchPVF2sUnAPV1xyGNMGifNBHu4bMc+MOs7
X-Google-Smtp-Source: AGHT+IEiXXDmNWiIoyS4g/sMa+CHtSKXB9iHnryoV5l5+xYp1a39XIVItxTv64eAI9cSRTAKN1SUlg==
X-Received: by 2002:a05:6a20:6a0b:b0:1e1:ad39:cc5c with SMTP id adf61e73a8af0-1eef3c7718dmr22630530637.14.1740375839448;
        Sun, 23 Feb 2025 21:43:59 -0800 (PST)
Received: from thinkpad ([36.255.17.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adf35fb47c4sm11085874a12.31.2025.02.23.21.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 21:43:58 -0800 (PST)
Date: Mon, 24 Feb 2025 11:13:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle array property
Message-ID: <20250224054353.c24rcplzsvskzceq@thinkpad>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_214400_810835_ED187FA8 
X-CRM114-Status: GOOD (  17.47  )
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

On Sat, Feb 22, 2025 at 11:43:44AM +0100, Lorenzo Bianconi wrote:
> Introduce the mediatek,pbus-csr property for the pbus-csr syscon node
> available on EN7581 SoC. The airoha pbus-csr block provides a configuration
> interface for the PBUS controller used to detect if a given address is
> accessible on PCIe controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index f05aab2b1addcac91d4685d7d94f421814822b92..162406e0691a81044406aa8f9e60605d0d917811 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -109,6 +109,17 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  mediatek,pbus-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to pbus-csr syscon
> +          - description: offset of pbus-csr base address register
> +          - description: offset of pbus-csr base address mask register
> +    description:
> +      Phandle with two arguments to the syscon node used to detect if
> +      a given address is accessible on PCIe controller.
> +
>    '#interrupt-cells':
>      const: 1
>  
> @@ -168,6 +179,8 @@ allOf:
>            minItems: 1
>            maxItems: 2
>  
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -197,6 +210,8 @@ allOf:
>            minItems: 1
>            maxItems: 2
>  
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> @@ -224,6 +239,8 @@ allOf:
>            minItems: 1
>            maxItems: 2
>  
> +        mediatek,pbus-csr: false
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

