Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1F2C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 14:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLVT+cYxO1TN85rByTE2a8qXeCzOerjL8RN/K2Xqi5o=; b=stX4jOPTsY7GLc49kVqkUdp/Nr
	+qYMvsQUHFnp6Wxsfqr23e1hK1I8GaAAzc5JjD7POAS22vNpqBro27a+21KWJd3F6LPWvzCKHby7h
	p2qDWSS6ZOsRFzsF6KXyrqJ2MxlQvRO8OApQVI6Gho+2KYKi2tuNQi0OX6N/cPFGFNRtWHDwt79UB
	Nrv587sfE2lbfYrqiiLHHNv+bwjqjn2kJgAaXGx5853rrOWhe0VDvdaDT1ij2dAjX/GaT5hqXBvO/
	NbUVROuaoe2Cp5bzg2b2Aw27jMeytxUCyjDn/4gz9PtFd0/sn28OBayJC8o8Et4q1/F1TZwG62vbe
	pAHZq5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXR2-00000007aMQ-40hZ;
	Tue, 17 Jun 2025 14:37:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWoL-00000007Rij-1js4;
	Tue, 17 Jun 2025 13:57:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451d3f72391so65234165e9.3;
        Tue, 17 Jun 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168631; x=1750773431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MLVT+cYxO1TN85rByTE2a8qXeCzOerjL8RN/K2Xqi5o=;
        b=SQG/KviJli2tSvhZFbgXEUtZmE3g0ub0qpLVNq2dj5RMnhLE38Al8jIQ9fLDuws7vi
         4Z28MB4IXH+7XJUWm4WWzHpAIYUBmRs4/aYNogWqOmvnETSbwxlKnb7mSGDlU64UIfLi
         PZb5Wy9RGFI5ucsTHhmbrn/wveXwxw9VgBmmvuzXdFVy2nchn030JlwlOMTs6YP3YHYk
         RPUogNP3MQEoCC7H/32HxtVx+DWxcJwNpbsyA98kHgpKEGIbfOtAow711V98FjHK2jVn
         ULaF1VNwL2m+17Ylomvzx+8eiNowVfmvyreiivpYMZpxKIUAyR+c9IuqFsh1+S7E17mB
         H4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168631; x=1750773431;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLVT+cYxO1TN85rByTE2a8qXeCzOerjL8RN/K2Xqi5o=;
        b=AF5flfhjnIgOD3Qubw6FTTx50SHjy4KfOffthWodW5vC5RK/Nq9zNWpjT4N6XMgAKu
         4kdREwj2WZSaaw/yxNKmTcGwexK7jO+5XfPOQV3XIes1HFtLqNYESbqbwdQWnjXz4VZV
         jFPH0kLpTBQ9Qw+orQRNcNhxffmUt7+qw11nNr9vH4Xh1Xt+syCceGC5fs1uNoH1qh+y
         lH7XRQpjWvP7/pfOKUDFShor88MKVoPBqBbM3zbUxkSCPiAy/Z7PfldrH0wu6aYJUyIS
         +s6h+jnfxOVVskBlv/KImcQqF/j+EYctgcrbvHIoiGzSXscr3FWqzul7bFIPRgapdy1X
         JIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZvY0TP7VE0FH77HLSonWmFVfI27XUxZVFNa0l9NKFjd9Qbl3VcCJhYT0xLuPw/Ak7zsg/NBib8sUMtoa7lwQM@lists.infradead.org, AJvYcCWxiMX/8FaHPsicSLf7niPYOLlep+UaF/hOghyJDegbHO+sPOPTju/BK5b2vuG5pcYGzSntlD9Ge6XW@lists.infradead.org
X-Gm-Message-State: AOJu0YwOz2n/nlwvbQ5jpTKPfWsaaGPPBh49A/BUG8CIb8ugmiyWcHQS
	J/uMRJxJPDGt7W+yngICfOdZHpWMpsg9XMCrleihPhzoYou1D4GyH+JTbzJG4w==
X-Gm-Gg: ASbGncvhRIUCCHp4fD9HAHFo6kD3GcVWcbvjahin6Wt/H5rZTz5dO6Ts51gn+6JKyjw
	fV8pime2elxE+pHJ9t+XBARNs3fFJqPjq6/Pa0mogFI5pI9mslbaFhTYOrrwDKhpejpu/sZMHT6
	igDRc27meP5PT+vSuT5tX5WfuMmNfdpqBq6gVAU25wQokI6Dw+y6JiE6K5XBeqrgHlnEU/Ebzry
	96hWffRiagREbuPeg3rfpHv6Tqmwbg8HXTBdifn/vqUBjOduEmWc2IBn/z/Lue6uz/yk+qhCUY/
	WxRejgRspFEiRuyaDp+5TQK7Lckoa+xCg3kqxRWNZGX+w3IjxnL0pVkcCoOgHN04TIrORpmuS3M
	lmCxpGjNx1wiqF34diw==
X-Google-Smtp-Source: AGHT+IFupVL+5wJXaUwaE5jmuyF6KpQ+tb0Z1hbP1TUoIU6loKaMX3a5/2xSpFf4oTiPjYqFm2EuOw==
X-Received: by 2002:a05:600c:1e1d:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4533ca7518dmr144413055e9.13.1750168631359;
        Tue, 17 Jun 2025 06:57:11 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e09c21esm175766615e9.17.2025.06.17.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:57:10 -0700 (PDT)
Message-ID: <68517436.050a0220.b9e1c.ed09@mx.google.com>
X-Google-Original-Message-ID: <aFF0NWK5v5oTQKLj@Ansuel-XPS.>
Date: Tue, 17 Jun 2025 15:57:09 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: airoha: Document support for
 AN7583 PCIe PHY
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
 <20250606192208.26465-4-ansuelsmth@gmail.com>
 <20250609-shifty-dingbat-31aa70d7d7b1@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-shifty-dingbat-31aa70d7d7b1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_065713_454236_344793CF 
X-CRM114-Status: GOOD (  24.59  )
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

On Mon, Jun 09, 2025 at 05:51:10PM +0100, Conor Dooley wrote:
> On Fri, Jun 06, 2025 at 09:22:04PM +0200, Christian Marangi wrote:
> > Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> > work. Add the rwquired register to configure the PCIe PHY and provide an
> > example for it.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/airoha,an7583-pcie-phy.yaml  | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> > new file mode 100644
> > index 000000000000..93252092c2e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-phy.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7583 PCI-Express PHY
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7583-pcie-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: PCIE G3 analog base address
> > +      - description: PCIE G3 PMA base address
> > +      - description: PCIE QPhy analog base address
> > +      - description: PCIE QPhy PMA base address
> > +      - description: PCIE QPhy diagnostic base address
> > +      - description: PCIE detection time base address
> > +      - description: PCIE Rx AEQ base address
> > +
> > +  reg-names:
> > +    items:
> > +      - const: g3-ana
> > +      - const: g3-pma
> > +      - const: qp-ana
> > +      - const: qp-pma
> > +      - const: qp-dig
> > +      - const: xr-dtime
> > +      - const: rx-aeq
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        phy@11e80000 {
> > +            compatible = "airoha,an7583-pcie-phy";
> > +            #phy-cells = <0>;
> > +            reg = <0x0 0x1fc7f000 0x0 0xfff>,
> > +                  <0x0 0x1fc7e000 0x0 0xfff>,
> > +                  <0x0 0x1fa5f000 0x0 0xff>,
> > +                  <0x0 0x1fa5e000 0x0 0x8ff>,
> > +                  <0x0 0x1fa5a000 0x0 0x3ff>,
> > +                  <0x0 0x1fc30044 0x0 0x4>,
> > +                  <0x0 0x1fc35030 0x0 0x4>;
> 
> Can you explain please why you have so many reg regions, some of which
> are directly beside one another? Why is one (or more) larger region(s)
> not viable here? Are some of these coming from a syscon that is not
> modelled or are there other devices sharing in between?
>

It's to keep consistency with the documentation and how stuff is
modelled in the SDK driver. The single region defined reflect real
register space. In the middle they are invalid register that might cause
system stall if read/written.

Also this is to keep consistency with the en7581 pcie phy driver.

Is it really that bad ? :(

> > +            reg-names = "g3-ana", "g3-pma",
> > +                        "qp-ana", "qp-pma", "qp-dig",
> > +                        "xr-dtime", "rx-aeq";
> > +        };
> > +    };
> > -- 
> > 2.48.1
> > 



-- 
	Ansuel

