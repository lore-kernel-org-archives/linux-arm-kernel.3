Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7315E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEpmGsnYD20KF98YPxRoScx17fqF75iFjcKl5Un5Rwc=; b=ifFJ5F3kbnOrKfFDCKvFYLAe1H
	i5Lup0EvxR+OiNJNlcma8s/fvDKDGGuFKWuw0/RlbFxCoGx5H2pTqi0JFNKQDrw3kjohDJK2mu4T1
	YQCM0GQ3B8Isdq+nw2qXKGP27JjmJCXCIzeDKK6AaBfbtNz3z08eh4E5Lx1VzVJrx3WOeRk9zbNuz
	GvDw+mHGVXdfkkQI/5Y6vTalkl1On3N3a9CESBHbShzBiJfLj2zeV/tFX0cuE+GpSMziQf7WHTjuN
	Ft3ojSeLZjaXrWiQc8niOW/KX2Ak1H5QUhVeUJbjXsg/56p6GHuUSjLG4EejAjyMtY7hq5do7+zGC
	XzD49m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBLH-00000005Oqc-45DA;
	Tue, 07 Jan 2025 15:18:03 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBJi-00000005OUU-0vPf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 15:16:30 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a8146a8ddaso57404065ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736262985; x=1736867785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEpmGsnYD20KF98YPxRoScx17fqF75iFjcKl5Un5Rwc=;
        b=SmAGsGcbnhAJj2wZ/HNdeHp77QfvIX2XBMr5DhIFUILFG15h7dPyo/aTSbTtbUztSn
         7hKQOvCjNLPMh2DTAecrk5o4vgA0A9aRghIQrrewChIcGtYknV1/4ArfGWPB2irKtlIF
         iPjHMfJWg8gKI4mBInCCdRynsty70tCDHkI1+dF0U2bbFRYcNuwLv/X/zmnMqaxPN9lm
         NpY0cgDdxF6sFYWgVRVbtZIBzzE637bXNPxJYFLYnReMf/Z+yehnbM17FSd2gSITYjzk
         Xc0c4BtgU4Ff41FiGRQwEvSnwMqFhkSRhBmq0crKHdSeHpkhAaAzvpgawKmLXzHrWIdW
         kPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262985; x=1736867785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEpmGsnYD20KF98YPxRoScx17fqF75iFjcKl5Un5Rwc=;
        b=qx8d5FQK7tlHMxT+8afSFLW+5Hu2jaBWWxNRo04TWOaofnV8MSwXaM1INlHGoF+a++
         ONZ6ovLt+u/xFjxZ42Dp8JV7qCqyZHDvaKOnI+b4O3nKwlbu/GQJ2/7t0hLae4TCtiiG
         wHYCknT4VMVnwoXf21kUX0RxArjCPuXJHBY7l8zrNGNFctl1pp1aRciIKiZQoAgG7ebj
         Z0Fwem82GwRJfzS0ZwvSFvIv7thqqzYHgyOrUy2QGQuXeqqw5Sb3toGCQjIKflipjdqF
         B5a7hezS+y/6jOiFF2jMnXlj35L/ZOqpMaHXs8Iwvxz4zCY99ABav6LgjE99jreUgfhE
         d72Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW24vJfvmUks1bvI6Zo/qADNCe9GJSu8EHuAmS6abLtFfDNQfmJB1ZWdfJrUaFk/DftWqh9l0UJV0QB9b0N1D4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/0Vhn0m5QH5e6hH2b1Ds71B3K1N8mOAcVpIi4LHKpPjXuYYF
	21WtWbmEzVQyfAyKnwk3oaJZV2P62zdYYvQkoFnrTHTSyi+jaDEFaIJ1YOEYQXKalFCtilLyjKp
	mDrurfbHIEinNQa0Oc/nCqvIwA3I=
X-Gm-Gg: ASbGncv670duUpu5tQQ+sjjfzP/IkwuXBQbtRALRFvuCJ2WzK/FPg8g9bXamhRXPDsx
	CQPjjebomoQuxSqSuuMuMIlKf1m2FNNfNYlWAF8pdsz7Duhl5e+quBgQeRV+oFgz8ikp1
X-Google-Smtp-Source: AGHT+IHlytIOa8SLJD6ilASbLpCUQevKgStkuVESsGuRpq4383tKFP0QuXLkBBL6bO1X1rxhpJ3kjld29+v9vpnSuz8=
X-Received: by 2002:a05:6e02:2384:b0:3a7:fe8c:b014 with SMTP id
 e9e14a558f8ab-3c2d5917533mr523633585ab.21.1736262984845; Tue, 07 Jan 2025
 07:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20241210165127.600817-1-robdclark@gmail.com> <Z30kWxVxwJXO_z2_@google.com>
 <20250107125840.GB6991@willie-the-truck>
In-Reply-To: <20250107125840.GB6991@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 7 Jan 2025 07:16:13 -0800
Message-ID: <CAF6AEGuXD6rCx8yABH338XSr0Wq6fyFe9Z6fWCh1KPNMbJgiOg@mail.gmail.com>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@chromium.org>, 
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Joao Martins <joao.m.martins@oracle.com>, Kevin Tian <kevin.tian@intel.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071626_274732_6C7E148E 
X-CRM114-Status: GOOD (  23.21  )
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

On Tue, Jan 7, 2025 at 4:58=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jan 07, 2025 at 12:55:55PM +0000, Mostafa Saleh wrote:
> > On Tue, Dec 10, 2024 at 08:51:18AM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > This series extends io-pgtable-arm with a method to retrieve the page
> > > table entries traversed in the process of address translation, and th=
en
> > > beefs up drm/msm gpu devcore dump to include this (and additional inf=
o)
> > > in the devcore dump.
> > >
> > > This is a respin of https://patchwork.freedesktop.org/series/94968/
> > > (minus a patch that was already merged)
> > >
> > > v2:  Fix an armv7/32b build error in the last patch
> > > v3:  Incorperate Will Deacon's suggestion to make the interface
> > >      callback based.
> > > v4:  Actually wire up the callback
> > > v5:  Drop the callback approach
> > > v6:  Make walk-data struct pgtable specific and rename
> > >      io_pgtable_walk_data to arm_lpae_io_pgtable_walk_data
> > > v7:  Re-use the pgtable walker added for arm_lpae_read_and_clear_dirt=
y()
> > > v8:  Pass pte pointer to callback so it can modify the actual pte
> > > v9:  Fix selftests_running case
> > > v10: Call visit cb for all nodes traversed, leave the decision about
> > >      whether to care about non-leaf nodes to the callback
> > > v11: Adjust logic in 3/4 [smostafa@]
> >
> > I see the level initialization was not removed as it was in the diff[1]=
, so it
> > seems to me that=E2=80=99s redundant as the level is set anyway in the =
callback, and
> > actually looking at that I see it=E2=80=99s not used or printed from th=
e driver,
> > so may it can be removed all together, anyway that=E2=80=99s nit that m=
ay be Will can
> > fix it up while merging.
> >
> > Otherwise, For the whole series
> > Reviewed-by: Mostafa Saleh <smostafa@google.com>
>
> I'm happy to drop the 'level' field if it's not used. We can add it back
> if/when it's needed. Rob?

That works for me, thx

BR,
-R

