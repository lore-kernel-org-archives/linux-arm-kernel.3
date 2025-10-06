Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8636ACCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMuoAimQl5z1QVIEkiLJdaqZSbw3bEnf0VXzo5Y71N4=; b=iiFVU33A90dF7kv66NudsYkzsY
	CWjfdlL3tevsXqoWH0JbST6vVPoBT/snTlvjMREv/bsJwFVCGjuWjVLEfBT9M+NJUMElFNy/nfsaG
	QGvMSoQqW7qcrj/l94R3K5LpFF0aSjGwbIT8amH/VLVpJtsAWwN07YqdP7WLpCkLPqVb+bekQgua7
	4fpsv//RzeXhaMj5/Ix5cVMYMNklK3WDQDUiTAtaPchJbHhNRMBbf0eiIJTqF+RMbaEcKuiTxbzqL
	qQ0U0ae0cp7I7BRLmVQe5C8BK7wNSOR8BvNoYAjeMbgrIYpvdHmsE/pdZ0faUzhSU/W0ahY8sT5Vc
	Wa0Qo8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5eyS-0000000H2TK-2D81;
	Mon, 06 Oct 2025 06:45:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5eyQ-0000000H2Sj-20Fg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 06:45:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b457d93c155so801752666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 23:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759733129; x=1760337929; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NMuoAimQl5z1QVIEkiLJdaqZSbw3bEnf0VXzo5Y71N4=;
        b=vQMW/FnogjeYXInA2V/dRqyEkgBHEiwXO3vd2ywxHl6te13PpSMmsdW++WTpfgcBxE
         Y+j0WCMvXaELRhgd6IzV/6jF2MXHpa3NXO2XYL7VI3Wd7YJ2/1NWqAPJlc60OIUG8Yvo
         +ydVg4coGT1AEMrXxIMBSWedrbW2/MOwIcwWGrvmS39RRib/3At+D/hscOXmIJJGB8vZ
         qrcu0ZqGB0IGhOJGDAX76G8gKXol2dfLXBHT/kBs3KjX8g2GFrGKwSfRN8OUXELMbBKT
         Vv8GFzb3bBF5Gj2QFtL4CSq4yBp0IOvolwOlyDZER/fiKyblYfJCvVJKQeuowyzfjp2o
         s61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759733129; x=1760337929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMuoAimQl5z1QVIEkiLJdaqZSbw3bEnf0VXzo5Y71N4=;
        b=dDTPVg8hp81gNr46bldkiBKRc9nuQw33Wk7l8bAXD6mm63qNPHc7aKLi4OZ+aEb6bB
         Gql8vDLCgk+HSHUkGoNRjSDEYsx2zPRB1cPZWQBkEwPNefIrHdAS7YDuocSiMoIbgadQ
         MxjnAxw/3xrIGMGZ58oFMDFfihVCc+9XFqVu0VXqMdsSahPWi9NSfHWbyhoelzVq+Mu1
         kvlp1DJx+n6aIYsF4dpgyJCG3ZY6NShw6i3Ete7yoz+aWiBY2pQppnu2pg/WO9VAuIi0
         hvys+xH79EY1F6tCqVDtpNIxU4fm4MuhIrW9gAC34evMd+WlFQd/IEWPWQ2aLOAUZ45B
         y2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVpOh/rgaXDq3v7BbdVQV1JKBerMj2/KuLipru8S4dSCv3yXObIEyKskU7TxtrbQxMKakYD2wG6sQkpb/5EjQ1D@lists.infradead.org
X-Gm-Message-State: AOJu0YyRuDDymWCn7EVP3xAzzXAp/izx5HJ80gHSjgnNSIg/iVVsAm8j
	xwLHFA9V3RrHfK3xZGKeDbRuVfpjZssNlJ9ZOAiY0ymZgaEdk7ayvgHWih6YOr0OJ/Y=
X-Gm-Gg: ASbGncvocaQE/BgA5ULoH0ZhWP3sXS/5Sx408J6nmLHKiZSzdMQQrvoE/T7HIqRCCRQ
	k0CzoI4g85LriItrr6Xk2Vmraqhwa684GUaf0nbf+N6HmVlp3/vAXYLShJ+zHbPEtsbNWopOjQi
	WtRTGySH/izvbVX3pVR8dXxE/4I/1P+WwbmRagozzq6Qd4Tu9K2btyqiIGhQdOmqbBrIQ2fuiTU
	TiKDXvtOEoZ2GPYRy5kbseAl6YVmb/ve5svQCQ1iQtblzKlDx/0w3qMkFlhdVN5W9qHcmBDNMoV
	33aSr2beQrDvYHIP65DXnhxJNFFL5qlrR+3F4zHApW+fD6nagEXx0PTgX6N5W7RVzih8xj97sH+
	RXVHEx26+1f3FLC39sK2/5P+OBDMxSrQHA5dvmnwTbOkLXO5650s+CosAc2hAtCf8
X-Google-Smtp-Source: AGHT+IGqbaxYVflPhQwlvzE4KWt9YOkvCpxShS92JNaxOYhBBBWeZkGh8ms2wjKFHVFGM9v06iNJOg==
X-Received: by 2002:a17:907:608b:b0:b45:8370:eefd with SMTP id a640c23a62f3a-b49c146e6c8mr1381123966b.5.1759733128600;
        Sun, 05 Oct 2025 23:45:28 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9f50sm1068769666b.9.2025.10.05.23.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:45:28 -0700 (PDT)
Message-ID: <662c6a56055a295e3f9bd594b8751e405590abff.camel@linaro.org>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 07:45:27 +0100
In-Reply-To: <CAPLW+4=mVbXex9Sxm2oEq0j3RJ0_KtXRq2Ttt5cfQ_dxXTuhSA@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
	 <CAPLW+4=mVbXex9Sxm2oEq0j3RJ0_KtXRq2Ttt5cfQ_dxXTuhSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_234530_545741_FED5446C 
X-CRM114-Status: GOOD (  20.66  )
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

Hi Sam,

On Fri, 2025-10-03 at 12:22 -0500, Sam Protsenko wrote:
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>=20

[...]

> >=20
> > diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exy=
nos-pmu.c
> > index 22c50ca2aa79bf1945255ee6cc7443d7309b2573..9f416de03610b1727d8cc77=
616e5c87e2525cc69 100644
> > --- a/drivers/soc/samsung/exynos-pmu.c
> > +++ b/drivers/soc/samsung/exynos-pmu.c
> > @@ -635,6 +635,9 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pmu_regmcfg =3D regmap_smccfg;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pmu_regmcfg.max_register =3D resource_size(res) -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu_regmcfg.reg_stride;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pmu_regmcfg.wr_table =3D pmu_context->pmu_data->wr_table;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pmu_regmcfg.rd_table =3D pmu_context->pmu_data->rd_table;
> > +
>=20
> Seems like pmu_regmcfg declaration can be pulled under this "if" scope
> -- just a thought for future.

Yes, there is room for improvement. It might be even better if a platform c=
ould
provide its own regmap, rather than just a flag and the code here copying a=
nd
updating pmu_regmcfg.
I wanted to keep changes minimal at this stage, as there might be other con=
siderations.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Need physical address for SMC call */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 regmap =3D devm_regmap_init(dev, NULL,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)(uintptr_t)res->start,
> > diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exy=
nos-pmu.h
> > index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..113149ed32c88a09b075be8=
2050c26970e4c0620 100644
> > --- a/drivers/soc/samsung/exynos-pmu.h
> > +++ b/drivers/soc/samsung/exynos-pmu.h
> > @@ -27,6 +27,10 @@ struct exynos_pmu_data {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*pmu_init)(void);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*powerdown_conf)(enum =
sys_powerdown);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*powerdown_conf_extra)=
(enum sys_powerdown);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* for the pmu_secure case */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct regmap_access_table =
*rd_table;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct regmap_access_table =
*wr_table;
>=20
> Maybe it's worth to add #include <linux/regmap.h> in this header, or
> at least forward declaration struct regmap_access_table?

Thanks! I'll add the forward declaration, as not all users of this header n=
eed
regmap.

> Also, would be nice to have kernel-doc comment for struct
> exynos_pmu_data at this point, but it might be out of scope for this
> patch.
>=20
> Other than those minor nitpicks -- LGTM:

I'll add something for the next version.

Cheers,
Andre'

