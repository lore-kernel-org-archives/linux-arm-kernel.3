Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF40CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+oAqH47cRsHD+glZ5Q5KatVvZ4QYYjYdLprWcY98JU=; b=1tj6MoQcBs0HziNFvEq5nw11dd
	W6Jq8ejEZCo2FGMVjxhaU8hPDYqopnZXgLk3/K1iToC1XX+4nohIj58xf6mlQLCm3OBYcoFVdYZ6g
	fHoe/eU89aI/2RzxhdtVxHvpJ604I6SULfD0NhkMv/8mxg4BYrWoya2nCSdIcQi/kjRHA994DLi20
	IWI3aGG5O+K5tT76hk3UnVp18kBBPFaWy5R4RB21JvXWva/9MIbCeJD3QkCkur1kf2X5jcahiDyey
	BZ8uH8mcYGUUJ+ED4sLROEeJVqI3ggq14Z+FraNs4z0r6Mr+WlFq3WxlunOKTvwRgYzah6gyWZ3JK
	300K7VhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3iE-00000007jbT-1oed;
	Thu, 23 Oct 2025 22:23:14 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3iA-00000007jZv-36As
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 22:23:12 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-87de60d0e3eso13358116d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 15:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761258189; x=1761862989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+oAqH47cRsHD+glZ5Q5KatVvZ4QYYjYdLprWcY98JU=;
        b=0g8iYDzLIxgyAQJc71p7o/MSkkSZFYY9erhoa3Yo5hTa3QPjxFlXsDpWL6Mdvmcsja
         noyfAQ68uKlYOdyKDR5+kmUWrx0ork2WuvhDAlZTvkGIKxVu3xHUcXlq8sqUpNiBQsat
         0wRMd+jYHvobxnSMimNtql98yl0j/agsi6LkT+r07GE/FbxzQAcLFPZVZUvqqTafpWit
         lmlxodbTG9oCf2flBlHJEp2T0mGYCVMS7WNgKRWVZnrsyvfxGT+LACWXin5SNL2KgfD6
         q7D3SQHNxYfwEPuzMcUsatbILfDxI4B+GlOJFio3cgCeFQa53PPXY6JjHH4bYQFCtKXP
         DtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761258189; x=1761862989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+oAqH47cRsHD+glZ5Q5KatVvZ4QYYjYdLprWcY98JU=;
        b=TgXL7DvGM35+amCGELPmUEbOFynR0bXrdrvCYROvQ3KikLf4mDKlERjd0pszwEQSgJ
         Y39Z1cFD5GVLdE96Ac3SiMyxBvulwO88EYA/kDG9vAIyASnb5DpKki/Q8ug9u69PrZyg
         Fk+Qo2o84Lg7+sLsDhMwQeqI/Z7jm9SC99kbBpTOrMn1YXxHZZLxoGBpin8bHa54Kyz+
         iliayqOcrDxIBvaQdtqKqwQ51MzPf1nr0k8ukGIy5YnxJyeAOfb2S+ifpMnDIpNDFKYw
         6kVjuJz1VhNbXPRP6ezo/E7yHEpykGwyjlljVpZalBi/chcnh4cX/ZztkCxPk1r/Ep6v
         ztAg==
X-Forwarded-Encrypted: i=1; AJvYcCVYQiy7zKd0AyhZyeMDkzMukt6NBXd31NBRYLqv8PZWJrL3ykXhTb/3TZbWKXW0zm2WybzEERjIS3GDCP7zXlEp@lists.infradead.org
X-Gm-Message-State: AOJu0YxVBFJY9ET7IwACY3a/7pca2hgJrH8g5sfVCKI/sPOD4S0GD7ii
	OGcrM20T+n72giWUvZd8mtreQgeaslibpeJro+cclp9B2KjLEicku3WMm5P3JA5zd59Tagoj3cO
	KS44w/HentWQ+f/j1GKjxIm4OLp8wI0iaUs/Lpe1/
X-Gm-Gg: ASbGncvmaHmgEtCbQNVjniRcU5FlvuUPOadOD70nScup6pZ46gHSYhOc4jrXcgcA3a1
	CVSgUMaDZwPJfzq7YjfJh2xd/7RArnsjcbsm8qq+KfK6TO1XGuU4satz/3uXFBoKiu0le7bA2dW
	rbGaxpkFscUJmpplI45671IyncFUiWKPLsrZp0lXb4I71QNSqniOX3ShYF9cFUznE4AXs331tsJ
	9XwTYFXr1ciQn6ZAHvmcAsSysCcbGwW3mJ4S2N6dZQrqmk9S1cv/TpDHuIsbMmeP1zzZkC0Q3tJ
	bTI6stlCd93uuiAMzo2C8Q3Wlg==
X-Google-Smtp-Source: AGHT+IGuCtYibPzQqqrjGNwM0zHaChLdpzHrb0geAS9qmAdlqFhgbwbFHzP5YvFRilqFdVAT8PX1Hff+wlSfn57dinQ=
X-Received: by 2002:ad4:4ea4:0:b0:81c:6455:ec77 with SMTP id
 6a1803df08f44-87f9ee7d0f6mr50574026d6.40.1761258188413; Thu, 23 Oct 2025
 15:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-2-royluo@google.com>
 <20251023-collie-of-impossible-plenty-fc9382@kuoka>
In-Reply-To: <20251023-collie-of-impossible-plenty-fc9382@kuoka>
From: Roy Luo <royluo@google.com>
Date: Thu, 23 Oct 2025 15:22:31 -0700
X-Gm-Features: AWmQ_bmWas4lIuJKQxW2zSsbNKRRFte9quUEFbVLot4b-vV1AO7q94wTEgHcExg
Message-ID: <CA+zupgwQTLEs8_7i-VsGbGV7O2Y3XFA1C3aV7iuv2HLOwKns3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_152310_792069_863B9F75 
X-CRM114-Status: GOOD (  26.62  )
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

On Wed, Oct 22, 2025 at 11:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Oct 17, 2025 at 11:51:58PM +0000, Roy Luo wrote:
> > Document the device tree bindings for the USB PHY interfaces integrated
> > with the DWC3 controller on Google Tensor SoCs, starting with G5
> > generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> > PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
> >
> > Due to a complete architectural overhaul in the Google Tensor G5, the
> > existing Samsung/Exynos USB PHY binding for older generations of Google
> > silicons such as gs101 are no longer compatible, necessitating this new
> > device tree binding.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/phy/google,gs5-usb-phy.yaml      | 104 ++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-us=
b-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.y=
aml b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..c92c20eba1ea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) USB PHY
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description: |
> > +  Describes the USB PHY interfaces integrated with the DWC3 USB contro=
ller on
> > +  Google Tensor SoCs, starting with the G5 generation.
> > +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.=
0 PHY IP
> > +  and USB 3.2/DisplayPort combo PHY IP.
> > +  The hardware can support three PHY interfaces, which are selected us=
ing the
> > +  first phandle argument in the PHY specifier::
>
> Just one ':', anyway this sentence and below does not belong to
> description but to phy-cells. You describe the cells.
>
> Or just mention the header with IDs - here or in phy-cells.
>
> > +    0 - USB high-speed.
> > +    1 - USB super-speed.
> > +    2 - DisplayPort
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-usb-phy
> > +
> > +  reg:
> > +    items:
> > +      - description: USB2 PHY configuration registers.
> > +      - description: USB 3.2/DisplayPort combo PHY top-level registers=
.
> > +
> > +  reg-names:
> > +    items:
> > +      - const: u2phy_cfg
> > +      - const: dp_top
> > +
> > +  "#phy-cells":
> > +    const: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: USB2 PHY clock.
> > +      - description: USB2 PHY APB clock.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: usb2_phy
>
> core
>
> > +      - const: u2phy_apb
>
> apb
>

Just to provide the full context, these two clocks/resets
(usb2_phy and u2phy_apb) are specifically for eUSB2 PHY.
USB3/DP combo PHY has its own clock/reset that hasn't
been added yet, we would have to differentiate them once
USB3 support is added in the future.
I'm fine with the suggested name change, and we can
address the naming again when USB3 is ready for
integration.

Regards,
Roy Luo

> > +
> > +  resets:
> > +    items:
> > +      - description: USB2 PHY reset.
> > +      - description: USB2 PHY APB reset.
> > +
> > +  reset-names:
> > +    items:
> > +      - const: usb2_phy
> > +      - const: u2phy_apb
>
> Same here
>
> > +
> > +  power-domains:
> > +    maxItems: 1
>
> Best regards,
> Krzysztof
>

