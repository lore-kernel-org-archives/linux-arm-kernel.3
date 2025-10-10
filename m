Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84792CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 00:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFIzsRx5u+TjLRxFDsuPe1onjkTRP2yLnHKqtm1kJjU=; b=BUegE0oQgztriDNutYaiNeKv76
	rfAwT0qhX9Ksw2CdbT/2xeXQHur6TxsSySHLHWFN1yK5lKY3mN9GoBwQKsfFI0g4a0EztgeJ4eo7o
	W57ZB/LxHEnUSAJ+CzKz4n4SiMwkuJJL+QKy9aBfMdq+FpOt3zwPepXxqE3EqZilAAENaM1klJ3xv
	BT1r1q26zDgqUN9uASwaBWf+y82+siCfsONCtQGFYTYbJ8z4OUhChBghu4StOJfaLiwVh2Clv9LxE
	cNV8MsfB3T98CaVTg8isiLDYBG3omXczZe+Z9cwzzTj8wLgMUPs+RNFHlVRcSo4h8DRmKyrneB5Gs
	Zg721IEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v70td-00000007MuW-0lgC;
	Fri, 10 Oct 2025 00:22:09 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v70ta-00000007Mtj-1gzQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 00:22:07 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so1967633a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 17:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760055725; x=1760660525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFIzsRx5u+TjLRxFDsuPe1onjkTRP2yLnHKqtm1kJjU=;
        b=Df0H7kxnkRGU5SWoF9CoQAJ4Txb4ZZaTWSNfro3E4UcqGW9LraLj0KoxW3ikF8Q/CM
         HLR1XvdmSwch8TkITi+FZYgFgtj8yy0B6LC3a3Bs+4flUFHaOjTLh5fQrJ6N0KGub0rA
         b4yB9aIokAryu5p6mov8zx/i/fiI+LjC2B3nNj2PRqViVaoFl7QSsWJFOykiRnovQcwQ
         mcRkegFaM5F0oDjsMBXMCB3TvVHa68+hTBhNykBE0nxfD8HBC3+eYilHT+J/npdw2zpL
         Lp8ya2i78n/sJkE7h3wJMm9f8kTOnjfJFKTedwlvUp35hd4uGbXyBUaTffKd9PYzgY4Z
         AY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760055725; x=1760660525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFIzsRx5u+TjLRxFDsuPe1onjkTRP2yLnHKqtm1kJjU=;
        b=a6YtjqdYyYnbQKmvnKE4azM011mrjHkBw9knmFv77UJrw6hZp+I0CcHpcz9DAd8EdC
         iQPWdrhDYZc9qDGHBuVD++nQb70uSxGd8WX2R6iV21I9/fo1GGTB92ru+JksaUSgjH5G
         WEGWZ3ouOq+Ars0HittN0m44PJc/9XmU6Fm/DVQxKMC6EtXyHRlaXwgd3mW1M3qFTG5n
         3mhsXCey5p/ztrilTqUITpnwdxU9Vhs5n1F7hsYdwe0rw/BLziUXoSVowPhlEsV+kDVm
         Rw0goyn029dI1xSBnrhJQQhX95v7NOrecGJmUDOymhE53S/OQchbK0HJ1PdACtMw1qYl
         /7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa3NMx4C8LO0mqZASZwwD9dSxIC1jVQCfpgp5YLKWqUFYNwDRZucOSDKAMI1xCVJ8bCHO6e2cvo4IY6mefyBVQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7yR/IwdFlL+ut3abUpZDFMcu5kWUhleIBkokc7hTqD/8yDZyp
	zbRwWYUYig7LMwAPOr1bL/zD2QKMk4GNQJ+Heg2yUoiLrhL9myEbWNSPdCtmM/hJyhh9tRKe0Wt
	PbuIiwf2veAlfVgbZL5PdNTn9Sxa3+MT7Luxp8km8
X-Gm-Gg: ASbGncuVYadcOHNi6SVgo3ZIHYVonE4IxPwkWmblqA76Bk8O+j5aCZHN1sjv4RKAv1f
	WpxMyTP5nS5e6F1eUcJmw2ZgshC4Fbt7GE2LX/WezGwtZL+Fx0pF/2VuJEF+uX6yMaYrcmDGhim
	sLWeNiF1F10O0x6GK/JOzDkNsAW44N0YGGrDSDDU6yF3PSt8DDB+M7P0sb743Y17M4AF2CJQra6
	+rTz8TPcCky+zNahch2vIUo/7tHCvlxtuS29N4RO8pbn4LIDQ==
X-Google-Smtp-Source: AGHT+IGgcF8PSmTCucb4se7xEsYvasKr34DgUTWPZOYiUTBUmeR+w0x0qQVtaKpSbfh4u5srIAgqWPVaIcKX9+EuOes=
X-Received: by 2002:a17:90b:3844:b0:32e:d649:f98c with SMTP id
 98e67ed59e1d1-33b510f8fc3mr12348912a91.1.1760055725085; Thu, 09 Oct 2025
 17:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251008060000.3136021-1-royluo@google.com> <20251008060000.3136021-2-royluo@google.com>
 <8966b6a9-ff70-4833-a5c7-c6d6c13c6c8b@kernel.org> <CA+zupgwLu-y26X9eiENyC28i9ZxCkuhb0X8X9H6HBpqkqJ7O3w@mail.gmail.com>
 <9ee299c1-edf4-4738-8b5e-6a684f683fbd@kernel.org>
In-Reply-To: <9ee299c1-edf4-4738-8b5e-6a684f683fbd@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 9 Oct 2025 17:21:27 -0700
X-Gm-Features: AS18NWC5EQBnjFzz6UkQXL4eyHUSSa6uRuaVLKwpG97sE-urd9eRzDvfbspqP2k
Message-ID: <CA+zupgxMfXE0YPTCFDsDOcwgQ0mzB40xZ=tLboMwzxxGfLj7kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_172206_465355_8E520232 
X-CRM114-Status: GOOD (  39.02  )
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

On Thu, Oct 9, 2025 at 12:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 09/10/2025 14:12, Roy Luo wrote:
> > On Wed, Oct 8, 2025 at 4:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 08/10/2025 14:59, Roy Luo wrote:
> >>> Document the device tree bindings for the DWC3 USB controller found i=
n
> >>> Google Tensor SoCs, starting with the G5 generation.
> >>>
> >>> The Tensor G5 silicon represents a complete architectural departure f=
rom
> >>
> >>
> >> G5 does not have a model number like G1-G4?
> >
> > There's no model number for G5, I'm sticking to the existing "gs" prefi=
x
> > as they're still in the same SoC family.  Please let me know if you hav=
e any
> > concerns.
> >
> >>
> >>> previous generations (like gs101), including entirely new clock/reset
> >>> schemes, top-level wrapper and register interface. Consequently,
> >>> existing Samsung/Exynos DWC3 USB bindings and drivers are incompatibl=
e,
> >>
> >> Do not reference drivers. Explain the hardware.
> >
> > Ack, all mentions of "driver" will be removed in the next patch.
> >
> >>
> >>> necessitating this new device tree binding.
> >>>
> >>> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and feat=
ures
> >>> Dual-Role Device single port with hibernation support.
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>> ---
> >>>  .../bindings/usb/google,gs-dwc3.yaml          | 145 ++++++++++++++++=
++
> >>>  1 file changed, 145 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,gs-d=
wc3.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/google,gs-dwc3.yam=
l b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> >>> new file mode 100644
> >>> index 000000000000..9eb0bf726e8d
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
> >>> @@ -0,0 +1,145 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +# Copyright (c) 2025, Google LLC
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/usb/google,gs-dwc3.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> >>> +
> >>> +maintainers:
> >>> +  - Roy Luo <royluo@google.com>
> >>> +
> >>> +description: |
> >>
> >>
> >> Do not need '|' unless you need to preserve formatting.
> >
> > Ack, will fix this in the next patch.
> >
> >>
> >>> +  Describes the DWC3 USB controller block implemented on Google Tens=
or SoCs,
> >>> +  starting with the G5 generation. Based on Synopsys DWC3 IP, the co=
ntroller
> >>> +  features Dual-Role Device single port with hibernation add-on.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - google,gs5-dwc3
> >>> +
> >>> +  reg:
> >>> +    minItems: 3
> >>
> >> Drop
> >>
> >>> +    maxItems: 3
> >>> +
> >>> +  reg-names:
> >>> +    description: |
> >>> +      The following memory regions must present:
> >>> +        - dwc3_core: Core DWC3 IP registers.
> >>> +        - host_cfg_csr: Hibernation control registers.
> >>> +        - usbint_csr: Hibernation interrupt registers.
> >>
> >> Drop description or move it to items in reg. See other bindings.
> >
> > Ack, will use an item list in reg instead.
> >
> >>
> >>> +    items:
> >>> +      - const: dwc3_core
> >>> +      - const: host_cfg_csr
> >>> +      - const: usbint_csr
> >>> +
> >>> +  interrupts:
> >>> +    minItems: 3
> >>
> >> Drop
> >
> > Ack, will use an item list instead.
> >
> >>
> >>> +    maxItems: 3
> >>> +
> >>> +  interrupt-names:
> >>> +    description: |
> >>> +      The following interrupts must present:
> >>> +        - dwc_usb3: Core DWC3 interrupt.
> >>> +        - hs_pme_irq: High speed remote wakeup interrupt for hiberna=
tion.
> >>> +        - ss_pme_irq: Super speed remote wakeup interrupt for hibern=
ation.
> >>
> >> From where did you get this style? Don't write bindings with chat gpt =
or
> >> whatever other tool. it is a waste of our time.
> >
> > I referenced the style from a recent dt binding change [1] that adds
> > "Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml".
> > I thought it would be a good reference because it's relatively new
> > and is also a binding for SNPS dwc3 glue logic. Perhaps that style
> > doesn't apply here because qcom,snps-dwc3.yaml supports
> > multiple compatible and here we have only one?
> >
> > Just to clarify, I'm a Gemini user and this patch is 100% organic,
> > hand-crafted by a living human brain :)
> >
> > [1] https://lore.kernel.org/all/20250414-dwc3-refactor-v7-2-f015b358722=
d@oss.qualcomm.com/
>
> Your code is not at all like above, you do not have any variants here,
> so you cannot use that syntax - is not correct here.
>
> Best regards,
> Krzysztof

Thanks for the clarification.

Regards,
Roy Luo

