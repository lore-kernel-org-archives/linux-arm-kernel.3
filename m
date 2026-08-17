Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY2bHrWP83c5qKEj7JctX4+A/lVgxJqecsGF51bUANw=; b=aKvugopk7rDh6lOXipDL1Kupaz
	3PG+xWlAKb0fH+HiZ7fGMp4DnIqFA0TBkpfQekRk/iZbHtxI5Fiym8GEACszdrSDLifz1EiK/qL1o
	wucGCckeUPyDMTuMvEJt1wddK1Utg4uY1bk7Y5RHnrRkYhXN03lJOWhvhiPY8Wa+N9uvyFysrs3ts
	XgIlbf1f5+XleDwBcrs4Ns1B3Bl4G6GkpPD/ENhtlTnf2rmDAj37eof6Lpg0J/AGE6ijQFaB47n0E
	PNtZ/wZV7/joidXLyYG6o+CNs2uZNAshGgq63sOPHk7y4gPW/dtdFPOFJyYQoXXpAGxqovVDJMmUA
	dwxJwTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrJh-00000005VhN-0XUc;
	Mon, 17 Aug 2026 06:59:29 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrJd-00000005VgP-3i6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 06:59:27 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51c01c79467so667191cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 23:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786949964; cv=none;
        d=google.com; s=arc-20260327;
        b=PWl/4bxGj90BiVSyPtLzMnsygE5xLEQ+L9u7V9Nm9nK6IRI3o3k0eJBxkFeGhpz5Zn
         E3HzaN/s4X2KRfi0++Aa7k1/ivO1GRsX5GejvkS9vKkM2OoKKOiXJPLaoVh5G2m2gK+z
         vw2fravmNX/eT+pBYXn1yCwTAHgoRiECbLPW5hsQ0UtSGyhEmO2ifwAlYImVXGb9HhhB
         82u6ZxcIk2nINrrDfm9Vq7w9yWooEnaHdrqVVh8Qx9aggRm3YHRBPDdMuEJ2ge3uXnIx
         xcl/bj9KldDL+V1J/kv6w6QwaEAja1vM44XlmjfAtHgJvXjo7qg0mtN/fIQZY6sFQBXj
         KvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY2bHrWP83c5qKEj7JctX4+A/lVgxJqecsGF51bUANw=;
        fh=/gNvPqpxwHn9CQjt2I2zofjk3YlJJXcyCpTqFp+ErzI=;
        b=IpHA9bIDzPASlbpea8xsOGWBg1cwgmfeSDVhbAzHCwbbKrybRfvIaZHDTMI7exotAC
         nMgw+o1KSSwOKWEp3SiJ3ZgvimPYTV2Ume4fYRYlc1Naxb8pVcw802nslwsc3PqLn6kn
         f09OTyv5aeNQqVtLUWj2V5TlPMjrsSWlcv4fsBnx1TInBojdrQaucnxlzKJUqxKHBWNH
         0MVACJXAYBjrpxumMYQtXqdERbUH8rYYRcfcz9xxXbstkpcOB00OuVhhEKtKHUpllFmc
         D27BVdWZgWcCXwNS4K4GE366OkycZUIwntuwyl2rfDH+mwyhE2AHY1v+HlzbSL8ZdstZ
         E/Qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786949964; x=1787554764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IY2bHrWP83c5qKEj7JctX4+A/lVgxJqecsGF51bUANw=;
        b=lQlL01jPOgWBPPqAzTEZzCZkis21I5sD+IlRd9cCM56feXh+Syqdnf2WLFx15I9HJj
         dI53MMEfHFFWC5JBYBfgSYnGlCrIavNtTUJYbnGbR1uc9YR+RxGOlQ4XrVtZxPeZrPvY
         6+yuoY5kTJywCjz6qIkxkfrpO0OBfsBf6Gp+hZ8K3IsPYUYeO5CitfACznjJOFNU4/KB
         kJdq6ZmCp0ZX1RIzoho4LMtADzHuP3qslMuAXM5IDnuYl5MELPSHCr6/Ocyxr7yqwm/l
         Zc5wRSEioZfFPYfn7DclzQX3q76ll8JvLuPWapLKXl54ySAISp4ABeCQ3uvHqSCHBPKJ
         HTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786949964; x=1787554764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IY2bHrWP83c5qKEj7JctX4+A/lVgxJqecsGF51bUANw=;
        b=OeVQHDIJN28G+OS3iTnYn6QunbLHINHs8uo89R2d3uIG+zfhD0ZzYLmQZvf/LxIwRl
         NNqBQOqmyKYgo7I78+NibAPT8GaFUZsCBCVtGTf4lt7SqfzSTkd8N9D0rJOMr8O1lCAs
         HbU5O3AwX0HMYeG4LKtusSCiEDCrSnGALVhFbMR7B6+HOzwUeK6+Ol10cHodAk9Tvkpt
         goKCmGd0mDwA2z4VM2kEF7Qr9Q0Au647c0E5Tkmzxs6z3jPXqOsydMMod1kueJ6JPRXP
         PxrlcLiddWJNL7u4JbInACoiEZb2cK/hY7y+vDxOlMtwZI2eBxzQIZJuaGoH2hbYPNBO
         MTvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMteD+mlRsmaKXfDgNw5/oa+eY8qniP0ZbJz9OSPxEU41CDgw1i+E46jw3U48Of0ZwOCteLEkxd2My6Cmuxt4K@lists.infradead.org
X-Gm-Message-State: AOJu0Yw60iDvJ2CGQB4aTDbjFSm7ZPusuITlm/1Mo5Prft0BkpT/8Kyz
	KCHcxodMZZdJkYWeK5ph96bG0t0LKJZNuwGQKXSgKROfOOVeUhk+8MshghMW07RVIr/ZrRsKnDs
	OeaWVF69q8RdeMz2Rgr/B/MfrnLU0dlSvbDkNwXXR
X-Gm-Gg: AR+sD11F5cKJKEcwyXE8TseYpCZG8YJdXxnKRH5O9W3V52r3NJs9WIbjLaj21aQawI5
	dUse0SdxIq02L2hcJEyX6euvuXjNGuy94pnYIFTjkkNxxuMdOqEwljo9HPDQdtBm84o7wtC/vKH
	7QBKZ2kAKFarKYcL1Rf/Ayr0zCyBZbxao23xaUNZc8dNfiCHDRh6P0RBN7W5UaSXufKMxH8lEIR
	kQjrZCSirFxpsK0SubXcz7okfJHffjXng7ZoD0AjRBz/hYQn1dPOkzU9rugfDXXIAgdLiAufgsV
	GVKJb6hMIYPJSr/0J0D+mZc7CD2+dec+owlDRK9Te018uQ==
X-Received: by 2002:a05:622a:258b:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52db1f07d0cmr7857301cf.11.1786949964069; Sun, 16 Aug 2026
 23:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com> <20260815172712.50119-1-irogers@google.com>
 <20260815172712.50119-2-irogers@google.com> <bca067e2-bbd7-43cf-9198-32bf4de35a7a@kernel.org>
In-Reply-To: <bca067e2-bbd7-43cf-9198-32bf4de35a7a@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sun, 16 Aug 2026 23:59:11 -0700
X-Gm-Features: AcwNN1Vs4MSe4cISy_57HV-pFnHrgdqaW60la9WkPHYBLONdcObvmkLdsOaO8wE
Message-ID: <CAP-5=fVpy=mK75hXNnFKTcdv-J9ckDV-vqVCbcEKigftom=1Qw@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: florian.fainelli@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_235925_959274_3804051C 
X-CRM114-Status: GOOD (  22.08  )
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

On Sun, Aug 16, 2026 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 15/08/2026 19:27, Ian Rogers wrote:
> > Add Device Tree bindings for the Broadcom AXI PMU hardware blocks prese=
nt
> > in the Raspberry Pi SoC line (BCM2835, BCM2711, BCM2712).
> >
> > Depending on the SoC and security configuration, these PMUs support eit=
her
> > direct MMIO access or routing via the Raspberry Pi firmware Mailbox IPC=
.
> > The bindings support defining 1 or 2 backing MMIO regions natively map
> > the system and VPU control surfaces.
> >
> > Assisted-by: Antigravity:gemini-3.6-flash
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835=
-axiperf.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiper=
f.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
> > new file mode 100644
> > index 000000000000..8a4857aa448c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
> > +
> > +maintainers:
> > +  - Ian Rogers <irogers@google.com>
> > +
> > +description: |
> > +  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features=
 hardware
> > +  performance monitors on the AXI bus for evaluating memory bandwidth =
and
> > +  system traffic. Depending on the SoC architecture, multiple monitors=
 exist.
> > +  The primary
> > +  monitor evaluates the System fabric, while the secondary monitor eva=
luates the
> > +  VideoCore VPU hardware.
> > +
> > +  Older silicon generally restricts direct MMIO access to the VPU endp=
oints,
> > +  requiring them to be accessed over the Raspberry Pi firmware mailbox
> > +  interface. If the VPU endpoints are memory-mapped, they are supplied=
 as
> > +  secondary resources.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm2835-axiperf
> > +      - brcm,bcm2711-axiperf
> > +      - brcm,bcm2712-axiperf
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      Memory-mapped I/O resource regions for the AXI PMU endpoints.
> > +      Typically ordered as System monitor, followed by VPU monitor if =
directly
> > +      mapped.
> > +
> > +  firmware:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
>
> This was already rejected.
>
> https://lore.kernel.org/all/?q=3Dbroadcom+firmware

Ok, assume I'm ignorant of device tree things, how should this be
addressed? Your link is to "~70000" messages.

Thanks,
Ian

> > +    description: |
> > +      Phandle to the Raspberry Pi firmware node. Required on older sil=
icon
> > +      (BCM2835-BCM2711) where VideoCore VPU endpoints are exclusively =
accessed
> > +      via firmware mailbox IPC.
>
>
> Best regards,
> Krzysztof

