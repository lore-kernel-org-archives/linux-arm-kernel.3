Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE8CCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=; b=imuP/icn8gnpVbGtJcucBYVoHY
	YsBcz+hZXAtReywhKDGoLAkpCuxX1CquyI59j40KkyzNyCPYpTbrFEHDc4m0TejVGZ7dtUee62LnO
	bwzjnm8cwOimH6Uyv7vyYl5EkXfvJ6WOk1E1w/bTrYnq5bfFpidzXu1BXfBbUxj1ZLWoq+C8xsxCl
	fLeNQhifNvH0a7Q4YKJYP9/tBUQyDuzxaEG2sgSCevaVXPHY8Ku/HyRF6K41Nn54HtiyKR7zglooP
	+mEx8ygFeL+QQqAsV7j5dEwG24BEhh+a0I5VpfZDgkjArF7k4e9mMF0wNv5fWln6YrvhC5yMQv3sA
	41ckkhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFVM-00000001X3M-3uuN;
	Wed, 07 Oct 2026 00:27:32 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFVJ-00000001X2n-2LTK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:27:32 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b056d58f2aso8133757b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 17:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791332848; cv=none;
        d=google.com; s=arc-20260327;
        b=GpehOU/RQBk6/apjkPhcjKZK1YpL0TDj7i2HLlgOahdYQrVRIeOwaBhy8+Vx9rKTo6
         ObUtxaj1+m71bM4gEzcZemeuedoHJrpONCmVYmdyESPQ14+CB7frq+Yl2ZIU+q22IL34
         aut5fC7r1Vn3DSyiyajNfZrBz2NfvVQY+oFwcpcb45Qq/Ie5mZIfmUnURMzC3OYWMZGi
         LmGR7Qi9munXtaGIY4hTlvUWADWJKxbtUGIVzxfW+F6zlrQdq3x8KOUxjfIg3kddf6nj
         y+PbUctEsts8IDjm+zF3goJtmQsaKzUjSXszA+q41R4dQhjmZBbByk2Ww70TdbJnDVKo
         FJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        fh=cZBOnMjXz2ALWma+OeUP4Ks2jNd/NxbQpxdbeBbbCeg=;
        b=Z+0rODHs8GE8Pp0BdDrnd+Qv9zS1OBCkaPb+EGSfcSVCXgnnYu6GvcpxA17GfFl/aw
         XlgYWyF6PAzLPj4qG6Mff2FM7gat5ErwwQeef1uEjFI47Wf7LyahXinIrB0SmeVFcNrx
         erxkGTK2AS8UZky7IHlm+lMlxeEkt1DOXDgi4oTaTKos7Xddg8/BGDrMbx9hsyd1oPaM
         toc051jDb+x1Aj44XP5vcpcNUxTi6FFQl0AWrubRiGlyuUfmmTmfkuCWnqxAF6xljuS5
         sf+jfFjiFiCwxC4Jab2qV5tfmybxLTh0erKUEBnY1XEyzfsfHi3hLOh0EsTLPiPytmId
         258A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791332848; x=1791937648; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        b=vpAnGoBLc6Mtl3dQ3ytwznOsJHcx30uGN7k2i01rL89IHUj2jCnE3E32BNLp9q9BqZ
         h8ozwLX6ldUgvEZhw0Za3kGMQasVhQONYighYRVHlwqlLyd2I3GKmy+znNqyeNXKT7TF
         h5jLdLzgZfRUi1bb9HyTPfjDfMw2buu7uL8bhZtWJEHQx7whAQSl0ttRH37nSIQHG3M3
         W0cltma8ovQmvkqecI4qt7XUwg3jmAgkjJLTLbcUcy7bvWPWnoOf7yeznfJ4TV0af1zw
         nWuafhov262ic0tJi/Whx0BTFXEkqFiTXtdy0bh1SMmMBfrWchywQBjlUViUZ6+7gV0d
         Jgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791332848; x=1791937648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndf5Tbs3jY61Y12tfz+GmUhm79/15f4MrnX2K4zKs/s=;
        b=BiMVP/da3EjwryA7XeLEvWAwFiEBafVvSvQm9k0v1HiG2KSsFU08uULxb7mr9ATiBN
         KNowEzndYJ0ArgXDK8B5ySQ6BOTryXd1chGNpVyiGMFMiQC3N3lhTVfI+A8IJ8GhSR74
         6glWXYhR2nLgCYwX+ChI11ay0qPC1vyx53GEB5jSfgeBw6WSDA3rs1bVSxGORVIh+Omz
         DiRNW353aRS/QFeUgFOUj1yghztbZfgAsFgkv3Cl0IJQMaosKcYC8Fm2uFZXS6C/gQGj
         +gRSTgowUdnz9+T8X5qI6ld9rhPOxO9ft0tG/VSfFKivfz7voxFlR7xRM2poKgStjT5p
         poWw==
X-Forwarded-Encrypted: i=1; AKwUvByPIOIRqBY37+7h1KxiEnW7g4qzkvtSxiohpgkItxctSUwIT3RS8Y1AQGZefYEgb7uvW2Jpk/W/j4mdMNe4ltO1@lists.infradead.org
X-Gm-Message-State: AFq9FYJC8B8Nt+Wgfxd/0URggOV1hNINRw30s8/4+X1HRHwsUEk7pxKm
	L0LHpTkge9/E96WBj3iOsJhxTMHQDJ/Pe7wEgtzKZhrqyVryi1mk/ACyQdrO5BkswO87njCk7ot
	0MaB6kgcMt2t15h7hBOHmYS6BXLAPjVFEXcJlq2uwNw==
X-Gm-Gg: AYBFou3TJKuZboZyxEsA/wciaE+haNxVoPNFrZB0WoDifpesKRv7zHQf8tY9VM500HW
	AD5xRiusrvVT0NpRg5gjc2UVnv2hS1A46yBESuXD237MF+OghhJSJA4egaswyo2rD7/T5ISCjrL
	r0ATUIGKyPtMFc3gQD37n8cDHtYlfnpU0DOAqLk6gznxSa5f10BSpngq8a5dtPFj5jQqYr6KQV0
	i1qrc8bWSjUjURcx6ixVIuj+pYGxywgVD/MsZptunwiElaNEY+OQ3j5APQwLXc9m5EVKgXOtjJu
	svZjl3YU8NnBwK1yp/eDXMgK6IRhk70OXFy5APt7Qi1FlVuWX0xxrR07d6O6QWRepuiLFEVTTMj
	mEIzV1N4duybA0w==
X-Received: by 2002:a05:690c:a798:b0:8a8:4cd6:b366 with SMTP id
 00721157ae682-8b05b0baadfmr4463097b3.34.1791332847977; Tue, 06 Oct 2026
 17:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org> <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
In-Reply-To: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:27:16 -0500
X-Gm-Features: AclHuK-gTMHxeLVbqLEEqthoe_YhAWKRzmo3ENLwqbF0WuTbIQb_K4cpIVT21tE
Message-ID: <CAPLW+4=gpnHSSdZ1SWaYz4L_U12vo-OTwUvEYCt=SOSexJw+Gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_172729_639776_490CB946 
X-CRM114-Status: GOOD (  33.27  )
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

On Tue, Oct 6, 2026 at 6:47=E2=80=AFPM Sam Protsenko <semen.protsenko@linar=
o.org> wrote:
>
> On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
> >
> > The Exynos850 SoC incorporates an APM co-processor. Communication with =
this
> > hardware block is done using the ACPM protocol, which handles IPC messa=
ges
> > for clocks, power, thermal management and PMIC control. In this
> > architecture, the ACPM firmware running on the APM acts as the central
> > supervisor or arbiter for shared system resources, handling requests fr=
om
> > clients or agents such as an OSPM. In this design, the OSPM is one of
> > several clients or agents communicating with APM.
> >
> > Dedicated compatible string is required for the Exynos850 because
> > its firmware utilizes a different initialisation data base offset
> > (0x7000) compared to the existing GS101 implementation (0xa000).
> >
> > Additionally, the ACPM firmware implementation on Exynos850 does not co=
ver
> > all clock management operations (such as clock rate reads over ACPM IPC=
).
> > To allow the OSPM to resolve rates for these ACPM clock IDs or sometime=
s
> > called domains, add 'clocks' and 'clock-names' properties to reference =
the
> > underlying physical clocks.
> >
> > Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines=
 for
> > Exynos850 ACPM clock IDs, clock property constraints, and disallow GS10=
1-
> > specific PMIC child nodes for Exynos850.
> >
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>

By the way, we discussed earlier the reason for ACPM clocks:

    "PMIC might be controlled by different masters (cores), e.g. when
Linux is asleep and doesn't control PMIC via CPU, audio co-processor
can still be up playing audio, thus it needs to control PMIC via ACPM,
which in turn means some clocks have to be controlled over ACPM, so
that power supervisor (APM) can decide how to handle/arbiter those
requests from different IP-cores."

FWIW, I think it may be valuable to have this explanation added either
in the bindings doc or in the commit message. Otherwise one might
question why this whole ACPM thing is needed at all, as we already can
control those clocks via the regular clock driver. It's just a
thought, and can be done in a separate patch later.

> >  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++=
+++++++-
> >  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
> >  2 files changed, 76 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-ac=
pm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-=
ipc.yaml
> > index e68f9c3ca5e2..0eaa9c881f6f 100644
> > --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.=
yaml
> > @@ -22,7 +22,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: google,gs101-acpm-ipc
> > +    enum:
> > +      - google,gs101-acpm-ipc
> > +      - samsung,exynos850-acpm-ipc
> >
> >    "#clock-cells":
> >      const: 1
> > @@ -33,6 +35,20 @@ properties:
> >        appropriately with the clock scaling. The argument is the ID of =
the
> >        clock contained by the firmware messages.
> >
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 9
> > +    description:
> > +      List of the underlying clocks associated with each ACPM clock do=
main.
> > +      This property relates to ACPM firmware variants where not all cl=
ock
> > +      operations are implemented.
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 9
> > +    description:
> > +      Names of the ACPM clock domains corresponding to entries in 'clo=
cks'.
> > +
> >    mboxes:
> >      maxItems: 1
> >
> > @@ -77,6 +93,44 @@ required:
> >    - mboxes
> >    - shmem
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-acpm-ipc
> > +    then:
> > +      properties:
> > +        clocks: false
> > +        clock-names: false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: samsung,exynos850-acpm-ipc
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            enum:
> > +              - mif
> > +              - int
> > +              - cpucl0
> > +              - cpucl1
> > +              - g3d
> > +              - aud
> > +              - cam
> > +              - disp
> > +              - cp
> > +          uniqueItems: true
> > +        pmic: false
> > +        pmic-1: false
> > +        pmic-2: false
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +
> >  additionalProperties: false
> >
> >  examples:
> > diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/inclu=
de/dt-bindings/clock/samsung,exynos850-acpm.h
> > new file mode 100644
> > index 000000000000..87fc6ccc1d99
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright 2026 Linaro Ltd.
> > + *
> > + * Device Tree binding constants for Exynos850 ACPM clock controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> > +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> > +
> > +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> > +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> > +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> > +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> > +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> > +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> > +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> > +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> > +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> > +
> > +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
> >
> > --
> > 2.51.0
> >

