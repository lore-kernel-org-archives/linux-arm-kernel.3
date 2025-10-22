Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AECDCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrRSPxugKfBRbwb38s0reG3tqtJvi6mHZloAZZkTJtM=; b=WmkBdGhNNntL4K5Gp+PhYZxYMB
	v4acWU7j5IPaQwPPUOWVUqGPU6pZPNQuybIkUn4TfvzrWqG1cFssnK6InmzSlbQ82qLWdSr3Z1r1u
	UknNC6Ypgw0EY7gh57DURKVcvv3/LPKRwM2pVHckBuy1X7UpdmKVBbFCpsRMTWr23ihOFaWflfpHV
	4Y8insuMWCSOcoEuVArZe2n/Qd7xQaMRGRM79EsPQNr1VEq1GlDK5Qm7qXc3Ns7i7W/WhBTMc/sZ4
	czLs3MTX2EPPQENQAokEok+yJEWTYd/d5W3NWSPyptedpMX788qKfv90IS+CfK8BQEUb5WUa7l6CP
	DOBIkq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZCP-000000035WE-1xq4;
	Wed, 22 Oct 2025 13:48:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZCL-000000035TJ-0C1o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0025543A2F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 13:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D46C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761140882;
	bh=jbBJWUa2D5mD4FO+YopVcu+7lzL7qETV1oQuE65ZYas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qpM5qoeZQsNoRwjYOFORTPLlO9z6w1lZ1UzSvTACk5t8ycXQNg+WYTa1AP5Kd9xd6
	 sSY2YiWIBNupKyFbn5isvNZ2sEssDpM1yhXdks3ikY0j7xSTxkFF6ANXSG6Yxw3OLk
	 BLIJYTcGTatl4bzmxF6GqI9i4kE5MfF0B7YKymkX/5CBk6p4elSqZgQMxyHaFFlfn4
	 sFCpsMsDoIvxg3CdtbF4AfLO3VSPKw9hVb3zAbDGM9vEhJG73Lm9GTKW5ksa90B2Qs
	 UD1PoP4R46adj+WaRYTRqlS1dDU+oURIdF9cF442fYZx2miNz6S9nL8U97nw4I7ELE
	 Kf/KtrvT+Sg3g==
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so6932780a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr4zHDZiv1dxz/rBrsU3OyMNa3aPhvxn6iyH5OzIgTtCvzFHDiD2PQiTBngvXj9iji8XX4bZUKZWN8ooPelGam@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhgy+hP8sN1zugJBCx9DoPHuCRH/hQ99oAejQ8aMZNchX36uhj
	gFGgpR68sYTjGYRzeL4c9dU7HT0dNnZBLuBkzXiv+IxpVoVvV6kPHWRYqgtLzQdLJlBZ6A+X0XN
	JWNdo+IX5aji9A06CFS00G7kgvZ744A==
X-Google-Smtp-Source: AGHT+IFy1XRD8bUn3Ht+foWFb4onBy3I0BzeduV4i7PqazihqftsGN1m+bW8yLWYlxF6eUIqhNEGG1eW7HknFBsv3Jk=
X-Received: by 2002:a17:902:f552:b0:290:6b30:fb3 with SMTP id
 d9443c01a7336-290c9ca32eemr287339455ad.16.1761140882431; Wed, 22 Oct 2025
 06:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com> <20250808-mediatek-drm-hdmi-v2-v10-4-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-4-21ea82eec1f6@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Oct 2025 13:47:50 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8-W8XRsTFDKH69BRA=hurgZ2KOHeBDnixL-LgHObqhXQ@mail.gmail.com>
X-Gm-Features: AS18NWDLymwzfszmU7JKmhTu0CgDInQdk-IxVHYP20sloO1fgKFGR0uo2gWdNLY
Message-ID: <CAAOTY_8-W8XRsTFDKH69BRA=hurgZ2KOHeBDnixL-LgHObqhXQ@mail.gmail.com>
Subject: Re: [PATCH v10 04/10] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_064817_123868_E8990727 
X-CRM114-Status: GOOD (  14.71  )
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

When I apply this patch, conflicts happen.
Please rebase this series base on latest kernel and resend these patches.

Regards,
Chun-Kuang.

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B48=E6=9C=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
>
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>  drivers/gpu/drm/mediatek/Makefile          |   1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c        | 539 +----------------------=
------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 428 +++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 188 ++++++++++
>  5 files changed, 633 insertions(+), 534 deletions(-)
>

