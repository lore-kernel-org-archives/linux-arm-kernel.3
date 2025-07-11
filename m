Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540C6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxCChrglHn+Uqy0YUudJl4m6M4rjCL8xQf7aFXlmf3g=; b=QAf2te25OzdDVNsluIV2cNsoIh
	vSh8NYhhytEgtoqNR2eck3IKPCdbTZvWe3VEYfzZJZtKM6ZvGi+2bDMYbXBcxquPAILIl451vZ9g9
	Nl6EYtCOVdhCKk2FOu83e73NDpBOk9WrZC8u/jCVQ3J99HCLYLa1ChRYpMZYJXih3gnagkceESE15
	Stx+9UNwFQsopUGwjXuqm/YLgPA36H6VtSLA2pHVOBc5rTeJlKMPl90srpGgvcY1uE3ZCj5xjEOC7
	cUaUs6vLmTR84xIK1y7FFzP6qOky1rriPW0DziSkZ6/gq6hteibdnt5v+fSmyJ6NHODuSbuGkNbV5
	6fKgd0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEKy-0000000Eymy-1iYW;
	Fri, 11 Jul 2025 14:02:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE9A-0000000Ex5m-0jOf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:50:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2005234b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752241839; x=1752846639; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxCChrglHn+Uqy0YUudJl4m6M4rjCL8xQf7aFXlmf3g=;
        b=OK1aV8AiChqaz1AYgJEa6Vvlmyipmt0G/hlilPQ3t/T2GTS6E+sqg40RrmVNUv73gO
         n/M9MyUcjBqwHTyMsacNhvNcccO/Q6+CJ8vdQOdDqd2MtUAlOTAjQDkp1MYSOBjcJNoH
         HB396qH//n0Bn5stpsdejFqajTvErTCZW1WvN4Z0cAFqk5BZledBDT85kVJiGgQo3JBt
         2MyScswXjkbKySR68hTTBqEZGDICdAvsdF5+PyxNBw3r1PNAJTxMkInZ8ot8VyCuUT3x
         OtNBrPDtOj5eluWGF/zOWzEoc/LwtSa/Op8umcrYbGj56WFTW7pIe6aVId86OvF/duNL
         JMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241839; x=1752846639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxCChrglHn+Uqy0YUudJl4m6M4rjCL8xQf7aFXlmf3g=;
        b=k/uejKWpR5kN4MHYHYXfasTOskKT+EJcoktdN04Xh+scEOE0P/DACM0b+XoS/Ysmwe
         DuWqfQpyPehiXL8I3VYTNEb8FgVwEbxnbOF9yfDptZ+1vDPaejQF56dk8JJhqbDFJGpz
         LqkSEvmB2F0JpbSCoi84rM4CCQW15dufuctNlHXXkFZRUMbMDhiURX6fxP6jfAFYBe8g
         gge6yLedtySXiv5okeV28y3Pg/eOyF2c0nYmgvBoJmeAQTpO57HvTXvR6vEDHgwQ9bPF
         5N6BMqhGqbH/Ur8Qg56hGWfZPZ0TMAQLpzE7DxTmNG3n/XVHgBQ2NZfqBw9XvV5qI3Kx
         Muzg==
X-Forwarded-Encrypted: i=1; AJvYcCW4/IVvsaIxupMN9/fGuxjlY7Bw9kSFL1SfxrNImUzkXZjHo0UCM1HDCvhkKEZGBMEIzh2iapd55VLUmoNN1hIO@lists.infradead.org
X-Gm-Message-State: AOJu0YyrCQ+i0RYMa5Bwch3LcqaQhZhRvpKUrxPje3j1dZmDjiFT5bHS
	0BvwxSq7vOcduJ0w9DfGq+Cd9P/CenP7WJ2QROc8Q20PiADD6iL+vhunxmtmHgpY9UKRjn3AZBF
	h9YIE1+astptag98Bm3SQoODa7Ge/UOXzmeXPWv4jVg==
X-Gm-Gg: ASbGncuu2wFYODgRResGSIo2ycW8hLg5O0qbzaNICTjAewr1l9cC45/2mcyLppXkxL1
	uF5MFuNaec9VGb9+VbrWFBBwg2cWu8sKI8zTC+jzkh3iS47q3BCl30q0nodiezqSl6sOW33Hnj/
	LOEFQXnu9FZmKinfJfoWDyyZxK5NUh7NzwtwwlGMrgEN7foNpCesv7p9BLFUWqJK65Gbj8YTCY1
	RDVH9tkcQLdk8CvddSG8K0oGPQdwMfagkyAgwqi
X-Google-Smtp-Source: AGHT+IF9w1zlsOy9Tpc/VqUpX5hlsohRMIl3W8B9IgIpmh4707Cf+Roh6PhUrMsx1N8++dq63Ov8Ydg2FFN95JGpX3E=
X-Received: by 2002:a05:6a00:856:b0:748:fcfa:8bd5 with SMTP id
 d2e1a72fcca58-74ee0bb022amr4951233b3a.3.1752241839246; Fri, 11 Jul 2025
 06:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com> <20250611-trace-noc-v10-1-a83b5c63da34@quicinc.com>
In-Reply-To: <20250611-trace-noc-v10-1-a83b5c63da34@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 14:50:27 +0100
X-Gm-Features: Ac12FXz5suXDSfb0reqEF8K7TSk9o2sFELW1ViZ5ykT-xvY6SdObq4JpNg1MVng
Message-ID: <CAJ9a7Vhs=5pXu4JvqeAbLBbV97x4xwVP6ag4oiK5sbJntwNNqA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: arm: Add device Trace Network On
 Chip definition
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_065040_211416_614717A0 
X-CRM114-Status: GOOD (  20.96  )
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

On Wed, 11 Jun 2025 at 11:43, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
> Add a new coresight-tnoc.yaml file to describe the bindings required to
> define Trace Network On Chip (TNOC) in device trees. TNOC is an
> integration hierarchy which is a hardware component that integrates the
> functionalities of TPDA and funnels. It collects trace form subsystems
> and transfers to coresight sink.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 +++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d1c93a9ade3ff14ede4a8d1481782776cf47be9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Trace Network On Chip - TNOC
> +
> +maintainers:
> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> +
> +description: >
> +  The Trace Network On Chip (TNOC) is an integration hierarchy hardware
> +  component that integrates the functionalities of TPDA and funnels.
> +
> +  It sits in the different subsystem of SOC and aggregates the trace and
> +  transports it to Aggregation TNOC or to coresight trace sink eventually.
> +  TNOC embeds bridges for all the interfaces APB, ATB, TPDA and NTS (Narrow
> +  Time Stamp).
> +
> +  TNOC can take inputs from different trace sources i.e. ATB, TPDM.
> +
> +  Note this binding is specifically intended for Aggregator TNOC instances.
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,coresight-tnoc
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^tn(@[0-9a-f]+)$"
> +
> +  compatible:
> +    items:
> +      - const: qcom,coresight-tnoc
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  clocks:
> +    items:
> +      - description: APB register access clock
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    patternProperties:
> +      '^port(@[0-9a-f]{1,2})?$':
> +        description: Input connections from CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +  out-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description:
> +          Output connection to CoreSight Trace Bus
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - in-ports
> +  - out-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tn@109ab000  {
> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
> +      reg = <0x109ab000 0x4200>;
> +
> +      clocks = <&aoss_qmp>;
> +      clock-names = "apb_pclk";
> +
> +      in-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          tn_ag_in_tpdm_gcc: endpoint {
> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
> +          };
> +        };
> +      };
> +
> +      out-ports {
> +        port {
> +          tn_ag_out_funnel_in1: endpoint {
> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
> +          };
> +        };
> +      };
> +    };
> +...
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

