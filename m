Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD2BCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y52Xkcdn7xk0ZUxLnhD94pTmXLnFSczNPfuhX4p80MM=; b=MiiSzykr06OLRw3j3byjKwkIBM
	9Tim8rF7KKHxn4OR0/eFxxAilSnmnuNHoirtOoloJtzqyesKckEp57pzBlggjYvLmOkrLTWWx30Tk
	8vnxPDdBiw2hYL+3pm3oRMOax0uh9tylZruM5BwbqjrRkBah7aWwlz3J7tOw8CbS1VKktB97qeQHP
	/hiIvA3YX3q30WvVOfqYGtZxolGR0quOeJY5vdxYHBJxmLkKx5qroCVwNZcHGpARUsW3z4jfk9frc
	uPVbRXdFLia3rFaZlZFKcIcx0tmFoEGETgKGSlctvZyJ7Wf8ogzdrA6BflY3ZOYxQsyKoo5ak0L6J
	2RPDHSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Kj-0000000Dv6H-3k9p;
	Tue, 23 Sep 2025 14:49:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Kc-0000000Dv0a-3ac0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:49:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b07d4d24d09so961080466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758638965; x=1759243765; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y52Xkcdn7xk0ZUxLnhD94pTmXLnFSczNPfuhX4p80MM=;
        b=l8X+5fiO2EM4X5f9Kk7t66fOH35XF8oQv0nmv6RMdCXwgPgpe7ee/tjPWek6Icu/Pg
         ZDafv74RNY6A5CGN8i3DoT104ODDxhDJdDVE05MFfr6LGK4Ott08T1de44Npv2I2Ew/K
         AgKtH/xt8ZA0cGnwtiSlzIq7U7WxGG5OdGWcRhnPgWHd8a75KmfB0VA8sWtdu86oA6UJ
         XGbIEq9559O6vFWeSgkvxw+ujC3iMncbdSNqlQgPFpfybcTUG/g9Ma8o+l3Ow+l5cMC6
         ZXcy2ZX+/NFGtTsVSCxjD7Upx91c6lVUu+rSkBfvv6eqoszearswTgnf70Y8yrCupwcb
         cFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638965; x=1759243765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y52Xkcdn7xk0ZUxLnhD94pTmXLnFSczNPfuhX4p80MM=;
        b=UICR2sELT9N4/jCntH3xoftDr9PioPxgchq7s+J2avmHauz8EbVc0fClotknKGj0AY
         4R9YLdP1ssIhSlMzxvTpekJQwdPeGPzCwetXNT9LUWOBXou05UeDboz/714d+P/k4mbj
         YvZ6obPPUr7ftq/Uhf3/e0IzlUCVzWL41vz8RHur7lc8fwvclHliZnTSh6eW1kPPxD9n
         1kWKWNGSthYTfEgKQhMtHifit861SqFBHUT1t/73wvPoQdEeBw7o9Z/V9qi3LKZZKR9W
         SZPES+4heBtgMDOBJmMIx+qWk5Jh6zPQrTcqv+3eHHrzs55ckc3vW+DKOasve3CqHno5
         /pNw==
X-Forwarded-Encrypted: i=1; AJvYcCXXkFHS5YdjhWwMBDZwOAnAizC42wmHC2jpZrgDNIP7OqatsiUu6siXE38Z9u3yci179/B7K68ww8HiRQASG+vG@lists.infradead.org
X-Gm-Message-State: AOJu0YwyJD/0RS7X0UyxkaghZbb2tRmm6nNhhpIW3RKtHJc+APgwMDPG
	NLG0e3KIRFPEM8X7kOUN0FH+i0DXo77dXq7guy39mpMNL0R77NpVbvOLpW4TajENKUjc9RxRny6
	KPMZwGajvz/915SafuUSGGewmHCV0jpWffMK8LFXiew==
X-Gm-Gg: ASbGncvEBfHbOunf+ZSM+yBByZDgd0QWBg8CSVxNQoDPKX9bAQIWgRLncXmMVSk2tTc
	QyJef/9AHf7l+8vumdACAeQpgXhP4ED2RsnicDx+NGxDCGQ9QfhwA3NEpqstAootAQ3ZX2UwFog
	lRjSoUGpuHbYycHCK76LX4HLi+zpEz9ztjLUdJBNmGF420+NE7IbZ8W+KHCAQ4kwxz6HV3cf946
	KRkDjCneZMHdXl6u5e33hKhnRaCBpQrQUJc
X-Google-Smtp-Source: AGHT+IECKT9YZPD+FAdye+FerjTbLGMGSvvRtZ+Pjo4XFET+bb/b/phi396gjsk4a+Gepk9kfKc2SZh1oT+jOw9HvrM=
X-Received: by 2002:a17:907:6d03:b0:b04:2533:e8dd with SMTP id
 a640c23a62f3a-b302d29ad94mr253112266b.60.1758638964984; Tue, 23 Sep 2025
 07:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org> <aM2HMOvksD0kSd1u@lizhi-Precision-Tower-5810>
In-Reply-To: <aM2HMOvksD0kSd1u@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 23 Sep 2025 16:49:13 +0200
X-Gm-Features: AS18NWBnvH3cHGC78xNej_-VaL44m5KxupJlVq-5uA_Jq-oxSoNspDlHAQbMDqk
Message-ID: <CAKfTPtDadioUFDn2F5gJ59tYJD2owVZMZs9TNUBHk-2uuz0GmQ@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_074926_917912_04087D6C 
X-CRM114-Status: GOOD (  16.83  )
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

On Fri, 19 Sept 2025 at 18:39, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 19, 2025 at 05:58:19PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> ...
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - ranges
> > +  - phys
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> > +  - $ref: /schemas/pci/pci-bus.yaml#
>
> why not snps,dw-pcie.yaml?

dt binding check reports a number errors and warnings with snps,dw-pcie.yaml.
In addition to the reg and irq names which I can't all map on the
snps,dw-pcie.yaml, it reports unevaluated properties which I don't
have with schemas/pci/pci-bus.yaml



>
> Frank
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    bus {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        pcie@40400000 {
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  /*
> > +                   * RC configuration space, 4KB each for cfg0 and cfg1
> > +                   * at the end of the outbound memory map
> > +                   */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> > +            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> > +                        "config", "addr_space";
> > +            dma-coherent;
> > +            #address-cells = <3>;
> > +            #size-cells = <2>;
> > +            device_type = "pci";
> > +            ranges =
> > +                  /*
> > +                   * downstream I/O, 64KB and aligned naturally just
> > +                   * before the config space to minimize fragmentation
> > +                   */
> > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> > +                  /*
> > +                   * non-prefetchable memory, with best case size and
> > +                   * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> > +
> > +            bus-range = <0x0 0xff>;
> > +            interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-names = "link-req-stat", "dma", "msi",
> > +                              "phy-link-down", "phy-link-up", "misc",
> > +                              "pcs", "tlp-req-no-comp";
> > +            #interrupt-cells = <1>;
> > +            interrupt-map-mask = <0 0 0 0x7>;
> > +            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > +        };
> > +    };
> > --
> > 2.43.0
> >

