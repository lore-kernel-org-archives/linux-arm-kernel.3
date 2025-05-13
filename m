Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116BFC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSW4H/9oiED8YuvwUCwK8tljzzdMC0PFt3czJd30uy4=; b=yYktM5ITm+jw9roic3H6bpIAHe
	RpzLLfDdhKnQWSviQPf70dCslqGLKH/A3YEiPPemh1GuVBw+iivPQAU074yN26K0iivaMnaXhOrp4
	KpnnDRnvmKu8XihNMSlqdLZosB9LR2yyLfMyLScxGUz732+62c0TXUg8eyT9xzehpX4uTNyn79Qsx
	iNvn/mY+qYkPLFvdMEp0U9k/8Kx54ImcSt2l3d6IaNoOQRvqUjh1K7d2QXDEZG6ijs8Oz6zZItRpq
	EfYc/E1NubUU7agctDQxMajDnsHya27LaaHHDvyGLKkYVMFGdJnRvy9KQHaNOWvDNpZUXLdttFPzI
	F8UuVJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEv7F-0000000DLcU-19ot;
	Tue, 13 May 2025 19:16:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuMs-0000000DEzA-08Wh;
	Tue, 13 May 2025 18:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDA54459C;
	Tue, 13 May 2025 18:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9B5C4CEEF;
	Tue, 13 May 2025 18:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747160921;
	bh=oZFqdy+kIx1Uv6kOWi0cVkp8dnOJ+w39voCH+Zy6/jQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QU+uBpTQESUH0g/UHKv9f26yvyg8lQo/NYrLZ3hZ2cyz/4KIpgY9+P94EHw4R5twI
	 KIwMMDbGbTfZeWF1gYGEDGcfBr3YScJbaQ8rpP9rtSa4fJy5v028pmx6AHa/bKn9/Y
	 F2zHbShph86Wz+dFZ85kedZ15aBsfOSVvf58d6aUA83lMRpl8EFa0UHbsD2E5On+vH
	 cytlWqTlDR7jgR/YuJsELBU4qsfCAjOjGJTYfYHG6+5eOixXczqnhVd58eHsth5KMt
	 mlM7C6Z5fb8wcFdQ4/nSt12c3AgILmgbIUyH8BA5B4OPXD50RZR2qs1HHt77rJCpgG
	 wmPRYvyP4zCaQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad2414a412dso513294166b.0;
        Tue, 13 May 2025 11:28:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBAEeMPE6s/lsNuunuNrGH8C/Q94zmmBoUHmGc3R6mSPAWc5yzkZ4O3iWiRMvifWpLFKbeYxUXnzfuYPG8sRFm@lists.infradead.org, AJvYcCXu2NlzTyL6H4eW/MX6OMSClWEi0krpqkXj2CiamHQZqz3jlni/IVWfSbG6xffwhvBbHSzHoTq7p2YnvyvexiE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/I37JMiTdQ3AAv/3RQda1zjhFKgWRq78iUbniBKxpI810diBE
	aoVIA2dXlKHzV+G9Qy8Oi91H3n1t2Vpw2WHItCUmKH3OyAhSz94xgTQsTshqYBH3vEPSJJyfSQG
	r14C7HodTzuc5cChhoeow/FgYbA==
X-Google-Smtp-Source: AGHT+IGyTGIYVGPlikbStjoVI4eRqm0PzFv/QwvZZdDs++dfU9kNsLAIF+uv3q2XW+UBz6tSIkW6ANCiczOOtuUYCos=
X-Received: by 2002:a17:906:d54f:b0:ad2:43b6:dd75 with SMTP id
 a640c23a62f3a-ad4f70d3028mr68659766b.10.1747160919892; Tue, 13 May 2025
 11:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 May 2025 13:28:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKmQxaOUykYfoUCaVe9jg5_fWnoLhxn5j3WmQC1Tm8ZGw@mail.gmail.com>
X-Gm-Features: AX0GCFszPWEYFuT81sDqZmIzjzZQ-10Xx5-913Q8x93yF6d8Q6VPUpzcufQ48i8
Message-ID: <CAL_JsqKmQxaOUykYfoUCaVe9jg5_fWnoLhxn5j3WmQC1Tm8ZGw@mail.gmail.com>
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: arm-soc <arm@kernel.org>, soc <soc@kernel.org>, matthias.bgg@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_112842_121340_900FC244 
X-CRM114-Status: GOOD (  25.97  )
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

On Tue, May 6, 2025 at 6:55=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags=
/mtk-dts64-for-v6.16
>
> for you to fetch changes up to 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:
>
>   arm64: dts: mt6359: Add missing 'compatible' property to regulators nod=
e (2025-05-06 10:35:45 +0200)
>
> ----------------------------------------------------------------
> MediaTek ARM64 DTS updates for v6.16
>
> This adds new MT8186-based Google Ponyta Chromebooks and improves
> support for already supported SoCs and machines.
>
> In particular, SoCs changes:
>  - MT6893
>    - Added pinmux header for this SoC
>  - MT8183
>    - Added port node for dsi_out in mt8183.dtsi to fix some DT
>      validation warnings.
>  - MT8188
>    - Adds an important fix for its Display Controller's Read DMA 0
>      (RDMA0), as it was using the wrong IOMMU and failing;
>    - Multimedia Data Path 3 (MDP3) devicetree nodes were added: now
>      hardware assisted color format conversions are available;
>    - Since SCP firmwares are available on linux-firmware, the
>      necessary nodes for the dual-core SCP were added to devicetree
>      along with the firmware-name property in mt8390-genio-common,
>      enabling hardware video encoders and decoders on the MediaTek
>      Genio 510 and Genio 700 EVKs.
>  - MT8195
>    - Power domains for video decoders and encoders were reparented
>      as the secondary vdec/venc core needs the primary core to be
>      also powered, as those are sharing the LAT hardware and SRAM;
>    - Missing power domain was added to the primary DisplayPort
>      Interface (dp_intf0) node.
>  - MT8196
>    - Added pinmux header for this SoC
>
> ... and machine-specific changes:
>  - Radxa NIO-12L (MT8395)
>    - Added support for Audio DSP and sound output through 3.5mm jack;
>  - MediaTek Genio 1200 EVK (MT8395)
>    - Support for this EVK's DSI display was added and enabled;
>    - Secondary display backlight was disabled as it was unused
>  - MediaTek Genio 510/700 (MT8370/MT8390)
>    - Added support for the DSI display on these EVKs too;
>    - Fixed an issue with integrated USB Bluetooth getting unplugged
>      permanently due to wrong declaration of the ID GPIO polarity of
>      the secondary USB port on the SSUSB2 controller;
>
> Other than that, some other devicetree validation fixes were added
> on the MT6357 and MT6359 PMIC DTs: for the former, all of the
> compatible strings in all regulators were dropped as those were
> wrong and causing DT kselftest failures - and for the latter, the
> compatible string for the main `regulators` node was added as it
> was missing.
>
> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (6):
>       arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power doma=
ins
>       dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>       dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>       arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes

I reported this already with no response, but this commit adds a crap
load of DT warnings. This is on top of the many existing Mediatek
warnings. Mediatek has the most warnings on arm64 and is about a fifth
of the total (182 out of 932 on Linus' tree). If there's a fix for any
of these, I can't find it. Either fix these warnings or drop the dts
change.

(Note the number is the count for the specific warning in order to
avoid duplicates (N warnings for N boards)).

     33 (mediatek,mt8188-mdp3-wrot): '#dma-cells' is a required property
     33 (mediatek,mt8188-mdp3-tdshp): 'power-domains' does not match
any of the regexes: '^pinctrl-[0-9]+$'
     33 (mediatek,mt8188-mdp3-rsz): 'power-domains' does not match any
of the regexes: '^pinctrl-[0-9]+$'
     33 (mediatek,mt8188-mdp3-rsz): 'mediatek,gce-events' is a required pro=
perty
     33 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional
failed, one must be fixed:
     33 (mediatek,mt8188-mdp3-hdr): 'power-domains' does not match any
of the regexes: '^pinctrl-[0-9]+$'
     33 (mediatek,mt8188-mdp3-fg): 'power-domains' does not match any
of the regexes: '^pinctrl-[0-9]+$'
     33 (mediatek,mt8188-mdp3-color): 'oneOf' conditional failed, one
must be fixed:
     33 (mediatek,mt8188-mdp3-aal): 'oneOf' conditional failed, one
must be fixed:
     11 (mediatek,mt8188-mdp3-tcc): 'power-domains' does not match any
of the regexes: '^pinctrl-[0-9]+$'
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
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[131, 13, 1], [131, 14,
1], [131, 16, 1], [131, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): mboxes: [[129, 13, 1], [129, 14,
1], [129, 16, 1], [129, 21, 1]] is too short
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 192], [93, 194]] is too =
long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[93, 128], [93, 131]] is too =
long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[142, 164], [142, 166]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[140, 164], [140, 166]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 192], [132, 194]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[132, 128], [132, 131]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 192], [130, 194]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[130, 128], [130, 131]]
is too long
      1 (mediatek,mt8188-mdp3-rdma): iommus: [[103, 164], [103, 166]]
is too long


>       arm64: dts: mediatek: Add MT6893 pinmux macro header file
>       arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
>
> Axe Yang (1):
>       arm64: dts: mediatek: mt8186-corsola: make SDIO card removable
>
> Cathy Xu (1):
>       arm64: dts: mediatek: mt8196: Add pinmux macro header file
>
> Chen-Yu Tsai (1):
>       arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
>
> Jianeng Ceng (2):
>       dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
>       arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
>
> Julien Massot (4):
>       arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
>       arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
>       arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound ca=
rd
>       arm64: dts: mt6359: Add missing 'compatible' property to regulators=
 node
>
> Louis-Alexis Eyraud (3):
>       arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_ch=
eck error
>       arm64: dts: mediatek: mt8395-genio-1200-evk: Add display on DSI0
>       arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual =
role mode to host
>
> Macpaul Lin (1):
>       arm64: dts: mediatek: mt8195: Add power domain for dp_intf0
>
> N=C3=ADcolas F. R. A. Prado (4):
>       arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two co=
res
>       arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for sc=
p0
>       arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
>       arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backlig=
ht
>
> Pin-yen Lin (1):
>       arm64: dts: mt8183: Add port node to mt8183.dtsi
>
> Rob Herring (Arm) (1):
>       arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,b=
t-sco
>
> =C5=81ukasz Majczak (1):
>       arm64: dts: mediatek: mt8186: starmie: Fix external display
>
>  Documentation/devicetree/bindings/arm/mediatek.yaml                     =
 |    7 +
>  Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml    =
 |    4 +
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml  =
 |    4 +
>  Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml  =
 |    4 +
>  Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml=
 |   10 +-
>  Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml           =
 |    8 +-
>  Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml          =
 |    8 +-
>  Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml          =
 |    1 +
>  Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml       =
 |    8 +-
>  Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml          =
 |    8 +-
>  Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml        =
 |    8 +-
>  Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml         =
 |    1 +
>  arch/arm/boot/dts/mediatek/mt2701-evb.dts                               =
 |    1 +
>  arch/arm64/boot/dts/mediatek/Makefile                                   =
 |    2 +
>  arch/arm64/boot/dts/mediatek/mt6357.dtsi                                =
 |   10 -
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi                                =
 |    2 +
>  arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h                           =
 | 1356 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                          =
 |   11 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi                                =
 |    4 +
>  arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts             =
 |   18 +
>  arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts             =
 |   22 +
>  arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi                 =
 |   49 ++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi                =
 |   45 --
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                        =
 |    1 -
>  arch/arm64/boot/dts/mediatek/mt8188-evb.dts                             =
 |    6 +-
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi                                =
 |  349 ++++++++++++++-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi                                =
 |   51 ++-
>  arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h                           =
 | 1574 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi                   =
 |  170 ++++++-
>  arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                  =
 |  127 +++++-
>  arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts                   =
 |   59 ++-
>  31 files changed, 3797 insertions(+), 131 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sk=
u0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sk=
u1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dt=
si
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
>
>

