Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF7C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=; b=YO8DNQh0mfhqebbPe0Jph+wsVt
	KaRLoTELsYqeyHeL2cs1f9Z6fCG73Mkn/sr7UjTzxXisTqFn0tMD1tuZwLudowYqj0dWc6hjy7pZg
	IgaxEO4nk8U6JrsLo5ldB/YBT5/zn9UIaIfPW4PHrG5lYjnHiHtk5lctRq/4Zuhq7WQVxwZGCMjvL
	n1IMIYGAzEBFzDAIZEXX2XeNDMkieHf/+nseaeRcTKMOuS/LgRl8C5XfGkNWONtbTvo+xIEjxpRCR
	T2hVcDcu6CeGC4YPe7qyubdqzJEU5lkuIVhOKVgYw/SwbvmKwP0m3s4eNDkBl7TWVLypT8AaETPig
	NDynX72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVpC-0000000Gnwz-3Pmb;
	Mon, 24 Aug 2026 14:38:58 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVp7-0000000Gnua-0HeS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:38:54 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso5754193a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582330; cv=none;
        d=google.com; s=arc-20260327;
        b=pVeelcAxnopy/R0ro4OdYx7abPwXoNqdyQsiO6TPssplDVddYX5Hc//45nIfMlcycX
         ylyZjaDmx0RmTXdGMH+XwmGELjzimR0jzu3kuvNYRhBfSMlti+EU6boasS1mwkXa9FG4
         hUbViA1ITba+bA3cAvsr2xtN55F3rU30U6x8Cr+F31jBHuJ7k3Ov9XZEQA6Ieqk737ux
         E8Uy55Agi1Y6gCai7ud+mXzA3o/LdYSvMV04Aoaf9VZqFVj42Ah/5ofdiJMYctfrpA9o
         TC4BG4SpM0uF5ErEu1hBTb3D1RGjEbLC+nCByXNo/Kqi3Yi7q6fwlmZidf/pFrcFPEQ6
         DTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        fh=9WsG+xmQ5KIhQKUnWUR9ijSYoayzZCmLVa4ABau9n4k=;
        b=dy74QOjqESGD8oRgnC8go5XzlVapD/DUr6s2rl00Q+4tiK90+sNeSHmzhXfkEXps4I
         n9HD2QANzP8HMWKBDtUCMrZXN5F/ypd3gr/wiIqotToSi7XYgEgHQQktx7PPQt8Kbibw
         wI/nlCwmtv8Fh93BEjxCV5mzD2XJfjPRxYhzurvSaBYaym6pMTqzlaIrM69th3TGAZIW
         DO3cMWMR9fji4z/dL0gUEXg4F3nYsxpv2Nbg3yIABHDiFp5GkHsrz/AkBmuVYQXUrBtP
         0JAt24UGal7KRUVLre6fwkQ78GNm6vjlCWGkCOdmz7Ybx6YcOCKGY2geVAMl/6AeIKZA
         UBJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787582330; x=1788187130; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=BxUJ1aium1l5XMgEpz8CLnJF/qTdvt8PO0TFoL4bD3UvtwDvt5kwokJNrz33J1CXb2
         ep5rtrscyh7OitEFD5OUsCQx/oCZ6zNecGUTM1HqUdzeGDdkuu6Ai7SAEkiGyixe3LN8
         AeV0Z0UbfzwZKHm2TTsZArkik10k8G4c9jGzd5lumPCj5a8CjR/yfyYFp3YS3uEIa8e2
         ZUrPiTOF2+Ad4bJRCXEivXF0jLb+KKRP2Rw7mu7OcDsAAZF3YCcdtFnuJYbNFqwwVTmI
         Ns4B11igiO3TlNoLD0tSP6qi7z+o0kyVvDbZnLkpkDJgYxyVelBmv5DQNFD3rWn0SINW
         6g5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582330; x=1788187130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=XTX+uyE9/dqLuQAzK47l3IjwJPdIROfJ2N0Y7+K/+bQwUAwQkrsxcpYp9mFpqwHVof
         yzREd/JbnsoBO7Jotjr1l8x0Ahb5sgBIRbqlp5KqbcFEnoF7XrT3ZHCfZwLr5M3rTmLW
         TCw7zyYOtYzE8ChzP8bJrRcJzhqVR3bwkAef/hFzr8bvx68o9EuPghfTRFU24PePAxg/
         69GrDIRycvoVHxI3chrRhCMErCXkZPgC9wGvksvYkiSCjmUGjUrcRJYNyuvhJawBxqlN
         VMc4feGweQZ0bQ4edX4w2GLcJ/Y4fack48WdfDFCFIXTgKy3rsW5x/t6lx6zUlEw6FM/
         CWUA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8rBiSqduBzmHwPEo701czNeI7H7QKU0rmqCCRswJT9ZRogCpch7Wp+jm5gXtFgCY9joKz+qbMsDL/9m5B12vC@lists.infradead.org
X-Gm-Message-State: AFuF++mlepOlZ51Vse2l38nhReu+xIxbd6n4GClcKWKVdwqS43ocLc7c
	UnyUiQM09f5Wc2G53fdThW/eYAxWSqaDcPf3FGVodOAGdPwJzb4vl+vNZvNByOyx0hURaAKm9zV
	q6ts6Rywu2o6LQQBUyWyl0mVO+CTAFi5YJwGhlLxzlw==
X-Gm-Gg: AR+sD109CrjxlqoDLuxJipgtDg9aVEXZGLVTkHSG1tYS7qgQx5HGFjS9NcShT+6glhl
	WoZovnTfXsX1v03J0nozP8UdAW/AMFyCPQcKpP+lwqTLfjAZKtO7M9f8xJJu+8/kPCGlZU+xiBW
	n8WKk7RwkXP+H+lPkp7RoVoL50403OcMBw4seWXwgWryo0b1j1fgaBn/YH7GiaglJZxwQdxjF/E
	QNE6NR3lOZL4ca6zKSx1KclOumkV6xQ20ZadKXZ1RjaNlaKq5NCQ/TvfeNgrl2QuDmKpjxhkbRd
	q1GOv2s1T0sV5jKCOIehBcpvo8iCyQpB00qkOUKhe8Jk4dkRpt9vOEwPvfDXBvJ+dmJT3ZtVdzR
	STwc=
X-Received: by 2002:a05:6402:a50a:10b0:6a4:cc9:e32b with SMTP id
 4fb4d7f45d1cf-6a582b608b0mr13946214a12.9.1787582330522; Mon, 24 Aug 2026
 07:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com> <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Aug 2026 08:38:38 -0600
X-Gm-Features: AcwNN1WkCFZbvWxe4PQA8OwbQcV2Qi4oWD0S_a9VEHwbP89HadQ5rWBGiqMxI74
Message-ID: <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_073853_148148_8B2B6FF0 
X-CRM114-Status: GOOD (  26.35  )
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

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote:
>
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

As I (and Arnaud) have stated before, I don't think this is the best
way to lay out bindings for rpmsg-gpio nodes.  I am currently thinking
about a representation that aligns better with other virtio devices.

> +      };
>      };
>  ...
> --
> 2.43.0
>

