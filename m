Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F9CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCYAaAMmLZBGANTUREZDDzVw+9UGntGcBVSJjgdzh+M=; b=BlI/Z+ilLOdu0OYZLg68CZn3H0
	2urbw80b6isOudGyZhexRuTgbBUB2ckFuQbOcfzfbgis8h/BpTgby1DMUwA6tWgh+Hc6IDqitLlOu
	1zIuOjKmpbjARrVQ67gCUwKNnTcr8auN1KTo4KsAkRNW7kv8Kz4MH/5qq75aFtGrkbUnZkSs7XbSy
	qhq3cfV1i1ooPfjrlYK9oEcu6vB8c30mLHqDINQ+olEPXyPrAn91Jp2fpkpyM1y4Job8xg6cTnwd/
	LOTS5FDqz7QzeQIOKe+0lgmML7QGDU8G9byuHF+8nKjyTRblANvUc0Se9GjDvjntzkKE0Hmyk5UbJ
	RZNorquA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnXt-000000061wj-2yYq;
	Fri, 31 Oct 2025 11:43:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnXr-000000061wC-2UFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED4E344CFE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C343CC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761911030;
	bh=mdzbrJ0J4uL7MKIWBphzIXl1JweK8UJmEopl7jTNs98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CwcegOPhjADnfYMsBl9VJU8444Zi7r5+Fje5jBkuUyLoW69fzojXbH1oiTz8pXuqp
	 HmsUdiup+rEVmPdCxf2wJsyNy1pSAzr+EEm3Q4rdtbKf+Wq6CGNdAKbWtrTZnDMeOZ
	 7kLvmgDlrRhAJBhuo6QgCQGV+jnGR38aJUfnUJ7mjdfWeLO5eT/AmgEc+q6bei45Sm
	 zzeH3qZU2/5r3+YN2tdTiizgDzm/Pp8g69asdZ4jZp2CBjtZDBTQGJG+zZPZFsxT7t
	 uNpIfbE2drxVRkVhChnwqGFYQN/uz+8sDVrXvbnphNz7pRIaTdsBPimhP3ScjGu54Y
	 LFul/DdFP3daw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63bea08a326so3111849a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:43:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0JI/RqIFqUQe+p2ll3XwR9V+6Y7LGQ4JwUtuNV316stFQGhG6sDkmB9h2keT+pfWOMr7RYsasUUBZvQLvmdZh@lists.infradead.org
X-Gm-Message-State: AOJu0YyAXl9habDEOdDt1ZQkfKC10vGvw7HygbyiUoqbWqRMMsd3PoC2
	xGmpgPQAU5Iqhvpml+zhSR+F591+5sjAx+H3TGGrGr6s3ozEMhLKyUYQS6t9O18j/aLulCIFuvD
	K+5V2NVHi0BbQA7/hQyoCkTrhXVsgaQ==
X-Google-Smtp-Source: AGHT+IEjMLK6OGl40HXHsXuGaAqP8D5LU+eugA99cHMlpyBU1ppcLNLQ3ZkPtjQ+CzfsdfP4X7J227AIT9NzZ3oM/mQ=
X-Received: by 2002:a05:6402:2744:b0:63b:f59b:e607 with SMTP id
 4fb4d7f45d1cf-64076f66d22mr2833156a12.2.1761911029322; Fri, 31 Oct 2025
 04:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251031084101.701159-1-adriana@arista.com> <20251031101009.704759-1-adriana@arista.com>
 <20251031101009.704759-2-adriana@arista.com> <CAL_JsqJn+vG=FJEnBT2rMQ9Jf+JE2u_j-JpEb=mnWPuTsuz_4w@mail.gmail.com>
In-Reply-To: <CAL_JsqJn+vG=FJEnBT2rMQ9Jf+JE2u_j-JpEb=mnWPuTsuz_4w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Oct 2025 06:43:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+421HUCRQB5ua9p2UBPi+sq8L0aSYpxVGgJpbpWu2MUQ@mail.gmail.com>
X-Gm-Features: AWmQ_bksFTqLinpU8zo27uHAZknvhm2S3I_vjliyAKm5aA1q3yssJinkZOpFVlQ
Message-ID: <CAL_Jsq+421HUCRQB5ua9p2UBPi+sq8L0aSYpxVGgJpbpWu2MUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: Add binding for SMBIOS
 /chosen properties
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, ardb@kernel.org, trini@konsulko.com, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_044351_693645_589F02C7 
X-CRM114-Status: GOOD (  17.60  )
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

On Fri, Oct 31, 2025 at 6:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Oct 31, 2025 at 5:10=E2=80=AFAM adriana <adriana@arista.com> wrot=
e:
> >
> > Signed-off-by: adriana <adriana@arista.com>
> > ---
> >  .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/linux,sm=
bios3-entrypoint.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios3-e=
ntrypoint.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios3-e=
ntrypoint.yaml
> > new file mode 100644
> > index 000000000000..4d1521c685ff
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/linux,smbios3-entrypoi=
nt.yaml
> > @@ -0,0 +1,25 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2025 Arista Networks
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/linux,smbios3-entrypoint.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Memory location for SMBIOS entry point
> > +
> > +description: |
> > +  This property is used in the /chosen node to pass the physical addre=
ss
> > +  of SMBIOS (System Management BIOS) or DMI (Desktop Management Interf=
ace)
> > +  tables from firmware to the kernel. This is typically used on non-EF=
I.
> > +
> > +maintainers:
> > +  - Adriana Nicolae <adriana@arista.com>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +
> > +properties:
> > +  linux,smbios3-entrypoint:
> > +    $ref: /schemas/types.yaml#/definitions/uint64
> > +    description:
> > +      The 64-bit physical address of the SMBIOSv3 entry point structur=
e.
>
> This needs to go in the chosen binding instead:
>
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/ch=
osen.yaml

Also, drop the 'linux,' prefix as SMBIOS is not a linux invention.

Rob

