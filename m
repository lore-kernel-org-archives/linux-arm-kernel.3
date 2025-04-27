Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCC7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 01:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSyjwgHmK5I+pd1M52xmmRHCzAj4gkXerhDj4y/bZ3E=; b=vAtuQy6z9dmfZkPXROmE7ZJ/lv
	DRtuDNebmNCLCPky2mEHDOFyRUhVPWTMMnwiD3FX1eTzY8bkMHnIRZdP5ummLvzLE4QlkEvdS4Xz7
	1k5fjTb3dhokB6FfwQMLDiBjCbP3bBp7X4M4SWws+qgUCZ7dgRNlIrHxoocZsy//jypkBKulsjOwL
	0YpO+05Fi96TCOURnB/iquBuSjuNy+LNx3o9VTiM7pDpGpB5ij3ZA8xtMdgAGA+g4K7jgVuWSWVTU
	e1Ahc1iKXYHlumOlTw2v/4w9xdXboKVImYElMW+847+JCOmaOSjhTXs9XbOt4gtAX6LuuOjZWLLy/
	bSkcm/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8r8T-00000002kDn-1HQa;
	Sun, 27 Apr 2025 01:48:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8r6W-00000002k4i-1eZh;
	Sun, 27 Apr 2025 01:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B7F8A4A596;
	Sun, 27 Apr 2025 01:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9B9C4AF09;
	Sun, 27 Apr 2025 01:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745718407;
	bh=SnY0OVfoDmbXp5koX1Ut+7k1dmo/CROGEsXd1gmHnO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OjxSi1cn6I5f6ICjrjhXad56TRK1i+y/AHQUc/5otvDDX7e8TDm1YRqpkH4hH/fyH
	 0YFMywvkD/ZkBq/p7QXyE7sQFYbfvlTbECFwj1fRASa5Ffu1GHwJUtWXlOzEdR/8BF
	 WBIT8efXIoqHNb9FLAnQreDsJLDiRFPlTUY05MZh/0jSH4YF8mToo4nuPrxNmT1K+2
	 +MvbLrUEaIIvlAKsKRlTGJB/G3y0xRhWBd4TZ8+xfBs18SV6LKPdxtiux/pA95X32x
	 lEeECD631518qCrdROzHls1T3vX6194Fr4Cy7239dOcsEkt0LyidiDrBnf6URhFngi
	 3yDVgCn/TYSwg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so5520462a12.3;
        Sat, 26 Apr 2025 18:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjRVDBh11mP6q8eQV6grTRHztNjy+356ahql8LVU1OhUqPmZsqFiF2OB2xdJ6mPZtrZb3ZM5JgwAOELm9EPTL2@lists.infradead.org, AJvYcCVKmTXutGnijEwlbWoBhYAi+M7I0Rx4QLvmF+LTwTjREQMuVcf9lnvCOpwXt3/P7UkRWvFiPW1/Y3YHSMeKka0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXLB5tIIgCi0kIlTmT3pCzLDpPPRmUtUrLrkE9xhwukirgy6LM
	sgPlJNhHpU3CoRTZMd30g7VF+CK0G89QiJ6V836dbn8Y7VdY1vPQihr9cp7NEAbW4/cbe0Idhxl
	1UpCK2yE/T/YQIrUIFCkuleS8Gw==
X-Google-Smtp-Source: AGHT+IHwFnZmrXrm96vl8R7jE4+InC0lzNGtdGV49DZM/HkH0U6QBLErQWPSVSddA8htDu0Z5bOVhme32UVMcNPgYiE=
X-Received: by 2002:a05:6402:3582:b0:5f4:370d:96bc with SMTP id
 4fb4d7f45d1cf-5f722673ab2mr5556823a12.2.1745718405627; Sat, 26 Apr 2025
 18:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 27 Apr 2025 09:47:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-YRTsGZc6BK+Z55S8vDtyRiK8+YmH5ot9S-0uZ74ZvLQ@mail.gmail.com>
X-Gm-Features: ATxdqUFIcH_9J8n0sw5vPGyhuF-f63RdB61FF-kV0-kFcASs5EUXu7xSvR6Jfcg
Message-ID: <CAAOTY_-YRTsGZc6BK+Z55S8vDtyRiK8+YmH5ot9S-0uZ74ZvLQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] MediaTek DPI: Cleanups and add support for more formats
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	lewis.liao@mediatek.com, ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_184648_564185_36694C88 
X-CRM114-Status: GOOD (  13.39  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B44=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:13=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This series adds support to configure the MediaTek DPI IP to output
> more formats, such as YUV422 8/10/12 bits, YUV444 8/10 bits, BGR 8bits,
> and RGB 10 bits, and also performs some cleanups that improve the code
> readability when those are added.
>
> Even though some of those formats are also supported by MT8173, MT8183,
> MT8186 and MT8192, I am enabling them only for MT8195/MT8188 as those
> are the only two that I was able to test.

The whole series is applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> This was tested on:
>  - MT8195 Tomato Chromebook
>  - MT8395 Radxa NIO-12L
>  - MT8390 MediaTek Genio 700 EVK
>
> AngeloGioacchino Del Regno (5):
>   drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
>   drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
>   drm/mediatek: mtk_dpi: Add support for additional output formats
>   drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
>   drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF
>
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 117 +++++++++++++++++++++++++----
>  1 file changed, 102 insertions(+), 15 deletions(-)
>
> --
> 2.49.0
>

