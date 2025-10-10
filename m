Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F404CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ETTSmzMEMLXYvaO7iiXW2H9dZ8Hr5VPzXraeMoXOYA=; b=fJppcM7EIEJk5k8Ng7epoEl0AV
	ZdJvmWaJzkoyPAH80ziIZJZ0zNygq+/PAeyR+jp/1L7C+8OwN24qaSFv8EaW9RvB7/IbK42ZnKF0g
	4L9flOEacjqVztEBo47jZL5IhgUltPfx9gdObX/PjfflNXs+WkKzbmE7OlX8jE+nngoipzAhNM6T5
	GMpSk+/tSKE3D6yiql72H22hf0KZLJvl/QfUiwmVB31RDzlPivjgHW8JDnHkZbU4YIW+RJe3LR0kH
	Eb0o61Z4i9Cm5fE+6DA1tqPgFL4TrdZTVh7S/91O/TXXpkPqhmy5UApbpD/moEvGtqYSH8ChUs/jw
	ZLbos4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DvY-00000008ecL-3sB5;
	Fri, 10 Oct 2025 14:17:01 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DvW-00000008ebP-0iiP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:16:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso347213366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760105816; x=1760710616; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9ETTSmzMEMLXYvaO7iiXW2H9dZ8Hr5VPzXraeMoXOYA=;
        b=sbMjaDZPYo/mbMJ8mf2Ws3gyj8TpEqHxz5pFs6wWZDIXdmelYdeXxdEqfY0xXdZ4kb
         FZnxtdfY97sIsYo77Rgy5OtHxbsJNtA/0ctF3wPJS0C8ywIZPTI04jeKNp+SmV0z/+Vv
         mPUuTF90dsC+dlmhaYSD4wjAg+p0qSPGuRsJzlNL8vvUvLwSb29gIk99iaMVH6nOGy+u
         IQ210QUXsOoPAdHYeV+cEdJoj9//coNEhfGbqAWbEPnMPPTsbLu0iiDS+p9Tfdb1N4Xu
         dF7myuvxG1d5NIArqzGnxDGH96U2W1ypIJkSKJkzzaOFWoz1s93cKu/xJPoMhQsNMBwh
         e5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105816; x=1760710616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ETTSmzMEMLXYvaO7iiXW2H9dZ8Hr5VPzXraeMoXOYA=;
        b=nJX5vjrym9o0XEDgD2mKHgq1gQ+jG8fkDdjh/HHawxr8/48eLBUbmR/gdqOw61Qvs6
         pRJ2ewNMoKTqhXm3/lh3CeyM08IISc9ZmH/ZkwDyP/bHgChKti5xHR4S4+9teiVFV/dc
         rYYZEFjxGhl4+plZTCGq2xNEXLLNXAr4d65Nz4KECYJ1Qp54bWKh9SdEHhgfTcOqPoEw
         OKGew2X3sVJutugulOjX8qGN/91SO2QGPBeeYjsT8j8MdepNnVryQVJYpa83AJSzmYGd
         6n37fBU1gdUf3fsKNJ3ryVcnCGXblZl08pQxWB2WqJpiw0TM1JOkZD+LVnzLXjA7PdLz
         XKQA==
X-Forwarded-Encrypted: i=1; AJvYcCUfDWYyIl6u6pDBb3w/59e8zW4NSz8hXJYt1QxwGBJbbCkgrcybmlAshCDCPgRyKVc8o6T+q/f+otWnjPj1b/Vz@lists.infradead.org
X-Gm-Message-State: AOJu0YxLVwPa9SCbMIAfx90hTUGMPJwDPeBRgJvz47NoLrbAPO0xcONT
	CMjIlA8Qnuf204DHG4KislGfLvO0fr/mGrQkYOklL1r1SoNlv/yIhwG4RSWidzVsjcs=
X-Gm-Gg: ASbGncsXVBGT/h2OMrMNkZ1yF9obq+4OUigHZRkZPcIaciZ0GG3sGRZ7SjCpC7koRUh
	cNpvXNk3emJjy/MpP/7Tg7+TLlYhgUHKquMkbWnQLVl7im56GN4+8pFBMDl70zHvxrAKZ7jwnzg
	h2P4AwBIHa24rTLzMGWIkR7SHTNyiEdQbr1SG+QsjkNiztSzDqdn7NM9DmVvZLFbuXijP4CAXL3
	4J708QmalmOJwmfgYzzH3ejHjFMLqwfgmwKeZzwOC+AG5eK7kJFamd7DWbJbI+CyvBcc4/4v+zz
	qq1vrQ8PtI0svZAvt1WehFO45v1Dwy9zHIodvTAXlXzWCmkY3gA3hLfrC2HGp3S5FW6JDIXoMOI
	kzqHrrE1Rqfse+h87p8OQlNfLEiOLapB/rDXYfE1w4pkUmyWp
X-Google-Smtp-Source: AGHT+IHEAsH6ZcFu+OEyw3ew5Qe/YQEPpYcPrHdEy87KxK9nyj76/ZCLGpnuNV/60Jx9Jzca5xe2iQ==
X-Received: by 2002:a17:906:4795:b0:b41:1657:2b1d with SMTP id a640c23a62f3a-b50abfcc8dbmr1274289566b.50.1760105815884;
        Fri, 10 Oct 2025 07:16:55 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d66cc4b8sm247352066b.30.2025.10.10.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:16:55 -0700 (PDT)
Message-ID: <ccd3c985a202f3fdbead41fcb3f0ba45950f74f6.camel@linaro.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Ulf Hansson	
 <ulf.hansson@linaro.org>, kernel-team@android.com, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Conor
 Dooley	 <conor+dt@kernel.org>, linux-pm@vger.kernel.org, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Date: Fri, 10 Oct 2025 15:16:54 +0100
In-Reply-To: <176009895995.7689.883182155048414797.robh@kernel.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
	 <20251009-gs101-pd-v2-2-3f4a6db2af39@linaro.org>
	 <176009895995.7689.883182155048414797.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_071658_228829_13BD47DE 
X-CRM114-Status: GOOD (  12.88  )
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

On Fri, 2025-10-10 at 07:23 -0500, Rob Herring (Arm) wrote:
>=20
> On Thu, 09 Oct 2025 16:25:04 +0100, Andr=C3=A9 Draszik wrote:
> > The gs101-pmu binding is going to acquire various additional (pattern)
> > properties that don't apply to other PMUs supported by this binding.
> >=20
> > To enable this, move google,gs101-pmu into a separate binding.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/soc/google/google,gs101-pmu.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 67 ++++++++++++++++++++++
> > =C2=A0.../bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 -------
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A03 files changed, 68 insertions(+), 20 deletions(-)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/google/google,gs101-pmu.yaml: $id: Cannot determine base
> path from $id, relative path/filename doesn't match actual path or filena=
me
> =C2=A0	 $id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu.y=
aml
> =C2=A0	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetr=
ee/bindings/soc/google/google,gs101-pmu.yaml

I moved the file ultimately but had restricted to samsung using DT_SCHEMA_F=
ILES=3D
during my binding check run :-(

A.

