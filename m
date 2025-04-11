Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8DCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XUXdxG/BhkCfZVlPJvHGNM3P7ArX2Kcz52iyJMQG+U=; b=Z2CrmLvkbo6biUYOtTvlV17ZSA
	DH9Gsz5uQggk86rThjqO1x/GMHxqGdvsAv8CO//QPCVbSz1FqEXvlqwxM8XRpbt33wOZY1krEx1fQ
	Jjs41P4m/jIY8vVaVLVT3Octx2hq1wfvLCdOVFZFp+1r3JELpLJAjqQL4yMYeCwUrtZE+WiF/B2gT
	QlIi2a3g+obW5Zi+pyrkAMzZ35Qz9EZnUWizUiDD2IfFEfZR3nz4OwEGhOFrX5ksoEBQeCjsCFtHZ
	O6VIpAv1UahkSYnUQSF/LG6u1H5vi2U4LE7jniJ73EIYe/dxb2CByCVnfK2LoewY+N+dj2gEXrmXN
	1gwn8dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3D8C-0000000DfpU-2BGL;
	Fri, 11 Apr 2025 12:05:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3D6M-0000000DfYX-2yOn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:03:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2248561f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744372996; x=1744977796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XUXdxG/BhkCfZVlPJvHGNM3P7ArX2Kcz52iyJMQG+U=;
        b=AOA0a67xELA9tzdCReX3lL61fxqGj2udp5FFFZRAmmwZcF+SyMUzWK52BdpC2hqhI+
         7qcH4O3HbA83INrrCKQZzJtX39seFj00EQWiIId4lKC3Ul/hlM+rGA8Q0yGsv1pY0YYX
         +pIoVTVicyvk5yYb7BiQ5uUDKb203Xt8L5/F87VbUjWmrzHQtZvOFGTcLJHNwht3isR5
         2CgM7vAEZlJzdK+5GniCZqAt7E0vu6SydBFXbApan1bGmr/si3z7ef/ehrNIYk/7tv/Y
         nzIiPStTutDMpo3ObSAjVGWhlAAPFwWk/odWOEgYpoqh90MmbKY5Oh3lxWkNjlTUre5N
         vPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372996; x=1744977796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XUXdxG/BhkCfZVlPJvHGNM3P7ArX2Kcz52iyJMQG+U=;
        b=iJYk1CKpL5/DCUXi8ZyCPAtFcqnfVerLrQEwHEt2ikYdcpAlCqEOMacGe5/n3bqz14
         auqihaVtQkgdpFvAS7bgUyV01imB0HXVwLrRBpv/fUyl4BJsy8YdUW1S8nW0e2kQMu0k
         VH//gZ3kEvRI7TvRmiu4w+jBpYwVCYT7GV6Bs5ax5HJ3ppsqg7+Ya2hs1SpkX5hDHsqk
         pzrd5vszIecFjzUOaX3aPrASrlSvNCbXLNcKARYE9ruia5IgwvG5weD5nBMcFdP3hgxP
         9XImA6NSsu/O0QraD9OJg6aE6Vdf40XJA6uh0xswP/+xWHgtBCB1Bn7YIXdxJSkk9Kn3
         n0xA==
X-Forwarded-Encrypted: i=1; AJvYcCXVkrC+l0sPeUl0eXIyzn4R5ormhT+jfcV2rmBVRHuWaRwPCz/bVtTZV8YmoqhAJc+ExHalIY3gQl1we7X0qSyx@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLx+jyOIkH0ZRbsc8/4bdS/YxDkCxqmIbPgn+YwzaAmd/CBXP
	S5jbbTsW+KFkihSOwsG78UEe9G9addYOxp/GudBxoXN9QpczpqPt
X-Gm-Gg: ASbGncuwlkLXrQ6jVVHR5S9Gc8DZmCYVXbhP+6DXEP7osOxZODyGr1QhwhmlexgUuqf
	8YjRVlgWcwiyS2gXFTZBaqm7knQl5a97rw+Q0zXwQqxhu4RSug5x9Ypar4g0IPWB28pmr7Nw7QK
	616o3pD1Tuo+7x1G/pm740rNKLZk8FWoZYclhsn7ThghrcsKWykwE4vmjPoh2d3bidzZ5Ms/xHd
	VgG8xHmlIQU1HfzzC9fmgN4eI4CS57IR6hdLAIeEsnl1CvsBuGQpyxEzMnUsk1gt4WAhkkrCg8b
	vtxHWL6m+DNtfEy5K8RL4Xv02Na2fEXDSXJAjyzThOkXBTog+3zGSn34oo6vWIuSqYovsBo2FGU
	Yq2Bwq37SAIkbgQ==
X-Google-Smtp-Source: AGHT+IFjJLiz90Y/fxzwTEEZjSN23htjHcLr+F0TlWnjvsqsniNtlVdnHF/+XW9GHr3Jqk8W2SymPg==
X-Received: by 2002:a5d:584b:0:b0:39d:724f:a8f0 with SMTP id ffacd0b85a97d-39eaaebb54fmr1676129f8f.42.1744372996097;
        Fri, 11 Apr 2025 05:03:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97b249sm1834556f8f.58.2025.04.11.05.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:03:15 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:03:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Xavier <xavier_qy@163.com>, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, ryan.roberts@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
Message-ID: <20250411130309.7894f204@pumpkin>
In-Reply-To: <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
	<CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_050318_743970_DEA020ED 
X-CRM114-Status: GOOD (  24.40  )
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

On Fri, 11 Apr 2025 09:25:39 +1200
Barry Song <21cnbao@gmail.com> wrote:

> On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
> >
> > This commit optimizes the contpte_ptep_get function by adding early
> >  termination logic. It checks if the dirty and young bits of orig_pte
> >  are already set and skips redundant bit-setting operations during
> >  the loop. This reduces unnecessary iterations and improves performance.
> >
> > Signed-off-by: Xavier <xavier_qy@163.com>
> > ---
> >  arch/arm64/mm/contpte.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > index bcac4f55f9c1..ca15d8f52d14 100644
> > --- a/arch/arm64/mm/contpte.c
> > +++ b/arch/arm64/mm/contpte.c
> > @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pt=
e)
> >
> >         pte_t pte;
> >         int i;
> > +       bool dirty =3D false;
> > +       bool young =3D false;
> >
> >         ptep =3D contpte_align_down(ptep);
> >
> >         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >                 pte =3D __ptep_get(ptep);
> >
> > -               if (pte_dirty(pte))
> > +               if (!dirty && pte_dirty(pte)) {
> > +                       dirty =3D true;
> >                         orig_pte =3D pte_mkdirty(orig_pte);
> > +               }
> >
> > -               if (pte_young(pte))
> > +               if (!young && pte_young(pte)) {
> > +                       young =3D true;
> >                         orig_pte =3D pte_mkyoung(orig_pte);
> > +               }
> > +
> > +               if (dirty && young)
> > +                       break; =20
>=20
> This kind of optimization is always tricky. Dev previously tried a similar
> approach to reduce the loop count, but it ended up causing performance
> degradation:
> https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.co=
m/
>=20
> So we may need actual data to validate this idea.

You might win with 3 loops.
The first looks for both 'dirty' and 'young'.
If it finds only one it jumps to a different loop that continues
the search but only looks for the other flag.

	David

>=20
> >         }
> >
> >         return orig_pte;
> > --
> > 2.34.1
> > =20
>=20
> Thanks
> Barry
>=20


