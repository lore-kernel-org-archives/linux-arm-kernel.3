Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8285ACD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fhFev+xWAooVTT+tM9hoBXOCTAMaZYFzCvirUusCO4=; b=RLcjY2/4kp9RFU6g/p2XGWS7+f
	NoYJIDGaOTCLaoRKJrUJc6hsLFsA4A9Uan/127ZF8VYU8+zMwuSaKmGYNkl+HN8V6Lh8wJzqVeXNP
	6VUJZjj6DM/ni/X30gX2tY0BbGZwaiiJzAed3FpjO3fM6CN0ARU7AKoLPY6s8nYSsJi3zrVyzATj3
	EIp8jMAnJG9oRi02TOj57Mv2M6vj71VHPVCrJr0Pv5NvK5LWs2xE2Hcc7LoWQ0HHui1BzpZzx4wQ0
	OGG5B4z//YMT6Wv6ly3r1XD1Hc+nYb8BTOHLiQ8wAGdT2QWxdtD0g2Ybx+mpcBcr497I/s9IxJXH1
	HKMqgybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyvn-0000000FyOU-39Ex;
	Mon, 18 May 2026 14:26:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyvl-0000000FyNe-2Ko4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B4D8434DF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11DCC2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779114413;
	bh=hm+pya9FfihN/vfpg8++W+yWh8lnVDDOk1psXq+CI/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vCY1AWCq63YDIRhRIg8pRz68eEPzXnj0ZixhlTK9Nkbcs4CG8tTj1eQXlqnK4M6WL
	 uD2pHi1p9nC5ZLUGNuJzz1OGTWx/oPnu0M6cl6yRl6GUxUdnTPTpXOy2EmS7xtY7c0
	 nf1YhUicPLVgsnmX7OU+8ybYl4jXJyrG/2FhSgfp7gSWk/JOpRpMA7T8TiJKW67tBk
	 aiP/JdY+E9w3Eptue1axz0XrPBskwuPxe4WRgF/JZx6JlCr0p7RKQY02EYDmojfBnH
	 Fb9U082pOMXNSGzIvxzh0xM0ZySnGi4eEoOV+fBL5TDTf/xwd6HodDAccokFwigeGe
	 Iz9jTy9wuuZZQ==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-132c338a537so2135361c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:26:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95vB1un/OcL5gN79LigTLHu05optYT1jx2itujV2i5+5LTsDH3HUtaOOvL5zpxHd4V/1f5t3AtagsgFlrKO43n@lists.infradead.org
X-Gm-Message-State: AOJu0Yw80/Wrs/0K2mULU6w2PVCveXDCzufPnWEvXwVC1HfsK3f1d6K7
	rZX9p+xI+FpVlxAVhJ1qosSkK1jpWcJBgS2R1EyV1nI1OTvy4UvgoJTmu7dMZRP0+qrzYpfv7yj
	qBIUVb+l3p3jHEoiHYPJDmuGCqphS3Q==
X-Received: by 2002:a05:7022:128d:b0:12d:b8e5:5e2 with SMTP id
 a92af1059eb24-134c8d4f477mr8519239c88.23.1779114412312; Mon, 18 May 2026
 07:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
In-Reply-To: <20260429-mediatek-drm-fix-sparse-warnings-v1-0-d95c4d118b83@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2026 14:26:40 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8ra9pD7CuJPP+KtP3keQmRBhy18ci+6tdCCmdzY_wYqA@mail.gmail.com>
X-Gm-Features: AVHnY4Ib1xGbXsskUH68KIQINuq9-DNUQmBWC2ptMW1dekY9PU2APVoyDwlBMvE
Message-ID: <CAAOTY_8ra9pD7CuJPP+KtP3keQmRBhy18ci+6tdCCmdzY_wYqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/mediatek: fix sparse warnings
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_072653_684699_38F6942B 
X-CRM114-Status: GOOD (  13.86  )
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

Hi, Louis:

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2026=E5=B9=
=B44=E6=9C=8829=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:59=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> This series fixes in the mediatek-drm driver the sparse warnings
> reported by [1] and two others introduced during v6.16 development
> cycle.
>
> The series has compile-tested and is based on linux-next (tag:
> next-2040428).
>
> [1]: https://lore.kernel.org/all/202604132044.fcYjEcU8-lkp@intel.com/

For this series, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Louis-Alexis Eyraud (4):
>       drm/mediatek: mtk_hdmi_ddc_v2: Fix non-static global variable
>       drm/mediatek: mtk_hdmi_v2: Fix non-static global variable
>       drm/mediatek: mtk_cec: Fix non-static global variable
>       drm/mediatek: mtk_hdmi_ddc: Fix non-static global variable
>
>  drivers/gpu/drm/mediatek/mtk_cec.c         | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c    | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> ---
> base-commit: 0f3ef35b0747832b58b97171bad99011d084c6b1
> change-id: 20260424-mediatek-drm-fix-sparse-warnings-7404de18204c
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

