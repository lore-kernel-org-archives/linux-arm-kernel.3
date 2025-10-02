Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DBACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWdvP8Y683s2RnoHRv1ZB/z8sm8WaE7z/Z8PLqDiBoU=; b=hqsmHer8Q7nrE9hrp2V35MhgOW
	2NMYVEdJIYYJ4HN/AdZ5acKDZ2EPseqCBhohsFBUr4fQdvKnTGfXAk+h/IFp48IKvj/6mdvjabGn3
	VjcycClqBSSDBtAHMJ1P0TMxftU19LzJpeFcMV+LuMRI0bk7F3bGTt/aOvAnKEhuVXmEm3Hb3FJ9h
	+4Cf3qAyzuliTb25saDXkZKCdmqfj7uRsSKnA0hwE9IQ6ZEc3P/InRtxgVxlr/uyZ2ajxEIe2jLpw
	IbTjEi+dz/Sv2MO1iqL2x7RaWTApfdaslr/I8FxAVwZs6bSKHgAeMy4+tTsYOEFMEx+/BCp8hsg75
	oeXLJlyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ly2-0000000An31-1ARr;
	Thu, 02 Oct 2025 16:15:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ly0-0000000An2K-0bE8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:15:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33067909400so914875a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421739; x=1760026539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWdvP8Y683s2RnoHRv1ZB/z8sm8WaE7z/Z8PLqDiBoU=;
        b=XTztJSnqnZK8wPvy5b9eQVK/lmnbvpH8FNT43BnxCeDUHDZpsCXv5nnAp7z62JB+bo
         4wCQuEQG+yE/5i9wB0h437kir7xYrV1IToc2J1ICYhX0216j90GUrh3CGgx0hpYsktCi
         0l4lRtHv9L30d4LcEpcn/CJTLrmb3J22xq0SqGkJGzNgQC57ngeZS2yYESqBThEFNJeA
         gwuHxG7Ol59tUkXTLOFYLt4bZz2ovQsVqNDWqYioOtRtQGDahcVA73M1B3N3dlVNBxs5
         gY6p2aKBSm9c+o23Ja+Pg6U7ts61zL9Mj1b2cm83qCtMqqqxJjRXaH0wIR8GaQUsRZZu
         JEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421739; x=1760026539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWdvP8Y683s2RnoHRv1ZB/z8sm8WaE7z/Z8PLqDiBoU=;
        b=M3PUyjVwPRj2bzZW77ehNCpSGlw0kz2wBB7ryoPrtheLpaarktMudLZItNtVv/Iyo9
         /QKZoDJK5Pz3V5Zhlffh+o7P5uzcRqcozOZduguAgOhgT2UIBNRei96crAKKuGVW+fJo
         cKupfPIlAakmyPOWXCLvZMuKy/UpwOW4SmhDcKiJHv6il19GBaua8EjoLQg1umkv/sKw
         vryh2FYu6JV+RzY2tr8/XtTofOypZpzdd9goQkEr6Hkw3Q6lAQoET/HyVE327zUwEmLH
         nAjXxF25fiRWFiib/FPj+eUnT13YxtCe2EBYQQnoHEm11Q/qlF3MZ2rAD72O2nCQPTSQ
         ljSw==
X-Forwarded-Encrypted: i=1; AJvYcCXEIqhFV0MLxj+ZQP1/9wiKj96RAnmYessjgZReL7vwwkhx0kBUqLWZRVjQxWRh57BGzGV0GQVeZbLPjzCchlMV@lists.infradead.org
X-Gm-Message-State: AOJu0YzWlzTmgKvDdi6KuLw099/DZUih9GXhOrv/PCQelUP9/hbvAh28
	DP6PcaR1VQWofymGW/bI0hkbVCMbY/ADdYE2Ujh4kgFKy6t9HN/yurJu8sSOgK8n/Dkesruz033
	5OMJBiJAVV/gOW9KcLX1JW/P/QmTNKCA=
X-Gm-Gg: ASbGncvklUc9W0y6i9ya/yNYQdqRBqikNQCmW9egDoxO7TXcIFHE3R1/eTr07/XfBQn
	1e/DEq5WeUpqupMQ9XB0USoTvfIhMWlKDYyye+PVsUfOclEWQ70nyPmtlZeh4SGy1THpuqGmJbN
	SFMsV8nv3qFoLOl7oiSDCY14YFzGgy+hGwOBDRXeiRL4KPdEjM/zui+oqdQ63o5yi0zpXExav1Z
	gwtRkQnQpPSa308oumdh2q+XuYFieg=
X-Google-Smtp-Source: AGHT+IEEMaz+rzobkhm8SyqYVcgEkJ1Ytr3pkDKrTDIqXJAg7v41uIIa9JbT8SRUVI32KEw1ae6Cpi3YJuSsap/Nsk4=
X-Received: by 2002:a17:90b:38cb:b0:32e:3686:830e with SMTP id
 98e67ed59e1d1-339a6f3cd02mr8975769a91.23.1759421739281; Thu, 02 Oct 2025
 09:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
 <20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu> <87plckit7j.fsf@bootlin.com>
In-Reply-To: <87plckit7j.fsf@bootlin.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:20:36 -0400
X-Gm-Features: AS18NWBiWy3rvi6cOhhxZBRyTPPh6tyb0jTA2Y6wHpPxRiwnHg5hHZpKt9z0ArA
Message-ID: <CALC8CXc0vZfusBKWXxA7EyG=VfmDHVe1g3HEej044KH_ZOjBsQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/4] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
	Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Martin Kurbanov <mmkurbanov@salutedevices.com>, 
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_091540_181715_131CE512 
X-CRM114-Status: GOOD (  14.89  )
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

Mikhail! YOU RUSSKIE RAYCIS

On Sun, Aug 24, 2025 at 12:24=E2=80=AFPM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hello,
>
> > +             if (controller_is_buggy) {
> > +                     /*
> > +                      * Some spi controllers may not support reading u=
p to
> > +                      * erase block size. They will read less data tha=
n
> > +                      * expected. If this happen disable continuous mo=
de
> > +                      * and repeat reading in normal mode.
> > +                      */
> > +                     spinand->cont_read_possible =3D false;
>
> I am fine with the idea, but could we avoid this little dance and drop
> the extra controller_is_buggy boolean, and just let
> spinand_mtd_continuous_page_read() do the fixup and return -EAGAIN?
>
> > +                     ret =3D spinand_mtd_regular_page_read(mtd, from, =
ops,
> > +                                                         &max_bitflips=
);
> > +             }
> > +     } else {
> > +             ret =3D spinand_mtd_regular_page_read(mtd, from, ops,
> > +                                                 &max_bitflips);
> > +     }
> >
> >       if (ops->stats) {
> >               ops->stats->uncorrectable_errors +=3D
>
> Thanks,
> Miqu=C3=A8l
>

