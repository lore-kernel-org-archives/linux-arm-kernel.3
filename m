Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F565CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKNP/yN+HoKZjA3XR1NyvYVI7Ql/SNuJgENY3tlDe/U=; b=Po9Q1KQ0WZ1tBohOZUGCExQAzt
	RomVLT/tJgtTCNp9n+9cWXyTcVm2ecpcYd+21sgbJwLYYkn3n//tn1ODBdi0VHlEfSiUGf9LE2iQ7
	Yi6j/l3opyopwu2oPNQujh+B968O/Oq68bPlmBIpGecZ0yrOlR8R/khBmWIOvd/wT2VaImRw6cCzF
	W89E4gujRAVInR+pp78UY5u/yqA3v5rSpBRJvgBY/OR6Scb+l3jw0FGtXVNwOYoQGvD4WYmR9IQx2
	+pGOxkreol8L4V4WQxHFUfGedKyhELSMKeLLXBpTt1bSnZtjxN+k0fntwFnd0SJJcEbBoptnkILzH
	irb6yHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl4f-00000005kKa-2BiU;
	Fri, 31 Oct 2025 09:05:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl4c-00000005kK4-0MOw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 829B745461
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 09:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B58C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 09:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901529;
	bh=eTKgCRHXJ2ttsTcaNiE+n665NDkdon4ccb7z2QxZkLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tCCyI58p4NXE9j2AYlOilbllj+ceXfrTCqgb319SHV43EG2At5MNkx76QzhYRkTII
	 Qxqx3anwIr//+EOyWZl/NuyKiai4fYT3+dYM2SSlga+vAeFOsbTXPSERs8QFVlX2E4
	 Lm8JGOJGuft7DlAZNHtjSV1ksZh0zzbNlfcUn+yIPghiCEU4jkeNa0j6avSGy3ms90
	 9dxTaxgUf5T2MzdvWLBh6bIHA0cpocjAq1srsxdd+nPEQdDKYUaOYbiXSdbLmYjcLB
	 jUtidO6dWRYROMG9rw33SgA8vFZbtrJKVd+4vXyMyDKgy7uHlYw6jtHwm9F++t/NpT
	 vIGEtwEoUKraQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso2936465e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 02:05:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQpGB/pD3AkSPJA8D41Hcwhw1FJ8AF3Jvpg4zWJkdoiYSstZC+ieuMTivvRgDLXiEhG9nupjwn45DFeFoy64O+@lists.infradead.org
X-Gm-Message-State: AOJu0YyNB32HPAssc7Rquwbq541fs7PQE4LSlL4bBa1vWPdFgg8eaYoo
	TRhilDGdl2e8Wet9U38Ezia8NEWhH7ZBXSCyFmHzJKzUWKn9aI7qK22kSlU+roP8Oj1bU5lkFKM
	aXNDGugSsjbaaJ8MPe6Zn0Z3POnZeJnc=
X-Google-Smtp-Source: AGHT+IE7b83tXRjmclJn2avYmt6XtvERRHTx5LrGseWwdXtkY4M3M6KW2ebXYIVYmSbAzUGZb4o1I6v7gq5sYFVpZVk=
X-Received: by 2002:a05:6512:234c:b0:592:f8c0:c917 with SMTP id
 2adb3069b0e04-5941d50dd57mr1067998e87.10.1761901527758; Fri, 31 Oct 2025
 02:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251022114527.618908-1-adriana@arista.com> <20251031084101.701159-1-adriana@arista.com>
 <20251031084101.701159-2-adriana@arista.com> <CAMj1kXG8hOMXzbbP2akJLB27hGJ_S28hcOL2c7k1uGA23hHUpA@mail.gmail.com>
In-Reply-To: <CAMj1kXG8hOMXzbbP2akJLB27hGJ_S28hcOL2c7k1uGA23hHUpA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 10:05:16 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGykgmJey8SgGuKBC8DdwnfqYTiop9OMo1UbcRdw=4cNg@mail.gmail.com>
X-Gm-Features: AWmQ_blRWekdn2tndAk532XPWCtNvPNe5S6diOrP7TlzawjZdaa-VvWSFigqvUI
Message-ID: <CAMj1kXGykgmJey8SgGuKBC8DdwnfqYTiop9OMo1UbcRdw=4cNg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: Add binding for SMBIOS
 /chosen properties
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, trini@konsulko.com, robh@kernel.org, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_020530_162089_A496D0EE 
X-CRM114-Status: GOOD (  22.19  )
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

On Fri, 31 Oct 2025 at 09:52, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 31 Oct 2025 at 09:41, adriana <adriana@arista.com> wrote:
> >
> > From: Adriana Nicolae <adriana@arista.com>
> >
> > Signed-off-by: Adriana Nicolae <adriana@arista.com>
> > ---
> >  .../bindings/firmware/linux,smbios-table.yaml | 26 +++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
> > new file mode 100644
> > index 000000000000..b78d8ec6025f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/linux,smbios-table.yaml
> > @@ -0,0 +1,26 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2025 Arista Networks
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/linux,smbios-table.yaml#
>
> Should the file name reflect the property? I.e., linux,smbios3-table.yaml
>

And maybe the property should be called linux,smbios3-entrypoint?

Sorry for the bikeshedding but this will be set in stone as soon as we
deploy it so better to get it right the first time.

> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Memory location for SMBIOS table
> > +
> > +description: |
> > +  This property is used in the /chosen node to pass the physical address
> > +  of SMBIOS (System Management BIOS) or DMI (Desktop Management Interface)
> > +  tables from firmware to the kernel. This is typically used on non-EFI
> > +  platforms like ARM/ARM64.
> > +
>
> 'like ARM/ARM64' is both unnecessary and inaccurate, so better to drop it.
>
> > +maintainers:
> > +  - Adriana Nicolae <adriana@arista.com>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +
> > +properties:
> > +  linux,smbios3-table:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      The 64-bit physical address of the SMBIOSv3 entry point structure.
> > +
> > +additionalProperties: true
> > --
> > 2.51.0
> >

