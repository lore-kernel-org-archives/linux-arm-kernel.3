Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F192CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXmc7QpSTt9ZosNT5x1nSeoE8ULcpihYGG51Sy2vopY=; b=YNwU98NcJ3/knBD916MzMkCp4G
	0nuiJZdXpBrbwHaERlqxocYkTzxoevr145e/vdlScJM/4HFCoKtVdKdjDCRYEs/Mlb4hDxcMf1opD
	mRvkDcObRtcjhW02Au5ho3z3oQ4+9E1WGXk4/hITPK8YX681xl/9pNDS/IeMUd5FdhIjKrocvEErL
	+Zw+sexrqR3k45r58e53UV7Fv3SLT8ZqED6bLbZOVasiEJ+7NkW8Z0WgsOUhr2cIpsb5d/VksBf+F
	FCSOjvzlY+gMruWxqpigNYpXTVtxv1fsj80FQ9vmFDk9jm2CShdz5Xz+jSm4SexERsn8yV54powhX
	u40FGt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5f5S-0000000H37t-3AB1;
	Mon, 06 Oct 2025 06:52:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5f5P-0000000H37S-350Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 06:52:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b456d2dc440so722956666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 23:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759733562; x=1760338362; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HXmc7QpSTt9ZosNT5x1nSeoE8ULcpihYGG51Sy2vopY=;
        b=xAY/bneoAP8WEBDm0U43HMzrHkdFNlXdDtG77MYhp5AC1O4OP6ED6VSUqto7Ye1Qyo
         SkshlR6csValYw+gQ4gV6uN6AYSuJ1mxK5vjLdJFDePAtq4/6lbrNogGsh6WJRSiPeTV
         lP6WE6FnUtspwP/boU7NebGKvc2aWpg+5FLlmZ3ATcFtdPz8+Fohn9U4T8f89YrQHtNH
         aUfXaAaImuTtJnrR+ACKvmMtQU/wpGiYJ4YS70821QqEtxh9JPkyZ2CJ4dvUUkNbJjk4
         k4t93IOXSYhItG0apqJ2UUVpskHzPmUUxbA0O3GemVMOvYgaAl7iWuYMZHHyggM1e7w/
         S0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759733562; x=1760338362;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HXmc7QpSTt9ZosNT5x1nSeoE8ULcpihYGG51Sy2vopY=;
        b=oitEZFRKQhImdDHlAl7fpzuLM73ZqPX89OhIupV20CuL7Yf7LO4ch+6KsaOiFwZKJY
         OGra9alqZN4dT9qzS1gJpzo81bwp5at0eE/99Eg8VLf4XZ7g8dSMonwjVozdErntuGvm
         rzta5Jb3CReU/LxHywubRztuAmN/kskmZ2wp0mfnxqjCX2XPoWKPeSSiwcYDOk4LpswJ
         yBxXqmYRAuhdFzFVCZFNJY/4HkCTjkq39kWb2F6/4zQcaYxeSfjj9jkgRlwkpID4F125
         xZ5Qvs0ooA7VLT7MMsxp7F1bFEGZP48I8AkdjOcZJQBWxUMCll/s5+yxsdffl46Hl64H
         cevQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoXxZIpJJ6xBKwK3W2iD8SnaXEQSYqrPZTybbBjZrIBik3XNF35w4B1VOEThQLtduF14/ITzG3Hsog9sPJV5jo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0j/qgbhOgMo6WHf034bXFWG2Us/a+gVgN0xQzkxj5abYPrzsl
	d9N3Qg+GsHLdVXM9U+j1EOkOYniWrjrWqNnceOYqf2+1ETXOa/QqQqlQ4EHzmdCx8Qg=
X-Gm-Gg: ASbGncuZUFJAkM53WNWZCad8oI2ziScRt+PGsO6TnRCPhtp3pvoBvywMZUx7Ey1xrLO
	zQ5HJ08W2NeVoGKwVOGyIwsbdq2JHuqD5qJb4KYzfxmI3Aaxfi+bRuqs7Y3P5m64kyrgFykQWrD
	02b04MbTfqoG1htJ4Qr5e+7j3ZJDLMI0X6VLpOy456mdl8pfpV2yookko6RjadxN8QbbqbWDStQ
	1sMdGAAE0wKMDFy+Wq6dJypeTlMDXl+5+4QJtfQfq8+V4f/OHSnt7Fa+sv+3ghD9HlUquRzOEGq
	sONt59gCaloL3eYZJOE7fiCL4tU1ExMxMMhGkXWA2nCIZMSBsaFR6squzxE7eBJ8sB3zzNh7suQ
	k/9htK6lVV30+L1tk2apGZs7UwWzt6gkxebbDdJ2velerkqr0xwUH3JL34dxYE3bd
X-Google-Smtp-Source: AGHT+IFH+Nm6t/KLP6g5tq5oQKi62aAAd8k2tFyYYm8tKkws1sxOeiOGOYBNadAisWD6RX0oCu0zaA==
X-Received: by 2002:a17:907:3f0a:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b49c214c03fmr1480542166b.28.1759733561787;
        Sun, 05 Oct 2025 23:52:41 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm1058949066b.84.2025.10.05.23.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:52:41 -0700 (PDT)
Message-ID: <949da0fec08f09bd6b70b14f3361f4a4584b42c3.camel@linaro.org>
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: move some gs101 related
 code into new file
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Oct 2025 07:52:40 +0100
In-Reply-To: <CAPLW+4=+efttfgj9gMSGpv2sjhJQ7whtoCuitK+Ku4U7hzE+1A@mail.gmail.com>
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org>
	 <20251002-gs101-pmu-regmap-tables-v1-2-1f96f0920eb3@linaro.org>
	 <CAPLW+4=+efttfgj9gMSGpv2sjhJQ7whtoCuitK+Ku4U7hzE+1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_235243_805201_9018D9BE 
X-CRM114-Status: GOOD (  20.61  )
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

On Fri, 2025-10-03 at 12:55 -0500, Sam Protsenko wrote:
> On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
> >=20
> > To avoid cluttering common code, move most of the gs101 code into a new
> > file, gs101-pmu.c
> >=20
> > More code is going to be added for gs101 - having it all in one file
> > helps keeping the common code (file) more readable.
> >=20
>=20
> Maybe add "no functional change" note for refactoring/cleanup patches lik=
e this.

Sure


[...]

> >=20
> > diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exy=
nos-pmu.h
> > index 113149ed32c88a09b075be82050c26970e4c0620..fe11adc4f6ac8fc8bce228d=
5852deaff7c438221 100644
> > --- a/drivers/soc/samsung/exynos-pmu.h
> > +++ b/drivers/soc/samsung/exynos-pmu.h
> > @@ -44,7 +44,14 @@ extern const struct exynos_pmu_data exynos4412_pmu_d=
ata;
> > =C2=A0extern const struct exynos_pmu_data exynos5250_pmu_data;
> > =C2=A0extern const struct exynos_pmu_data exynos5420_pmu_data;
> > =C2=A0#endif
> > +extern const struct exynos_pmu_data gs101_pmu_data;
> >=20
> > =C2=A0extern void pmu_raw_writel(u32 val, u32 offset);
> > =C2=A0extern u32 pmu_raw_readl(u32 offset);
> > +
> > +int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int=
 val);
> > +int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int =
*val);
> > +int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int m=
ask,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned int val);
>=20
> Nitpick: just noticed the inconsistency between context/ctx wording
> usage in above function arguments.

Interesting... I'll fix it as part of the move.

>=20
> > +
> > =C2=A0#endif /* __EXYNOS_PMU_H */
> > diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs10=
1-pmu.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b5a535822ec830b751e36a3=
3121e2a03ef2ebcb2
> > --- /dev/null
> > +++ b/drivers/soc/samsung/gs101-pmu.c
> > @@ -0,0 +1,141 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright 2025 Linaro Ltd.
> > +//
> > +// GS101 PMU (Power Management Unit) support
> > +
>=20
> AFAIR headers like these should be made using multi-line comments (not
> talking about SPDX part). Or is it the latest fashion trends in
> kernel?

Depends on subsystem, but multi-line for most. Here I went with existing st=
yle for
the PMU-related files, though.

Cheers,
Andre'

