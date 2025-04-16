Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BBFC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+fXnkJpwelTixeoKCaTbF6EKiAnJ5P42+1RZbVSe1I=; b=mdowEOGchtN8mjhU6GQQjxi+ea
	dx+J3JTSB2CgSaYS2pP+FPXeHGI8KLL78+3zFrgyuqv1eaIZFh+FdIWA98wKu+8ZauClykKCvfK+b
	yOPjDJDsvewEtppFcx9x8UPSHjHPyhiN5Vgw5DQeet12Pyi0ZYvJWNkVlscfm9qbXDhzHVWNrQL/4
	gjho7J1tpbGTrC7/Q7tMR8fFI2lDAa6Ta7dYNDzYD/TkSzYViQLAqWlg0Z3cePdwmiT/ORYH7ECGe
	HN5DVSQB6wpDLsDdu1Ot19l03w732i/nydPfxQhCZfxX96GcykfagqAIBQe8aet89RP8utGpouP/k
	YfhIAxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52JI-00000009aTT-1tyJ;
	Wed, 16 Apr 2025 12:56:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52HR-00000009aBi-2fN3;
	Wed, 16 Apr 2025 12:54:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0F9B49C65;
	Wed, 16 Apr 2025 12:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF62FC4AF09;
	Wed, 16 Apr 2025 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744808056;
	bh=comiGzp0yJ4uJILmejSmpCuv8WNkCrKJ9fiuAA5Eobw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XgxN7RF6ckFVEbhTn4I+sUZDqecs+mp3hGbLLci+Upkk2MPH7CIQvlQFKOyjI4/3P
	 nGB24udzu5O62ORPQlrRwyyGveOHGDOrMF38yJfdtVsFhOZ8wLNu7luUFZqyLvsVOU
	 6lkI1ew3WMP9j5VUysZEDaKWSUyImO63a14HdAbC+GHfk49ZspnHGRcdMvil/jTsjP
	 AZ7OhS/a8bSP43LawW46zSOqSlkawiBkad4nxwPsBjJNhSIhgv5X0vLfdE2iz3QE7X
	 NxVajwcnP/1YaLNgnD5Yuc9Y3/EqUo2z2Mp5X+QRlMaVXqeEVUsZwUaB+eRqr6L+Lv
	 P8iQx/wPt2Kow==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso1162111266b.3;
        Wed, 16 Apr 2025 05:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbTZwLJxoGxWJ8qOrr/9OT5DCyBDTiZTNt0Hf4Gox8Whw8+at8zm8sMJctKMCdF0BKpzp79xPDp4U5K1F02NOe@lists.infradead.org, AJvYcCWANSGrZac+Th/pesZgDwC3JGyngxaVx5anozf00+qO9c/tO7UP/edZrg0HxIVXQgHA8GCQeZROb8Ao0yJZT50=@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0bR+AhCKhGA3VLf5RrMxDybjMAxE9fkq2fdjcR5RIEvbINfk
	SRZix6X10tHUjMJMkJj1BOxGigb41yomXLuY4wbDaLfPpYS3jXmqdG9iyKEdVHy83i6U+goOMNL
	24NE8M4DXv5YKDO6OT1Z5/EhN9g==
X-Google-Smtp-Source: AGHT+IHKUgTFGckVUkYUIXHvq2dBr0rCYxoZR8dZi86QjoaRiJl8+SbX5WOjSc7+LpPbHbXBjdpbz7ajUIvfSATF50o=
X-Received: by 2002:a17:907:2da5:b0:ac4:751:5f16 with SMTP id
 a640c23a62f3a-acb429e409fmr172840366b.30.1744808055323; Wed, 16 Apr 2025
 05:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com> <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
In-Reply-To: <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Apr 2025 07:54:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKZN6PxsThZtcCBLaLKgC2Dd1kxfgWhK6RK8DxY6_2X0g@mail.gmail.com>
X-Gm-Features: ATxdqUFMIZ7R44fK-lMlhaa-MPGGZB7R6M_caVCgAn6SeZBUMV0t64nOdSZ5Dr4
Message-ID: <CAL_JsqKZN6PxsThZtcCBLaLKgC2Dd1kxfgWhK6RK8DxY6_2X0g@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, sebastian.fricke@collabora.com, 
	macpaul.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_055417_716586_091D8E9C 
X-CRM114-Status: GOOD (  10.81  )
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

On Tue, Apr 15, 2025 at 2:38=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Wed, 18 Dec 2024 11:53:17 +0100, AngeloGioacchino Del Regno wrote:
> > This series adds the necessary bindings and devicetree nodes to enable
> > the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek=
's
> > MT8188 SoC.
> >
> > This was tested on a MediaTek Genio 700 EVK board.
> >
> > AngeloGioacchino Del Regno (3):
> >   dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
> >   dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
> >   arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> >
> > [...]
>
> Applied to v6.15-next/dts64, thanks!
>
> [1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>       commit: 2971de063fa56c18b2720ab19bdebca23cd96471
> [2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>       commit: cfb00dfa1b778a8037faf6973cca226e5ad4f45a
> [3/3] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
>       commit: f0935480253ede5405045a4e733f4476343cbb91

A couple of warnings added with this:

     33 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
     33 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match
any of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required pro=
perty
     33 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional
failed, one must be fixed:
     33 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     33 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one
must be fixed:
     33 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one
must be fixed:
     11 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any
of the regexes: 'pinctrl-[0-9]+'
     11 (mediatek,mt8188-mdp3-ovl): 'oneOf' conditional failed, one
must be fixed:
     11 (mediatek,mt8188-mdp3-ovl): 'iommus' is a required property
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 12], [46, 186],
[46, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[51, 10], [46, 186],
[46, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 12], [45, 186],
[45, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[50, 10], [45, 186],
[45, 191]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185],
[46, 190], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42],
[49, 8]] is too long
      8 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185],
[45, 190], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42],
[48, 8]] is too long
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 24], [51, 25]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[51, 20], [51, 21]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 24], [50, 25]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rsz): clocks: [[50, 20], [50, 21]] is too lon=
g
      4 (mediatek,mt8188-mdp3-rdma): power-domains: [[67, 15], [67,
20]] is too long
      4 (mediatek,mt8188-mdp3-rdma): power-domains: [[66, 15], [66,
20]] is too long
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14,
1], [121, 16, 1], [121, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14,
1], [120, 16, 1], [120, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14,
1], [119, 16, 1], [119, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14,
1], [118, 16, 1], [118, 21, 1]] is too short
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 164], [132, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 164], [131, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 164], [130, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 164], [129, 166]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 192], [122, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[122, 128], [122, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 192], [121, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[121, 128], [121, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 192], [120, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[120, 128], [120, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 192], [119, 194]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): iommus: [[119, 128], [119, 131]]
is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 12], [39, 186],
[39, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[44, 10], [39, 186],
[39, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185],
[39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42],
[42, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185],
[37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42],
[40, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185],
[39, 190], [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42],
[42, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 12], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 10], [37, 186],
[37, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185],
[37, 190], [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42],
[40, 8]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 12], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[38, 10], [34, 186],
[34, 191]] is too long
      2 (mediatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185],
[34, 190], [36, 4], [36, 41], [36, 42], [36, 7], [38, 41], [38, 42],
[36, 8]] is too long
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 24], [44, 25]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[44, 20], [44, 21]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 24], [42, 25]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[42, 20], [42, 21]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 24], [38, 25]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rsz): clocks: [[38, 20], [38, 21]] is too lon=
g
      1 (mediatek,mt8188-mdp3-rdma): power-domains: [[60, 15], [60,
20]] is too long
      1 (mediatek,mt8188-mdp3-rdma): power-domains: [[58, 15], [58,
20]] is too long
      1 (mediatek,mt8188-mdp3-rdma): power-domains: [[54, 15], [54,
20]] is too long
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[92, 13, 1], [92, 14,
1], [92, 16, 1], [92, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[130, 13, 1], [130, 14,
1], [130, 16, 1], [130, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[128, 13, 1], [128, 14,
1], [128, 16, 1], [128, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 192], [93, 194]] is too =
long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 128], [93, 131]] is too =
long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[141, 164], [141, 166]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[139, 164], [139, 166]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 192], [131, 194]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[131, 128], [131, 131]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 192], [129, 194]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[129, 128], [129, 131]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[103, 164], [103, 166]]
is too long

