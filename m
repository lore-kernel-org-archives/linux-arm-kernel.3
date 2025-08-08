Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75038C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CItPX3Nziwspy+DUPcMmH1OYCckJOPZ1VMD2rIXFTYo=; b=5DHm5ks7oHbDkNGvwLjs8/65ai
	XkaRY0kYzYRIKZDLtH1raxSRs2+IxtWiu082EgYRqpWV6yiR6w+sNgqEcyPUjzhN651PIMblTzntN
	YTArKaKuLTrQfJzLpHFJ/vLDPH2PcGUg6G7TAg4FPsKQCK+5VZVK4yKvyH90XgKJm1E6VslbsBRup
	UDQeTtp+X1TCYsYRynBqsee7YCcLhFgsGSRI186hM9K+yCU0gYJOKY11fZLMgXH8sNZGPtNKogmv0
	djNFh8BFuq7aTR6zaD2aECHCWgLPNmrbdKeWNLVUOsal7wO6Bh9luGpL8/o/kaKL1TQwFWUBG1nPU
	t78fkJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukME7-00000002oEG-1Hxf;
	Fri, 08 Aug 2025 12:29:39 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLpQ-00000002kTf-060B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:04:09 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88ddd1c6178so1129344241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 05:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754654647; x=1755259447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CItPX3Nziwspy+DUPcMmH1OYCckJOPZ1VMD2rIXFTYo=;
        b=Zc11dJV5jeJ+9umFG9qidbIYFedzy5+YFOP0GQan7xBZ3H/ctp43KKr8pdqbA8iB0O
         yd5APHZ6083laIAcN2k8QPCuzDOlCUzOH/zv5Rzr+3gZyWtY2uLcMdWGWtrr5kmTW34F
         jA8DpkgsUPUOmfF6x9aL2l5aIDBZRDL7pQ+LtNtdDNI2N6cM2jOoWXuxhuvmi2uIcsUE
         EOKEeC71zRnZZRbOow3NXa4Zzmw0SLJUjUAxqsAZyolaaSZ9kR8Dy+hMWxF9HooNvq53
         Af60b4aHi95Am3nECzhR4rG5Z0+GTU8bOamqGncLI8Dmoy5mLyGf2r7B2jGzquU78uzX
         QoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9XDCByoARqIISTg3138Z/FpNQUjcEBEMRmBtIOZ2IK7wiu/jhM1FS4tEuWpnixzox4KqhbdBx2cn6pI1uoEJj@lists.infradead.org
X-Gm-Message-State: AOJu0YxVEzmIf15nXUU44AKeTpZGtCzo0Z2i1J+Qs54pPCE/hOgowc8l
	W9SwDxD7nyFR9u3Kozapv3p8C0MBw3LQzlptcZFpyMQOa2K4ODt3HsRjHAArelUL
X-Gm-Gg: ASbGncvsczwuZ+yik/xhMghNP+fUu8paWsN9CZ9P3/3v8vDMgr0J4oOWKFJqV7sNchI
	+jJ58uWPTUzT/ajGQd5vPF2d6RHUQkFUIgju/LqTDqoIM/Hr0Hr917tCE5f6ZuGAawjitMsICsz
	uUDxxxWLFpf5ljqdxaRSvERqpUWwDHgh2Hx42QNf41LYIKoUl/ODRZ3Tzb+iDLmIVtDVWtcFsgI
	4VDu1Qznzr/dn+RVqvaJomPvEmNjVvCQU6Nng9l9yDAci12pAL46XVoE1v0+Up+GexPZ4n2L742
	FlCpMp7HEg0Ivq32c6vipXvqHMudj2oAAjch8g+OVpKl/NFdY5jYls/ytGhJDEVmfmjyM7z2d9i
	DlvvbrzG0K8f2CvpWQQA088OwDV5qqezJoqA1ZoqvZWx734bjdH5QMH/Tgpj/
X-Google-Smtp-Source: AGHT+IHu0C5AvKzRaBd8W9YSSZpYNcEJ/7j73zsjwyW3CcoRhGVCrAixsrA8IjzralJ5PwKE1KvRVg==
X-Received: by 2002:a05:6122:8285:b0:535:e35d:49f4 with SMTP id 71dfb90a1353d-53a52f1316bmr1022084e0c.11.1754654646762;
        Fri, 08 Aug 2025 05:04:06 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02a1d78sm1009742e0c.25.2025.08.08.05.04.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 05:04:05 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4fd210f8448so2708672137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 05:04:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUi2yFQz/KdqLHJJIL0+I9t0Hp+L0fUWTE379f3rRosohfIFnweElky8SQsiRxVXMAh+mFn5+8pUOlBHtlsHPZi@lists.infradead.org
X-Received: by 2002:a05:6102:c89:b0:4fb:df6d:61e9 with SMTP id
 ada2fe7eead31-5060cc8f424mr967777137.1.1754654644981; Fri, 08 Aug 2025
 05:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250709132449.GA2193594@bhelgaas> <2e0d815a-774a-4e31-92f1-71e0772294c7@kernel.org>
 <0addc570-a3c6-4d7e-9cbd-06eedd2447bb@tuxon.dev>
In-Reply-To: <0addc570-a3c6-4d7e-9cbd-06eedd2447bb@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 14:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVS7VRBj3Neh7P1FDfaG7uPfpny4tFsDTk6tsmiYu3S+g@mail.gmail.com>
X-Gm-Features: Ac12FXxvhlSsjlxIyp9wLVrjxx1brBJSnSBO2bel6v02fDMzhy9BrWS7nxQ7HtU
Message-ID: <CAMuHMdVS7VRBj3Neh7P1FDfaG7uPfpny4tFsDTk6tsmiYu3S+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_050408_059880_5BC39924 
X-CRM114-Status: GOOD (  39.52  )
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

Hi Claudiu,

On Fri, 8 Aug 2025 at 13:44, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 09.07.2025 16:43, Krzysztof Kozlowski wrote:
> > On 09/07/2025 15:24, Bjorn Helgaas wrote:
> >> On Wed, Jul 09, 2025 at 08:47:05AM +0200, Krzysztof Kozlowski wrote:
> >>> On 08/07/2025 18:34, Bjorn Helgaas wrote:
> >>>> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
> >>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>
> >>>>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
> >>>>> Base Specification 4.0. It is designed for root complex applications and
> >>>>> features a single-lane (x1) implementation. Add documentation for it.
> >>>>
> >>>>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
> >>>>
> >>>> The "r9a08g045s33" in the filename seems oddly specific.  Does it
> >>>> leave room for descendants of the current chip that will inevitably be
> >>>> added in the future?  Most bindings are named with a fairly generic
> >>>> family name, e.g., "fsl,layerscape", "hisilicon,kirin", "intel,
> >>>> keembay", "samsung,exynos", etc.
> >>>>
> >>>
> >>> Bindings should be named by compatible, not in a generic way, so name is
> >>> correct. It can always grow with new compatibles even if name matches
> >>> old one, it's not a problem.
> >>
> >> Ok, thanks!
> >>
> >> I guess that means I'm casting shade on the "r9a08g045s33" compatible.
> >> I suppose it means something to somebody.
> >
> > Well, I hope it matches the name of the SoC, from which the compatible
> > should come :)
>
> The r9a08g45s33 is the part number of a device from the RZ/G3S group. This
> particular device from RZ/G3S group supports PCIe.
>
> In the RZ/G3S group there are more SoC variants (each with its own part
> number). Not all support PCIe. To differentiate b/w PCIe and non-PCIe
> variants it has been chosen to use the full part number here.
>
> The available RZ/G3S part numbers are listed in Table 1.1 Product Lineup at [1]
>
> (The following steps should be followed to access the manual:
> 1/ Click the "User Manual" button
> 2/ Click "Confirm"; this will start downloading an archive
> 3/ Open the downloaded archive
> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> 5/ Open the file r01uh1014ej*-rzg3s.pdf)
>
> We use a similar compatible scheme in other drivers.
>
> Geert, I may be wrong. Please correct me otherwise, as I don't have the
> full picture of this.
>
> Maybe, the other variant would be to use "renesas,rzg3s-pcie", or maybe a
> more generic one "renesas,rz-pcie" (though I think this last one is too
> generic).

Both would be too generic for the myriad of RZ devices.

AFAIU, the R9A08G045Sxx variants are really the same SoC, with some
hardware modules disabled/nonfunctional.  This is typically handled by:
  1. Using the base part number (r9a08g045) in the compatible value,
  2. Having the device node in the base .dtsi,
  3. Deleting nodes in the variant-specific .dtsi file when needed
     (see e.g. arch/arm64/boot/dts/renesas/r9a09g047{,e[35]7}.dtsi)

Hence as R9A08G045S13, R9A08G045S17, R9A08G045S33, and
R9A08G045S37 all have PCIe, I think it is more appropriate
to use "renesas,r9a08g045-pcie" as the compatible value than
"renesas,r9a08g045s33-pcie".

> Geert, please let us know if you have some suggestions here with regards to
> the compatible. The IP on RZ/G3S is compatible also with the one in RZ/V2H,
> RZ/G3E.

RZ/V2H and RZ/G3E can use "renesas,r9a09g057-pcie" resp.
"renesas,r9a09g047-pcie", with "renesas,r9a08g045-pcie" as a fallback.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

