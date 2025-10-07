Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8AFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 19:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfYcdfacXGl7fDg4hKzg8AXQsGo845Ky08ZG+mHHCa8=; b=z0FTKc11pZ+wmWgpfex9AChNl/
	4Wewg1ZD2++ce8e5nUbW2KffiLbltL/7HAA4BshcGjekxPAOO2c4FxNhLC1mNsaAckJwXDND5D2Pu
	w9qeY2ULWKoKcPxeS+E64sT0Y5GXZZp/V1F1ajslnwd30IMAntx+ow1F0ofZsyvFRuKpm8U+LysNE
	xmNDyQwsCJl51ITc5GIbWNqCGNszmIieIDCdXHCJSAtkClKk2evJ69UaBHeBXs/JWk/c1yftmXdon
	ts8FXGMpcxFkns4S1tBpah6UmtuZcoqn1/sM3yydAVQj6hxThMbcsFcRdhFziLMinmmHNN6pkzsx6
	toTm8nSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Czj-00000002eOq-1glS;
	Tue, 07 Oct 2025 19:05:07 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Czg-00000002eNm-0dYm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 19:05:05 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-78e9f48da30so59672276d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759863903; x=1760468703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfYcdfacXGl7fDg4hKzg8AXQsGo845Ky08ZG+mHHCa8=;
        b=GQGZLFugKqcENhH+rSKyvMT5wEyBIUtjQzmNnMJOiXr38XZhASy+eJF360HvmzQd32
         XxsZ+0Id/JhbDXBRpSTM/Ad58I70pua9OY5SA7SXRJECSA/Ik0NNuNgrPRnHFOvawNPb
         lfgqenX3+uS3G+n7OJSqZlZCmoTBmYVwIo2lsMaZNxWwd0ohQBgqnCOfsZmOlAJlnZ48
         bmycsp14krTH/4WlIn1awncwcuWQvY4ohqU2q8D61O87MgJ5GMSaf1+BMMTMEphGvMhh
         kIiPYdzmWxHj42KWliEXRP+kJuJR9w3GgPqEEZYKy3oEZoy+RTbhCXlVrQgDqp0VFT+y
         uivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863903; x=1760468703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfYcdfacXGl7fDg4hKzg8AXQsGo845Ky08ZG+mHHCa8=;
        b=pHOLRCDvDOB3rBrYgyzHxxsZeivJZXhy/2sp8fxA7YKiovo+Nb2dhsS/VGntvgYinH
         +PdPejDR4ro3igZMBBuoA6JR1XeBJ1IXf+eiKjsjmF3OrEWvnN37yBEY7gt1DrOm54/a
         AaaZZNBNyIq+JZp9pnzmFY6HixFuJX1KOv4Zdbx7PkhxZNhAXyGscHtTHihSDpvHni4D
         kIetf7yPpyzkuJx1OdGZrSdeGhpHmU8K+YxQ8KFzQXsbHfiBnd4EBI6xlIM98tTekcFz
         FAIFdi8exCuYI2r9DcGOfq55RB0vgoVvSZEEZjsEwEZwWIwLy2jKx7XcxIM6F7BI3Maw
         VEQA==
X-Forwarded-Encrypted: i=1; AJvYcCX3XE8j/vgIQKGUJlw43Fxvlf+n99nauMMiKlHJ9JEk4kFqvv6nHqF5Vhx1GhBYZTDaU3pJdau5l4UfdUUdeiuW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Ru7XAkueye9E5isfmrzf9F6uMryz0usWWyFP7H0eiID4ZjQM
	Qw8YLszgYdT2tflc25K9kqMtmFuSTvs7+ScqCYQI9pf5KYz0X20NmOOhSLoqa/gQ/cmey7y0AW6
	rJMRkOxgHsAMaLPSoH9Uz0irGoFdRlmZGWyo+mcx+
X-Gm-Gg: ASbGncvrhrZsql1o8icwAd1u7TVMrWB12SCxeoAhQVeTUumPEY9pt7pmIY7ocYcXXw2
	BsF8vGUCqR5GxQp4Z4uqWTmdZ6BbpwNxZFyfyamgIqaseZmRvd47EG5JL4imhgJ3IEEhjvZDPnq
	MdbzlRl4rlbaWSSLCzHj/Q4RBsDqVx1n28Yzb3+G0I1w9H9OfdNYnvxazIojaxMQ4J4fhkaG0bQ
	eDYXfpwANb2IhsCbmEqZ0+l2GQYSdBqQZVwFQKRiP7c8SBQo2qPPHvnqT8CNDhyND+S
X-Google-Smtp-Source: AGHT+IESFakXnW6Fg7wLYTYS/Mk7KjZzZUlAj2VCFe5Uoi1p/a2ZlnMdRcd1vHRmazVrtj5+BAM5Fv3D9UEy9BjEHP0=
X-Received: by 2002:ad4:5c62:0:b0:879:eb26:dafc with SMTP id
 6a1803df08f44-87b2efdbb1dmr8896926d6.54.1759863902406; Tue, 07 Oct 2025
 12:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-5-royluo@google.com>
 <c9ac3ada-d527-40b6-a45a-41572ae1cc9b@kernel.org>
In-Reply-To: <c9ac3ada-d527-40b6-a45a-41572ae1cc9b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 12:04:25 -0700
X-Gm-Features: AS18NWBx0Fa1NrpP4hD_qvt4PklaMmDusw8GBylg6_1boLk-co7d-M-x80eszUI
Message-ID: <CA+zupgyjFnNjVjv0hzOMyt50aPHZCK-p2wkj-oka7J4wtv+WUQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] dt-bindings: phy: google: Add Google SoC USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_120504_215398_8780FA1E 
X-CRM114-Status: GOOD (  19.97  )
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

On Mon, Oct 6, 2025 at 5:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > Document the USB PHY bindings for Google Tensor SoCs.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/phy/google,usb-phy.yaml          | 91 +++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/google,usb-ph=
y.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/google,usb-phy.yaml =
b/Documentation/devicetree/bindings/phy/google,usb-phy.yaml
> > new file mode 100644
> > index 000000000000..5552696edfff
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/google,usb-phy.yaml
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/google,usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google USB PHY
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the USB PHY block on Google Tensor SoCs.
>
> Which ones? You need to be VERY specific here.

This USB PHY is specific to Tensor G5 SoC (and future generations) and thus
necessitates new drivers and new bindings. Will update the description and
commit message in the next patchset.

>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - google,lga-usb-phy
> > +      - const: google,usb-phy
>
> Please read carefully  bindings. You cannot have generic compatible.
> Plus you are duplicating existing Samsung bindings.
>
> Best regards,
> Krzysztof

Will refrain from using generic compatible in the next patchset.

Thanks,
Roy Luo

