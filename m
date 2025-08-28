Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF90CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iikKpnY3clq6EDEGi8c+zEbaWXwCHdwKnDixFM/DWwM=; b=Ywwi9pTcnINCIBKJ5FT9lRlQEM
	7OvynTsLfxeRklezKziNS7W+YvjOXUOKJylLtr6QFKMmfroMm3jQ1KcpwG2g3ovvaG/0j3uuaqpRp
	XJV5g1aeMOZ1l/Hg1euU2vmrP/OecA0lqaz212mn76X28OOVW3+d823CQRzVRRyWRlnb1EIjpt/Ee
	6hIwSTtof3xuBPjeX4stFpeq4ShZowDgyBAM06J86f2RU4BsFkBJl5rureFqJf2moqSm2YZoXJ7IC
	7cCzMU5vIs9MOn00LXCMgmYtv8f/da/lFlB04DpEbWv3QUuTg8ucgGJ0/A+lgQGIqKrKtjn2Lk+vt
	3zhuKPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmQU-00000003jdw-26Yn;
	Thu, 28 Aug 2025 23:53:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmNm-00000003jKX-3vMh;
	Thu, 28 Aug 2025 23:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iikKpnY3clq6EDEGi8c+zEbaWXwCHdwKnDixFM/DWwM=; b=RBefDwPV6BPZxdPvzv6rIxD5DP
	xCpFJEU3fM7ZOnrt/6acYYG27Ec3lddPLCG4m0L1LOlt60Bz8ryM5iwWWzsKoyOUr6ayyx9d1f3g3
	rnW9WmZQLdaCVqmKTyc3eJB7WKPj+r8oISYkdZZQyhLlsju2HgB308/yxmzBcw04ENFS0Qefd021b
	VCPfjhiBuFWUBOolNgi2IkhfoBYf/Kf6TqvIcQzXt9+TAETJMikEHUv7dV83BEA/alnUfjPJtW/Cw
	CelCfuxXRDuLhjpQzu15457zgLIcJf9PmS/Ib4DVCIK4A9uXdDOhX8Ork+efK3R5ZVcV8hGeiBUTK
	pLEJ/h+g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmNj-00000002ySd-2GRN;
	Thu, 28 Aug 2025 23:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A58044E4B;
	Thu, 28 Aug 2025 23:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9E6C4CEEB;
	Thu, 28 Aug 2025 23:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756425014;
	bh=zsWCFAyMsxiaMzTEC3Gr3yuzGPTx6B+vy48OAuN/rqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lUM2trqD6QlWxEbRGcHnWfAT2Dw6TF/vTGWJnBm3Lnj48ttau7a9jzrHNOqTDhcjd
	 z0sB8EwOiczyD7iNgthyhi+Omu58xYralkqysW54YfQUTMuDqO0gi4j3uDXLV7e9mQ
	 FbKlQ3XrVF/6gGwwfiZ644bMQa8Oic2wG/g1Tli3VZN7dnZo8Gu//4PtFB4tKfKJQp
	 GZmG92gVtfuLoaQ61eXYr1rAjQyOuOlM1DjxMw7CWiyTciFXlf1Jxu7lP/0h0TJPKQ
	 EVtNBY9OIA/EIuO9l5ZsrmiXSoyeQID06KOCFP8BQj6VWd3urFpHeywTWuGvXNF6pa
	 10ECT7tdBeZSw==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-323267872f3so1421996a91.1;
        Thu, 28 Aug 2025 16:50:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6kZL5TdMYVtPdB47b1YWia7wBW+ei3D/2L3DQ1GYeTA5CIVjGmjrITV64FB/gLJ1b4TfxiO/I70ezyDMsXkY=@lists.infradead.org, AJvYcCWMIsX2gOsOvcOQj05T9SvtSW5WGcyS0dLbVrWkKtEbuMGf5T8oBqmitP1etZVkPcI34LK60Wdtk7FwB/xdu9tr@lists.infradead.org
X-Gm-Message-State: AOJu0YzBbRJFOrdpH2PseXHIHTjAMvBI9QNZy64ZP7wnSIC4lQlYyE0t
	y+9PbLEYfEVsFlHztVxGYRaI39ThdsBP5iSyoKkute+qn0yB/Gu1wMGqGDmPcNWkqUwAFaiRCZo
	xDTZ1CWc/id/avW/RFcfv4eJsjdJ+Ag==
X-Google-Smtp-Source: AGHT+IEyPrn2mauZsphfR5LkJf3knFAASu6dleEuuWgWtdTpwoFH8h3V5JmRW8ZSNdzaXyzRk8Y/2ADMz9Ym8II8Udk=
X-Received: by 2002:a17:90b:384c:b0:325:57fc:87ce with SMTP id
 98e67ed59e1d1-32557fc89damr26677996a91.9.1756425013709; Thu, 28 Aug 2025
 16:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250722092722.425-1-johan@kernel.org> <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
In-Reply-To: <aK7VCJ9yOKntjgKX@hovoldconsulting.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 29 Aug 2025 07:51:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
X-Gm-Features: Ac12FXy2kPL9Itx_6-_TK8BzHuWR2wBjPXyw4so4ACn3LaV_swD9vLFI7S9ZLJk
Message-ID: <CAAOTY_-CijzQqrRUf_=cQbTUSybN3GT46q0vx1139mmZub_OfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix device leaks at bind
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Nancy.Lin" <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_005015_925536_3F7FC0F2 
X-CRM114-Status: GOOD (  11.15  )
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

Hi, Johan:

Johan Hovold <johan@kernel.org> =E6=96=BC 2025=E5=B9=B48=E6=9C=8827=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Jul 22, 2025 at 11:27:22AM +0200, Johan Hovold wrote:
> > Make sure to drop the references to the sibling platform devices and
> > their child drm devices taken by of_find_device_by_node() and
> > device_find_child() when initialising the driver data during bind().
> >
> > Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 mult=
i mmsys support")
> > Cc: stable@vger.kernel.org    # 6.4
> > Cc: Nancy.Lin <nancy.lin@mediatek.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
>
> Can this one be picked up?

Ma Ke has sent a similar patch [1] before you. And that patch fix more thin=
gs.
I've already pick up the final version [2].

[1] https://patchwork.kernel.org/project/dri-devel/patch/20250718033226.339=
0054-1-make24@iscas.ac.cn/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
commit/?h=3Dmediatek-drm-fixes-20250825&id=3D1f403699c40f0806a707a9a6eed3b8=
904224021a

Regards,
Chun-Kuang.

>
> Johan

