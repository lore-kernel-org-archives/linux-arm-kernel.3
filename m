Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42DEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOPV+rKrhFxhfr/BDT97d+AUMncXtvhCP8Kd1bZ9mu0=; b=jJCndIe/AXY7aYPQyi8yTK3O6S
	tKzj4am4bueoPE3aZfiGlDL8hKxAfaP09+lSjPgkG3mazq9Vci0bEPdKR1+g8lc/0PrqOWsw7HAkN
	eTJxfx37c7gPiEipxpSKItm34vWAaU6QaN14CEAQrya0c9moYZg4+UqfO0xmcdSoMCPc5vvs+Bv8Q
	Ijjx9T0PM7sNgBvvV/5S5f6pX0qT/TmRQ8bIp7vq+Kk29zkpYY9siU0DfgpFuZ07Y0Yasx6Te08LL
	ViXE9lbYV2sHqR1c8TY5+A2/N/ooMkBdEqEGIZi3BVwMK7LhyILQYhHqTf0dh/E//stnpR46Xw7+6
	ueNatRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbMo-0000000EKso-21Rj;
	Tue, 17 Dec 2024 17:28:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbJq-0000000EKJk-0k1f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 17:25:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso6491452b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 09:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734456313; x=1735061113; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOPV+rKrhFxhfr/BDT97d+AUMncXtvhCP8Kd1bZ9mu0=;
        b=SE1bjoKQKG1H6hloQHxYg1vB9A7pGXSKfqrXyL5cXLuiOtqXnouWsV7XzGTjZ2TSuK
         KlKz4F0h5Iy7ipXWkM6uKFMj7wZclWVv+CrnC5s+ZRSaLey66nyeF74L0130MhiDzdAL
         eZOXziE0LFbpChnJk8idyvgvcWSPJMidVUxcDUpNjVglPxfu6G+u7wBe9qUuqojFPZZm
         iV8STq3Z6ieGtgFkYOqhZrnYZfxGNM/76ptce/ka2bwHMAHF8/Dohb4Va9Qc4+mhCfZ1
         LmNi5KSsX3oW3/b6I4We7WMEOE+JNjqBgVLwBntEHgDSh9XI6BBUIe0ysT2STCp9QVnA
         jtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456313; x=1735061113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOPV+rKrhFxhfr/BDT97d+AUMncXtvhCP8Kd1bZ9mu0=;
        b=WCAyp9gqnZYIqSJ6187AOZLS9l60tx25XTaOlPbbqYwdvQlaFwzig95NAFD4jWaq3Q
         XNd+O54TrzCRCGDI3LowEvV5GA5WNZ+SRRJ/54R6na+kLtZmeja+vh48lXIvJMmFE7r6
         KSpZSADSjMsgrmzDdhmwUdDy0ngLc4hqhXuS/FSxhhysmedfnyfe2RYhndWpVCL2koDx
         EE9j1uiNN14dqBd51u/xWe0DYZtYxCTbXYvfvFdIoUvidK8Kd+2liBNX3vjcdXvV1NUb
         RvvyUIRBE6CH0KHy35sf3KzmZOlFijK+bUSEcAqeTP21uY9pBA8dePhX/CmX0AIUZ/rm
         goEg==
X-Forwarded-Encrypted: i=1; AJvYcCWuI9RqBw+i7cCXE4WL3zvVlKYh8D8Iwyrwy2vQvixxErD/WLY0DI/mmsP4b4bTx0nPzfRJ7M2ddiUQAPsKr+Ce@lists.infradead.org
X-Gm-Message-State: AOJu0YzYn+TxYPDgMR6kAJ5fDjeJXn51qCRpZTef31k9avIAxuJes+gG
	7Ru3hCHu3cAF20FkvMSOXVnsqhjOaxh2JsDjIg9VbORXM7moIDm2LAKLnpU1Yw==
X-Gm-Gg: ASbGncuniyFkyq0DIKSNWmOsuCgoW+vRJ+W8UdvOmPAV9TQetfwzFztXhoKXFF6GYuA
	e8j0miUbty9XczfAdDVIkbBQYOmbAUhRGZTL/vKM9vDs4flMbZ0KdjnmSUH8JXk7uJst3TWoTiL
	5V+xN6ysUxRVV59CWcs8tEZT3ai3BsgZzE/5nOqEfvXk4M+Ly0DZlUH6uaCis/Ey6HVWr0eC6gn
	MYo1b8j++WFdyTynNLQZrhLYyXmCbdf6mrttVswyYT2blS70mQrRlnFJTN9saYr0ChC
X-Google-Smtp-Source: AGHT+IEiyPtAWgyu8zoCPimND9mRn/6YCnmBDMVc1DmVYS+iQJlok+y8D22roOKEWjuOJV17xvafEw==
X-Received: by 2002:a05:6a00:3d06:b0:725:cfd0:dffa with SMTP id d2e1a72fcca58-7290c0ee463mr28517272b3a.5.1734456312913;
        Tue, 17 Dec 2024 09:25:12 -0800 (PST)
Received: from thinkpad ([117.193.214.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bcfecbsm6907193b3a.195.2024.12.17.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 09:25:12 -0800 (PST)
Date: Tue, 17 Dec 2024 22:55:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241217172502.borj2oy4rpxcteag@thinkpad>
References: <20241205172022.GA3053765@bhelgaas>
 <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_092514_212533_0B93A4A0 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, Dec 17, 2024 at 04:53:48PM +0100, Christian Bruel wrote:
> 
> > Makes sense.  What about phys, resets, etc?  I'm pretty sure a PHY
> > would be a per-Root Port thing, and some resets and wakeup signals
> > also.
> > 
> > For new drivers, I think we should start adding Root Port stanzas to
> > specifically associate those things with the Root Port, e.g.,
> > something like this?
> > 
> >    pcie@48400000 {
> >      compatible = "st,stm32mp25-pcie-rc";
> > 
> >      pcie@0,0 {
> >        reg = <0x0000 0 0 0 0>;
> >        phys = <&combophy PHY_TYPE_PCIE>;
> >        phy-names = "pcie-phy";
> >      };
> >    };
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.12#n111
> > is one binding that does this, others include apple,pcie.yaml,
> > brcm,stb-pcie.yaml, hisilicon,kirin-pcie.yaml.
> > 
> 
> On a second thought, moving the PHY to the root-port part would introduce a
> discrepancy with the pcie_ep binding, whereas the PHY is required on the
> pcie_ep node.
> 
> Even for the pcie_rc, the PHY is needed to enable the core_clk to access
> the PCIe core registers,
> 

But why that matters? You can still parse the child nodes, enable PHY and
configure PCIe registers.

> So that would make 2 different required PHY locations for RC and EP:
> 
>     pcie_rc: pcie@48400000 {
>       compatible = "st,stm32mp25-pcie-rc";
> 
>       pcie@0,0 {
>         reg = <0x0000 0 0 0 0>;
>         phys = <&combophy PHY_TYPE_PCIE>;
>         phy-names = "pcie-phy";
>       };
>     };
> 
>     pcie_ep pcie@48400000 {
>       compatible = "st,stm32mp25-pcie-ep";
>       phys = <&combophy PHY_TYPE_PCIE>;
>       phy-names = "pcie-phy";
>     };
> 
> Simplest seems to keep the PHY required for the pcie core regardless of the
> mode and keep the empty root port to split the design
> 

No please. Try to do the right thing from the start itself.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

