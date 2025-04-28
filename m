Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49600C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3PDk0kE6Pq6FLmLOY/JDwc7lEcgFrVSKJD43x+V3Uo=; b=kP3Ksh2pY9/lrESm1Bm++OREfC
	6IIxyXYZZp1VSLWsKFb3+9lc4Jl5eZMqXmYV1Y/XviEgoKyE2TPVv06vVKCLw8jTiDSKR8unq9MLG
	jgtaP9+MgdFfUgfjGy4l2phiJSh2k3u5m/oWKcVx5Ay9UzxMVH0ZPL6VHndRW8cw1ZnAiHLhgg/dm
	E+MaIZbTd1/tZR3iukKng53rc1NrkaVGqguZ3MS0JZb/c7ILz9eSOWPD474lR8IFXVVBRK7pBkdcY
	BrG0Ks/xaEgbYXwN8JSIGgaO4fdwcdQ72Q10y5Dwd9ZES+4i4kThY+ME7exj6Mx+ojRIeGqcww4ia
	0c8NKFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9R0W-00000006rJj-0Zcr;
	Mon, 28 Apr 2025 16:07:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9QyY-00000006r3q-1DYS;
	Mon, 28 Apr 2025 16:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C134D4A11F;
	Mon, 28 Apr 2025 16:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6576C4CEE4;
	Mon, 28 Apr 2025 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745856297;
	bh=7XLdbWmNFskoiToXzoYEkGfsOw/zohiTcP2XkykS74o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AM9L7fZuEJv8GJopbMAaCLzul2dtTfFJkqqJ7BqfmbmCyAf10FdcxcWA/Ng3eUspe
	 UKicT9AHwF0xcV/7M0JEceXTD6wy5YgRoC81Xvjy79aPqtv7WHhmosG1kwNnZj+PLQ
	 2VPm3GAdNQ/sMv5301JJTyBVGb6HJCDTMgEfBTGBNwTEG1novG/AMwvccQDP+V02UL
	 6M2s58ruhrpoQeJ4Es/bu5G7f3ZtgwS+SGoA+tcjE4DAcR3OLIp/2evQhbeM4E5aT3
	 EWlDsmGGqb/fAJ8ea7L7+HLZKI31nwe0JS5bb6+xZWMHe17K24pRXJPO1j7sRq1rPL
	 i00uL7SUG/KTQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso4967240a12.2;
        Mon, 28 Apr 2025 09:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxSJRD+JhDzCbQ591THjyZAoP/uifG/8ZBL9l/+ECMFCPtum5Mc1IwNTkPw32Kep5n+lgSFg3A545eVnmZCFKx@lists.infradead.org, AJvYcCXvdCoFivc2V9Gkbpst8y0qnWKQlRbUGs+S/RjGyNRCGsEDHiFq3F5mocszJVXBFOYqniNeIIu4wmEWyQMVW9k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpLtYfZ/NzQI9ucSrvkG7VwVFFIFS8xavfc9rmRPgdq15ZvMe/
	1e1hVINiKLBsMzbx8P9qOPeDcraBePtc+TPZYu2Ca/t+e06w5hAgZgZwCRLgYFIrP12LTf7Rhlp
	odARk8R9hBVFI4uAZUHfGkdSA/g==
X-Google-Smtp-Source: AGHT+IHqyjiiOUZc7O0PTXr4PU21+O3T0XNzhaZ1i8yWNd5TokGg/Wq4TNREu/IzrAIDEiBQ7J/8fcTB66uLEb2Z3jg=
X-Received: by 2002:a05:6402:40c6:b0:5dc:7643:4f3d with SMTP id
 4fb4d7f45d1cf-5f83809e106mr113428a12.1.1745856296286; Mon, 28 Apr 2025
 09:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
 <aAETI0hrOiQZDKh2@8bytes.org> <20250428160227.GA1322286-robh@kernel.org>
In-Reply-To: <20250428160227.GA1322286-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Apr 2025 11:04:44 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pE2c3GzdrgRO97Ee=ajOVAMzNtqyujD3PXyNE6Ad9vA@mail.gmail.com>
X-Gm-Features: ATxdqUHw7IfXnRL7JJPy7HyVs4hLK90IaG__j7ETIyndbfex7BJvjd7AGV1APf0
Message-ID: <CAL_Jsq+pE2c3GzdrgRO97Ee=ajOVAMzNtqyujD3PXyNE6Ad9vA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add IOMMU support
To: Joerg Roedel <joro@8bytes.org>, yong.wu@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, will@kernel.org, 
	robin.murphy@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, iommu@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_090458_353222_CBDC954E 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, Apr 28, 2025 at 11:02=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Apr 17, 2025 at 04:41:39PM +0200, Joerg Roedel wrote:
> > On Thu, Apr 10, 2025 at 04:40:06PM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > In preparation for adding basic support for the OnePlus Nord 2 5G
> > > DN2103 smartphone, this series adds support for the IOMMU found in
> > > the MediaTek Dimensity 1200 (MT6893) SoC.
> > >
> > > AngeloGioacchino Del Regno (2):
> > >   dt-bindings: iommu: mediatek: Add binding for MT6893 MM IOMMU
> > >   iommu/mediatek: Add support for Dimensity 1200 MT6893 MM IOMMU
> > >
> > >  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
> > >  drivers/iommu/mtk_iommu.c                     |  37 ++-
> > >  .../memory/mediatek,mt6893-memory-port.h      | 288 ++++++++++++++++=
++
> > >  3 files changed, 318 insertions(+), 11 deletions(-)
> > >  create mode 100644 include/dt-bindings/memory/mediatek,mt6893-memory=
-port.h
> >
> > Applied, thanks.
>
> It looks like you missed the binding change for this.

Actually, upon closer look, the driver's compatible string has a typo.
The period should be a comma.

Rob

