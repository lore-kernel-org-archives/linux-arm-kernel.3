Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFC4E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=; b=reRjjlEmXkrvHuNbBQE8t62qzG
	XeTX1L+Mb4SafdThMnmwWW6PXLdGAdXx3e1/51PkygpPu+oCqtAaUaKqNZ67wa3zgMqARpoyJHla+
	W/t3OUEFHdydD+ZZWuXPeV+b7kApJdmfVo+itmqB+ZnARcNGKCT+7/XvEA74CPWbSxVE/Tdgn91hW
	BpkIkwLngbD7x3cwpnzhe/Uzcf+kXxX2AoXZjyY05jrYXShGsJnAMuB5WKFJZtLCTyJ+XAbtfVOjo
	+Gevhy2j/hz1ZUryLFp9hG0WFdJJKM9C+vpfByqndzcKhk248Nlvw1HHUc5lJFPt/a1gWVw4OqwgC
	OjCOjL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIcd-00000004uOP-2DSX;
	Mon, 13 Jan 2025 11:28:43 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIaB-00000004tjH-47Kc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:26:13 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-85bb264993cso924773241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736767570; x=1737372370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=;
        b=FIDMBW1n0uzFLAfzZMapagDFGKtlvlL71hDNaLt699Ig/qwQpk+rRmg6KkA2C5Q9CH
         dA7CkamZJfbeDAuKMRK/s2xQ76ewh9C6aRqIxdCe/sWQ5aEG2XrcwL26+NmT1MU12P9V
         RdDn2Sqfpk/P2rxqOnv7ADtqb+B86DAYXEn+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767570; x=1737372370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=;
        b=D0C2Gv2f4IkyzZJJJtusiqZjInwQq1OzxCHwsoGNyjYW+sZlwWIZPlzghtHyQIpEBN
         1h5kHJe6daqe4w4r9yDAKQ6jNisMeHzPtfGbVkRY5Pm/Ypm4KT983+lhxPYDzwv1GLaq
         HZTN5UWBA0jisR04m9QDXaTvPKfgb3TMB4+A3l6shuULJhh5VcoM/8CnQh69gRa2OnYh
         jK6UGOjhOEyPCBGFwp7VESvaPiJTMkHKX0txN+HyxKLXSK7LTAhwnjenTvQSODq39t79
         5XrL5VLzOHf5w5bYQwEQNHl2PXI8kgdD2oKZNsR6oCAn5Bl3ZuTq5SMj/DJqTNX1JdjP
         RdZA==
X-Forwarded-Encrypted: i=1; AJvYcCWHMb1VPtRvOuOI6Ae2O5Uab+75kpehgRQ4nkzcYzMMwmTf0SfZY2qmeOC4EqZbNdwhGofX1EHKzyZzh+U9i336@lists.infradead.org
X-Gm-Message-State: AOJu0YzpjyCsNgNqbkumN1iEsYEmhhmjJuB6L21gmEYRQKSjT8lNkam6
	H11SxRdNJ6aMXv0HKOdKaNPdaBFKrx+EBkbitiWPhXzCG0+jc4A4lZiqoyXTZgO8lVxgx6/D+z0
	=
X-Gm-Gg: ASbGncvyql1AARlb+oWp9xZzolWYGvStLmw7Y7jKB5Oz04YtCZTP8dn8u4zRlQmP8oO
	5kYCJd2sHeliOkY2NqVH0Sr+FFc0PJc7B8qPCKDz2qWRrH5n2u0hUF8Rv+9NgRUq91fTMFh2MVd
	55miAgeuWSnZAmtYhbHIMjmsUcYf+F0AoHA3AXn4YXQS8xInHtbJU5JoB4FnDP3l8Hbi71WPuxe
	Xh0S1gm/lSL2FSjsh5iphCl/BHHOS8/9hPP7PoNXua5v3+4eFVyt9uZwX60dGzwErt6Ub5fZsZA
	A2zSTH6knV0r89hI
X-Google-Smtp-Source: AGHT+IEg5+j1zCJjrHKbsBS5MrXju/MypUUJs21PmN2YlJ3bO/XZRZt+R66PgQS3sO0zj5PF7nXk1Q==
X-Received: by 2002:a05:6102:d89:b0:4af:bf45:39a8 with SMTP id ada2fe7eead31-4b3d0f41da6mr15616059137.16.1736767570343;
        Mon, 13 Jan 2025 03:26:10 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b60916fe94sm4129569137.24.2025.01.13.03.26.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:26:08 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c15e283bfso861327241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 03:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUrh4RqA+V0mV5JKj/XOPM8mpcuF381009sVtGWbWN+n8I/ORbJ/OP6lBySlBfVo3aSobOioKviarlUShfPvhp@lists.infradead.org
X-Received: by 2002:a05:6102:26d6:b0:4a3:ab95:9637 with SMTP id
 ada2fe7eead31-4b3d0f1a897mr14365630137.12.1736767568272; Mon, 13 Jan 2025
 03:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-2-paul-pl.chen@mediatek.com> <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
In-Reply-To: <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 13 Jan 2025 19:25:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1nionnQ=g-7Ys=D_iQegPebuPfOH5S9aOx73aVh987DMLA@mail.gmail.com>
X-Gm-Features: AbW1kvai0eVMYu31zp3zyb5u2A5YMsTuoKfeRhXsuHOuCIeklBH2XCKHTQA_efQ
Message-ID: <CAC=S1nionnQ=g-7Ys=D_iQegPebuPfOH5S9aOx73aVh987DMLA@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: mediatek: mmsys: add compatible
 for MT8196
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, 
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, 
	sirius.wang@mediatek.com, sunny.shen@mediatek.com, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_032612_043941_810D9129 
X-CRM114-Status: GOOD (  14.75  )
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

On Fri, Jan 10, 2025 at 8:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/01/2025 13:33, paul-pl.chen wrote:
> > From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> >
> > Add compatible for mmsys yaml of MT8196
> >
> > Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
>
>
> This is a wide pattern now in Mediatek: login name is used as family
> name. Repeating the same comment to every Mediatek employee is a bit
> tedious, so maybe you could fix it internally?
>
> Create some guideline for your colleagues so you won't repeat the same
> things over and over?

Not a guarantee that this will go away once and for all, but I can
ping some MediaTek folks via a separate channel, and hopefully they
can amplify this message internally.

Regards,
Fei

>
> Best regards,
> Krzysztof

