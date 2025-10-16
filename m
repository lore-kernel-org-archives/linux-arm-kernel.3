Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020DDCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 03:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3V6/3lwtdjURh/3v4+zxQ+JkOqta8pLIKsB7qZtosM=; b=m7enVXFQteNY7hnni3jlHs2+11
	iQI0FX0c3p5PZyDGG7x4rX6lnn33HWUQTEqiUXJ0Zfc5aIanGNV3gKCeDYWa8Y8Xjvbna/47RQytq
	RKM9QJN7JsB3mtw08aIOH4++qnGpYcIy6oinTeNpxcPh5X5B+NQ/kyQATJovb+BBP9mDJBvE7CkGk
	FLZnHQkIGXbcBk7rulLaLtJY7sSH6RI3o5us0vOpftcdT/4Zrt26rGKtFroir4mpHjhiMv9TX+GPm
	YtWSo1lqUws57Fl8fw1BGenTjIPTJIabieZY1oJvv3rxHJwrBTesC9WB0noLbKH68G9SfDeoO4Ii5
	RDj3dlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9EWE-00000003LoI-3uXL;
	Thu, 16 Oct 2025 03:19:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9EWB-00000003Lnv-30pd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 03:19:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b550a522a49so184920a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 20:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584746; x=1761189546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3V6/3lwtdjURh/3v4+zxQ+JkOqta8pLIKsB7qZtosM=;
        b=cDSSWnVkqJJ39XCP4wdiB1hRRXI1hqaQlUGWpl12cANa6VcV7XGFwM6v7xMNmvKpyw
         92qYR1v05o9Xg6D1s5AHJUd8+OHyAqGxUjJRiBOODJuX2/7srwGI7n+sDjm9pYRI5cwB
         F/fpTW2325MkTgWXIjtmodr1z0RDzO3AZuixBwo+9KZmquszmyIIUcKJV1VhZ5KTIc0Y
         EjLFboi8SvOShJdSFV+NENRijAfLUtx3bBVLdrcDDn74sqA8oVe+FCZJARdGoYRadfFs
         P0J7Q8DrAqz+NcrncG5HQG5f+TQhibcu441IL8w8IxOqtVTLscmuO3yPBk4WrjytiJ5z
         D6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584746; x=1761189546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3V6/3lwtdjURh/3v4+zxQ+JkOqta8pLIKsB7qZtosM=;
        b=DbWudKfuWYuyZbFaN/6G8NJxxnRJ/qiBqnAKfzJjb+J0QYy6cH9n6mJdiEclkKElal
         Not7qJXsm8srM2+4yr8Zag6ptznghWP2Aybvnrp4GVCLrlwpeNgcPxGApPhQYf+tCdrI
         6Nrzp/l9XUm+KTtp191/3VtRzlAWCiBK0EEgadarXNeA5v9v3oPkAA2QrCTPKlYlRS1f
         P1QOTDEtf48Zzt7yk8TndcOF8gJJBCBpujYnPPpunrD1l3f8Xt57HS3XoJxI7lYcP5qf
         tYggPp+069pO1sIBzsM8KjHv18S2og30qum2QuQ/+uJqmTEnb1XgQjH6dD5XqC1t4yRT
         CU9A==
X-Forwarded-Encrypted: i=1; AJvYcCW0SF0GMIbsNNhtAb75/LNYx7P34229ycZyFxOSChzXVmIVydhSSoBkQBl+zzI/K+xcs3Ahr8WK1IGUbK6dRMmL@lists.infradead.org
X-Gm-Message-State: AOJu0YwxyojKi4DcNKeaWWRaLpixE4HUGesCSrMJqNvqj0QMFFF7e8lB
	8hPBzQcQdpJ4edgvDsgMYZSDVbw9UnqzifOL2H9BP4VLJ1rACTgHswIP
X-Gm-Gg: ASbGncvVzfnr58EWs15J+2HfRg6wRLGEHN3BpMTuPj64XP+oMzHcayZs+62qGyDZVoJ
	Df7tXTDeEr4Q+V8vlT3tKymTHNlXSPDPNVrmZ9hCAlQzfzBsvRotQVhdRl94+RfSBeOEaMYm29T
	Nbehj8fEidfcuKJG6lKd6zvmkRaOWUKlZ13uOBms6S/S3gAzfMqIU3K8MsiuX+eWA4BvvjgfEbt
	MxwY5xXtPQeHUcBEejdHFHizOrjD43DBHWmRHjTIAste8Cis8KpEjwSqlwdfCFg2Qtl8tcPa6RC
	+ZGHobd2lPS3W6P1kSOu60StbIyK/f+yZl1e2hczVZDBhl9CYd6G0Zb6WL4pxSnDVw6VTyoj30h
	npPZcLJ7Zu6yJ4p+e8Ib3nXASGl2Qx2/qsWF2qJR19+nwac4B/0ejVVGObpZqwnA1iFIqWw0ZS0
	9SdNtrVBnhX9+n
X-Google-Smtp-Source: AGHT+IF4v2d27Dj/e7jq1kEU9oe1rwtYs2LQ1lRSZOTT/iIRfUfi40YveMA9WdkCLpBc1j1xOkHApQ==
X-Received: by 2002:a17:903:b4f:b0:288:e2ec:edfd with SMTP id d9443c01a7336-290272154a4mr369206485ad.10.1760584746390;
        Wed, 15 Oct 2025 20:19:06 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099ab9c0fsm11872355ad.82.2025.10.15.20.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 20:19:05 -0700 (PDT)
Message-ID: <227c0045-1e6c-4b2e-93d5-263213a7ff39@gmail.com>
Date: Wed, 15 Oct 2025 20:17:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: ethernet: eswin: Document for EIC7700
 SoC
To: weishangjuan@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jan.petrous@oss.nxp.com,
 inochiama@gmail.com, jszhang@kernel.org, 0x1207@gmail.com,
 boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 lizhi2@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Xuyang Dong <dongxuyang@eswincomputing.com>
References: <20251015113751.1114-1-weishangjuan@eswincomputing.com>
 <20251015114041.1166-1-weishangjuan@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251015114041.1166-1-weishangjuan@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_201907_785800_C42E7485 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Zhi, ShangJuan,


On 10/15/25 04:40, weishangjuan@eswincomputing.com wrote:
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
> index 000000000000..9ddbfe219ae2
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

Can you let me know which clock I should use for EIC7700 (HiFive P550), if
I apply this patchset on top of XuYang's v6 clock patchset? ref:
https://lore.kernel.org/all/20251009092029.140-1-dongxuyang@eswincomputing.com/
In your vendor kernel, you have EIC7700_CLK_HSP_ETH_[APP|CSR]_CLK, but in
the v6 clock patchset, I couldn't find them. Please help translate
<186> <171> <40> <193> to the macro of v6 clock patchset, so I can help
test it.

> +        clock-names = "axi", "cfg", "stmmaceth", "tx";> +        interrupt-parent = <&plic>;
> +        interrupts = <61>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&phy0>;> +        resets = <&reset 95>;

For reset, I assume this <95> corresponds to EIC7700_RESET_HSP_ETH0_ARST,
if applying on top of the v7 reset patchset, correct? ref:
https://lore.kernel.org/all/20250930093132.2003-1-dongxuyang@eswincomputing.com/

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
> --
> 2.17.1
> 

Bo

