Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE0BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=; b=mRU7DkbTyRgEoyGZMDmxUJdNe4
	BatmKBBoKB9+ivOmgd1v9HI4UMcsSyARBu0Uyld8+DrBYEjgMFhIMzj5w5FC/pOgbya6TXsGCVktF
	uNSXIZB9Z60ylIAoUB8slBfpOkW6QmuGfXlVmd9zWwnMYvHt3X8lRymDPXe9PCdRa4LCv+69DtsC6
	cy0O57+3Bo/ZnGry7rlXSHhvpCBf6iynO4vFNHcP4IttEt+XCDRy1qb1oCEj+qpmnVIX/Dq10LH9r
	QW/2eQjbMKX2tOqkc9tFt0WKCbsxi2G9l4iFKSeedqhxsVngElT23BnpdbW7CdHnvzTJzAAnkQ2MD
	7U0O1m4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BGR-00000000HQ2-1lY1;
	Thu, 03 Sep 2026 17:30:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BGO-00000000HPN-0z9N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:30:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d91518a63fso794385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788456610; x=1789061410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=;
        b=Ezcc4OBhuWVD/eENezZQyD5POZnU8oCou84DsS4AZrNKK2bh/3R+K9KmMuwmiFU5HK
         VeuA2Q9Qi+vEj+dy0Krs5fCN7/ZR9/4WpYygMq/dC1MM9WChuFU10wgG/1OhtQIyvotX
         Ygc40UPF0gSTjDGxumDo9DLvMDAEiet7aKLvTqBRelgpPfqy0PmNk48c4Rmmn0S8Aau4
         7hkWQAtLj4lF5hr9JzADoA4VMj5TydP/PIH8KwSxuTFkQ04RuGlyAv9J09L6mXjnTPYu
         O2Y7dXsFfkRRhryBxfrO0qq57wGHUqVW1tDuCCghjxS4lYtGnZm7rlUwGIT0FqfxFGao
         LMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456610; x=1789061410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=;
        b=GzEHm1CM3PvytaCbv56dxo83ky0Usbe0EMD1ACMv8/9iCDdu38i+3nTQ79DkHb8j9C
         wxzyBv4ObvDD15OIp8din/Msi9GCU8ADbb0mf3u/cRa9MvgI+xlrC1+YXnqU3sIdmTV5
         5JGbC6jNxBmy5fjOTMuURe2RG6+YvXbXfXSU29e7P1z3rCuRSPXn5kgDcRy5p2rdFE1+
         h9eYhbzV24/HsMSPahVIoyoG2TfjiSeqIt79HxYejtPgQvpOovWo1tdyXhO8xMw8UYH+
         AEuyQBNa8pUJ/6iBESao7Xb+Rqe+LyN4tfxSd3uvP7JS6350aO9Vk9dArdfNgSK2bG3f
         LAJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJVdGr7fI5+eqnvXHm2KBoHhhDDP2HqbtcQv2SstYQi/Tc+PgC4lRExDfkpL4V7MfllNjzmzWpzzbSYUqMnVju@lists.infradead.org
X-Gm-Message-State: AFuF++nIU0waBDA6EotL31daQWHgWzT1FtU4Q1S21JI3/NQaLGg/ySsw
	K1HzVBaINGCicBAD62+3qAs5gpGad+SwyYAyRHb40X1ietllzOvGA69n4u7uQWNaR5E=
X-Gm-Gg: AYBFou1wbAx1LsQ8IUEOlO53lxyGh0m8hIdtqGHGeFQq/ZSaUHfPt4Xakk0gl/05ib7
	x8+3lhlvatKQSJeNm2H4iiQMX0lQYkRknLL+hqsnQW0+5yldeBLIo3rTuupw5opg7UgCoPVVyGX
	RF9MIsb4FcVSfGg4AJ1i20vFJGJI2X11VHW8+Byt85U/8mgXPos0r1VJqOnqnjGK6CyNO+dVBfi
	a/8ll+xIIrODsJxv1a6TFeV0Ltiy9KoCXoA4QMdV41W/p0DxILMZvyUDUXUiMilVElxhbGZyll/
	rjwIuKN/P78qidux9Gphs/L6MM8jLbIbVwPVy5Xtd3cTSlHv8AJHN8iYyfQ/nHHabUp3beqcAev
	9EcAegnjWcDx50Kh5jclckYwkIRSZxls3WoXeewqsJgrGLSoZ1JkBbUqrz/amPktK4IQs4wcQeq
	yEZ1X00xLCnlkEQZ/qEi4dN3MEsGumD48kBiSAsws2gAeBSf7iEhP8p2ATdcrhGZ6QGrAD0fXZT
	Pc=
X-Received: by 2002:a17:903:3848:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2db125f00c7mr7573775ad.13.1788456608541;
        Thu, 03 Sep 2026 10:30:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafed70184sm13249205ad.75.2026.09.03.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:30:07 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:30:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>,
	viresh.kumar@linaro.org
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apmunD8bkKOu5_Vm@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_103012_290541_3B89EFFC 
X-CRM114-Status: GOOD (  32.38  )
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

Krzysztof and Rob - I'm seeking your advice on the best way to define bindings
for this use case.

Here is some background:

The transport mechanic between the kernel and remote processors can take
different forms.  As of this writing we have 'glink' and 'virtio'.  The protocol
that runs on top of the transport mechanic is RPMSG.  All this is already
implemented and stable.

In this use case, we have GPIO controllers connected to the remote processor and
we want to make them available to the kernel.  We also want to use the existing
virtio-gpio protocol on top of RPMSG, allowing the kernel to interface with the
GPIO controllers as if they were virtio-gpios.  This patchset is about providing
a driver that will enact the virtio-gpio procotol on top of the mechanic used
between the kernel and remote processor.

Shenwei has proposed some bindings (below).  I think they can be improved to
take into account the transport mechanic and be closer to what virtio-gpio
currently does.  I'm proposing something like this:

                        $(transport) {
                                compatible = "$(transport),rpmsg";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <3>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <4>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                        }

A complete example with a virtio transport mechanic would look like:

m4_rproc: m4@10000000 {
                        compatible = "st,stm32mp1-m4";
                        reg = <0x10000000 0x40000>,
                              <0x30000000 0x40000>,
                              <0x38000000 0x10000>;
                        resets = <&rcc MCU_R>;
                        reset-names = "mcu_rst";
                        st,syscfg-holdboot = <&rcc 0x10C 0x1>;
                        st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
                        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
                        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
                        status = "disabled";

                        virtio {
                                compatible = "virtio,rpmsg";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <3>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <4>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                        }   
                };  
        };

Let me know what you think.

Thanks,
Mathieu


On Tue, Jul 21, 2026 at 03:46:45PM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol. For more details of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Since
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..b9b559b186af 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,34 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Contains
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>  
> @@ -150,5 +178,30 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +        };
> +      };
>      };
>  ...
> -- 
> 2.43.0
> 

