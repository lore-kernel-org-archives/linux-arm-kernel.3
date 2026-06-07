Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E197CCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+9fNpCsE6s4qptEKDyb1NK+xycGWP9ueu0opDX1ZcA=; b=mEvwLaqIOdizt6U9wEuPlos+Dm
	87DiMaWJBx3qtiHpw1xko0wjZIaFTwdSSkgTX1WIJIALtmk9tXDqw14MtuJOO7Q0y8FLC4W+ZlF1w
	xn49b7fVUOyIb5Cxf0Bbks5SwWkztJafruHVX9ru8cF4Hpl2OJNlz3qnF4m6rt42NAuIBxyddMrLc
	lOGy1Hb/IaTJKRfqYg/Rqwp7b4EIlXGMlaGcGPqnFCnLqMDcbwv2qmIiPNJmzqwrRS7kEoXLABLCZ
	Ic4ntnGtRiR3z14OhcOTOkbMINnAcGKDPk2kX+9cYoev8eNXu5/36MYCrAwH3gOszxRhSD3CeiNTO
	z4QBg8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWKdR-00000002UeC-0FcQ;
	Sun, 07 Jun 2026 21:02:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWKdO-00000002UdW-2I8U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:02:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-bebb72b845aso524232866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 14:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780866137; cv=none;
        d=google.com; s=arc-20240605;
        b=kpAE5w/L53vXI+GkwjPBqVwUL4pD6uMk/Si2IMftarjByrrzEbeeiUCLpLSUc454W4
         MFu08egG7FQzIAaBhro0wTykDcPI23oYtVLZ5J2Yu9SzcjCKfb6v8UkZYybo8v72Sayu
         AoK7ybou8vpt7E7UBTRmSWdVKX70LSwGIGcBMuMLJuR8A3NVTEMhZHkuJzxFrF6es1pi
         9Ap8wItkVfKVNqDdch4k7hHCC5vpEVwEPTeCJmuWlJNQ6x9PetkZvzRuaZfd5rx247+0
         l/IK6nAiTe1m1LLR0/k96HsYAvhphFxkG7vCubjA8m5ya58oROqXXkSahdriNxlhwEoN
         lH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A+9fNpCsE6s4qptEKDyb1NK+xycGWP9ueu0opDX1ZcA=;
        fh=nuxAcd4CPncyTDuUfUbBy2Sujs/6BN8FFuhkn5jAv3E=;
        b=Wo+w9vnkHNcXKpoD2ZVJEWhfTWZqYI54y9e8kBrwOUdLqjSY4cFPULE40J08Q2/BFC
         4rvOlogJUtt0eCXslnKWK3bGwW1tUc4dDSPm8FYDIgRwFnYEDOxNFU5MRWS0CMZqlhOQ
         gV4IpfoK+/s12kMEKR7V/5hfiEUtMWb/Epe/Gly47HwRrm59Mvu7OmViyVeJMEhPmHq+
         wfhpwxuFuFDP7ezoO4z4Lmj/3IiUVDUWQZCiPCXF8WfGXlZClXqpVIPkLs89rObJ2rdx
         jjvIA/KAKm/Hf5leB04cO0wwlGfvKlxlTKGHKy119fMBT0y8S7O4zsfiuyDtl1wKo6Mf
         JJXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780866137; x=1781470937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+9fNpCsE6s4qptEKDyb1NK+xycGWP9ueu0opDX1ZcA=;
        b=Fti/M1tuP2EpqyYcOoutfKbhPj8FNG+KXakMNz3e3f/IdXTNKXu0tWL0KCf3C01tQ6
         If2iwkB4ofR881QiqnUddXihH07P8t4h95+9kZHsf+2gXnKMmX9Hb9vsLExXmwS99BdR
         L02cnJn1sCvW6+qfCJKjiCW0JVIGk2MmVGYppsAnpWDFyv74ADVopjV7XNie/QOKVPRr
         p4ERdGihY2X9g0O6c4Et9HucQWbIbj3Ugf0zaEAPpcNgkma0xgSHASPZLvfHcG/p4J6v
         oyx6IWmPMZzp+P09LsR8UZLTMMcpXRO+NqQHgn1MwJE8TUTNrehM0Wg/eigumY6EmW2B
         iZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780866137; x=1781470937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A+9fNpCsE6s4qptEKDyb1NK+xycGWP9ueu0opDX1ZcA=;
        b=ECRsrxSPelvpBzC/N6fro4dTal98isplXZceQpNpqaboAAF0zfXlzO79tBM41eNRFg
         noKvalmlqPA/+Qb2Suw7Fjcw72II8xSyA00OmA7CdMjvVPx2uIJdc5F6b698+iKnBgnN
         30UF7CGZkmxrDJYVy0iaw2KjmKjMk7b6cGiCuFgFri1XmQ509TiWsCX5CLVwMYPV1V7E
         nNq6nJ59MLFdm6gl0r5E6M6SZNC2Qtq50SBtt8k3IbdS0U4vH7BRSapNL+rdGmDfK3dA
         9PHfL2uEiH5KGZ71Gm3B1rSgtM06/pGvBWNc3V0qg/ym3k6nsw59t8dbp22IpJAdM8hm
         ri/g==
X-Forwarded-Encrypted: i=1; AFNElJ/4rQ7ArCjlXijVAieFIZg93fa+isYlVnJcKHNRJhHYXkYP2wfZ2UuNvLFVDobuFlf0+92Pd6JvCLlNcvWAAS8U@lists.infradead.org
X-Gm-Message-State: AOJu0YzqGqnaCWbyjqxHROzFG7liOoHet1LZsSDiKguhIztkoGz+OPZt
	A0KClRfa7x4H1QA5g1WS8P0JcGbdkLKeaCYuoy9vyx02iKnj7h0Q9N0Ce6uE6E79NC7VO6GiA1z
	1mWSeL8vlEOHJefjwec+5WdtIsA1QCuA=
X-Gm-Gg: Acq92OHPWRgUPu0FyFsa0UTw8fJKg5/c+6E1gsLEoebrthYoWsDMIKpf9yjImrWTlMq
	7xYunzIgFTHwcZMOiG9qExL/bv+KY0IzJtshr/ADJDywxoo30z+k+CYfC5T4QYmFJ1KpxssEeN0
	lTbvOVl6CQF6j/4O7DRH+tFyPebcTjIqb+hheLRoc/hPF22CQPcYyokGXm6/zQKOj2/rQ6X7VAD
	b6I66Lzw2wiM7XOcNM+4slCG1GoEgzYIU7gyMFN5WjSA2yGPQlD7xbNcCIOfE/MrgJiHYjJmMyD
	eSb0n8+txvYshvWXaSocGblHCT5MAd/kjzmxF65a+PRRSLwDN/0=
X-Received: by 2002:a17:907:2718:b0:bea:f4e0:c7b9 with SMTP id
 a640c23a62f3a-bf370d638ccmr437637066b.19.1780866136465; Sun, 07 Jun 2026
 14:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <20260604135255.62682-7-midgy971@gmail.com>
 <e44b506e-e9d2-48e3-acea-ab28b7be9b37@rock-chips.com>
In-Reply-To: <e44b506e-e9d2-48e3-acea-ab28b7be9b37@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Sun, 7 Jun 2026 23:05:03 +0200
X-Gm-Features: AVVi8Cf-JVkWYJtDYXL1xfOVyosnpbnb7w4PJV4kFFggOhSQTxoQOwyJz0V_ZFQ
Message-ID: <CA+GS1Y16++cztPxdUGLrPA73ENm4vJGFrjm-jP8r=8OQqcMJGA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the
 RK356x v1 IOMMU
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Simon Xue <xxm@rock-chips.com>, tomeu@tomeuvizoso.net, ogabbay@kernel.org, 
	heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_140218_625511_F03C5496 
X-CRM114-Status: GOOD (  29.83  )
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

Hi Chaoyi,

> As I said, it is v2. Could you please try using the code below instead an=
d
> see if it works?
> [ auto_gate =3D read(RK_MMU_AUTO_GATING); auto_gate |=3D BIT(31); write(.=
..) ]

Thanks -- that's clearly the right shape (read-modify-write, before paging =
is
enabled, keeping the reset value instead of my clobbering 0x2).

I rebuilt v7.1-rc6 (with the rocket RK3568 series + your per-device-ops wor=
k)
using your bit-31 version and tested it on a ROCK 3B: the NPU IOMMU comes u=
p and
services the NPU's DMA cleanly -- the NPU probes, attaches its domain, and =
runs
repeated conv submissions with no DMA_READ_ERROR and no page-walk stall. No
regression from the write.

To be precise about what I can and can't show: I tested both ways on v7.1-r=
c6 --
with your bit-31 write, and on the reset value (0x3) -- and the NPU
IOMMU services
the NPU's reads with zero faults in both cases (no DMA_READ_ERROR, no page-=
walk
stall). So I don't have a failing baseline here that bit-31 visibly
fixes. Is the
AUTO_GATING write needed on current mainline, or only under conditions I'm =
not
reproducing (a particular traffic pattern / silicon rev)? I'll keep the pat=
ch in
your form unless you'd prefer to drop it.

One question so I document it correctly: what does bit 31 of RK_MMU_AUTO_GA=
TING
control on the v2 block -- is it a master "disable internal auto clock-gati=
ng"
for the page-table walker (i.e. so a TLB-miss walk's AXI master keeps its c=
lock
to completion)? The RK3568 TRM I have doesn't cover the IOMMU registers, so=
 a
one-line description would let me write an accurate comment.



Kind regards,
Midgy

Le ven. 5 juin 2026 =C3=A0 03:59, Chaoyi Chen <chaoyi.chen@rock-chips.com> =
a =C3=A9crit :
>
> Hello Midgy,
>
> On 6/4/2026 9:52 PM, Midgy BALON wrote:
> > On the RK356x v1 IOMMU, RK_MMU_AUTO_GATING resets to 0x3. Bit 1 enables
> > auto clock-gating of the page-table walker, so the walker's AXI master
> > loses its clock between transactions; a TLB-miss page walk then never
> > completes and the IOMMU is left stuck (PAGING_ENABLED, never IDLE).
> >
> > Clear bit 1 (keeping bit 0, the slave-port gate) once paging is enabled
> > so the walker keeps its clock. This is required for the RK3568 NPU MMU.
> >
> > Signed-off-by: Midgy BALON <midgy971@gmail.com>
> > ---
> >  drivers/iommu/rockchip-iommu.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-io=
mmu.c
> > index 4da80136933c4..e3d8b6e9ca12b 100644
> > --- a/drivers/iommu/rockchip-iommu.c
> > +++ b/drivers/iommu/rockchip-iommu.c
> > @@ -953,6 +953,18 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
> >
> >       ret =3D rk_iommu_enable_paging(iommu);
> >
> > +     if (!ret) {
> > +             /*
> > +              * RK356x v1 IOMMU: RK_MMU_AUTO_GATING bit 1 enables page=
-walker
> > +              * auto clock-gating; the walker's AXI master then loses =
its clock
> > +              * between transactions and a TLB-miss page walk never co=
mpletes,
> > +              * leaving the IOMMU stuck (PAGING_ENABLED, never IDLE). =
 Clear
> > +              * bit 1 (keep bit 0, the slave-port gate) once paging is=
 enabled.
> > +              */
> > +             for (i =3D 0; i < iommu->num_mmu; i++)
> > +                     rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATIN=
G, 0x2);
> > +     }
> > +
> >  out_disable_stall:
> >       rk_iommu_disable_stall(iommu);
> >  out_disable_clocks:
>
> As I said, it is v2. Could you please try using the code below
> instead and see if it works? Thank you.
>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 0013cf196c57..89e3a83a0251 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -930,6 +930,7 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>         struct iommu_domain *domain =3D iommu->domain;
>         struct rk_iommu_domain *rk_domain =3D to_rk_domain(domain);
>         int ret, i;
> +       u32 auto_gate;
>
>         ret =3D clk_bulk_enable(iommu->num_clocks, iommu->clocks);
>         if (ret)
> @@ -948,6 +949,10 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>                                rk_ops->mk_dtentries(rk_domain->dt_dma));
>                 rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CAC=
HE);
>                 rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_I=
RQ_MASK);
> +
> +               auto_gate =3D rk_iommu_read(iommu->bases[i], RK_MMU_AUTO_=
GATING);
> +               auto_gate |=3D BIT(31);
> +               rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING, auto_=
gate);
>         }
>
>         ret =3D rk_iommu_enable_paging(iommu);
>
> --
> Best,
> Chaoyi

