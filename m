Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB8D767FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JfYq9s6ngpopb/HFUrI8d6+rkmKVhmoYL6XuSM5GkQ=; b=Wp0fA3uV5+/isPu3wz+949plHt
	t7ntujqXGceRyttAMSKZyxZiIVhtbf5LTEvsPxVtxQUvehOHBskzuplVV4ELbjXCdUanYiflbQgFQ
	vTX1l0KYOe9ZllbQhkqq065aISuTjjLRClRAdqobUHeivyTcOROS/FcAqj6YtMXweeIueR+RcCRqX
	48d+Nw9ZdnJhgJz5H1ryusQrERhOrzSotrh7YLWGTSci4H11fNEG65oimFI4V6GCjZbbvPQaRsvMU
	xqrVoci9nCg1m6yGI8CY+KM3pF9i/OQlgS/R+1zpnu7noGGv+HPKqb31cUC7imXrwdXpa5gsF2npM
	pNzRnPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bIa-00000004iBg-1OTC;
	Thu, 31 Oct 2024 19:57:40 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bGp-00000004heQ-1tXs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:55:52 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so12734131fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730404549; x=1731009349; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/JfYq9s6ngpopb/HFUrI8d6+rkmKVhmoYL6XuSM5GkQ=;
        b=jTju6eOuXKusz8ZUCJs/TzIOFrPUAoN/0cy8Jngo9An8NahWaMGKKXjpzrIABvs6wM
         lRgW/H2mnyukAaoQaIdtI+Nf4Manm78Zn1dn5QPsEHTEtSUI9qrNy8qOkbS1hlKUV4fQ
         86VnzBoGS8/QefObqP4QcceeKJSPKRuyRfTVBJTxtj5uJVo6aeZMiFZwmng/FaMgsGDc
         pP6cDlUFWv/LBCr3DU8t6A4n53Xz6zEg42x9LQ3JoyD0ykOe6ufpkxT8dyBVOGl1Al9z
         t0RAy4I69u81hsbYjOuObzQLo5Ee7h1ZSXAgWuiVo8949eT/mbaz5z+pwKit5P1QvYKo
         b1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404549; x=1731009349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JfYq9s6ngpopb/HFUrI8d6+rkmKVhmoYL6XuSM5GkQ=;
        b=m+H771c+3vrKCz/mHRibHsl8O08MW+Qpqv46Z2M44m7apvECbwAYtIfMKG6l2xJJye
         bhJUkm2cQijyKkv6x9rGGGKlLmw2IOp597sdZYcPJhufOPE7HFAv3O6EzWyXsWzCWiu9
         1KH8JrdAFFXPnk1YeXzVg3fuOC0VzYa8wiQu6utFImfRpMSQ06nMlMFJ2LBGiMprZ0CI
         fpNGfw7BzXzBeGnDitiMkYs+/9uRpfB7QWTA+OTqvqFt2P90v+THs8GzJajHMtJEPPT9
         U+Pks48/NKz+cqKLBcCfdTYlLKeqip6x/L5HbDfsrQ4svizVAmK9lNUwWqYirSJ1ZAqI
         ZdAw==
X-Forwarded-Encrypted: i=1; AJvYcCVjRg9gWWT5sbUFgTOqIbfm+nRb/5NNDcIuEu4uzQU+3GlPFbbuzCa+GjUvGRYouz99kkhINjzi14e+9L3T3Svl@lists.infradead.org
X-Gm-Message-State: AOJu0YzQf6hf53WP3Fnje0wzZcP90OJsb4aswU3VJtwtopJ4tS9XuYt2
	6SO20zPUpQuIIUJ+cRD9mrh/NhPLnhAhxSYD7usuMZob5Qc2kvYqDYKS7Cp4Qkk=
X-Google-Smtp-Source: AGHT+IFST23M4a8b1pktfQRWTCWa5bDO89YGeshcwWLCnCkXGUc3a5M1/Bok3OaH8Ct0VxyqE0z6DA==
X-Received: by 2002:a2e:b895:0:b0:2fb:5014:8eb9 with SMTP id 38308e7fff4ca-2fdec4b5a95mr24056941fa.10.1730404548868;
        Thu, 31 Oct 2024 12:55:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d77aasm3192261fa.47.2024.10.31.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:55:47 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:55:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org, 
	kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <22f3pkf63uphnx3opld6ibkhptbtxqoguqgu6iswb6w4hzkxxd@pwbdwjdodcnc>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_125551_523157_459D5A59 
X-CRM114-Status: GOOD (  20.04  )
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

On Tue, Oct 29, 2024 at 02:02:11PM +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v17->v18:
> - remove lane-mapping and replace it with data-lanes
> - remove r-b tag as property changed.
> 
> v16->v17:
> - Add lane-mapping property
> 
> v9->v16:
>  *No change
> 
>  .../display/bridge/cdns,mhdp8501.yaml         | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 0000000000000..e4b900ecf1ac9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 DP/HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mhdp8501
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP8501 DP/HDMI APB clock.
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      phandle to the DP/HDMI PHY
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  data-lanes:
> +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> +    minItems: 4
> +    maxItems: 4
> +    description: Lane reordering for HDMI or DisplayPort interface.

So, HDMI or DP port? I don't think the format is actually the same, so
it is either-or.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port from display controller output.
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port to DisplayPort or HDMI connector.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - interrupt-names
> +  - phys
> +  - data-lanes
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mhdp: display-bridge@32c00000 {
> +        compatible = "fsl,imx8mq-mhdp8501";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        phys = <&mdhp_phy>;
> +        data-lanes = <1 2 3 4>;

0 1 2 3

> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mhdp_in: endpoint {
> +                    remote-endpoint = <&dcss_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                mhdp_out: endpoint {
> +                    remote-endpoint = <&dp_connector>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

