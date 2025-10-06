Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 07:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuSzaxHt2WjkCZsaacpzvkRWkgXa3kCzT0kK4JkGdSQ=; b=oRK4rTy7ZPWQN+DpJBSd8c/WM6
	QlitQSk3gH7MbGIgP+l9jyYFQeO7+4U1s3COn47VUxapTueYOjpstz2+zDbBHa7PiKYPvZifS3Nk3
	nDM0FVoOz+5IT5toGK0T54eIq4jpySFSgbSXKsrIJoFIHYl3/CanKhlxIT4KI/HAkcbwlOIxhC6WY
	gASihMFfcLvLy8bML29Vt8+0SZ/n1EXLtosV1Y4M9EbrhqfYagIL786SLSll/1Uy6C8bWKigrRZ+R
	kaYuqzXkqlHnXM3L+7cS6ztW0uDZEm/Qj2insfpGZYfCVoCSBjQWzjqR2U1mKeLS+rSnIZhBbe3A3
	LLH15JqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5fIn-0000000H3xa-12lp;
	Mon, 06 Oct 2025 07:06:33 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5fIk-0000000H3xB-20r6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 07:06:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so6540766a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 00:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759734388; x=1760339188; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HuSzaxHt2WjkCZsaacpzvkRWkgXa3kCzT0kK4JkGdSQ=;
        b=CQ48MKVODypo0ZBLXVLivIV0HI7vmA/ia3ndBUmuUy0ONJwVusF7yDnbq3RCRfaCeH
         IJRv2t0hQNQIwR1ogEOItkI7iNp/EMaMQzjsIWEliPNWqH7SqWjw+77Tflpqdr3XusRz
         zmrdIjNyf3UJWGGH6XODHhhKMvL2hWVx+b1xjOHImTriCkyzw1zEjVXs28WmGYx8b8/U
         9oYO5WFXTBpTrYvdJNe7w3Ar0Zej8OiAtqlVdMqLiO+DwZd/u4CYiEUBB9teenhDexn+
         JPJGiWae/uobGrU1h2mFPJjTEtNPkaSBqe1HqvVR/b4pVGmbjGKRMLzohpE1lhkSoOrv
         MHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759734388; x=1760339188;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuSzaxHt2WjkCZsaacpzvkRWkgXa3kCzT0kK4JkGdSQ=;
        b=ZHw65zN+Ob53JrQBBthMddzz/wf5XxjfhkXllR/bQ7a5YN1uzfAmTRWDGfRM9/24Vh
         CX+AWvYpEGdaZ+WmP/O8M7Tkm3GZAxDdh5BJevHPrSMgKNKUR7LJXbvMHxOaLZlrNM0H
         1CP9GDPjhfP1y6ICKF76FBFLOxQ3Cf6B16Zdmhqi78WBfnbDwh2qw9KxiQY+6tLSAlEi
         KeZXaAv3ZZDf+Sl7EDWmggdRReVfYNw2qg6Hji6FllJsmt0l/cR+HYQKYu6kqocAw7aD
         uIE94IWLuWHWksc/CNOfDK1wp7Pkqd1uQnsHaYbCxvpk7cqBSnx5PaMXuHB2LoAelkvD
         VKfA==
X-Forwarded-Encrypted: i=1; AJvYcCV1H0BhfzWQVi8xxvh1svchP1utTNhHe+wLa9aVFEEEtPSMOgsCC7DoRMKSyHYhaoWylE3mCpgBcw+exMpizLfe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd8x2Wbp7wIaQZD8MwUxdb4fZGh27gGqk0yzfqfjJYo78vOB6f
	SgDZjFIIfEnHLGkOQIF/CTxngzniWHxsocrg0Z2+h4xBkC2VXTYI2WA7kYpBBYB6RLk=
X-Gm-Gg: ASbGncseXgLC4YWx4wZR5vsnA2bD6JLyra6FuKHFX4hGOsrgxkW5HKSKZek1iqN3VIt
	9SUj55gwnD6LvwNPpPIwCXnLQFw4ZBbDboKRUGv3XkqkpTS/60cjMFBp9TEu5deYnhn7SxUETPA
	1go8bOeRKbScX7XSjYuxwH4Mrh4/wSDf+SC9dWqmREMtVkLkaQMAuJOxt1FI2Zimc4j6l72u4PC
	M0y7v8lPrBk3NOeW2cam0x3OBHuQtBviN4pKopgdG32s7wxSsNjaRfztR1XSHDnltBtUqUwAXp8
	y3JFUMnrifOFuBXqYnxCyk0by2u6J6Oe2ovGH+89yCcr/tcVxD2/rCjXvNm9zr3FGWoC9S8CyZR
	g0pevqp7WDwNZ38KBiaOCzV2uCDF0+oyivgMG8HSNuLD5rzZy1jGHYrjK4Rj1SCoO
X-Google-Smtp-Source: AGHT+IEwbtOWhrJkM+5+XAaKyLXT4+RAoqahDvyQ66RfyOQrQ4PJvtBnJFcYl5rm+NOF2Nq60WjVQA==
X-Received: by 2002:a05:6402:1e90:b0:636:67c8:59d8 with SMTP id 4fb4d7f45d1cf-63934900291mr11938562a12.13.1759734388488;
        Mon, 06 Oct 2025 00:06:28 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000besm9623517a12.23.2025.10.06.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:06:28 -0700 (PDT)
Message-ID: <2c36d66dc3eaf8f0f9778dd6a1d45806e7d9bcdd.camel@linaro.org>
Subject: Re: [PATCH 3/3] soc: samsung: gs101-pmu: implement access tables
 for read and write
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 08:06:26 +0100
In-Reply-To: <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <20251002-gs101-pmu-regmap-tables-v1-3-1f96f0920eb3@linaro.org>
	 <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_000630_550885_21472B68 
X-CRM114-Status: GOOD (  24.86  )
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

On Fri, 2025-10-03 at 13:24 -0500, Sam Protsenko wrote:
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
> >=20
> > Accessing non-existent PMU registers causes an SError, halting the
> > system.
> >=20
> > Implement read and write access tables for the gs101-PMU to specify
> > which registers are read- and/or writable to avoid that SError.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> I think having "Fixes:" tag would be justified here?

I decided against, because IMHO it's not a bug fix as such, it's a new feat=
ure.
>=20

> > ---
> > Note there are checkpatch warnings 'Macros with complex values should
> > be enclosed in parentheses' and 'Macro argument reuse' for macros like
> > CLUSTER_CPU_RANGE(). Since they are used in an initialiser, the only
> > way to get rid of the warnings is to avoid the macros and duplicate all
> > the related register ranges I believe, which I'd rather not due to the
> > sheer amount of similar blocks.
> > ---
> > =C2=A0drivers/soc/samsung/gs101-pmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 306 ++++++++++++++++++++++++-
> > =C2=A0include/linux/soc/samsung/exynos-regs-pmu.h | 343 +++++++++++++++=
++++++++++++-
> > =C2=A02 files changed, 640 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs10=
1-pmu.c
> > index b5a535822ec830b751e36a33121e2a03ef2ebcb2..5be1cbfa58c95e466bbdf95=
4923f324f74460783 100644
> > --- a/drivers/soc/samsung/gs101-pmu.c
> > +++ b/drivers/soc/samsung/gs101-pmu.c
> > @@ -8,6 +8,7 @@
> > =C2=A0#include <linux/array_size.h>
> > =C2=A0#include <linux/soc/samsung/exynos-pmu.h>
> > =C2=A0#include <linux/soc/samsung/exynos-regs-pmu.h>
> > +#include <linux/regmap.h>
>=20
> If you decide to add this line to exynos-pmu.h (as I commented in the
> preceding patch), it can then be omitted here.
>=20
> >=20
> > =C2=A0#include "exynos-pmu.h"
> >=20
> > @@ -19,9 +20,312 @@
> > =C2=A0#define TENSOR_PMUREG_WRITE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
> > =C2=A0#define TENSOR_PMUREG_RMW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2

[...]

> > +#define CLUSTER_NONCPU_RANGE(cl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_IN(cl),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_IN(cl)),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_INT_IN(cl),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_INT_IN(cl)),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_DUALRAIL_CTRL_IN(cl),=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLUSTER_NONCPU_RANGE(0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLUSTER_NONCPU_RANGE(1),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLUSTER_NONCPU_RANGE(2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_reg_range(GS101_CLUSTER_NO=
NCPU_INT_EN(2),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS101=
_CLUSTER_NONCPU_INT_DIR(2)),
> > +#undef CLUSTER_NONCPU_RANGE
> > +
> > +#define SUBBLK_RANGE(blk)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>=20
> Reusing the same names for different macros seems a bit confusing. But
> that might be just a matter of my taste, so no strong opinion.

And I OTOH explicitly picked the same name because it's the same block, jus=
t
for r/o instead of r/w :-)

[...]

>=20
> That's quite an extensive list of registers! Does this PMU driver
> really have to cover all of those?

That's what all Samsung PMU drivers do, it's the PMU region after all.=C2=
=A0Also,
in the gs101 case, only the PMU driver knows how to do the secure access:=
=C2=A0Various
other drivers have references to this PMU regmap, e.g. phy drivers for isol=
ation
(USB & UFS) and upcoming PD driver will do too. We don't want to reimplemen=
t
secure access in all of those.

Cheers,
Andre'

