Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F4CCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAteg+F5oQJPVS5wX8AGAiIq+FclqksfL+/bVRY3pIY=; b=I0/hTctsW1BnN5TymLevNcVIKT
	VHipaYWfcPJxMBNzs2or1vu2bx60AE6Vu3zPMrRqS3yDQRK24mUpNVu7V/9UwhgCYoyV6Fb+cPppY
	k+y/LElqTgbOetFEQzLLwS3kl0coOkYVDljzsBwbvblqqpeOhMIMFpQd1km1sFxCH5pJFOJoBaS9v
	5U8KKRjn9Mtvn/HGCXStvQTlXc4ulNL6yZM7u6WOYoNd165TTUf9qTzLdB2MGuJRbuqE5+eaN6dun
	Xozuy6tYWmOYbQM8gdKTSHZ1lEDatrP+uB+QSUglnRLve0KZYZBp8FtkB/kWij9lhtgL3C9My9ICq
	nr6RCznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTlL-0000000EjFE-2EOa;
	Mon, 27 Oct 2025 20:24:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTlJ-0000000EjEO-01Lp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:24:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42557c5cedcso3448122f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761596655; x=1762201455; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sAteg+F5oQJPVS5wX8AGAiIq+FclqksfL+/bVRY3pIY=;
        b=XIfLYr9twZU1kqgcK25IZcD9IMBwggg9uwPUs6aUtWoUteytR1BkRp5l1tuVkmoqyo
         ZBTVurY1OqF88GXpkKQJ+HgN7sNgvB+ktwisPiB2o+6O5joXta9TyI97wftGg2MVagDF
         6wRH/PuScH0bGf21ynRBYYC23ERGypLFamOPp1sp2d4rj4mUCk8V7Udz4weBqNbIJ4FM
         jKLr4UtJwsy79SA5n8xIibIKaRhyFoVYkxJTdQCe8FUVHvgMPv8gUXfffC0FbZWbIufh
         oxIHY1us+SdGawjTMeFHAkIaWy3pY47LyBSpo9iIEK8WceIOfKYTyZ2XSdjw8AVazGAO
         /8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761596655; x=1762201455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAteg+F5oQJPVS5wX8AGAiIq+FclqksfL+/bVRY3pIY=;
        b=Q+eKOG2rkkGJbk97KLN4EtMStxb+c4G/qWF9wNx/nT5lDnuD5oPcptTjayJYzHxDU1
         gcyR2cuAcLxQ08Pj6jSe3M17dUiGds+R06qhXROx7TXT1PwqNmjeXA+dDJtpIR4dpPx0
         8boYAooQ/x+43COVpp9uG3V/80t2omRMWLZFCTUDvDF/+AT4Uo5xSQBRGd3RaHonyPGE
         aJxXtAkD4qRx8rrM7QXcpWifpnuvA2qXonWluXhco9NsYNz00HWgx3RLrJDjItMLZCRj
         jjC3UiBMxLQOBnvBOeuDIUSsiUGWlUIgeu816PjSH99mYVK4k6CoEQixRjXqZfHP5Zif
         VG3A==
X-Forwarded-Encrypted: i=1; AJvYcCUfMW9x6DgCMV9dq5cqidkEqQ4KyH4ElFg7PuDMUTmWbETJqa+WqF3JHoj/YDc6CVAd4wzR5uTSDPsAo3MU4LqG@lists.infradead.org
X-Gm-Message-State: AOJu0YzttKMN7I70SfllzPbA0oNXQo8m4VHDeUvxi3y38o9XmoVDHIYy
	YOQxdAVUvSBy0GdixOrtX9HREdpy2UKMqdNnrTtUMpVClXpf46yQn5L2
X-Gm-Gg: ASbGnctg6BBQR9aQPIUJFT7eVqoyA6z3BW8TcHgC1kTbhikrnjXbK2eD5TR9apnm/eP
	LsDdprJfeuh4QvuE+eMChBMPXxm+0r/PQZkELvQGqX+wM2xrH0A/QrGFACEbWYSNSy31r8FmRMP
	Dsok3gZ9D1wY1bMvYMtG5LznBQd4OuNj747Skzmtgg7FcDbcDTjozPkABJ+osjXoZQzwX115MKT
	wkBv5g3af4tHzUqBbpU+6JOOfMwBQpI/IPUvoHyEAEgBWmMBxicvM5dIpbJhAHrsGnJs3EiDArH
	ieLYq3jnlhxFgXR3loKJhuYt2nKhCP/lE0fYPgXQtsALirs26SpvG5CYmz7kS2l2r7po3vK4ZNX
	vN/+TAY+lAiZb04BQ7nhq2ax6GyHOVqCid9cJNQwcIc2okqu4Q+EtiIKv2IhWKW1antRYmPv6Nh
	SSy24JSBi1K4EiTBJW/FekDJ9UoTyRNwuxPA==
X-Google-Smtp-Source: AGHT+IFjSyEOJ8OO9p5enPOa4OY5LYK/YHPQz+HhFO/SNaTbXxhM08eDKEWgk5JuJu6a3RlEJUVVfQ==
X-Received: by 2002:a5d:64e4:0:b0:429:8b44:57b7 with SMTP id ffacd0b85a97d-429a7e844eemr974038f8f.51.1761596654557;
        Mon, 27 Oct 2025 13:24:14 -0700 (PDT)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm173897105e9.1.2025.10.27.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:24:13 -0700 (PDT)
Message-ID: <91e8f4346a677a2ea46a210d7422adb99e70b3be.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] PCI: j721e: Add support for optional regulator
 supplies
From: Vitor Soares <ivitro@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
	 <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
	=?UTF-8?Q?Wilczy=C5=84ski?=
	 <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	 <bhelgaas@google.com>, Vitor Soares <vitor.soares@toradex.com>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Oct 2025 20:24:12 +0000
In-Reply-To: <p3l2p2raecqqkpdjswiddkthpxzvhm3rl4cw56y2epgcxfiwbb@gsieef3yqvpk>
References: <20251014112553.398845-1-ivitro@gmail.com>
	 <20251014112553.398845-3-ivitro@gmail.com>
	 <p3l2p2raecqqkpdjswiddkthpxzvhm3rl4cw56y2epgcxfiwbb@gsieef3yqvpk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_132417_081585_1E699234 
X-CRM114-Status: GOOD (  26.04  )
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

Hello Mani,

Thank you for the feedback.

On Tue, 2025-10-21 at 07:36 +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 14, 2025 at 12:25:49PM +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> >=20
> > Some boards require external regulators to power PCIe endpoints.
> > Add support for optional 1.5V, 3.3V, and 12V supplies, which may be
> > defined in the device tree as vpcie1v5-supply, vpcie3v3-supply, and
> > vpcie12v-supply.
> >=20
> > Use devm_regulator_get_enable_optional() to obtain and enable each
> > supply, so it will be automatically disabled when the driver is
> > removed.
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > ---
> > =C2=A0drivers/pci/controller/cadence/pci-j721e.c | 13 +++++++++++++
> > =C2=A01 file changed, 13 insertions(+)
> >=20
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c
> > b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..f29ce2aef04e 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > @@ -21,6 +21,7 @@
> > =C2=A0#include <linux/platform_device.h>
> > =C2=A0#include <linux/pm_runtime.h>
> > =C2=A0#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > =C2=A0
> > =C2=A0#include "../../pci.h"
> > =C2=A0#include "pcie-cadence.h"
> > @@ -467,6 +468,10 @@ static const struct of_device_id of_j721e_pcie_mat=
ch[]
> > =3D {
> > =C2=A0};
> > =C2=A0MODULE_DEVICE_TABLE(of, of_j721e_pcie_match);
> > =C2=A0
> > +static const char * const j721e_pcie_supplies[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"vpcie12v", "vpcie3v3", "vpc=
ie1v5"
> > +};
>=20
> Please don't hardcode the supplies in driver. The DT binding should make =
sure
> the relevant supplies are passed (including the optional ones). Just use
> of_regulator_bulk_get_all() to acquire all the passed supplies.
>=20
> - Mani
>=20

I checked the bulk regulator APIs as suggested and of_regulator_bulk_get_al=
l()
does handle optional supplies correctly, however it is not a managed functi=
on
and doesn't enable the  regulators automatically.

To use of_regulator_bulk_get_all(), I would need to:
- Manually enable regulators with regulator_bulk_enable()
- Add cleanup/disable logic in remove path
- Handle error cleanup path manually

This would actually make the code more complex and error-prone compared to =
the
current approach using devm_regulator_get_enable_optional(), which provides
managed cleanup and automatic enable for optional supplies.

I also checked devm_regulator_bulk_get_enable(), it treats all supplies as
required and needs the supplies name as well.

Unless there is a devm_regulator_bulk_get_optional_enable() API I'm not awa=
re
of, the current per-supply approach is the standard kernel pattern for this=
 use
case. Would you still prefer the bulk approach despite these limitations?

Best regards,
Vitor Soares




