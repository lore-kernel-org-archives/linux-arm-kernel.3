Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6DFFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/jChz6sjr+zrCpBnIRaHvUti3M8eQoxf0csRWJFl5E=; b=EQEHO5xaM2O7mdIOfuV3XLsDLg
	ud2tFQUuSsiD+O01jO4PawIcZMypmM9+M4M2+Gg0zvF+IHCpIA6NCYALgDD5T3td/F9/ueIkMycNk
	Ii/XOIJeZaXb18iVit4UxaOqq/JKjIXuNad4yrU2XNCIDiP90g4coSbInAz4P7f8f0aSsz1VJW/qj
	5LsYyUb0HSpvmlnxI0OdIyuUhJXWEJIrEXdMo7B4GQ2i/miAvDg36Z45ieHgSckTIscDVstJWikCJ
	9DKxHZpROe1fnepDdPnPGIqQE7J+6HIL7eZtWwQTpRggyBL+Ablmlri2/oc76qfm5m7ECpBYvK2Ap
	CXSY9W9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkNq-00000001jha-3W1D;
	Tue, 28 Apr 2026 15:29:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkNo-00000001jgy-1mY0;
	Tue, 28 Apr 2026 15:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=J/jChz6sjr+zrCpBnIRaHvUti3M8eQoxf0csRWJFl5E=; b=kk2CPk3wqtMV0MItlwGDeU9Y7T
	+Kbtlcbmt9w+KIgiLd8tiFmLjqa3QioEtuNmPAhviIHiXn3voURz7hK4AeEC49zd3yb/wz06yf9ej
	ECvlnDkEof03pZg/1HA1Uk1TQg50bBqvs5LMlbZlDk89zS3gkjyBiaREeiXWB+Q9Iq/T9F3gKIY11
	M9T/jir/dOWsgDZTZI19EKTcJeyPA55KRJFS8++DH0xAaYLjZ5IB/QC6vSBKZ5sUxlbvEQqyQMudj
	nI60BYAvqTLEOWzkdPjNKK6G5NV2g1SqnYLDIo7wTsIIGvXC9Z1VdyCpchvmc7/NNAssrhA1qDsEd
	s/gySzEw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Simon Xue <xxm@rock-chips.com>, kernel@pengutronix.de
Subject: Re: [PATCH] iommu/rockchip: disable fetch dte time limit
Date: Tue, 28 Apr 2026 17:29:33 +0200
Message-ID: <4696766.BEx9A2HvPv@phil>
In-Reply-To: <ece1961d-d16c-40c8-8f42-55bd0f0eda27@pengutronix.de>
References: <20251126-spu-iommudtefix-v1-1-f90003dbfcc4@pengutronix.de>
 <cea54dcb-6236-4363-8b46-e2213a190894@pengutronix.de>
 <ece1961d-d16c-40c8-8f42-55bd0f0eda27@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_082956_497419_4584A03B 
X-CRM114-Status: GOOD (  37.85  )
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

Hi Sven,

Am Dienstag, 28. April 2026, 14:15:45 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Sven P=C3=BCschel:
> Hi,
>=20
> pinging this Patch, as I didn't receive any more feedback/reviews. The=20
> feedback only affects the comment and doesn't affect the commit,=20
> therefore I currently don't see a reason for a v2.

it's been 5 months since the original submission, so I'd disagree :-)
It may very well have already been discarded from maintainers' inboxes.

So I do think a v2 or at least a resend is waranted here.


Heiko


> We've noticed that this patches fixes hangups when using the RGA3=20
> peripheral on the rk3588 (where I'm in the process of upstreaming a=20
> driver [1], which depends on this changeset). Based on the vendor commit=
=20
> messages, it should also fix VOP and screen black issues.
>=20
> Sincerely
>      Sven
>=20
> [1]=20
> https://lore.kernel.org/linux-media/20260428-spu-rga3-v5-0-eb7f5d019d86@p=
engutronix.de/
>=20
> On 11/28/25 8:26 AM, Sven P=C3=BCschel wrote:
> >
> > On 11/27/25 5:32 AM, Shawn Lin wrote:
> >> =E5=9C=A8 2025/11/26 =E6=98=9F=E6=9C=9F=E4=B8=89 19:45, Sven P=C3=BCsc=
hel =E5=86=99=E9=81=93:
> >>> From: Simon Xue <xxm@rock-chips.com>
> >>>
> >>> Disable the Bit 31 of the AUTO_GATING iommu register, as it causes
> >>> hangups with the RGA3 (Raster Graphics Acceleration 3) peripheral.
> >>> The RGA3 register description of the TRM already states that the bit
> >>> must be set to 1. The vendor kernel sets the bit unconditionally to
> >>> 1 to fix VOP (Video Output Processor) screen black issues. This patch
> >>> squashes the 2 vendor kernel commits with the following commit=20
> >>> messages:
> >>>
> >>> Master fetch data and cpu update page table may work in parallel, may
> >>> have the following procedure:
> >>>
> >>>     master                  cpu
> >>>     fetch dte               update page tabl
> >>>             |                       |
> >>>     (make dte invalid)  <-  zap iotlb entry
> >>>             |                       |
> >>>     fetch dte again
> >>>     (make dte invalid)  <-  zap iotlb entry
> >>>             |                       |
> >>>     fetch dte again
> >>>     (make dte invalid)  <-  zap iotlb entry
> >>>             |                       |
> >>>     fetch dte again
> >>>     (make iommu block)  <-  zap iotlb entry
> >>>
> >>> New iommu version has the above bug, if fetch dte consecutively four
> >>> times, then it will be blocked. Fortunately, we can set bit 31 of
> >>> register MMU_AUTO_GATING to 1 to make it work as old version which do=
es
> >>> not have this issue.
> >>>
> >>> This issue only appears on RV1126 so far, so make a workaround=20
> >>> dedicated
> >>> to "rockchip,rv1126" machine type.
> >>>
> >>> iommu/rockchip: fix vop blocked and screen black on RK356X and RK3588
> >>>
> >>> RK3568 and RK3588 has the same issue as RV1126/RV1109 that caused by
> >>> dte fetch time limit, So we can set BIT(31) of register 0x24 default
> >>> to 1 as a workaround.
> >>>
> >>> Signed-off-by: Simon Xue <xxm@rock-chips.com>
> >>> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> >>> ---
> >>> During testing of a newly developed driver for the RGA3 peripheral [1]
> >>> (Raster Graphic Acceleration 3) of the RK3588 some sporadic hangs
> >>> have been observed. The upstream rockchip-iommu driver is used to=20
> >>> handle
> >>> the RGA3 IOMMU register space.
> >>>
> >>> After a closer look at the TRM for the RK3588, the RGA3 iommu register
> >>> description of the RGA3_MMU_AUTO_GATING register (offset 0x24) mentio=
ns
> >>
> >> It's 0xF24 per RGA3 chapter.
> >
> > yeah, sorry. I was already thinking relative to the rga3 iommu address=
=20
> > space in my head, but didn't really mention that the chapter says=20
> > 0xF24 with the iommu related registers starting at 0xF00.
> >
> > Sincerely
> >     Sven
> >
> >>
> >>> a mmu_bug_fixed_disable bit, which must be set to 1 but defaults to 0.
> >>>
> >>> Looking at the commits in the vendor kernel, the bit is unconditional=
ly
> >>> set to 1 and mentions that it fixes a blocked VOP (Video Output
> >>> Processor) [3]. Therefore squash the relevant vendor commits
> >>> [2] and [3] into a single patch, combine the commit messages and keep
> >>> the Signed-off-by line from the original author.
> >>>
> >>> [1]=20
> >>> https://lore.kernel.org/all/20251007-spu-rga3-v1-0-36ad85570402@pengu=
tronix.de/
> >>> [2]=20
> >>> https://github.com/rockchip-linux/kernel/commit/7f8158fb41b5cc8e738aa=
eebc3637c50ebd74cae
> >>> [3]=20
> >>> https://github.com/rockchip-linux/kernel/commit/6a355e5f9a2069a2309e2=
40791bc3aad63b7324e
> >>> ---
> >>>   drivers/iommu/rockchip-iommu.c | 8 ++++++++
> >>>   1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/rockchip-iommu.c=20
> >>> b/drivers/iommu/rockchip-iommu.c
> >>> index 0861dd469bd86..2d0dabb0d101a 100644
> >>> --- a/drivers/iommu/rockchip-iommu.c
> >>> +++ b/drivers/iommu/rockchip-iommu.c
> >>> @@ -76,6 +76,8 @@
> >>>   #define SPAGE_ORDER 12
> >>>   #define SPAGE_SIZE (1 << SPAGE_ORDER)
> >>>   +#define DISABLE_FETCH_DTE_TIME_LIMIT BIT(31)
> >>> +
> >>>    /*
> >>>     * Support mapping any size that fits in one page table:
> >>>     *   4 KiB to 4 MiB
> >>> @@ -930,6 +932,7 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
> >>>       struct iommu_domain *domain =3D iommu->domain;
> >>>       struct rk_iommu_domain *rk_domain =3D to_rk_domain(domain);
> >>>       int ret, i;
> >>> +    u32 auto_gate;
> >>>         ret =3D clk_bulk_enable(iommu->num_clocks, iommu->clocks);
> >>>       if (ret)
> >>> @@ -948,6 +951,11 @@ static int rk_iommu_enable(struct rk_iommu *iomm=
u)
> >>> rk_ops->mk_dtentries(rk_domain->dt_dma));
> >>>           rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE=
);
> >>>           rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK,=20
> >>> RK_MMU_IRQ_MASK);
> >>> +
> >>> +        /* Workaround for iommu blocked, BIT(31) default to 1 */
> >>> +        auto_gate =3D rk_iommu_read(iommu->bases[i],=20
> >>> RK_MMU_AUTO_GATING);
> >>> +        auto_gate |=3D DISABLE_FETCH_DTE_TIME_LIMIT;
> >>> +        rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING,=20
> >>> auto_gate);
> >>>       }
> >>>         ret =3D rk_iommu_enable_paging(iommu);
> >>>
> >>> ---
> >>> base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
> >>> change-id: 20251126-spu-iommudtefix-cd0c5244c74a
> >>>
> >>> Best regards,
> >>
> >>
>=20





