Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB5C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 01:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBoiEuNQUK+MG2DD2nIykSgb4W6tOdrktJLNBGrAb/Y=; b=fIISczg1UXsuA7jW1lSx0PVUoI
	VODBwzwYSArlgMKDHD5/mOh26omIfYk+yTa88QRMCuPvcNJBxrwb/4hxeZsHd3I5pLvL2I0XcP+gS
	y9et4wLyOTnRrDiL/ITqOBcNRbJmmW2xZYnQAPjSMQknbnMzzsh7pmzn9bGsqeM3+p61hkMtTobY5
	QrWCO045Qy57KRBvs4EMaFSYA4BpzZg3cB0aQ5xea0dxh+a9xUvKuIzpaVK5RlC8s5jmn0lixeddl
	CMsABd/PHz0kRPkaTXNm0Ew3ryMhRuHf/z3VdIp3CIxyf6dR26qxTDfX2b2VqpWhVUj1TJq4D4JjW
	HQPToIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSY2-00000006Uhs-1mh4;
	Sun, 18 May 2025 01:10:38 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGSW0-00000006UYb-4ADU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 01:08:34 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6f8b0fdd5ffso27671776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 May 2025 18:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747530511; x=1748135311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBoiEuNQUK+MG2DD2nIykSgb4W6tOdrktJLNBGrAb/Y=;
        b=SGavsffU8gqN4zTcL8GxHphCkE/hlAO1F5u7wbVt8dte8vf3e7Q6+Wr3cejQo/Ojte
         ZXC0r9vxN6ZVaiqW1cVv3JCZUI8TKPM9bdfxiMKg/3Vk46NOzi8mkuo/0wYuLoKQmqf8
         8VcNxj3eMFEZ57qWM7+P3g9KhbbxKbuYMrZCnMWvqXb8C1YM5GKaFWTyhliOHOmjE0If
         pcGqPElO1St/yGOylhMQUkW/mQt+k/OS3E0faO6opfD8zUe9OL36BtT6ls5EQ7QPkMAO
         41FVX0y0570JoCEtO68yKTwspHa9NfoNfI5oDC15HfmDfZrcKth/Cazv9NSjSREsj9ge
         VmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747530511; x=1748135311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBoiEuNQUK+MG2DD2nIykSgb4W6tOdrktJLNBGrAb/Y=;
        b=XaDnHH+OCuRjEAStC9HubN7m84aemfXhz1ggBKo5Ze2qDueBesnuSlL0VqMt77Hd7D
         LhglhA1XvCTitAr6FkutiMJh8u8JZfBjvGQuRmUeFscJGtb9mMw4HS9KA4HnmLyI9bYy
         a++DHdynvouSjyazEP1nUdiwkJv5ZLxVhR4T+evIW1X5/GgZPTwkBBM1QtKe0E9svIKZ
         Fm0SiRbvMoJ0AoZdOpQS+hFL52scAHmIgDTfBsLjN1Zdtg7UBypicHAMna/eiRUBKg1b
         t7rjDAOcJAt/ibuoRwCdDZeTsJSe9w7oH2ydA/+WXgAOttWvL6ER2uOGjNWeKatCchA2
         +fkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkPVDBnwEMVJAFqJs/LDwyjEdMiYLRQ2gcfmDXbJUoq3EyvQBWzMmz7DY9K60i+YyJzWUd9j/86c5pWXtQRtXY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2R8i5v3DI0OYL7VmXWNzxxoy1jas9EsbXjpExm3Z5BBvrpTs5
	4bIFsYFUCcQxkEKbJKsUJSSkgasq5VjkMeP5aD03yfrWGh8ThA7+pytC
X-Gm-Gg: ASbGncuZbnPQx3SO1/2amBfQ3q4X2p+lmzdQpJhPoXMzF40qafiJOr6bXRagYJrXdm8
	tadmSKWOWxFiqZ9io1UIs4VMkbbgH8Gc4mdXhq0Mr3XpJ9sFpHbpc3biJ+BkaQVkfuYDgk6jk/E
	92VHNS1C3OeALR5Ht9izZVU1VaOVrN9qHBhP87sKfo74ApWWT4UeZtPBmYmPboawtJkxR78C4D0
	vcKc0+zsxsJYKXoZ09h4m8w0rL5trhvG8Wfw+AYhcEh20cpq1YTO3BoOkCAz8kwyMLHOqtOajqv
	cAI9g6puRnM0sdRAZwbj9Bq2THk=
X-Google-Smtp-Source: AGHT+IGWyPrDcYHqjCN3qtoNsW5iOSUZa13NaKXNbx7t9skbjcJsYPif4vqMZCd2++JUXSgynnt8yg==
X-Received: by 2002:a0c:f113:0:b0:6f8:b4aa:2a4c with SMTP id 6a1803df08f44-6f8b4aa47f5mr74616576d6.14.1747530511141;
        Sat, 17 May 2025 18:08:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468b6a53sm335710785a.67.2025.05.17.18.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 18:08:30 -0700 (PDT)
Date: Sun, 18 May 2025 09:07:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	richardcochran@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com, rmk+kernel@armlinux.org.uk, 
	jszhang@kernel.org, inochiama@gmail.com, jan.petrous@oss.nxp.com, 
	dfustini@tenstorrent.com, 0x1207@gmail.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	lizhi2@eswincomputing.com
Subject: Re: [PATCH v1 1/2] ethernet: eswin: Document for eic7700 SoC
Message-ID: <mqf33f6bd6w7ozklh7igpa7ybgzuicqfxrbokvdcvcofwayffx@i6g5mqebahif>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011040.801-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516011040.801-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_180833_038027_F073011C 
X-CRM114-Status: GOOD (  17.72  )
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

On Fri, May 16, 2025 at 09:10:38AM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting
> multi-rate (10M/100M/1G) auto-negotiation, PHY LED configuration,
> clock/reset control, and AXI bus parameter optimization.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> new file mode 100644
> index 000000000000..6cb9c109c036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/eswin,eic7700-eth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin EIC7700 SOC Eth Controller
> +
> +maintainers:
> +  - Shuang Liang <liangshuang@eswincomputing.com>
> +  - Zhi Li <lizhi2@eswincomputing.com>
> +  - Shangjuan Wei <weishangjuan@eswincomputing.com>
> +
> +description: |
> +  The eth controller registers are part of the syscrg block on
> +  the EIC7700 SoC.
> +
> +properties:
> +  compatible:
> +    const: eswin,eic7700-qos-eth

Please set the related dwmac version as basic compatible,
it should be something like snps,dwmac-xxx.

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Base address and size
> +      - description: Extension region (optional)
> +
> +  interrupt-names:
> +    const: macirq
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phy-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [mii, gmii, rgmii, rmii, sgmii]
> +
> +  id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller instance ID
> +

> +  clocks:
> +    minItems: 3
> +    maxItems: 7
> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: app
> +      - const: stmmaceth
> +      - const: tx
> +      - const: slave_bus
> +      - const: master_bus
> +      - const: ptp_ref
> +      - const: phy_ref_clk
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: ethrst

Please refer to snps,dwmac.yaml and set a matching name.
This applies to all properties with snp prefix.

> +
> +  dma-noncoherent: true
> +
> +  # Custom properties
> +  eswin,hsp_sp_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: HSP SP control registers
> +
> +  eswin,syscrg_csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: System clock registers
> +
> +  eswin,dly_hsp_reg:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: HSP delay control registers
> +
> +  snps,axi-config:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: AXI bus configuration
> +
> +  stmmac-axi-config:
> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      snps,lpi_en:
> +        type: boolean
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Low Power Interface enable flag (true/false)
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-names
> +  - interrupts
> +  - phy-mode
> +  - id
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - eswin,hsp_sp_csr
> +  - eswin,syscrg_csr
> +  - eswin,dly_hsp_reg
> +  - snps,axi-config
> +  - snps,blen
> +  - snps,rd_osr_lmt
> +  - snps,wr_osr_lmt
> +  - snps,lpi_en
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth";
> +        reg = <0x0 0x50400000 0x0 0x10000>;
> +        interrupt-parent = <&plic>;
> +        interrupt-names = "macirq";
> +        interrupts = <61>;
> +        phy-mode = "rgmii";
> +        id = <0>;
> +        status = "disabled";
> +        clocks = <&clock 550>,
> +                 <&clock 551>,
> +                 <&clock 552>;
> +        clock-names = "app", "stmmaceth", "tx";
> +        resets = <&reset 0x07 (1 << 26)>;
> +        reset-names = "ethrst";
> +        dma-noncoherent;
> +        eswin,hsp_sp_csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
> +        eswin,syscrg_csr = <&sys_crg 0x148 0x14c>;
> +        eswin,dly_hsp_reg = <0x114 0x118 0x11c>;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        stmmac_axi_setup: stmmac-axi-config {
> +            snps,blen = <0 0 0 0 16 8 4>;
> +            snps,rd_osr_lmt = <2>;
> +            snps,wr_osr_lmt = <2>;
> +            snps,lpi_en;
> +        };
> +    };
> -- 
> 2.17.1
> 

