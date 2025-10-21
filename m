Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A43CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=; b=MslZxPCOoCgPXxeXE/5Nj+VNiF
	UN2RXicpQ5kkbKHa9vrXMWtHh0i7HTeyjoJbyDWv5AHCiDtRV073EvICLg+FdVyisz/6Oxs98Z2k9
	k798wXYMvf+tdgxeMHkzgiiBKjF3rVoOmd7937Gb9Q7m6myAmZXC+AXA046zlv3LoZ8xGCQpVQNT5
	M+0JoqNerNVV6nHnaPt/gcMjv2dxyPCsIn/KlONJJTRdgz0NI6CY1CNKfBK/zHypPFGxbFx2Z9nu0
	kqsCWL8y6PfJTbAWHSwUYOI8ai9uVnpc5Rm0SVdj5oHg3EHWhG/H8UfvqPL8IAZ40eu1BrN3TFBvv
	gDAhettA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7Jr-0000000GCfF-1xlN;
	Tue, 21 Oct 2025 08:02:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7Jo-0000000GCeY-3D8Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:02:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so6835503a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761033726; x=1761638526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=;
        b=j42FLNzh5Dlh7XRdjkkT1gTuwPbZ1csqFTEs+Pvmj4U31qJuPO2qYdfCAphaKh99/k
         /PUvlVsZW4S448/+zWwfcZtMsWQrRFEk8gvWNtiINldKrXHZY2Pb+XwhHzQkQrspnR6P
         Bxq42rnUetMxVT4GVass2neEo8TQ/92Q2f+nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033726; x=1761638526;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmJ3kbCZYasBy1tdyPRhi15Hy8S31f6BJlgZcjYUhfI=;
        b=E9ejUgJKvM2ubfHNUelCyCq4uicTpQ6JBVC+IZfE9VSn4TpYq6FwSyu/6K6KXu4jEJ
         63opvb1Qv+ZNbMIGy3l/P2nZxe6o+oahMyBBRK2hgU6QTeHCPFE4dVgrqO9lx//5Jhzl
         h86f5JxKhQbDF0zi50XsX2dy1QnWbUf5EtITrIw0TTJJFjHAiOzeXedY+l3vRRgLMPIf
         6/Jg/hQ9m7tx8HyNc+4PdBUr66/UaM1y0NwAuCtiihs/BS4Q1mbGSOCTRyUXAcsLbjX1
         AyeaLNiO3/VJwcjbX+OadDzC89Qed5wMY/DGMA22iFlkoT8YJKXuMIDHouYW5i7qpLo3
         sRWw==
X-Forwarded-Encrypted: i=1; AJvYcCWSG8tc+66x8WWoP9gRh2ByptETW7DqMeU9w8YKRq8nxIWBRMz1rzxKFPd39qyDcS+rqwCJs69CCWUZKsuxHsK9@lists.infradead.org
X-Gm-Message-State: AOJu0YzKWR68RYueq8L8W5KiKOH5Zazpidi+4qojNYxe1il7SUUP9t6T
	gkFii/s2UT/AWShzuhFVYOLptdW7herXDdH9E7OVEJVEn1EXd3XyabI0RITXYd7kdSU=
X-Gm-Gg: ASbGnctl4TIi4LAsnmtrm1+ZZthjZoJMG4hM8yazJUvEuCzdF0CmwVTus7GAbm7Ca9V
	byl431H8Q0xBhj7Q59pPDFyWz7pjf4ZpeM7c6nWtkNIy5F0KJzPwFa9UOa03bNPXC7RiVvW7jd7
	xKDDWp26bYlYj31LCJ34bVXm45QzRbKOmkolddvh7JXe7ISS4c7gr6/slUKumkFmAYi+mZlyEVE
	mxZwPYQ9uE9g65dddVqnjfaZkPcaq/szwClZE3bYvv/rt5xj2vMEyopWM49AVVHzSfQdPd/ay+B
	cWbgyAf/ZGHKGTABuUFOm2mrC/mZIxLe98hBG5fwc01PyKsGSa9w/ZOSSnpC1w2Ym+tPj3fv5HT
	sIIO9FLszFQDl7fpt0/N19hKvnJ1L+WboB91brmlpIyknDIwIx95xCyR5Nhmlsy4A/AOuzvr/5y
	1UgSWUcXZkssVyLDsq1rzP3g==
X-Google-Smtp-Source: AGHT+IEQBbHU46zJp3I8qzuqYSyvo8c+5/g/4Db1HXzfzGIE1r78chLA2+YlpgeKvqwNE6fWnrQZTA==
X-Received: by 2002:a05:6402:1471:b0:62e:e722:a3c7 with SMTP id 4fb4d7f45d1cf-63c1f6345ccmr16006744a12.9.1761033725994;
        Tue, 21 Oct 2025 01:02:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c494301aasm8934112a12.24.2025.10.21.01.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:02:05 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:02:03 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-2-shengjiu.wang@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010209_203816_D7B4DFD9 
X-CRM114-Status: GOOD (  21.92  )
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

On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> Controller compose the HDMI audio pipeline.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

dt patches need an ack from dt maintainers before you push them, please
make sure you follow that for the next changes.
-Sima

> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..6211ab8bbb0e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,6 +49,10 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port
> +
>      required:
>        - port@0
>        - port@1
> @@ -98,5 +102,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..4f99682a308d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> +  Audio Subsystem to the HDMI TX Controller.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    audio-bridge@32fc4800 {
> +        compatible = "fsl,imx8mp-hdmi-pai";
> +        reg = <0x32fc4800 0x800>;
> +        interrupt-parent = <&irqsteer_hdmi>;
> +        interrupts = <14>;
> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> +        clock-names = "apb";
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +
> +        port {
> +            pai_to_hdmi_tx: endpoint {
> +                remote-endpoint = <&hdmi_tx_from_pai>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

