Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9272C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=; b=MUe4D8MZTRwwBnF/97gFk2AET3
	GWaqjp9/EYPifcNGiL2Ee2hgg5t7I765WKbl99ImHEvUDRu1zBQbUh4ZmQ0zG+OOwG86SMGaMsVXL
	nSv59WtC5BsIbmr+Ew/HmIzn/iJ/orwsnisIk6M7TkZtpbk6KCMRh3cXOezdTVwvXKIhqXK5znWCz
	1Wxp7OLvO5Duv7vjTN6M2G9qUFonXtG6NnjG2xjnq3RqXCfoAkj1DhIwmA24bJMSyoKmpNTOTbguX
	K8tK1niAY5N8oz9pDkwpd7eieRlAn8q7GqxHFWv68KF187lsizFehCFULokqL4o59RurHQaBNItSg
	A6pjwtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKJa-00000000is6-0QMd;
	Tue, 04 Feb 2025 14:54:14 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKH9-00000000iU2-2pC0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 14:51:45 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401ab97206so5566734e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680702; x=1739285502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=lUGiyv+6UYXevOZb8XSkbMQt0EYLG+ujCdA0edeld5GfLzmcHXqrCVCjTKEzI6wp6v
         Tcy31hoH0P+vwZdWwuLBh42vvl849M7d9e5xUu86n8mBYeTQpC9ODXlmZXa91fKm+c4I
         YwUhTbq8I4+2t1KKWTzLGLZkI4ZIZ2QQ2XVRNpwNHCwzAV654arGer2fOYDN/flAbsKI
         855N3a+rY3UlHDfUMqTk5/9yLOtAd9npKN7tkjQGQXWgZ/sTRSdzFEA9+db3Ziy245S/
         5G2QM6eIkiINR/bwSpGVRD3jGb3dTY5ti0oI9STPnfCKwajisbF9VjWu5TMxCOeZR6Jr
         uI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680702; x=1739285502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4zLUjXm4prg/eFxGt+fYgNMmII7NdmBc8I6cT7wueA=;
        b=iCmsELm85BSFS35zOOohNNNb66iaDa8KQn46Yn2tivMCFVwOiLlXVf9xF9DB13V0mf
         QHlDEwUxsoCgVtbBiwfyI8FdLH5pBOppDP5M6D3RN2lROIGtSa6+Ys3UPvRiPAH4qA2b
         yWQpB4PsJJwsGdT76OxuPTu6oFPTFZlMeox7DvCHlUbTAxTrqWxRAobBktWZTMIJx6Lc
         rQR6Fs/Dr0xQpHIjEgpUewj0BVum78xAKwspH+clJPpF61IwKqI2v1g/7oTc3zba7nwB
         vtaNwtErjeCiIrdWH9vo9oxTdYUHTmOsaGaD65OFj+xFSm/NKemqEwCEkxPJY3q1Chb5
         U1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV753so7lzqACFYUco66kapWvjxZaLMguTVGasBiSfh1oCwcvYCqudTPxwz+pKTZrdvEj6x7HN0KBpIgn5FYib@lists.infradead.org
X-Gm-Message-State: AOJu0Yz29xs9hRJMJj19EWOO4lYSV5DWXDx6rMAkQGqUIOOIxOk1jbpV
	+pM4bUkbBi8r/3U9rqogc+0zcps88E5tEQ1KxZ82CkRq4uRbsGFhmrkd6al1GFoWwXSrbWkOV4/
	QxIAJBnPTxNA5SmHO2tNGsW6la8IwTz81YqdF6g==
X-Gm-Gg: ASbGncs4KEckqo88xS6CmfCogZa/LbyCRmRgYKyoQjs1rjysQGyMVDMPZll3fu7KYEE
	Z7zXezfHPKIfPGLuZ5PplMhtxjX27MhZnmXU4UBtA+pNtvxnqZaV+Kz5WbY4bdXc7In0BeKZZWg
	==
X-Google-Smtp-Source: AGHT+IFWTKRZ04zHi9yazDmOAR+9nHPiC9DLDSwxIssSS1/sYlKHwCu1qRW2q05nuJpua/OP5aauc8pAw8aEMUpq3to=
X-Received: by 2002:a05:6512:239e:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-543e4c3c98cmr8359830e87.50.1738680701650; Tue, 04 Feb 2025
 06:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-2-apatel@ventanamicro.com> <87frktoo16.ffs@tglx>
In-Reply-To: <87frktoo16.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:21:30 +0530
X-Gm-Features: AWEUYZmlBEyFq7UPY0VRDrxJd2P92k6Zjc43uE6bTATPsZOqON-E7U5h2zWhfaQ
Message-ID: <CAK9=C2WOnB9g55r9bfWW4X-BjrST8WArDT8+wLwt7B=TDwYjdg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI
 updates for device
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065143_711831_38290B5C 
X-CRM114-Status: GOOD (  12.54  )
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

On Tue, Feb 4, 2025 at 6:38=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Feb 04 2025 at 13:23, Anup Patel wrote:
> > Device having non-atomic MSI update might see an intermediate
> > state when changing target IMSIC vector from one CPU to another.
> >
> > To handle such intermediate device state, update MSI address
> > and MSI data through separate MSI writes to the device.
>
> As pointed out in the other mail, this intermediate step does not fix
> the issue. It requires that the MSI message write happens on the
> original target CPU so that an interrupt which is raised on that
> intermediate vector can be observed.

Okay, I will drop this patch and instead have the last patch do
the intermediate step.

Regards,
Anup

