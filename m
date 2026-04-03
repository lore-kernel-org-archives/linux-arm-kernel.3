Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0C0E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZJMb8BpsQsC5OCqpX0KvnetYnrUPrII+wbhqXuacG4=; b=baIC2i4+lBTqq/sn4ytfA7hKjh
	ZBGCb005pOKWJXFZ12XxxVcfTIKSDgIwuFvi5dZZf3gxNhV3kmj1VryDcPr9PC+yCcXYjGuxPjI6R
	0uaQqTDFWRA0yZFiI3H1RnLYlP8XlzyOY9NqunvnX5ySEWfxccBOl0e2QBqLVlz9WsSNs+ltYhtyI
	KltlBPmuryOPiCtsJlmg14dQpIx5Fbs3cy8gPcE3ePM9ReMlBcMoLZmm8ItB2eSDyZEk84WTvaa+c
	KtPbV64UfypsgnVBOquh8GKuJ8Rh9FLnMFlJd+7mnMmrByNLKwCcdx5Wo1f7YWca8E2Gd3sDrTExG
	kzenIetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8f4V-000000026xx-11ne;
	Fri, 03 Apr 2026 14:00:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8f4S-000000026xG-3Sxc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:00:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-66b2f6e983bso3174219a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775224822; cv=none;
        d=google.com; s=arc-20240605;
        b=Uf2XQy82x1d/j+6kdk8QSICV9dL7dqaCD1ljeXe7xR5bN6Uy8Nw/EWZneGXwqtmx6o
         C8snvn54viOVwCCU3mJ/46RQ0VCRpJgOY0bUJnLQbnqRl64SlFRnwMK7dHLtFeLs9vgs
         u4q9w7mhUAwBX9riMuTLNRy2l1N9MCvTCyjYE9C6YPHRtqNmj75whrdlnOPRcnwBOfgG
         FXtf07weoZYP7PwEUG2LP2t8bPWqhCtilNuJUjwXWL2Ks1K3oEXRJGXSs+lGbSONaHsY
         EmwEDs7VlHJNGJPY8KFJpkUGQhbcDeRA5QCH/1YRGj7EXKWDKq18jt0zWU1YPCotGYWh
         w9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GZJMb8BpsQsC5OCqpX0KvnetYnrUPrII+wbhqXuacG4=;
        fh=rZsie27CrxZv5JBNDeWQSvWBBWHSeb+p9r1wU9LTHVs=;
        b=ENkl6LqrzhLeUZSsDewLRkd13Cysix1JCMuDbaxTynXCicJ+mU5E2SlwKkk1RF7sJD
         jQ2aJlN1kRbPrHeaJg8JqfP0E+yi2T5F7+Znt8QcndFJ9gOz2v4wDRk7XNm09g6JKBlc
         Ukf6BzF4Cl0Mopk1NKGyj5yRRgIOTSmBrI6D8GYi2o7mauxe8fMiTv4IWICIuZb5ZEfK
         PhZxulFHVZ9BAKMRpE53LbphcbjP1JrLiwV8YAxGGxCrwpxG4raKRcOBEldvDQ5rJz87
         s+IIXyRpGi/TMUhUxVHqhaIEbzZisC1kTI1i4xynxfA0J49bNEPMEPID7eoHR1lCOELz
         u+TQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775224822; x=1775829622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZJMb8BpsQsC5OCqpX0KvnetYnrUPrII+wbhqXuacG4=;
        b=jVlu/eiXVqjKKfAKso1le+wOEoCgy0Rric/41W9ggpE4evx/uNLD5WJ+q8a4PoneoX
         vEFnARzcxZIxrvnnZRRRDuUAeAnsXmvh+1V4FqU5T+v++yoAG6qLgcxJi+xPzSzj77PQ
         2mPUw/+/YRdYIVrgvUXRjNC7g4LMoTn8/NtzUlsM3Ah7vTyUiXekk/n2m5/VlBEZFBxR
         tG8XY5yCL8zhEbGPnTY3Jka/aN4KwdWFCw6DbLBqLKm4JpgeB8qwaVom+lu8fUXpqpFC
         h7XxMinpun9Ea6cu1ucxrZp5xGqyYHHJmUZZM+CHg4s23751ZRIXUPvgy0+CXbcfM0CE
         HJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224822; x=1775829622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZJMb8BpsQsC5OCqpX0KvnetYnrUPrII+wbhqXuacG4=;
        b=AlUzgh1GPrfmgrHYuaScVwzrFbeTCg1HL57q+GPFlNiRdzst59SuOLnadCaN1qeb+t
         BiNEysT/ePjg7eixcuTKN6Hno8UIxw3OAW9ggdMWfK1OqroogJ0PMIJKDGDCwP/ftaVR
         jUPeYUoQ7/ovzUt+nC0zKVH2zTmMaGVYQVIgpsi7XEkxG8arXFvJScruciAlJpAyTTnH
         S3RoUnKRR4K9dwXF33jD2+Qc+J9J3PB5erl0exfKIlESIb/vFcGa09UMZ55BvKGFrhfg
         njGhFfYjej2sBE9kdF6Im5SjbWDK/4RZJqnpRJU1txSzfziq5sc0ZWwLzz65bJyIytLE
         +NvA==
X-Forwarded-Encrypted: i=1; AJvYcCVcEeQxjSihIsh6ruvHKOWcavJqsdFTWHqAUHQ5MILWD23UN9p2/p1MnNGbOuQ4NX7pFTIcQKL38UrhR5CgTXBd@lists.infradead.org
X-Gm-Message-State: AOJu0YwBnFiHvRhlrOnwiYbNhqOZl5NCAu5gsk2O88iPDP4AGW3hs0dB
	bFUXObmpxSGEyFkPJToyyOSG+w7djoMTcor11JKKw23BNDM4eLf9j0yyD2LOw5dNCjGtAEppm6X
	eT7gmtvpYmcJCFfXNdFanmZ0ex3FvrTI=
X-Gm-Gg: AeBDievZ5PV6eHWhb5dgp6pRJvIx1GGkKibxnERYrqG1LVl4GTq8WgZNDuSB+D4welT
	w1I+1i0D+5JvzFXmq8lW5mxElDzge1oRBuOO7KtmuH2flkB7Gw+rUNKEZ5qfERK47dIMnCbcGbg
	hTc+E+9XG+xKro+6pM5gquAo5MA48C9YTIET2AptG6DbvaMNXojNdarjUrk5oD7wLkgSb7vjs6n
	nIhSe7XiIOayQmPIl7SULbe9lrTCefHyWUklUiPHxQtL6wCo4eRhWu8/uVU8AwYruBTsSiF4dLx
	iynyY/eUwxdCWqQOgg==
X-Received: by 2002:a05:6402:5241:b0:668:50ef:427d with SMTP id
 4fb4d7f45d1cf-66e3f70d42cmr1446085a12.21.1775224821948; Fri, 03 Apr 2026
 07:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260331075010.1463-1-midgy971@gmail.com> <0f285782-b12a-4abd-bca7-b6c549bed59f@rock-chips.com>
 <e622cc9e-8fb0-454a-b88e-dc13cf2ff507@kwiboo.se> <89ed223d-1a2c-447d-9f21-76969e668855@rock-chips.com>
 <5663593b-2c53-4632-ad2c-db9efa8e9ab2@rock-chips.com>
In-Reply-To: <5663593b-2c53-4632-ad2c-db9efa8e9ab2@rock-chips.com>
From: Midgy Balon <midgy971@gmail.com>
Date: Fri, 3 Apr 2026 16:02:02 +0200
X-Gm-Features: AQROBzC2wzA0RbJXoNrMzE6k6aC5-WfVfCFoYB3Sb0oM_n_1ycoKvDZTyy5IIMA
Message-ID: <CA+GS1Y3K=N3emYYC-4KAZ27MO7W7ZPgczbk8xPtWC+cYm-5F1w@mail.gmail.com>
Subject: Re: [PATCH] iommu/rockchip: fix page table allocation flags for v2 IOMMU
To: Simon Xue <xxm@rock-chips.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, iommu@lists.linux.dev, joro@8bytes.org, 
	will@kernel.org, robin.murphy@arm.com, Heiko Stuebner <heiko@sntech.de>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_070024_916891_73F55062 
X-CRM114-Status: GOOD (  41.57  )
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

 From: Midgy BALON <midgy971@gmail.com>
 To: Simon Xue <xxm@rock-chips.com>
 Cc: Jonas Karlman <jonas@kwiboo.se>, iommu@lists.linux.dev,
     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
     heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
     linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
     stable@vger.kernel.org
 In-Reply-To: <5663593b-2c53-4632-ad2c-db9efa8e9ab2@rock-chips.com>
 References: <20260331075010.1463-1-midgy971@gmail.com>
             <0f285782-b12a-4abd-bca7-b6c549bed59f@rock-chips.com>
             <e622cc9e-8fb0-454a-b88e-dc13cf2ff507@kwiboo.se>
             <89ed223d-1a2c-447d-9f21-76969e668855@rock-chips.com>
             <5663593b-2c53-4632-ad2c-db9efa8e9ab2@rock-chips.com>
 Subject: Re: [PATCH] iommu/rockchip: fix page table allocation flags
for v2 IOMMU

 On 4/3/2026, Simon Xue wrote:
 > We internally checked that the RK356x SoCs integrate two different
 > IOMMU versions (v1.0 and v2.0), like NPU and ISP use the v1.0 IOMMU.
 >
 > Both versions can map 40-bit physical pages, but v1.0 does not support
 > placing the first-level page table above 4 GB.
 >
 > To fix this, I think we need to land this patch first:
 > https://lore.kernel.org/all/20260310105303.128859-1-xxm@rock-chips.com/
 >
 > Then on top of that, we can add a new compatible string to distinguish
 > the IOMMU versions.

 Thank you Simon and Jonas for the internal investigation. This explains
 exactly what I observed.

 To answer Simon's earlier question: the IP block hitting both failure
 modes is the NPU IOMMU (rknpu_mmu, at 0xfde4b000), currently bound
 to "rockchip,rk3568-iommu" in rk356x-base.dtsi. Both the downstream
 rknpu driver and the upstream Rocket accel driver (drivers/accel/rocket/)
 use this IOMMU.

 The v1.0 first-level page table constraint explains both failure modes.
 On boards with more than 4 GB of RAM the DTE table can be allocated
 above 0x100000000, and the v1.0 hardware silently truncates or errors
 on that address. The SWIOTLB bounce-buffer path is a consequence of
 the same root cause: with DMA_BIT_MASK(32) on the NPU device, bounce
 buffers land below 4 GB, phys_to_virt() of the bounce address is then
 used as the PTE write target, and the subsequent
 dma_sync_single_for_device(DMA_TO_DEVICE) overwrites those PTEs with
 zeros from the original buffer.

 Please consider my original patch withdrawn. Modifying iommu_data_ops_v2
 was too broad and would have incorrectly constrained VOP2 MMU and all
 other v2 IOMMU users.

 I agree fully with the two-step approach. On top of your per-device-ops
 patch [1], I plan to send:

   [1/2] iommu/rockchip: Add "rockchip,rk3568-iommu-v1" compatible
         for IOMMU v1.0 blocks (NPU, ISP/VICAP) on RK3568
         =E2=80=94 ops with .gfp_flags =3D GFP_DMA32,
                .dma_bit_mask =3D DMA_BIT_MASK(40)
         (v1.0 can still map 40-bit physical pages; only the DTE
         table base must be below 4 GB)
   [2/2] arm64: dts: rockchip: rk356x: Use "rockchip,rk3568-iommu-v1"
         for rknpu_mmu (0xfde4b000) and vicap_mmu (0xfdfe0800)

 One note on the SWIOTLB issue: with GFP_DMA32 in the new ops, page
 table allocations never reach SWIOTLB, so the "track L2 base addresses"
 approach you suggested should not be necessary =E2=80=94 GFP_DMA32 prevent=
s the
 bounce-buffer poisoning at the source. Happy to be corrected if there
 is another path where it is still needed.

 I am happy to add Tested-by to your per-device-ops patch [1].

 [1] https://lore.kernel.org/all/20260310105303.128859-1-xxm@rock-chips.com=
/

 Regards,
 Midgy BALON

Le ven. 3 avr. 2026 =C3=A0 06:40, Simon Xue <xxm@rock-chips.com> a =C3=A9cr=
it :
>
>
> =E5=9C=A8 2026/4/1 18:22, Simon Xue =E5=86=99=E9=81=93:
> > Hi Jonas,
> >
> > =E5=9C=A8 2026/4/1 16:41, Jonas Karlman =E5=86=99=E9=81=93:
> >> Hi Simon,
> >>
> >> On 4/1/2026 9:48 AM, Simon wrote:
> >>> Hi Midgy,
> >>>
> >>> =E5=9C=A8 2026/3/31 15:50, Midgy BALON =E5=86=99=E9=81=93:
> >>>> commit 2a7e6400f72b ("iommu: rockchip: Allocate tables from all
> >>>> available memory for IOMMU v2") removed GFP_DMA32 from
> >>>> iommu_data_ops_v2, reasoning that RK356x and RK3588 IOMMU v2 hardwar=
e
> >>>> supports up to 40-bit physical addresses for page tables. However, t=
he
> >>>> RK3568 IOMMU page-table walker uses a 32-bit AXI bus: it cannot acce=
ss
> >>>> physical addresses above 4 GB regardless of the address encoding
> >>>> range.
> >>>>
> >>>> On boards with more than 4 GB of RAM (e.g. 8 GB LPDDR4X), removing
> >>>> GFP_DMA32 causes two distinct failure modes:
> >>>>
> >>>> 1. Direct allocation above 4 GB: iommu_alloc_pages_sz() may return
> >>>>      memory above 0x100000000.  The hardware page-table walker
> >>>> issues a
> >>>>      bus error trying to dereference those addresses, causing an IOM=
MU
> >>>>      fault on the first DMA transaction.
> >>> Which IP block is hitting this? We'd like to take a look on our end.
> >> I have seen reports that the NPU MMU on RK3568/RK3566 is having some
> >> issue using DTE/PTE with >32-bit addresses, maybe it uses a different
> >> MMU hw revision or has some hw errata?
> >>
> >>  From my own testing at least the VOP2 MMU on RK3568 (and RK3588) was
> >> able to handle 40-bit addressable DTE/PTE, hence the original commit
> >> 2a7e6400f72b ("iommu: rockchip: Allocate tables from all available
> >> memory for IOMMU v2").
> >>
> >> As also mentioned in my reply at [1], maybe the NPU MMU has some hw
> >> limitation or errata and may need to use a different compatible.
> >
> > Yes,  We are checking internally whether different IOMMU versions
> > integrated.
> >
> > I will share what we find once we have results.
> >
> We internally checked that the RK356x SoCs integrate two different IOMMU
> versions (v1.0 and v2.0), like NPU and ISP use the v1.0 IOMMU.
>
> Both versions can map 40-bit physical pages, but v1.0 does not support
> placing the first-level page table above 4 GB.
>
> To fix this, I think we need to land this patch first:
> https://lore.kernel.org/all/20260310105303.128859-1-xxm@rock-chips.com/
>
> Then on top of that, we can add a new compatible string to distinguish
> the IOMMU versions.
>
> >> [1]
> >> https://lore.kernel.org/r/3cd63b3d-1c5e-4a11-856e-c4aeb5d97d55@kwiboo.=
se/
> >>
> >> Regards,
> >> Jonas
> >>
> >>>> 2. SWIOTLB bounce-buffer poisoning: without GFP_DMA32, page tables
> >>>> land
> >>>>      above the SWIOTLB window.  dma_map_single() with DMA_BIT_MASK(3=
2)
> >>>>      then bounces them into a buffer below 4 GB.
> >>>> rk_dte_get_page_table()
> >>>>      returns phys_to_virt() of the bounce buffer address; PTEs are
> >>>> written
> >>>>      there; the next dma_sync_single_for_device(DMA_TO_DEVICE)
> >>>> copies the
> >>>>      original (zero) data back over the bounce buffer, silently
> >>>> erasing the
> >>>>      freshly written PTEs.  The IOMMU faults because every PTE
> >>>> reads as zero.
> >>> This probably need a separate patch. One way to fix it would be to
> >>> track the
> >>> original L2 page table base addresses in struct rk_iommu_domain,
> >>> then have rk_dte_get_page_table() return the tracked address instead =
of
> >>> deriving it from the DTE.
> >>>
> >>>> Restore GFP_DMA32 (and DMA_BIT_MASK(32)) for iommu_data_ops_v2, whic=
h
> >>>> currently only serves "rockchip,rk3568-iommu" in mainline.
> >>>>
> >>>> Tested on Radxa ROCK 3B (RK3568, 8 GB LPDDR4X):
> >>>>     - MobileNetV1 via RKNN: 5.8 ms/inference (IOMMU mode)
> >>>>     - YOLOv5s 640x640 via RKNN: ~57 ms/inference (IOMMU mode)
> >>>>     - No IOMMU faults, correct inference results
> >>>>
> >>>> Fixes: 2a7e6400f72b ("iommu: rockchip: Allocate tables from all
> >>>> available memory for IOMMU v2")
> >>>> Cc: stable@vger.kernel.org
> >>>> Cc: Jonas Karlman <jonas@kwiboo.se>
> >>>> Signed-off-by: Midgy BALON <midgy971@gmail.com>
> >>>> ---
> >>>>    drivers/iommu/rockchip-iommu.c | 4 ++--
> >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/iommu/rockchip-iommu.c
> >>>> b/drivers/iommu/rockchip-iommu.c
> >>>> index 85f3667e797..8b45db29471 100644
> >>>> --- a/drivers/iommu/rockchip-iommu.c
> >>>> +++ b/drivers/iommu/rockchip-iommu.c
> >>>> @@ -1358,8 +1358,8 @@ static struct rk_iommu_ops iommu_data_ops_v2 =
=3D {
> >>>>        .pt_address =3D &rk_dte_pt_address_v2,
> >>>>        .mk_dtentries =3D &rk_mk_dte_v2,
> >>>>        .mk_ptentries =3D &rk_mk_pte_v2,
> >>>> -    .dma_bit_mask =3D DMA_BIT_MASK(40),
> >>>> -    .gfp_flags =3D 0,
> >>>> +    .dma_bit_mask =3D DMA_BIT_MASK(32),
> >>>> +    .gfp_flags =3D GFP_DMA32,
> >>>>    };
> >>>>       static const struct of_device_id rk_iommu_dt_ids[] =3D {
> >>

