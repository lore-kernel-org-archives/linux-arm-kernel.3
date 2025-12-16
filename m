Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E0CD609C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb2HSCN1T1kqHeoHnRD9+QfQA+jV+A8hknxEwI82YVg=; b=BQ7z5Hpus/9PP8fBKXnVDKLjVq
	e+L3zox6gxNnFybfmWo2ctRH+XOcMw+d+BRzYHNWvHnxgQTBC8UQrTs4PBnQyUfYbRETofxW8K+rC
	GfhN60wRBc2NR+Zp3znIuxViY7jCN2b9qmc7zBUpUSJOZI0p4b1/CRDXaix0sIm155WDH+LsXlHrR
	Wg6wQ/zAt4WTYhg6nhQG33PNEsgxn9GC3/VY0hes/M2KvnEF2e7Lgn3FYHe42iJW5dHhCmGR6XPjy
	5RLqPhTU9GeA9B3JD7E49L2qvpGsXhRRCsSMAVkq2i6EH8fkkTz0c+LJv8Y69H9tgPyP5yiD2KiEt
	NXY5t5Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY4s-00000005XZ2-49T3;
	Tue, 16 Dec 2025 16:39:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY4q-00000005XXW-2kl2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78EAA43FD6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B043C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903147;
	bh=ygnPQ7qqQym717fCvUFfhnK2QtoeS4ewCob6NeNRoB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ihVt6mlaorBbndGhkkCveepgzV2lv6R+u2Ox7OBjDcayXcVVfhA7g/licAPgZh2HG
	 +PQCi0P2TG6A7cppa84AlsyOTqJinLK1OQg6zfzWGxy0tjOOhgJ03t/O94K7iDPz2U
	 zBpK9AA0pI2yKCCTKOXEh3RVU5D4foBD5PA4kBzwTK6/+/oww/U6X31WvmVx0bzkY7
	 HiHhM+vS2tZdkyw6NYEzMaZMUgY3NtL76NxU3oJOZ4VNKi6vrXpZLh77UjMNk5HqaD
	 5wI6qI25k50sZLonzATNWb0qUapp26Vl64gCgdB7GqMlFPmlvqZVdzrmm8Bf3BzD9v
	 30Ntam0GeLiCA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so7479447a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 08:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4eLWgQ3wZiYBYqV19KrvxXGrJTHwG3gGUlHWB3P0xBT7lFYxcTwKRGtSIgdbN08g6noaldm69B5Ig0i7P+/61@lists.infradead.org
X-Gm-Message-State: AOJu0Yye/UqEw1XMDbLAnRtAJpmlyRbJTW5nGnAlu3WXB1H0dKMImrPk
	dsL7YDqFhBkvTRCeWV9/THcPfnqiKEpp445U+DtsyQf8WrhAJ+rzzQherPSkaKUYj7TiIKGfaED
	jczja8+TBAxXMQqH9a9qIduBZ6hDjlg==
X-Google-Smtp-Source: AGHT+IF5jXJ0Rl7YYnShYK/S+a50ZyXpCcbuaBSQB8P5v+he6uYqN0QQpK8m3x5KcKmZZWDxawZvxxtvR6G4pjd9LKo=
X-Received: by 2002:a05:6402:34c6:b0:649:6a40:143c with SMTP id
 4fb4d7f45d1cf-6499b168a3fmr15052287a12.5.1765903145910; Tue, 16 Dec 2025
 08:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20251215212507.3317805-1-robh@kernel.org> <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
In-Reply-To: <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Dec 2025 10:38:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sXky33rD1-DkLvWdNcUEBNAty8t2NzvHFx-2ZK1cCSQ@mail.gmail.com>
X-Gm-Features: AQt7F2pHbPdy-KmWb8WZRvs7TP6Y2xOXn9QzR2n7zlqPufyZqNmrkovKonzV3PQ
Message-ID: <CAL_Jsq+sXky33rD1-DkLvWdNcUEBNAty8t2NzvHFx-2ZK1cCSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_083908_736565_CDA2D016 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, Dec 15, 2025 at 7:22=E2=80=AFPM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Hi Rob,
>
> On 2025/12/16 6:25, Rob Herring (Arm) wrote:
> > The Socionext Uniphier DWC3 controller binding is already in use, but
> > undocumented. It's a straight-forward binding similar to other DWC3
> > bindings.
>
> After being pointed out by Krzysztof at OSSJapan, I've checked the bindin=
gs
> and was preparing some additions or fixes to resolve the warning.
>
> It's almost the same as my proposal, however, I add a little.
>
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >   .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 ++++++++++++++++++=
+
> >   1 file changed, 89 insertions(+)
> >   create mode 100644
> > Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> > b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> > new file mode 100644
> > index 000000000000..892ae3458c1b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yam=
l
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
> > +
> > +maintainers:
> > +  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > +  - Masami Hiramatsu <mhiramat@kernel.org>
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: socionext,uniphier-dwc3
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: socionext,uniphier-dwc3
> > +      - const: snps,dwc3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    items:
> > +      - description: Host or single combined interrupt
> > +      - description: Peripheral interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    items:
> > +      - enum:
> > +          - dwc_usb3
> > +          - host
> > +      - const: peripheral
> There's no problem, but how about the following description
> following snps,dwc3.yaml?
>
>    interrupt-names:
>      oneOf:
>        - const: dwc_usb3
>        - items:
>            enum: [host, peripheral]

That allows for 'peripheral, host' or just 'peripheral'. Mine would
seemingly allow 'dwc_usb3, host', but snps,dwc3.yaml will prevent
that.

>
> > +
> > +  clocks:
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ref
> > +      - const: bus_early
> > +      - const: suspend
> > +
> > +  phys:
> > +    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed P=
HYs
> > +    minItems: 2
> > +    maxItems: 6
>
> Since Pro4 only has one PHY, so:
>      minItems: 1

Ah, I only checked arm64. Will fix.

If there's other arm32 warnings, I'm not looking at those. So fixes
appreciated there.

Rob

