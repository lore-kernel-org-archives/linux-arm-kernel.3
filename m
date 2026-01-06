Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E8CDC188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h38P6grNQ0TKwDHGWJBzjPGM53XcBW+OJ687HIujUPE=; b=Rra1GSNoE7rEUu7Uarirmm0jAI
	pYh7FrL7tiEfwyhJClCl2Udhfz2GbHccIqdjLeODwPSZgGujDQ6DaXDDz+p+l4CCP8y6c0z7XRTqd
	5EoF8xxBx9yjDSl2YrBF21rjZ9jHgp7iUNKtjVFo37iMz3OWBKDr62sTpGPkGo1GJF65mfL9VGkzH
	fJgl47bVpZ9u3MYj/PgEzZ4LwM9/Bp1d3o5CGQaNwABK1VHHe+TKOuyyyA4/xTAYt41rUHTRZZTCL
	4vCDt30ieDCQMad4P09OJ+GAWh648Ea/vpD1qcU4NFwf2VbnmK+njl2CyQ2lLOIjUre1s2zAL3sV5
	qcIoR4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6EA-0000000D0En-2shB;
	Tue, 06 Jan 2026 12:31:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6E6-0000000D0EZ-2jCq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBABC6013D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 12:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6B2C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702713;
	bh=hkToN4ECsG3MudPOwQYTR0U4TyBoX8kGNtWHmfV4Vbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mOujkwb6bMD8rzDaSHSkYx8OjwEInrJxUuBRj1PQtwd2iVuOFj95TFLz/HIe5m6b4
	 JFCtSlFDE6EI2w0ZVIbDJ1otvSnulYNoVUf+NRkWGcoFoX8nn36gYVzlRQa8qiUtsT
	 chJE0COSzraPDn3y+bL4oqPwwnh3W6TFe/TDY2TKMIY3o/cLyofSgpW0Z2kG+Yvs67
	 l79HG1GTvtrUkxCOt92LR1WXhnZ+Rr5BYxkzarDZ4hC7cnVCXK6RYFnuVp0u5Z1LAV
	 mgC7wC2iudZM316pRGDMnehBsd9/ci4mnjW8XIBPXQxyqrLAMvAuLq6sHRsEfIo3O7
	 qcjJakQbt4f3A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a33b06028so7616921fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 04:31:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWImV2sJ0uchuew1hIZLdIOrWZCSlISjwxfbt7bD1vlItGqsv2LPiT4eT9mwf5RSsUG8LrFZo6Vd4iZXJz/Ig6D@lists.infradead.org
X-Gm-Message-State: AOJu0YzWGrLBW5pPovgLuVZq4QGglR/Zq2M7ZyqHDj/NqxZ/f6gfmtPt
	MtDKoQjNcUKl9g1OCeda4BtJhESEhWanoXy8871EYJ/C+qGWUlIBx3Mzsl5x4Y3EZJEJOjd/dKS
	o00l9ujGKwp6vEpG09pcLjUQH9RDXnhCHkzeJq5fEuQ==
X-Google-Smtp-Source: AGHT+IGAgUkYHb6c2adQeG89MGXDusPgXEG8AgpWKhx2YWzaObHsgiKa1FY1iLZX9m/J51WaZQMV+gh52Wy4JNwMhjo=
X-Received: by 2002:a2e:a555:0:b0:37f:cb34:2144 with SMTP id
 38308e7fff4ca-382eaa6025cmr8054501fa.2.1767702712063; Tue, 06 Jan 2026
 04:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com> <06619e53-7260-7bd2-1954-dd10b92dc354@oss.qualcomm.com>
In-Reply-To: <06619e53-7260-7bd2-1954-dd10b92dc354@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 13:31:39 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfaS=zAXj_YMOyV0DJBULbtysF5VU_mx3BFmhPWSYTnHw@mail.gmail.com>
X-Gm-Features: AQt7F2pN4gC2sUo7-pfcb6UAcqBXjb_7kw1NmqpeCuPqNOQAqpYTTP5tEx92_QA
Message-ID: <CAMRc=MfaS=zAXj_YMOyV0DJBULbtysF5VU_mx3BFmhPWSYTnHw@mail.gmail.com>
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based allocations
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jan 5, 2026 at 6:54=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >>
> >>         INIT_LIST_HEAD(&reboot->head);
> >> @@ -82,19 +87,17 @@ int reboot_mode_register(struct reboot_mode_driver=
 *reboot)
> >>                 if (strncmp(prop->name, PREFIX, len))
> >>                         continue;
> >>
> >> -               info =3D devm_kzalloc(reboot->dev, sizeof(*info), GFP_=
KERNEL);
> >> +               if (of_property_read_u32(np, prop->name, &magic)) {
> >
> > Please use device_property_read_u32() if you have access to a device st=
ruct.
>
> Ack. Can it go in same patch with the fixes tag?
>

I would be fine with it but it's more a question to Sebastian as the mainta=
iner.

Bart

