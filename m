Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE43CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 05:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crkj1xqggaMTh9oPYxb0RXj1qaPHLThFfXIKjj2cn5I=; b=auE7BPCEVq8cjew4lI6P5ZPkYL
	SOgRzpaCkziQ8QYV/QO7DNiwR82y3MA3kRGhqJC7tNGXj6DaeMyaa4E8N1j3vMAMNcLP3a/G5E9yX
	+VnKqteSnoZpIM8QocjCzj7nuejtRzcCRxdifztS4XIjoK+FEt8y/kFXRezS6hIrC02ChHbvBcxaR
	QbNxK4ci7NZh3Os9+g7D1KtWVU+juHg/ifeL418AfHpzqRE4gqOg6p38gUkFQ75HD1LkwHlFCDTB2
	yomEGe5c9GIcHjDyCOE1mTnVDg382v2QtnFkBdXw6Zd1IOK2wt6s2UgYAqGDZJhF0nDCghPdQFX2i
	rqsY7roA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7cl-0000000GMOW-3E42;
	Thu, 18 Sep 2025 05:56:07 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7cj-0000000GMNy-2yWz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 05:56:06 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso740154a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 22:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758174964; x=1758779764; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=crkj1xqggaMTh9oPYxb0RXj1qaPHLThFfXIKjj2cn5I=;
        b=bl8y2wBCFGLs4Tw5pFfxAfpA4qN0NrEbh6/52t6rlQajEq4JIzyaeaZ03fCUiGom0V
         dUmoKloCsGhpPbh83IiJG+CxbFQUcefdwDiFuMcNrzGMC3f3ly2w66gnTbHgvguoleXE
         IQoGNl5h3E6tXD/ni/6478Vm81i74SBSacOO9slbq8Rl9uCAR5e+nx7lvwaLUK2yy80B
         usSPCJI2lU3Ymf9hgprCnN8YVFYOvqc5fn7RIyIwWVjTy/PBPZsoYIYmuA4hMtmvJEbl
         d7gtA03ietgzMztIV82jsEEBl0+qFlRpgNjMghpirgWZSHtofujXoI5ZyT6VPE3otJCI
         mRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758174964; x=1758779764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crkj1xqggaMTh9oPYxb0RXj1qaPHLThFfXIKjj2cn5I=;
        b=t0HanLwExKE4aO+UtV7LefCzBGk3XeFGwTmcl6T9KwmA1pDDVNH/Sv0u7cnhKoX6pP
         sdrWjYll/wooYjs3/KOKJO65O/+4eGWQ8SB69Aaz4csAUEPZGLWlOcBcVf67dOI4nUB9
         RZwBX/S2F8FPk4CS+O84m/6VJ9ETbGGuZTB7RBuBASo4zFG4dEp9DeoTnikx0yJTtCmT
         pZzKz78QOE5hs3jNKwGhbCk67NHNoLtHwTJitzh0mg/XFoWRNQwInwgIsWvbwFxRu22a
         zAfLwxtdFlNuVeEFXSDsUQOu3o+2guY3QPsvnOnzmED04NYtdCeEyZIeyf+w2EoIuxjZ
         7sxg==
X-Forwarded-Encrypted: i=1; AJvYcCXNYpOc8821tmwR1n5Xaekws+/Zj/EnuaQgquczB0jR3Y+D60kpEd5zqHtaRyJdMO1mRDOx+H6FHOnWgsjQGFps@lists.infradead.org
X-Gm-Message-State: AOJu0YwZuBSjdeKeagWP7Wwx4zwx6tXyRqpoQEpV9lEPmwtu7B7M8iSv
	AF+CFCLwJ3lPJqsf1Bafmlmeq+f+9bAfffffX0DdLc9VnghTyPeG/IrNIjmlBodocdAjhyXwpwa
	N3vp0Y/DAov+tCIeFHZUR7d9hGZSqMGjBGMzCKuKUZw==
X-Gm-Gg: ASbGncsydMHMiX8Nh9vNi/O2w6dOgdW7oGzsEHhPMFecpqHDR5FdYwFpw08XJY8zK4Z
	0tys018fazUTnk/62AIxW2mYgPiA0+renVWcfuAB5PjcYldDS1SfmWhT30fowQp1QbMVy7elqTZ
	6ZABEL05L0QjmZp0bmzlTAgtQw4WMgX+uGP1uJF1PqwntIgCWYTL0GwBRXrxoXiL7s+LQ8Mcah7
	1heD6HocW9XWngxD+FIJb0CP/EinBHvJa7yKU6ZG8ue1VVZTFyamAU=
X-Google-Smtp-Source: AGHT+IGR7nTIOBAlrh93nycdh2C4wP1m8EWpmRWv6aiZAFrIZWDDf8XTFM9Ow/5GHA8Zx6KHRGOD1LFlVtecDyn67Xg=
X-Received: by 2002:a05:6402:1d52:b0:62f:4be5:2268 with SMTP id
 4fb4d7f45d1cf-62f84231d4dmr4414232a12.19.1758174963640; Wed, 17 Sep 2025
 22:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-2-vincent.guittot@linaro.org> <20250917211825.GA1874549@bhelgaas>
In-Reply-To: <20250917211825.GA1874549@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 18 Sep 2025 07:55:50 +0200
X-Gm-Features: AS18NWDMnG99kNALQoafVcWPwrQuqGOxmbLVsuUCgARppc3AjZboY6ARustWRK0
Message-ID: <CAKfTPtC6bGYCoUuMZSX=kx0uR1XS1rHKzY99tkTQa-hUigmpPQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_225605_780628_EF0B5621 
X-CRM114-Status: GOOD (  15.59  )
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

On Wed, 17 Sept 2025 at 23:18, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> Suggest following convention for subject lines (run "git log --oneline
> Documentation/devicetree/bindings/pci/"), e.g.,
>
>   dt-bindings: PCI: s32g: Add NXP PCIe controller

okay

>
> On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > Describe the PCIe controller available on the S32G platforms.
>
> > +        pcie0: pcie@40400000 {
> > +            compatible = "nxp,s32g3-pcie",
> > +                         "nxp,s32g2-pcie";
> > +            dma-coherent;
> > +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> > +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> > +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> > +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> > +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> > +                  /* RC configuration space, 4KB each for cfg0 and cfg1
> > +                   * at the end of the outbound memory map
> > +                   */
> > +                  <0x5f 0xffffe000 0x0 0x00002000>,
> > +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> > +                  reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> > +                              "config", "addr_space";
>
> Looks like an indentation error.  Shouldn't "reg-names" and subsequent
> properties be aligned under "reg"?

yeah, that's a mistake.

>
> > +                  #address-cells = <3>;
> > +                  #size-cells = <2>;
> > +                  device_type = "pci";
> > +                  ranges =
> > +                  /* downstream I/O, 64KB and aligned naturally just
> > +                   * before the config space to minimize fragmentation
> > +                   */
> > +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
> > +                  /* non-prefetchable memory, with best case size and
> > +                  * alignment
> > +                   */
> > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> > +
> > +                  nxp,phy-mode = "crns";
>
> If "nxp,phy-mode" goes with "phys", should it be adjacent to it?

yes, this , phys and num-lane should be together

>
> > +                  bus-range = <0x0 0xff>;
> > +                  interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +                                <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> > +                  interrupt-names = "link_req_stat", "dma", "msi",
> > +                                    "phy_link_down", "phy_link_up", "misc",
> > +                                    "pcs", "tlp_req_no_comp";
> > +                  #interrupt-cells = <1>;
> > +                  interrupt-map-mask = <0 0 0 0x7>;
> > +                  interrupt-map = <0 0 0 1 &gic 0 0 0 128 4>,
> > +                                  <0 0 0 2 &gic 0 0 0 129 4>,
> > +                                  <0 0 0 3 &gic 0 0 0 130 4>,
> > +                                  <0 0 0 4 &gic 0 0 0 131 4>;
> > +                  msi-parent = <&gic>;
> > +
> > +                  num-lanes = <2>;
> > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > +        };
> > +    };

