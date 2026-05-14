Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE1ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=; b=XWznVefm1sSgjRBuP5FsP7+XmR
	AcB41uL6rtJBBOGOqhsb5dVjvqIis1YnzzLPF5uTMD8VJhBP6FeuZiV69c9AkyG7X/EpkAHuugGs2
	6TgbEMugrxzWiUhn5nAk/HWl+8qU3r1bulbJ8aYisuUiDBr5ZR3g+6OR/Mh71v9T2hGMq7YQZpYs3
	kYcm165y6OcOt44L753v6rTqCqEyfmKDwEkbcdrjDfDGajzK6PqpeKYFxNrW6Yijw+HpvX+GDehzA
	nZzZTN7pPYJL9PI2kpNimDJ9TAOEfmPl8bWzoEKFFNfcBECVczR4tQqrN/npg8zlx6wtPawktAhzT
	nqzQuWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNR5Y-00000004tu2-2kHT;
	Thu, 14 May 2026 08:06:36 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNR5W-00000004tta-1D36
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 08:06:35 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50e61648f10so351451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 01:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778745993; cv=none;
        d=google.com; s=arc-20240605;
        b=bK1ZuBBQPOJRA1dbLBb1y4+OxREGh7IlWBnpXM65O8nrWrY+2VeSBUfjZAyBv0jDBR
         rm+cxRJPW+h0vHTlvI/gHBty84OxRJnQ9EhBQFcRMVbHnDAP8QeNGJeSLcPZzTXWl24I
         eHoU/Uu3wa7uem9AOclxcqDVJnKg+FWSvDtnijPJA6jqitf675xF0/XpljOw7zYsi80l
         hnzcbN+6s/re0QzXaZSNba/ArP/4VDIic5yQ2JGJqdWSDNChop6HG0UVko9aahGm+6hT
         2xd+EnXEud9iUj0zjLjyfT8YsMw5+zzborx1FGZO+Ivgd9L5cEvpGe1e8gpOnBwioeOw
         ySJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=;
        fh=wIx5L9nWnLIfSh9Ipdf2wvRl9srlkEvffyCeMtj9t1w=;
        b=UOnxhgxm3cdthqyx7USfcTuZKYwTyTKwbHE8Z9Z/G9NxqyH3ExVK9UcsjoS+YZtGc+
         3LwPa83yczqY2mH+PgMjspPKB54udq/JTM4v8GbMcOtYpCKxlLcE997vFBQ+mMgNfkYL
         0jcDl8s5Q1Et7MoyWaHjCZJwJcR7Hdw5J5fJYWWfJS2kjUbpN24XgmjfQD7eXjaUTmex
         qumiiOX08thCNGGFf2LAQQcKOsPVxgnr5FIA4uE68V+1zyddB+XmypQ/SDMn9fTVrUEN
         bGudnWd8F2mWcsy4QBHiC2bJq3t24C/x8fo+nu4U3rNTWOnQVJRUHfr4wJdijTls9G4r
         THxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778745993; x=1779350793; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=;
        b=TTZuaNTyXc8kETkw40H/Oy9LIaCsumDbjlsGMgFJIQGqIahj19lik4gFLCwU3m1Q3u
         fXeas5wQ5PPwGtCC9Eu/yVEczpqsSmQmg+jddu10LhSyiQXm2/bnhx7yKtmXBi14znLy
         ZqOw1Mt0JoO4LogMQsUpQXJg/D9nC1Ozwn/UG/8zq+QaFIrbLweTsVeYno/14pfCx974
         j5MGhd6UeXLm64WFzsaai4JpHbeiPsyOOV9WEmlR1cjgt+XQLJGBMpJ0aC9wZmq+ACMe
         kBtazMnT8GSQIYylN6pYCSusTiMkcZaVA6+cI63dQ5cZy42mbKP06CJo3762n3E92D99
         2sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745993; x=1779350793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXdd7FnOAYRaLS7B63YJ6ysgGCzM3+RdD/s5lYMWf1I=;
        b=kP5KdvObrHWumQRGHJkOPWdnEhE5+CvwoVGG//Qzc2Rz5th70XqSfW+UAjxLLBa0Dd
         crux5m2tavV4hSC8UoSt7PmWOi7OtZvuOLzTw5bESxqXfeG9m3t2F43FezoRajbGwOPg
         4Fx9J1VD679AY2c6cU/f6tiL5av9HlbNSKYUjP63kZwds8ZFpUDtPYZCiMAPMd6n3Bxv
         E4oHgSfvC6blWkT2Ioi9rn2NPbgRAga/V9DtMJOIWs5pn6x2kxmicSVS+QeN1rI9eT61
         8sottkwJ1K/vF2fbpn9+wUE/GWMnOuZc9Zzxf4O4CDeKvl/XQY7Vu0B9bniga4UebkU1
         rMGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v2bYIwR1kaUw3z1YGBhtq765UquPV9jd/iyACs1Wf/Xr/R9pI+k0x8ShYmi+m0bEEAbu8OpzM5SVx6I4aqEqf@lists.infradead.org
X-Gm-Message-State: AOJu0YzIpCt1HxT1ENC+/mcwetzH/HyU6WhavRtWgqrm95hY0O1XQg1Q
	QetpByIMfPJBKU9+f3lne87yEzRzkEn18lNuJcSzBDMqka+wD1BbNkmYeSb9P2WMTVVkZ42uPAd
	AS/Yu0y08drjLYUtoYks63gYGe3NW1wqFsXAVFjdu
X-Gm-Gg: Acq92OGrdNR+IXhlbLymjQ7FI/xv1G3npYHhgwNz7lyhv5zTNoU4iTYjftoT270V/rt
	uAz8Bwy9GRqh/gFVf15ybhbEZibNKSw3lyN/ntF9FOWsL+Pxj7vxFFh4C9SeFC0K245g3uVUFCy
	qW9WgghWnk3gdOUmTw4GHdNymgCSKhQ1nbUv+CekA1qAqwTX1xRYJ64kaFzjDdcwPljugqb4iRJ
	HC9aPwfe01wDb43z8kBKJC79DTkPJlbExBOYhYzD2zeGMI83FBryJSnrjlhIynQ2YnNcfp8G8vq
	2rVScNuQApBG05fxYW/YI2DoHyv3Lc1yHu09EvqcagR2Xsii
X-Received: by 2002:a05:622a:9007:b0:50e:6360:96e with SMTP id
 d75a77b69052e-516420a4ecdmr12032231cf.0.1778745992401; Thu, 14 May 2026
 01:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-4-aneesh.kumar@kernel.org> <agSED6BdSXBhbDYI@google.com>
 <yq5abjeia315.fsf@kernel.org>
In-Reply-To: <yq5abjeia315.fsf@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 14 May 2026 09:06:19 +0100
X-Gm-Features: AVHnY4KFUT_Q3ProEjcPRlzXFAyPmNH0RBADajCyGfb0sF72QbGsmq65dFwn1XU
Message-ID: <CAFgf54qB0msUdKakDvh7hp0r5kokPV0vohBxUjkOz7sR1FZNuw@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] dma-pool: track decrypted atomic pools and
 select them via attrs
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, Petr Tesarik <ptesarik@suse.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_010634_340470_5390186D 
X-CRM114-Status: GOOD (  17.85  )
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

On Thu, May 14, 2026 at 8:01=E2=80=AFAM Aneesh Kumar K.V
<aneesh.kumar@kernel.org> wrote:
>
> Mostafa Saleh <smostafa@google.com> writes:
>
> ...
>
> >>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
> >> -            void **cpu_addr, gfp_t gfp,
> >> +            void **cpu_addr, gfp_t gfp, unsigned long attrs,
> >>              bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t=
))
> >>  {
> >> -    struct gen_pool *pool =3D NULL;
> >> +    struct dma_gen_pool *dma_pool =3D NULL;
> >>      struct page *page;
> >>      bool pool_found =3D false;
> >>
> >> -    while ((pool =3D dma_guess_pool(pool, gfp))) {
> >> +    while ((dma_pool =3D dma_guess_pool(dma_pool, gfp))) {
> >> +
> >> +            if (dma_pool->unencrypted !=3D !!(attrs & DMA_ATTR_CC_SHA=
RED))
> >> +                    continue;
> >> +
> >
> > nit: If we fail to find a matching pool, a slightly misleading message
> > is printed as pool_found =3D false
> >
>
> The message printed is
>
>         WARN(1, "Failed to get suitable pool for %s\n", dev_name(dev));
>
> That is correct, isn=E2=80=99t it? The kernel failed to find a pool with =
the
> correct encryption attribute. For example, the request was for an
> encrypted allocation from the pool, but no encrypted pool was available.
>

Sure, I=E2=80=99d prefer a clearer print in that case, especially since tha=
t=E2=80=99s new code:
=E2=80=9COnly {encrypted/decrypted} pool found for a {encrypted/decrypted} =
alloction=E2=80=9D

But no strong opinion.

Thanks,
Mostafa



> >
> >>              pool_found =3D true;
> >> -            page =3D __dma_alloc_from_pool(dev, size, pool, cpu_addr,
> >> +            page =3D __dma_alloc_from_pool(dev, size, dma_pool->pool,=
 cpu_addr,
> >>                                           phys_addr_ok);
> >>              if (page)
> >>                      return page;
> >> @@ -296,12 +345,14 @@ struct page *dma_alloc_from_pool(struct device *=
dev, size_t size,
>
> -aneesh

