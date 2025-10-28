Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B878CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SByi/noK1LzrmChetu+9tAciMT7QNCZcLIgFo+c/8VA=; b=ZsmBLIA3pDR8cWFQPNGYN2KdZt
	cZ8MzTMa3c2nSLOQFjHs78sizcr8EPkGRvukRdx45nc603/G8kBQhmPcqK+CNsUvSPZU+TSeLWYOL
	jYi9p6PbMlWCY+w7GXRdRwbu3HvCM5OxvMn5XfvEPWq46egsT+2JfbLgU1UaIki+09Td1IeTz6/Dy
	/60NXZra4KvOn9/6LhO5qIEXepRMEwMIoFjaY+Ynn1vmWRYD3Y36SuDtYV6T/m17nlW1qV9Sxs6sT
	1RrFlJ70mcG1hhSyUrkrG4jETw+jKAu3wO9Gzr7SSzfCU3EWavDWA2HxEtjo7oht12FE2+iSDjdlU
	wuGPkUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoMI-0000000GUS0-3tcJ;
	Tue, 28 Oct 2025 18:23:50 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoMG-0000000GURY-1wJN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:23:49 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so3061434a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761675826; x=1762280626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SByi/noK1LzrmChetu+9tAciMT7QNCZcLIgFo+c/8VA=;
        b=gfiUmeqrAWY4Xz40xOHxKMVYDJ/1QDuBsKHHEidQAGaIFirnYM7mrUOhxXIkMUWi+n
         aQULHOfyv6xs7e15EWGFiCuSRdZF5a4ARGRkM9V6ZeVGywFdKssY+avg3KEof2yQPhAe
         fcWAZ/wYCaivtmpr38KvMdnSKvGAV/M3pDSsMHIuq5oQuBfdWf1T2UQ2Lkj/4vNMsUxm
         CMlE70M5qtOq26vxmhNTedUffZtZXvMvi+y/pxr29wZD3AK/A4TCEHl7Ukdi72HPnjdu
         i5cfe/xKQSm4Y4c0SnDIHkSklOjidsE6NLIASilq/7zt6NawtCIvuNgq1jgzTkNbszsb
         bavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675826; x=1762280626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SByi/noK1LzrmChetu+9tAciMT7QNCZcLIgFo+c/8VA=;
        b=tHYaRr6w+i3PnNylomFjU/TmHxIypJfiLQna8AWeoi3Qhe+Ug8OHxBa4QTEkDxyM3B
         JH+gd1EqIZqlOG3RAYjzsXac27/+ced1ET6W7TuDIwZWRyTBs0U+yHC813KkEWCvjEAQ
         moELmp7y5eXneWB1deWhqmYPJfuNyYw1SadlG+fL2vdDLFAeFME402L/zZSrwSkfRSmg
         HOwO8xySXr6+Zfd7fQXCvcQoqunKHbzIiqK5otRbXaj+idoN1CIVSTiMlK9rzJsIWV02
         oB/AjsMTZg1wbG5bCqKq1pCgKUlxI6sjMGzX1wj+Za8Uo0IYkvJs1LaKMqt7yI3Fyzkf
         x94g==
X-Forwarded-Encrypted: i=1; AJvYcCUremortgX2vfhr3ittBZKpOJnZQ+Vgj6ZeanaANMaBfleaUQxFHyzRLaDFnWLNMqsd+o3/UwSHpirvTkpC35al@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9jPF5rfaX1A6EGeYWAHiUgAksgFSJrN1ev4b/DklPt/UU8EYV
	VcjuSWJ8bX4Ew+E/7/Sbp8/kuKP78gujfl6hatt0qjb6caKT8k3kUDKZFD2ADodqplVd+UQpWD5
	TXg/5mzvNF6afzv/D2coNlqD2T0Jr5WY=
X-Gm-Gg: ASbGncvxeNUa/Ma7RX8EV0YCaAmB6YZw11Apg987DUyVCdtec2Yj1ONh+/30t9HCVkv
	dsiv4Y8se3cnxqD1dJqtQibzcwQ9nVIQX0hxvKChpkUbnwFrzGxDVbl5V2GvefOHYj18+6uOBei
	NN3NELj0fXDu4DFQu1h/QAWLJr8jKMyRMQf8zpzgagbmtq/XL8obyhc/ASrcSWwDBFQzMH7uIpH
	BjKE/Tvit3Ni34riHhwDwGgMM1lYPD0VIK081QdB4CMgQItN7y5wnNFlmOK
X-Google-Smtp-Source: AGHT+IERzCnM1Q+dG5xJk3p4f7frp3yawAfW/uKDFumZLMQ7OAJhXOruAAAPxc8vqZJQImIU0+jA31a/xFLrLwySBTg=
X-Received: by 2002:a17:907:980b:b0:b3e:f89e:9861 with SMTP id
 a640c23a62f3a-b6dba4a8de7mr443497866b.28.1761675826412; Tue, 28 Oct 2025
 11:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com> <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-3-3eda2dba9554@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Oct 2025 18:23:19 +0000
X-Gm-Features: AWmQ_bmm1K9uTQjGChVp6dXcI7uBwmD2Omk5zjMb8vPaExIO7xEYl9DV_jPi_n0
Message-ID: <CA+V-a8sg4c697WTS=wXoWvgc_UCFM3+Qjh1br=rMm4F84NVw-Q@mail.gmail.com>
Subject: Re: [PATCH v12 03/15] dt-bindings: media: Add bindings for ARM mali-c55
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, 
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_112348_532549_2746ADE1 
X-CRM114-Status: GOOD (  28.74  )
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

Hi Daniel,

Thank you for the patch.

On Thu, Oct 2, 2025 at 11:19=E2=80=AFAM Daniel Scally
<dan.scally@ideasonboard.com> wrote:
>
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
>         - _Actually_ dropped the arm,inline property mode, having forgott=
en to
>           do so in v11.
>
> Changes in v11:
>
>         - Dropped in arm,inline_mode property. This is now identical to t=
he
>           reviewed version 8, so I have kept the tags on there.
>
> Changes in v10:
>
>         - None
>
> Changes in v9:
>
>         - Added the arm,inline_mode property to differentiate between inl=
ine and
>           memory input configurations
>
> Changes in v8:
>
>         - Added the video clock back in. Now that we have actual hardware=
 it's
>           clear that it's necessary.
>         - Added reset lines
>         - Dropped R-bs
>
> Changes in v7:
>
>         - None
>
> Changes in v6:
>
>         - None
>
> Changes in v5:
>
>         - None
>
> Changes in v4:
>
>         - Switched to port instead of ports
>
> Changes in v3:
>
>         - Dropped the video clock as suggested by Laurent. I didn't retai=
n it
>         for the purposes of the refcount since this driver will call .s_s=
tream()
>         for the sensor driver which will refcount the clock anyway.
>         - Clarified that the port is a parallel input port rather (Sakari=
)
>
> Changes in v2:
>
>         - Added clocks information
>         - Fixed the warnings raised by Rob
> ---
>  .../devicetree/bindings/media/arm,mali-c55.yaml    | 82 ++++++++++++++++=
++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..efc88fd2c447e98dd82a1fc1b=
ae234147eb967a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C55 Image Signal Processor
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c55
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ISP Video Clock
> +      - description: ISP AXI clock
> +      - description: ISP AHB-lite clock
As per RZ/V2H HW manual we have reg clock looking at the driver code
it does have readl. IVC has reg clock if IVC driver fails are you
still able to read/write regs from ISP driver? I think we do need to
pass reg clock too.

Also for IVC we do have a main clock (which is a system clock).  Can
you please educate me on what is the purpose of it. Just curious as we
pass to IVC and not ISP.

> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: aclk
> +      - const: hclk
Not sure if we want to have the same names as IVC or vice versa.

> +
> +  resets:
> +    items:
> +      - description: vclk domain reset
> +      - description: aclk domain reset
> +      - description: hclk domain reset
Same query here, wrt register reset.

> +
> +  reset-names:
> +    items:
> +      - const: vresetn
> +      - const: aresetn
> +      - const: hresetn
ditto naming.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Input parallel video bus
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
maybe also resets and rest-names should be part of required properties?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c55: isp@400000 {
we could drop `mali_c55`

> +      compatible =3D "arm,mali-c55";
> +      reg =3D <0x400000 0x200000>;
> +      clocks =3D <&clk 0>, <&clk 1>, <&clk 2>;
> +      clock-names =3D "vclk", "aclk", "hclk";
> +      resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
> +      reset-names =3D "vresetn", "aresetn", "hresetn";
> +      interrupts =3D <0>;
I would have a non-zero val here.

Cheers,
Prabhakar

> +
> +      port {
> +        isp_in: endpoint {
> +            remote-endpoint =3D <&csi2_rx_out>;
> +        };
> +      };
> +    };
> +...
>
> --
> 2.43.0
>
>

