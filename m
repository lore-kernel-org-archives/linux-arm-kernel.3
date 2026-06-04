Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5748ACD6E78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=; b=m1vEPz1ZcEAQnMjogSpFZQ8vbt
	Aac0XSGFhgR5I/8hAfsaG8wPf3dcoRnWGAupJziec4cFXLc12aR58LmMbLj7HK7yQa2k95vhivWvC
	/rqxnJ34alYF392vvKs0TDQKUwq5jSlhJuwoMK6ktAEP0nCGWshOUZIGqbhWucfjS4/MVBrHmlHE3
	iDwLI4u1oz0CdFgkQgJQ1zfOr0XsyW3wRfntp+vaxMN40mczbkL70iAW9NFzkVzTi8x4TFFhWcyAH
	s7MdQAO4qiqtt/SS//MM1LhnPoYr/JjJziL6DCgxu36PbzE4vMyQ9OAYYNKE7esknwnV9KpN26r/4
	0fhYsfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8vr-0000000Gst6-0vID;
	Thu, 04 Jun 2026 14:20:27 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8vo-0000000GssP-2gkJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:20:26 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-9159da9bba5so52971485a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780582823; cv=none;
        d=google.com; s=arc-20240605;
        b=HjyhgCmwWtzvu+F0tN5jUzuAmP1M310Tzk517VmBEbtEXEYwTBmqZ53h7juWJzU+nX
         poY2Bsxv6zkmfwE5zsXj1yr2IsG5woDQ0RIkDPJd2L8SUHuSz8czJ/lDLzQgmytpZ2c3
         A9P5FMMjgcvBWl1zXTU/m1yRvrn/QOqNfIYE6Un4/USurPAenhcmXuSlnIBbBWKeNqAN
         xrqIbJF+bKI8NQFIY28nRpcKYiF/4wIcLVp+rds7GLSLBAXeukdag0+aNyfOu3XEP/Ly
         vvUP7Ib1e3GBk214PcXk4vR3d68sa6w/giVjzagtnuUy1RalcRQNKwoUKgR2PejU8Xy6
         +lDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=;
        fh=Uaq+5bbeNb3DGPJUFnK5Dvxv3HMkQ/ht0l/NVALdxFg=;
        b=b8UWK7h4Ji1VOQqTWKyg5fEYlCSphjSX4LXLZei/vx+eI2k0hZfbVS5LQYb8cWvuR0
         byLPFhKXYqgaLaSCSt5RbG2Y7CDUhSGpIV6Hy823Zk2KIiL9jvevKJXiF4iJ4GrfViUi
         UiIn/dsnUjZS/1IGJ8fHUblbDAGzzPunHSrJFV+MBdkJGSRDtKZr6oEZEIDRAI0+AIW0
         dOH2X2LmE14FCaP7oFlgpOJ0/2Tv5B+YvQCmGvH3l7IvOq5sWZGNJwSqDeX82gnJHDJa
         sLXvaAH6V4eIaEJ+CRqceR6fEy9DtXAtdXpkBeiwTba/flCgvSgeL81vRr5MMZSnf5pt
         12Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1780582823; x=1781187623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=;
        b=TpD72eX+hrZ/NcYBlnD6nALiPPILo2Xa7W/TvqY7JPKgnYudS0mMSJFVh4kvfKP1Uq
         pHx2U//POMHnjFUH88WNC2dUSv8GulfXqOndWKu5H5pQ1+U7fcov81niBqxYHNBZxJvi
         QMVMuxRusvh/mLl+jllTRLrwuUP+/hnz1J4zAew7Kl6YoMpcgzdRV3gHK2kHQowZe/iL
         5ZeRx4FGkdg/Zp2/la7tUV6y2gZ5/2YUNM0CHcb6eVlULmWEWia9DqdWm3YCfPuwL+7o
         ToSY6CcsAkv0rrZBJEEBlc66HmXlDInVH2cAygCc0WK06QoJGDKZj1D/wYCBZqIysCsH
         E2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582823; x=1781187623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPi10HvU9BftniKMgGr3MAu9cx9vcqkTMC3QUEUHzeg=;
        b=PYsoAPTv51eG+ekrzu4WgtbeRlaJquJyIu2rZvd1Z/JDFzBm+9u/TX1IaXvqaefFDD
         YtvXiPCuaECf/ChZKzP9zstMigaJoERk9wbmDwHERPGCTpt8c/J71BXHtD12nfJyFVJe
         zK/VyblaUi6/JjK2FcnlgC468DVEyWGpjlJz5EvuvSNBz5TkhgLaOQAvnTmoRnxPWoFX
         ahotDaQrV1koKOB5Fs3f9izn2NgGkQq40dxIhbqgbix+siit73npDOnHMHjCOnvOvpA9
         /stqkHFEPOl32z64W45M89bs954Qf3UIXr0jiOr510Z1Z25M9rdqZh125zLimb4Z44q1
         FTbg==
X-Forwarded-Encrypted: i=1; AFNElJ8KyDG8wlotKTSOZyMALo2ZPGBejc+tgTv2rJz6JNOAkbGB/eGoDICB70YF9w7Y4vvhZFsw028LohinLBTfKidV@lists.infradead.org
X-Gm-Message-State: AOJu0YzXrScmL6UHHZgQi73DT2ii3UjuBG3IEm8Awgp7bjgXI5Ua9dKh
	gHvUBXFaWYnFayZ5NiJvyqhHTNnWZH9XThdhM9eTD+cd7GPPClaPiGITLJ+rZdMTyAMdW553uCu
	3exmv+wN6lSuWmKsRzQetRmoz1hnHymVj5XIE7mrxfA==
X-Gm-Gg: Acq92OFH4htkQ+CJQ0UP9s+LPkf0f683sbZMP29uvwzLRylBCCqCv0cZ1klB4ATh3Uy
	tScfmMWMpjNJ6YWDLUnXqAfV+w2Tio31kwFf6eC+Tl7xLc+fPxzkVjBrxs5lAt3xyswQLQlA+0c
	S2lNORCEVxFvNy4e7chr5+Ye3V1LHoaHgdJKYfhWGSXebSxoY2MaS613esr0Ge9Hubk17mlNtQI
	QX7UYiKVpKT7uRnRBH1Fi1PlrJd31ghNkw1W4kzUILECvZN2wwzgPHQa1Banw1rdrXb023q6fVv
	XdXPq7JlTB6Y3M0W
X-Received: by 2002:a05:620a:268d:b0:912:c0b3:7d9b with SMTP id
 af79cd13be357-9158a76739emr1272633085a.24.1780582822784; Thu, 04 Jun 2026
 07:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260604135255.62682-1-midgy971@gmail.com> <20260604135255.62682-7-midgy971@gmail.com>
In-Reply-To: <20260604135255.62682-7-midgy971@gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 4 Jun 2026 16:20:10 +0200
X-Gm-Features: AVHnY4JQeDtrhyq7YBnn9raVEBX1uxBzeM4kDcgUj1eAV9LhKWI5-NL4FjfQpnY
Message-ID: <CAPsqS2RYjf4dMj=Maz1c2vViW83ZsrEW9eOez526eh=TsKvQww@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the
 RK356x v1 IOMMU
To: Midgy BALON <midgy971@gmail.com>
Cc: ogabbay@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_072024_942160_456B1169 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Jun 4, 2026 at 3:53=E2=80=AFPM Midgy BALON <midgy971@gmail.com> wro=
te:
>
> On the RK356x v1 IOMMU, RK_MMU_AUTO_GATING resets to 0x3. Bit 1 enables
> auto clock-gating of the page-table walker, so the walker's AXI master
> loses its clock between transactions; a TLB-miss page walk then never
> completes and the IOMMU is left stuck (PAGING_ENABLED, never IDLE).
>
> Clear bit 1 (keeping bit 0, the slave-port gate) once paging is enabled
> so the walker keeps its clock. This is required for the RK3568 NPU MMU.

Hi,

I'm not able to review this patch myself, but maybe it can be
submitted separately while we work on the NPU bits?

Regards,

Tomeu

> Signed-off-by: Midgy BALON <midgy971@gmail.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 4da80136933c4..e3d8b6e9ca12b 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -953,6 +953,18 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>
>         ret =3D rk_iommu_enable_paging(iommu);
>
> +       if (!ret) {
> +               /*
> +                * RK356x v1 IOMMU: RK_MMU_AUTO_GATING bit 1 enables page=
-walker
> +                * auto clock-gating; the walker's AXI master then loses =
its clock
> +                * between transactions and a TLB-miss page walk never co=
mpletes,
> +                * leaving the IOMMU stuck (PAGING_ENABLED, never IDLE). =
 Clear
> +                * bit 1 (keep bit 0, the slave-port gate) once paging is=
 enabled.
> +                */
> +               for (i =3D 0; i < iommu->num_mmu; i++)
> +                       rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATIN=
G, 0x2);
> +       }
> +
>  out_disable_stall:
>         rk_iommu_disable_stall(iommu);
>  out_disable_clocks:
> --
> 2.39.5
>

