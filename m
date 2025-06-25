Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72502C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4mYB4tBUdPUMeyYHKQeTaMy0h6gvtr/bFiZgucNrGA=; b=dsTPmRcHV4u9p3pri9S8p6zmMz
	x/hsgzWm7mUNQpY9+7TahroyyRQYnr3+/OP6nQeQkhnRU+BxYt14gtDSTj1kP52tyNEdPjP+4hPvG
	RHr2QU0L+QHxy3eUc7qzHkqlyetEb5tFGLFzTx1KminhqCyDsdsgfMmqj/sxDKs8mRJGdiAE9oHRz
	QHyRqMjhcqqMbpMAF2ccu8a4JXdWbZgqyNJ6LO+y3VSirwBeU95v4VBVA+s02OfaQuy71PM+c/DsR
	uaBdaqawV9o+bYLM1JuKFCyUPYpRqDfzCTBGurpwezAnDPXDUbUieniXE5hXEL5J3oh9rvPeAPvwF
	KgUbmyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVtQ-00000009l8M-0TUU;
	Wed, 25 Jun 2025 19:34:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURkV-000000094VQ-41of;
	Wed, 25 Jun 2025 15:09:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5102A52B62;
	Wed, 25 Jun 2025 15:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712D9C4CEEB;
	Wed, 25 Jun 2025 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864157;
	bh=K4mYB4tBUdPUMeyYHKQeTaMy0h6gvtr/bFiZgucNrGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mHgmM4BXZJdRLA0AG8FpjshWGQcHIqK9vLXP8xrXwqtKjH22HXCsv7UYj10oqkN8z
	 /LtHvk9uB6Yqvbg54izwnIFlWrolCXxgYCLU+9Ja2dMbiDosKca4o9IYdGzUsVuadL
	 /U1rd74XDe9OV+FGDFgI+a5+P3HwwmB7bsYlo6CDUHT/Eemt9BvChK3orbvOn3llqk
	 n9oNrj2ors43SO9zV7V8ebymMt700XOF19CF8WItb0PgFmxMJVYfPafMVqgAIe+9oV
	 l79yWiLyXnnSwK/S0REqytiLrnXK5ntYSrNe6n2mzp8+K//SrwW/JHfca66U7ij3iI
	 YiNUbuIIeSoVw==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso5187521a91.2;
        Wed, 25 Jun 2025 08:09:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3N6xXSgUdaPXQeCcdNJZfKen/Lk0qUqgQ9SYvu6xIaiGv4JSXCcKQg0w+q8zxGS7g5GC4eVUPUtwEYIpw82y0@lists.infradead.org, AJvYcCVQd5NMFt8KpBnV3+WxaPQmXgfKxFr27BgYYgAJM7Mcbl2GTYerAarcEH1Cc5qmMjvRKtJZUxFxHLXPwix0JNg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo6E1g0hE6ZmJT/yzThPIM/d2+8YyRZI2x40+pAA4Un6sUFSmk
	EvBaAYj5AIv9l2j4KOcqCNbJMcGjXnmbiXUqCXb9M7KjdCC4Cgt2EKyx06O8jsK0cpeqeh2VHSh
	zttMQin0PL56shmvwSDdOg+AK7eBETg==
X-Google-Smtp-Source: AGHT+IHrqFJYwexIy4K3H44OAiL9zqXRsG/mR2uBGM9V193N8VPfdgtjIMDquzLnT+KvD4r/VPBCj9+QTqb0x8H7bj4=
X-Received: by 2002:a17:90b:4a0e:b0:313:287c:74bd with SMTP id
 98e67ed59e1d1-315f26b8a00mr5619136a91.33.1750864157037; Wed, 25 Jun 2025
 08:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250624113223.443274-1-jason-jh.lin@mediatek.com>
 <669aae01778b4dbd49420fff053a6fa59078a9b1.camel@mediatek.com> <6e7ab8ab603ed8ac06c7a6b639f339c1d87f9ad0.camel@mediatek.com>
In-Reply-To: <6e7ab8ab603ed8ac06c7a6b639f339c1d87f9ad0.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Jun 2025 23:10:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SKSwikTwog9aGL1LOdsgbnBFz-7wHRNWxa4fY36_dQg@mail.gmail.com>
X-Gm-Features: AX0GCFvhdG4cEt57zmk3oZRU1MyycMA7E8SYirD5Luit-6MBhB9-QKGa6QYUkZk
Message-ID: <CAAOTY_9SKSwikTwog9aGL1LOdsgbnBFz-7wHRNWxa4fY36_dQg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling plane
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	=?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
	=?UTF-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	=?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"wenst@chromium.org" <wenst@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>, 
	=?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_080920_135856_39ABF250 
X-CRM114-Status: GOOD (  22.61  )
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

Hi, Jason:

Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) <Jason-JH.Lin@mediatek.com> =E6=
=96=BC 2025=E5=B9=B46=E6=9C=8825=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=
=8D=883:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 2025-06-25 at 06:54 +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) wr=
ote:
> > On Tue, 2025-06-24 at 19:31 +0800, Jason-JH Lin wrote:
> > > Our hardware registers are set through GCE, not by the CPU.
> > > DRM might assume the hardware is disabled immediately after calling
> > > atomic_disable() of drm_plane, but it is only truly disabled after
> > > the
> > > GCE IRQ is triggered.
> > >
> > > Additionally, the cursor plane in DRM uses async_commit, so DRM
> > > will
> > > not wait for vblank and will free the buffer immediately after
> > > calling
> > > atomic_disable().
> > >
> > > To prevent the framebuffer from being freed before the layer
> > > disable
> > > settings are configured into the hardware, which can cause an IOMMU
> > > fault error, a wait_event_timeout has been added to wait for the
> > > ddp_cmdq_cb() callback,indicating that the GCE IRQ has been
> > > triggered.
> > >
> > > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > > MT8173.")
> >
> > This patch looks good to me, so
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >
> > But fixes patch is not correct.
> > In "drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.", it does
> > not support cmdq.
> > The first patch to support cmdq is 2f965be7f900 "drm/mediatek: apply
> > CMDQ control flow"
> > I would change fixes tag when I apply this patch.
> >
>
> Thank you very much!
>
> Regards,
> Jason-JH Lin

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
>

