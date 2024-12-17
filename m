Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13284E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+dl3ly0rdbKwmGKotpv1oO2gk374L+s+XxGWg7hHC4=; b=x1nGQyzMi8fYm9DfXZ2/nUWCXD
	0SqnX/G3o0TASV71HVq1apTg2swiNeReRHx4I7uB1V+21xxXr79zs9qBnkQOMHsUNy6I/Qs0IIDqJ
	52MdhEXqrLyWQmYbF9dR12XQCHox/zV1HRkK0o30OJGX/4sXBk2bQeGJLtLTrLe3YcYypygEve8Y1
	lUC7EdyhOtK51UcDNo0RkE6rIwAmiwN4pxbRoS+ZGIKuldS5PZNiBDrqdKQo9iZ4SQqbBGQWdjmGH
	3qvCQ8FI6DzBFMxx4/LhMf96cegy+ehMabo5D1EZ451M4PAbtsXVpIovOwLs8LbWxGvC1wURg5IHz
	fqVMPt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWO2-0000000DLkI-3lqH;
	Tue, 17 Dec 2024 12:09:14 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWMx-0000000DLbm-1NZl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:08:08 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6d932b5081eso47350216d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1734437286; x=1735042086; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j+dl3ly0rdbKwmGKotpv1oO2gk374L+s+XxGWg7hHC4=;
        b=BlPU+nEZyhPQ7UyQRb3K8a8U8ZnSSFBmNtZ3r20cP538bgMzvjfLaewu1huwS7sIqC
         LKndD2XVx5NTTUu0jxyl7tgVRRq7cBHyrGSCuGE+E0ZXehF3/SuQzb8M/W2fuwoTCHCn
         p0QSrprIh9y55uqvxSTMOp0ndLGfIKtTXFG0vQDVHd84i2AClW0Lnqxdgbc52U8bafsO
         W4d7x7I2VsLK1WnXpNiT3DRBzMrGtPXsZqyjWJ7hZTdksVukP7z3e0Pg+0CHOrlchfy4
         aqcBhjBgZauhZAxbsdzusXufI8btpWKaJdBX0nW0HiM0JO4nxuxIFQdWpanGICTkZGaz
         7dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734437286; x=1735042086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+dl3ly0rdbKwmGKotpv1oO2gk374L+s+XxGWg7hHC4=;
        b=Ld730Agq0L9vuR+gv/D/E/1gShJn9vY62H5ktymucGD0tOcCoNjTmAI5O6hvUvBW+E
         pCxtz5Hh7duAC1L1qWgweNvyNehhJ3g1medvdSz5VUzALT1BM09ebUMixtAc9pHMN06Y
         o2Uw26jqdjOMAEnerTig09AgBJIlvMQ5UyMnK6WW3Q4TM4tK7FRiTN2QNAcY1y0GSH5U
         fRsFVOHoJ0F07nRWlb1rJaXk7ukpGzuKZSOktgcF5VSo4IWLQ+lyyqj4gHpJ42QI1A7z
         K78DaL4pyxOgHFSmau184gouoBRvZnN0QrMJL1SLQJbYHIyH+foAgY31WBkYRKPb3+Wg
         QPQg==
X-Forwarded-Encrypted: i=1; AJvYcCWS+X4lQlkgeOpSsHTU4MNvnQ3KQik3X5HZLSd/o/Gqjexw/kBUG0du1pHlD/coUzMqT0L0Cqznv1Z5NQG99Fbz@lists.infradead.org
X-Gm-Message-State: AOJu0YyXJda2WCUl8wSyXgqspuFJU7KIBHbiHuDVRknRWO5CBq8XQyKR
	TSDTOIzWVSTCOScdAaRSKLpkvp02ibaL3Vlt4KXMPXlkFYiNeu+oMhVMaAHK9QZgFjhmeHYWh3V
	KR5JOIFrnvmDRfS6MbAIU5UB+8zlEv3C+v2zYsQ==
X-Gm-Gg: ASbGncuzCdpJq8c2lRQ5aoiTsuqKJsVxqdJjFYJ3v/tslCqn2k6Uf0SCTU0GysFCSnk
	JVjmSCKz1V5PMzeG/8mcfN35Dnmd4S2xIbD27
X-Google-Smtp-Source: AGHT+IENXkFl1sf/3x7p8kafThXQqXSZZrmYVwhsRzFtxsCkGCBTgLsddU6Li0qrlY45bm/mZ6nEZU9yLbhu5otz4j4=
X-Received: by 2002:a05:6214:d48:b0:6d8:a754:9647 with SMTP id
 6a1803df08f44-6dc8ca57509mr252459736d6.17.1734437285918; Tue, 17 Dec 2024
 04:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20241214081719.3330518-1-andyshrk@163.com> <20241214081719.3330518-9-andyshrk@163.com>
 <CAPj87rOjqZdyht2y8MK7gVyk_eqEzk1Sy0DcxFtQRuhrHQ_oxA@mail.gmail.com> <165af58a.697.193d2100239.Coremail.andyshrk@163.com>
In-Reply-To: <165af58a.697.193d2100239.Coremail.andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 17 Dec 2024 12:07:54 +0000
Message-ID: <CAPj87rMfFXkbyh7UEJQw4JV1R18KLXC3GyF0CznrN1k3UdL0Lw@mail.gmail.com>
Subject: Re: Re: [PATCH v6 08/16] drm/rockchip: vop2: Support 32x8 superblock afbc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>, Michael Riesch <michael.riesch@wolfvision.net>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_040807_468633_AAE66548 
X-CRM114-Status: GOOD (  19.07  )
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

Hi Andy,

On Tue, 17 Dec 2024 at 00:41, Andy Yan <andyshrk@163.com> wrote:
> At 2024-12-16 21:06:07, "Daniel Stone" <daniel@fooishbar.org> wrote:
> >On Sat, 14 Dec 2024 at 08:18, Andy Yan <andyshrk@163.com> wrote:
> >> This is the only afbc format supported by the upcoming
> >> VOP for rk3576.
> >>
> >> Add support for it.
> >
> >Out of interest, how was this tested? There is no 32x8 modifier in the
> >format list in format_modifiers_afbc[], so it seems like it shouldn't
> >be possible to get a 32x8 buffer on a plane at all.
>
> The 32x8 modifier  added in PATCH 16/16:
>
> +/* used from rk3576, afbc 32*8 half mode */
> +static const uint64_t format_modifiers_rk3576_afbc[] = {
> +       DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +                               AFBC_FORMAT_MOD_SPLIT),
> +

Hmmm, that's strange; I applied the whole series with b4 but wasn't
seeing that block defined. Maybe a bad conflict resolution. Sorry for
the confusion.

> I write an ovltest[0] tool which can take linear/AFBC rgb/yuv data from a file, then
> commit to drm driver, I use this tool for most basic format test.
>
> But when tested on weston, I found that weston does not use the AFBC format for display,
> don't know why.

You'll need a Mesa tree with e0f48568c7f2 included; if you have this
then it should just work out of the box.

Cheers,
Daniel

