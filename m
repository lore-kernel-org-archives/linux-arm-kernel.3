Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842ECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISi9f6KzQSpnphkygLBuAPANu77cvnhCFWLhBPhHgsY=; b=h15l1C4rI/ctJ2No2/iZ4iCpVj
	fgOTMUVF4yfSHWni57ViWXQyTnM4TF9B/nW/XEFUEsxGNbxwcbf5HClHKMBzBWGp45cb5xMtokkb8
	CkId41Y4LoEEJParzWUk4qpcb/JOPNWnrqCYYD2/MAD99aG+lhq33afyom35djCyQN93A7WcAlndi
	8PqH8bVnAzgl4UhlVKXSO9py6XraS5UGaD3hGViWu03qp5Qb/K4W6p6cyYGQmmRtdE0qMfLqUEidO
	6s3zINnPZQI3KkrwxOx35/15vcdka+UiACgaFlhGjTBk1pKEhif5ocz9+oPF3VVvBQ67D868Kgsht
	Q0IrhvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ant-0000000FgDv-1Zsl;
	Tue, 14 Oct 2025 08:54:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8anq-0000000FgCn-3sZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:54:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4041270b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760432082; x=1761036882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ISi9f6KzQSpnphkygLBuAPANu77cvnhCFWLhBPhHgsY=;
        b=dsWHpe+0CU7ARRhpfRS/4agg0edK1uXoDUEKelB5wsd+RHDlH6aUKfoE4qHXKhTulg
         HLS4KJbDXSVC3OuxPHIDhcs1sCUuWdVBo28MWcJE8zy5zERK4pRXJd5zJHVE4A5PucWn
         2OIEqT6sn601foYY9eLuVsUZqWcPx7ISOSsJOsXIF+0yCeN4MTsuShOa9RtUJNu5/6WJ
         3v1MytNwg+l+uMRqdIIjzguK4JH6QZD95k7SDfsppCwtpQdlaaqjF7IMVXlhfKFAtbFe
         7NBubGvJ9aXXIy87jUDcj0SUbVmPMJOs1OnWVtGbGMRWlRQ2O0/KZ993SLFh1bo3J+eM
         Xfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760432082; x=1761036882;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISi9f6KzQSpnphkygLBuAPANu77cvnhCFWLhBPhHgsY=;
        b=XWLtxnyP0V+982NeqVkiMA1ms+6gCujKUfLFv3V0DE9hgXFam2wjpGqTeneTHF+iNt
         CaadTDiKHriVWwXUPb2Dr4T/P84ngfnauQ6mnqJnHuYYRKp0zYRWkZi8W63MGmIL56YM
         EOh8r56sbKS6kAKezQMgxcLDdBgTtWnAsKQf5yzrqgf2QTKw6Gp+Lsgon3VjeG7DVujp
         HQqV75nPIV9a/yooHUYnCVi3229PyRHADLwM0SQCa71Ixxdu0LlclCaIzHcOjFj2GKNH
         ExRTWsKpyKJRjRVIB+PtXoaaURrSQPlERABxyOUyc9dwPlxoG0depI18lgdrRccUPCSQ
         zOiA==
X-Forwarded-Encrypted: i=1; AJvYcCUc46owhc2Jwg3DgaS0UFtD/hml5z3rwxc9zy4vZSihj6B0SeRxLnFvqoyQjUw95yyyLB88ViOglQhE6BcOw5LA@lists.infradead.org
X-Gm-Message-State: AOJu0YzP5Z3UuLFtTdAIhmKU6pVo1DAVJc8IlDmkCYYER2HphH7xu9Dt
	f1z1ZOHZ/doD+64wrkbAWzOhK/q+G43mBbF2iUZC5NOxKzextAruGxFL
X-Gm-Gg: ASbGncsbeGitNBKhxhHRmHLEYdbtlkEr+JkI7xm3FIbZcuhdeXl7HjEvPR5WMhBsKJm
	6Jt5ti/rbQzuDy5uXvOgMWhzicPaA2qHJEfFz5nEDuMirQmC5awfK5zI6eUZABSUZfTK7QWIRj+
	Opc31rms40TCvetxDe1wVYtQMjTbiCo/16vdpmmxZ1GvSqN+gQZ1U7RM2jAX47ou+nOy14lwZqz
	kThdH59t2IMlpqZOaRb7tY7mnI+fDiVBI18XA05du+BfxUhdHvngFXZbqCeGxQmkhvgmJGy0hK6
	pkpcp79FbuYZf5Vhorwklb21XuvdeqliaZJRQzTDzRvr8l8RoEIf2dF/zE/bWthDVxhxUQC/pg3
	tLxkFXh1J/GvE1omI1exsjUVe5swVo6lbSvkdb6J7jZ/cfG+wfax6pw==
X-Google-Smtp-Source: AGHT+IGqTpN25zTj2NoGAGnl9jeNvvTw7CBNIuJy1oxy3KZR2C7Ji/G8drrYLcEK31MzNn+ZS3y/Fg==
X-Received: by 2002:a05:6a00:4fd3:b0:776:12ea:c737 with SMTP id d2e1a72fcca58-79387e05323mr21822249b3a.23.1760432081535;
        Tue, 14 Oct 2025 01:54:41 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060b66sm14499599b3a.8.2025.10.14.01.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:54:41 -0700 (PDT)
Message-ID: <8226884b-96f9-483e-bcee-466ff3e04b23@gmail.com>
Date: Tue, 14 Oct 2025 01:53:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: ethernet: eswin: Document for EIC7700
 SoC
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 anthony.l.nguyen@intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, inochiama@gmail.com,
 0x1207@gmail.com, boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 lizhi2@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918085903.3228-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
In-Reply-To: <20250918085903.3228-1-weishangjuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_015442_973328_CE8F0A63 
X-CRM114-Status: GOOD (  19.28  )
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

On 9/18/25 01:59, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting clock
> configuration, delay adjustment and speed adaptive functions.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/net/eswin,eic7700-eth.yaml       | 127 ++++++++++++++++++
>   1 file changed, 127 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> new file mode 100644
> index 000000000000..57d6d0efc126
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -0,0 +1,127 @@
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
> +description:
> +  Platform glue layer implementation for STMMAC Ethernet driver.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - eswin,eic7700-qos-eth
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: eswin,eic7700-qos-eth
> +      - const: snps,dwmac-5.20
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: macirq
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: Configuration clock
> +      - description: GMAC main clock
> +      - description: Tx clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: cfg
> +      - const: stmmaceth
> +      - const: tx
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  rx-internal-delay-ps:
> +    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +
> +  tx-internal-delay-ps:
> +    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
> +
> +  eswin,hsp-sp-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - description: Phandle to HSP(High-Speed Peripheral) device
> +      - description: Offset of phy control register for internal
> +                     or external clock selection
> +      - description: Offset of AXI clock controller Low-Power request
> +                     register
> +      - description: Offset of register controlling TX/RX clock delay
> +    description: |
> +      High-Speed Peripheral device needed to configure clock selection,
> +      clock low-power mode and clock delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - resets
> +  - reset-names
> +  - rx-internal-delay-ps
> +  - tx-internal-delay-ps
> +  - eswin,hsp-sp-csr
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
> +        reg = <0x50400000 0x10000>;
> +        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
> +                <&d0_clock 193>;
> +        clock-names = "axi", "cfg", "stmmaceth", "tx";
> +        interrupt-parent = <&plic>;
> +        interrupts = <61>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&phy0>;
> +        resets = <&reset 95>;
> +        reset-names = "stmmaceth";
> +        rx-internal-delay-ps = <200>;
> +        tx-internal-delay-ps = <200>;
> +        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        snps,aal;
> +        snps,fixed-burst;
> +        snps,tso;
> +        stmmac_axi_setup: stmmac-axi-config {
> +            snps,blen = <0 0 0 0 16 8 4>;
> +            snps,rd_osr_lmt = <2>;
> +            snps,wr_osr_lmt = <2>;
> +        };
> +    };
> \ No newline at end of file
> --
> 2.17.1
> 

Hi ShangJuan,

I'm active user of HiFive p550. I'd like to test out this driver. Do you have
the device tree section of phy0 for Hifive p550 board? Or it's optional for
p550 board and I can just provide an empty &phy0 node? Regarding hsp_sp_csr
node, I should be able to use
https://github.com/sifiveinc/riscv-linux/blob/b4a753400e624a0eba3ec475fba2866dd7efb767/arch/riscv/boot/dts/eswin/eic7700.dtsi#L167
correct?

Bo

