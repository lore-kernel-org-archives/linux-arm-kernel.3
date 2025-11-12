Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA0ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=; b=2eAw/fbnhvOYS8F2sSSbLBg197
	504ipfAwd1iG+TGIfeE/UbG0mPTbVTiLAGM8LuU9XMWrtgsa7MVrtQ3vY/s1DaKM7f7oAFsFr9Acq
	UgCXfk9ULhs/4gynaa70wS6qUBx1lOsIT91q40xZZ4rX8QuViklGJnCIDjkI5c/bOtds33+YYtUly
	OTnVm5vedS34/MdxxIAWj4S6Z1pVxn1DmbTrz1+hGcW99ztR1XZDiWCvI8QftiaWQNgxsEO+JEEga
	pibwc3V16ovsPiboPnpLWcTItBN9TbSL/OAWKYe3uRAo86/EW5/fIxQUYzQ/mX2iNnCOIXwu8KfZI
	FJwsh/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ91I-00000008gg9-3mtl;
	Wed, 12 Nov 2025 11:28:12 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ91F-00000008gfL-3aAR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:28:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-ba599137cf8so466351a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762946888; x=1763551688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=;
        b=F0hXXhvKzW7G+cYPSZOQADj+H+G7PyRQHF/YpYXhaz7OUUrW9GhxqPKH10e5FVfjWs
         53f2+ax+xnPcyffRrIDBO8PMk45zB/OB41hx11uiiKrW6G9+GRNvh41RvWQyu+WpWqNQ
         dx1ZMQ6bXycILs6ko2C5EkMr/hGjnsn2GnPvKgsLRmsJTb0kdfVDJc9gD875h54ndDIM
         8tA6TRGXvLSU1NkLurKlCIPq14vZLinoGiKmTlvlGq4k/fGRtlybfTSIIWSuNctJeM46
         MdwWh5qZVsptb1OnMuW58drNQzfUS2phO+H7IJQLmZxZaYN9TLs6RVxY5iW0cs52p8dF
         FmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946888; x=1763551688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=;
        b=e8TS8o58dZHh9JBkZP5y5fL9Lfrog85JpOolTd6qfEbQxIDsilTkTMDNmu0VyoIAAo
         pNMHCuf736SlMVqCCa8bgBMQqGyQ6NQP8JKh/6LT7BFL8yEHy9U4aRA8H5jukBecKczA
         XVmH5VKm7rBV86JOPQNU+eMtfq7+dwJ6kWkbOGz4VmMlpgYGFtV54741I81KOA7lmjH5
         O+BnnceLRLiii7UgdjbDTnw7m+0RHfhJDJGbBqMuzcdOdJltw3JFnlFQUWbHQbOQepFu
         xw4YimOspkI7KKdssbxRUqjNzyErOJcnrcm5emGBC5S5ZxAZKAJA0tbhkJNO1Ktm6LQW
         GBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCCLYrpuV+7Ns//hP4Ihd99ljn0ajwsG+A2xQjHGV8+GwO2ymrz5JFhFRCimX7+OM5ifxkHrtYiMKUG2qYELPk@lists.infradead.org
X-Gm-Message-State: AOJu0YwvfuErZ0ErORITfPnx/ciBXaTCcgAaHoNsJVCyUSCRgQZUUxIv
	ky8kC4mAD3ZuWuXjqQGNX3MuvSYX6oIaQH/ORYnhSVBCBnYMhgRlve5MlrVzqb1qZ2XWyVKiMNW
	0DG96+UrDLIQ0nDS/NB0dXZ3bpAkTPkaEnpP5EoH1
X-Gm-Gg: ASbGncuguE+hVLIHTlONPAdq3g3dWBEqMxGdnyhdSODQh8V6eG2YhtnQKEvM2JgBQKV
	IxnCq1J7CCnG72vai9W0oUkO0n69dl7mDhMyz+N7TWzuWVPTdnTTsIyWJfKfXctKEwY/RWB5PYI
	srS9KaWi5Vq7iN3V0fJMFCu18pvRezpsMo76kUryDmturhOqJY3zef4kFKX6QY1vHXBD7WJCC95
	hp1NewddBXKd/yx/0cpLwbPDkEamqKzzcRtOIYT1IqX/bN2vj8s93mn3SBgikvp0Y7eqQJlXvJr
	lxQaBPEGVk/Dl7gEmqqLt8TpU2XeYcRx4BBK
X-Google-Smtp-Source: AGHT+IEzhYJUJIhP1itpJ8SMj4wfy7Edo9fDUXSWIfM11ytYomEi4CEvHvu/YvWNAK7+sehRmwWVHzbMhPckpBBMF6k=
X-Received: by 2002:a17:903:234d:b0:296:5ebe:8fa with SMTP id
 d9443c01a7336-2984094a5bcmr70869985ad.23.1762946887940; Wed, 12 Nov 2025
 03:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20251111130624.3069704-1-royluo@google.com> <20251111130624.3069704-2-royluo@google.com>
 <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
In-Reply-To: <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
From: Roy Luo <royluo@google.com>
Date: Wed, 12 Nov 2025 19:27:30 +0800
X-Gm-Features: AWmQ_bn2RT6EbgSb3mHFWKckHPwcrvZ-s2OqhjevpH_GhYx3Lcain4Rs18PGkFc
Message-ID: <CA+zupgxALZjF8m=PfYgb1QUgf0u+-Su0XYQ3VB=fCpM1dt9s_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_032809_901283_82B8A78A 
X-CRM114-Status: GOOD (  25.55  )
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

On Wed, Nov 12, 2025 at 4:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 11, 2025 at 01:06:23PM +0000, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitati=
ng
> > this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dw=
c3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > new file mode 100644
> > index 000000000000..bfaf6cbdfec3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-dwc3
>
> Doug just said SoC is lga, not gs5, so you need both to align on that.
> Actually not only you both, but whoever else is upstreaming from Google.
>
> It is not the community who should synchronize and organize way how
> Google works on their own stuff. Google should organize how Google works
> on your Google's stuff.
>
> Best regards,
> Krzysztof
>

Ack, will align on the next patchset.

Thanks,
Roy Luo

