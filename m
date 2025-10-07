Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED57CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aNYGyYwV4vw7l+4kbvJWnzel0gTCPuhPYenonekONo=; b=ZTYLqLgf8aOl7zN8VyF6xCS1p6
	IWAryd4uyR3ZJKgfuTnoW/N1cy3pjn1xIINqxf3+DZY22Hh3WH4so68ctu+ylBp5xMJ4vMwstmuS2
	9PBha4Ot4iqKlT99x0EqpcFu5j5rsoEgWV3taa0bIuZMrAqv3Qc2ER7/Ur07CWVcFWnF3yAW5HtQZ
	viQ40918zOmVYS0TPDH9QFypYcZrxPMLSw6vrjBTQT++bNebepgfZ40wmvmaSrVRE/oWI+UyHG62Q
	NOJoPXROiu4lzTYxdrdfa4eCHB+mzzUks4us7xgsrBm95iFwfGjuIML226KJCL3OELhRU5KLCVHwk
	uofgvSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ClC-00000002ciu-2KfM;
	Tue, 07 Oct 2025 18:50:06 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Cl9-00000002ci1-0k67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:50:04 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-7ea50f94045so1764316d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759863002; x=1760467802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aNYGyYwV4vw7l+4kbvJWnzel0gTCPuhPYenonekONo=;
        b=l0JCWXaLjAoejpbc2/AQRI7ZgnfVNKl3Y7hHrHUawEftuu/y0CreV1ODxz4XyV1997
         Ly8xFXbFJWRHMQSrNaOG+waW4QhV36HsX1HzY/cC6wfevjwrKyQQlKH1BLp7hw1muRZc
         rat6YdS9aP9JwO6gsPtfxBhi6/0C2rVjeJgRoFwu1Z03tNJu7NhOQpzhZ+E9/GWnC0jd
         GEWiYibf81T6DNmBRqChtkedl2SZFgLZfzVsVmS6th4D6Ttu0IMjkIDrtSWtaxHGj2ZM
         VNQOtYQ8lyL48PePKd/9Asb6oi6fqGZKtNdeNfwKSIP0LUwfzeUPFaNb2OUNealVC1ax
         z6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863002; x=1760467802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aNYGyYwV4vw7l+4kbvJWnzel0gTCPuhPYenonekONo=;
        b=U/23zP+Fjuc6KorV9uvOHacRfNhrdqClpkSCof2YELjTVBonmVypXMYTqQVBpN84Ef
         BOQJPrgjKR6IG2t+LFjdRli0dbSBjXrZhp1JYYSZ4TVdu3YSyVXH1fMjC3JDMOWWbvQn
         VYxXzpvOcEFG0vcTtervxWshSYeKK9k1QWRLYw/YTHfnIosKk3qYn9TRPa2aaRiV26Rq
         FsbRieHDvqCGq3X2CNhhfD42lvOIIOQ+mY/EXD3XnZy+ApHZuUDq3u3vKF7EILZriL8F
         7b5JWkVlP36JHKVqwRGJkMOfxLzcdI+ZFdECvfLOQiZ2/jxpoRK8NpA89OzEnKd3vho+
         d6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXLFBoAmZllTWkODwMAonluoww0ADGP/d5kaO48mDeWeo3pW6Fd67rPgbNK2cWF6USa79MUUdv4a0dgOH3QAA76@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Y+nzCyIZrpfhs41wDLLeik4OOhdtqh5D5NVq7NtPtRKAQ2WX
	MZJk1FEppuZjCUPXceEFWEPqvnmdh9IXD7FCxKRpkwVbV4+NkOr1x/5Ri8BdKIj13VnXK2HWW9N
	Z1fbcGOjwpxql7aUpb5JIfEpEE4kRAvBF13Y7lGTF
X-Gm-Gg: ASbGncvACQRkSf1kpV92+01XWKLSW4Og31gbEwJI2c98WXWeB44kzRp+ryItVSyeS6h
	ewlmzkvOdOHYGENHc1vm0pP7ZRJ1pE+00U6nQ14u/k1OwkAW4jF9M69UuaIRprVqUprzlEupWU+
	rzHUiIqKDoz1iMIYLTKzDlm7KzM/gd61OyWULo7h0oymhnMYG2DkJUf9Z+wNBTFCX809ssPmCL+
	aV/wChgNBpF+b0+OyegLywqch56z32UgLoC7UVAGNewbqKMuBgNH9fWS/GnjN6k2vH4+cyxBgCS
	WU4=
X-Google-Smtp-Source: AGHT+IGo6iqnWrqDrtRo1an3vJuKouV5RjS5DRtWGy3IQp7nt9esDi9MQIuwsCqJ8H6093glYV4xzd90Bb/yR8LhGEE=
X-Received: by 2002:a05:6214:1ccf:b0:86c:a297:9c97 with SMTP id
 6a1803df08f44-87a052877b1mr67912886d6.18.1759863001273; Tue, 07 Oct 2025
 11:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <20251006232125.1833979-3-royluo@google.com>
 <8ca61364-df47-41f2-b0d1-f2a8a74ec728@kernel.org> <CADrjBPr7Jp_ZyGv2Krv6iLG0avgFWpcWJEO-Z=cEkhwEY-+z5Q@mail.gmail.com>
 <d592eb91-84e9-4bdc-8363-1d0bfd47c17c@kernel.org>
In-Reply-To: <d592eb91-84e9-4bdc-8363-1d0bfd47c17c@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:49:24 -0700
X-Gm-Features: AS18NWB1W-NkF9ZGaROK3BKRMdthcWV6kVzDTDNtLUYtC_DV2IHX4qZyOhy-2Gs
Message-ID: <CA+zupgyQGpQEoqCm9rbnw2Aum4j3mu-dqvDVN=RUEVY9E7q7Hg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_115003_225215_B52CE3B9 
X-CRM114-Status: GOOD (  39.48  )
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

On Tue, Oct 7, 2025 at 7:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 18:09, Peter Griffin wrote:
> > Hi Krzysztof & Roy,
> >
> > Firstly thanks Roy for your patches, it's great to see more Tensor
> > support being posted upstream!
> >
> > On Tue, 7 Oct 2025 at 01:44, Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
> >>
> >> On 07/10/2025 08:21, Roy Luo wrote:
> >>> Document the DWC3 USB bindings for Google Tensor SoCs.
> >>>
> >>> Signed-off-by: Roy Luo <royluo@google.com>
> >>> ---
> >>>  .../bindings/usb/google,snps-dwc3.yaml        | 144 ++++++++++++++++=
++
> >>>  1 file changed, 144 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/usb/google,snps=
-dwc3.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/google,snps-dwc3.y=
aml b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> >>> new file mode 100644
> >>> index 000000000000..3e8bcc0c2cef
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
> >>> @@ -0,0 +1,144 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +# Copyright (c) 2025, Google LLC
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/usb/google,snps-dwc3.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Google DWC3 USB SoC Controller
> >>> +
> >>> +maintainers:
> >>> +  - Roy Luo <royluo@google.com>
> >>> +
> >>> +description:
> >>> +  Describes the Google DWC3 USB block, based on Synopsys DWC3 IP.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - google,lga-dwc3
> >>> +      - const: google,snps-dwc3
> >>
> >>
> >> There is no such soc as snps, so you grossly misuse other company name
> >> as name of SoC. Neither lga. Otherwise please point me to the top-leve=
l
> >> bindings describing that SoC.
> >>
> >> You need to better describe the hardware here - why this is something
> >> completely different than GS which. Or switch to existing bindings and
> >> existing drivers. Did you align this with Peter Griffin?
> >
> > I think (from what I've seen at least) this is the first submission
> > for drivers in the Tensor G5 SoC used in Pixel 10 devices (which as I
> > understand it isn't based on any Samsung IP). Hence the new drivers,
> > bindings etc.
>
>
> That could explain a lot. I would be happy to see background of hardware
> in the bindings commit msg and the cover letter.
>
> >
> > However the issue is that none of the other base SoC drivers on which
> > this driver depends currently exist upstream (like clocks, reset
> > driver, power domains, pinctrl etc). So it's very hard to reason about
> > the correctness or otherwise of this submission. It is also likely
> > that when those drivers are upstreamed things could change in the
> > review process, to how it looks today in the downstream kernel.
>
>
> Bindings and drivers can be contributed without core SoC support, but
> then please describe the hardware (SoC) here. Having core support posted
> earlier is of course preferred, but I think not a requirement.
>
> Anyway, compatibles and all commit messages in this patchset are too
> generic and need to reflect this actual SoC, not "Tensor" because we
> already have a Tensor with USB. So basically based on existing support
> all this patchset would be redundant, right? :)
>
> Best regards,
> Krzysztof

Hi Krzysztof and Peter,

My apologies for not providing the full context on the SoC supported in thi=
s
series. Thanks to Peter for clarifying; yes, the Tensor G5 SoC is a new
generation of Google silicon that is significantly different from previous
generations which are based on Samsung/Exynos IP. This necessitates
new bindings and drivers for the G5 and future generations, and I will
ensure this is clearly detailed in the next patch set's cover letter and
commit message.

I acknowledge that the core SoC support (clocks, reset, etc.) for G5 is sti=
ll
missing from upstream. We do have plans to push this forward, but I don't
have a firm timeline yet. Thanks for confirming that this won't be a show
stopper for this patchset.

Thanks,
Roy Luo

