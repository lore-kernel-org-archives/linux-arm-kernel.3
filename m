Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75616CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlQXBrL6GJchLN0rsfCNDqviLGR3waoluveYLsj3WyU=; b=4hiDJ6DvDYH7lqa+T+T/CWUqKz
	kN/m+1mPHq30vZ/+xCxaOB6H6+vRlbgG3+9mRXn+A6LNZUPh4TPirADMCbtp7sDqxbxf2HD+eog5r
	OMeNwsgmr7cbfn0cMK7LEQ1RWTP1IjwDiyIt3D1BObd0v3dFb4w8HoJogIuneuRAEnHcHgZES4mwi
	Oo9S1xKLdN88ZxBgMvZKAto9tAok5a9YxhUcbC66LoEg43mvXwVY8EP9KUSvYhVrSH8T9/9nT90LX
	WwCKR/n/xEWzO6dHSJsWGia+occ0plqOsHq6ngwYSXhqFFg/nnyyc/+K5IEq2k8yaPHS3ot30Ip/t
	2hPW1XHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoIa-0000000650O-2FXJ;
	Fri, 31 Oct 2025 12:32:08 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoIX-000000064zx-18au
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:32:06 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-3c9aef8fea5so289596fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761913924; x=1762518724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlQXBrL6GJchLN0rsfCNDqviLGR3waoluveYLsj3WyU=;
        b=S7VwzSraPIQIonnINsmpW1L2MRqpzAjRuyEcqZhh3ZTXxKapQC2l8/dYWiMK944qGH
         aNaYOg6BtxSEz/jxiGiA4SQ+xl+Ia+LGdbEB2xlKIO4U6042vSD2bjCCWVpkIoTmTONK
         VmpDugNCz4gbJ1ucOAHetV7YuQaFhvJ6wR9j4CUUYeVuN4zN2skvK+BTo/enixDOVRBi
         L5B3gZgGXeY/W/qe0U9Q3fhrdXTl/S8YfIkiCgNNIcYMArPsBOBEAIhCvj3245U30TdE
         qpjCgggoN7TW0wlCxAKJiEeMUaNONjaLWWubwph/cPfWLngpTRjJTbmyb/F7fFU8WamG
         kLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761913924; x=1762518724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlQXBrL6GJchLN0rsfCNDqviLGR3waoluveYLsj3WyU=;
        b=LtEu6rvLQAPoVQ6Ishe89vrfWfYpgCeKjvD7EbAM1f4Ot8XDBA4du2NiCC8eonUvGz
         7o34IKAcMNqNKkfEY3a0e0qW4sD91UhxXwIWyZiaoBq7wLdgYghtMT4e6sXXsz6VsPaW
         RxsV5VjoNSLvmCMJuH2mh0PL+GTYjvNki0wqeHaulNLIuWRZPGOsuwYzR2BePwLPzG5C
         EeB6Xnm6Xxfh3Ukj+/GZTv9uJI8sbEaAounK2seadqc7eWp98IAP1GVJE7uZX+mOAYsa
         t/26LxMzgrG00cr171EJKq5C3aDdy9ZiQnsBxSNJZTXz396imXzeGFYzua46bL3mpShb
         7/9A==
X-Forwarded-Encrypted: i=1; AJvYcCWEnj4avg+uaWQtkw3pXzNQyrhOS6a2BjYdN8uvR+NhX2Bd+cG6kSb4c7c8RGili5p9z4o3BCm3Ob+7U84+dgKC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0sX0fs415SUNR6pBHi6ejbpfRNvAduobP2c1FMLwyl2YYj+0w
	hOGyTWtK5HZSVI6DS2tOIHk1D8e1aVtA4WvBLLsCdUCn/ZKlKxDC7J6299+yeVwbyU/XQDViDKI
	GnEAulTBXGjgCmeB0yghPA9LD9RqfyH1zg12vnVP5
X-Gm-Gg: ASbGncsmAKjem7VMeJcbVLrX7Sx7a3qG1HrFju/aUS5LNrLF4hYiLCjRVk1Q1POZSoO
	Shmh01C5A4p8sqiPciiNCfoVuvR31P+zfvhyf7SjMIYQW+PAJdPls/Ddvi/FXLhUN4kGQlKulg1
	+RwgyfWHPvg3h5VTpf7flvCcE5/joOtT1n0FELssQIJGDs05ObdB+qreer1GcPp98ebp+0M6km9
	yArOAf+zURoJL2CBOo4VhiHpVe6O9reQzl5QfWvkq7Z/GNtHM4QC854BzEiDzH5mDY8veD6PtDq
	wYvxRYHcQxEIjjzW
X-Google-Smtp-Source: AGHT+IGYh3c4p7Lro2vb/Mmkwo7ehq0fLSmv/FWy9Te4d7O0xi13T47Zh+2e4+y9v1m45TtVgV5OLaRslqisajSlViY=
X-Received: by 2002:a05:6808:1813:b0:443:9fe6:3bbd with SMTP id
 5614622812f47-44f96061dd0mr676165b6e.8.1761913923931; Fri, 31 Oct 2025
 05:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251031084101.701159-1-adriana@arista.com> <20251031101009.704759-1-adriana@arista.com>
 <20251031101009.704759-2-adriana@arista.com> <CAL_JsqJn+vG=FJEnBT2rMQ9Jf+JE2u_j-JpEb=mnWPuTsuz_4w@mail.gmail.com>
 <CAL_Jsq+421HUCRQB5ua9p2UBPi+sq8L0aSYpxVGgJpbpWu2MUQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+421HUCRQB5ua9p2UBPi+sq8L0aSYpxVGgJpbpWu2MUQ@mail.gmail.com>
From: Adriana Nicolae <adriana@arista.com>
Date: Fri, 31 Oct 2025 14:31:52 +0200
X-Gm-Features: AWmQ_bkNOnWH29heQ4utX5bqmSvBneb1mSwkOXqgWEYTPI_SWMnLMKu6rap9SuQ
Message-ID: <CAERbo5x3_+RVRsxY-BZseBPzR0Kkvn7SaSSdoC6fw8a5s5RtUA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: Add binding for SMBIOS
 /chosen properties
To: Rob Herring <robh@kernel.org>
Cc: ilias.apalodimas@linaro.org, ardb@kernel.org, trini@konsulko.com, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_053205_454411_F748223A 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, Oct 31, 2025 at 1:43=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Oct 31, 2025 at 6:15=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Fri, Oct 31, 2025 at 5:10=E2=80=AFAM adriana <adriana@arista.com> wr=
ote:
> > >
> > > Signed-off-by: adriana <adriana@arista.com>
> > > ---
> > >  .../firmware/linux,smbios3-entrypoint.yaml    | 25 +++++++++++++++++=
++
> > >  1 file changed, 25 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/firmware/linux,=
smbios3-entrypoint.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/firmware/linux,smbios3=
-entrypoint.yaml b/Documentation/devicetree/bindings/firmware/linux,smbios3=
-entrypoint.yaml
> > > new file mode 100644
> > > index 000000000000..4d1521c685ff
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/firmware/linux,smbios3-entryp=
oint.yaml
> > > @@ -0,0 +1,25 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +# Copyright 2025 Arista Networks
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/firmware/linux,smbios3-entrypoint=
.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Memory location for SMBIOS entry point
> > > +
> > > +description: |
> > > +  This property is used in the /chosen node to pass the physical add=
ress
> > > +  of SMBIOS (System Management BIOS) or DMI (Desktop Management Inte=
rface)
> > > +  tables from firmware to the kernel. This is typically used on non-=
EFI.
> > > +
> > > +maintainers:
> > > +  - Adriana Nicolae <adriana@arista.com>
> > > +  - Rob Herring <robh+dt@kernel.org>
> > > +
> > > +properties:
> > > +  linux,smbios3-entrypoint:
> > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > +    description:
> > > +      The 64-bit physical address of the SMBIOSv3 entry point struct=
ure.
> >
> > This needs to go in the chosen binding instead:
> >
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
chosen.yaml
>
> Also, drop the 'linux,' prefix as SMBIOS is not a linux invention.
Thanks! I've renamed it to "smbios3-entrypoint" and opened a separate
PR for the binding:
https://github.com/devicetree-org/dt-schema/pull/177
>
> Rob

