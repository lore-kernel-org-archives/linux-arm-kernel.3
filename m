Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35483C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkcabmcYCcBrxnwKFSNqoTlMq8l5sVsmuZV7ptzpUhs=; b=Dsg0lLW8KCshqRjmxU9/eMoB5b
	Exj6MspVQROOKvEyIraEqnXhVPqB/V7NChhVzDBDIxnPMQ19ZL4DXRjkV+x30uDzYz/NZJ2Ic18Wo
	X/nMQEs356sOtnznGSeD3kMCb+ojqzFDSqDiFvxWj5rYyiSH3tcwlonINcSM/JfGXg1egxPp2PuWm
	X2o1A2Sfsg2+HLAlHUsrWAaJDSi/X5ApbWN9Vw+ksymJy+SkYrqMMP5ajNkDtKuCR+tCjMJXrcIea
	cjFqNqCo0Kegw/4/rw/nnYn70ldDJl3bJBcptRUc5oOKJruxy2mnN8O6vfJYnAkBZLaMeMvh+Iv+J
	49yBFL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKDQ-00000005fcM-1vPy;
	Mon, 12 Jan 2026 15:52:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfKDP-00000005fbm-14gv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 612D960017
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E75C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768233142;
	bh=ZkcabmcYCcBrxnwKFSNqoTlMq8l5sVsmuZV7ptzpUhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8UJ8IaEpopQ/EXYsnMfDGmckISt8UEqaPIlrsVA9V4pYuvWLdsRW0EkDKUrHwuJx
	 83kZlHNTNvMum/h5bOAws9xHUn2v4fHczgsAmXBEo/vF44IaAChXWJBbn2K1ogLW7f
	 TNoDh9FVoDwG0clkJ732A72BgcdP5JB0pu7qUp7qspza+hZJW5gIdmcdBvcbVrOs2d
	 rp2YAA9rfBU/6yaYdj8TaVVW/a1ME+/cCXj+Y48KZQS+kY1HT5WiDaepDIVyPUwDub
	 AV0+PX3/JHW6P9gLCt066fLSGMuxQZ+vddw1XlNeqMdNeiVzyt4uDG5XCC0vlkfZAF
	 pe7dwOsMs8MMQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382f0732612so36661391fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 07:52:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWG9tjjT4yA4NmQS/TSO21drRRk52bodvBHfw5hfe73mrVLrXHeuvCOajPzJ1Hhi5hp77axhSKN3yzZsxbor7aE@lists.infradead.org
X-Gm-Message-State: AOJu0YxbcLVk7ApQcSpRVF4LK4x06u8Igr2AtnHtfFyUGmdnmqYSQK+L
	IVc+Htxt+9OVqklhuL+o8MTHwTKTskhr4AobbbSdgx7SIszKH8Fehnjj+jSL1sPmc0T1hRv8RQ+
	W8ibOOEJuyI2rj2loN5w9pZWbE7Yy4iE=
X-Google-Smtp-Source: AGHT+IGvtvpe0+JORzp/Ys20P6G9z09DfGY5vS/3Gm+svovxaEP0U/CWOpHfTeAwgDHpI7RPcWpKuzzFp/hRrSMcr6c=
X-Received: by 2002:a2e:bea8:0:b0:383:1ec5:9650 with SMTP id
 38308e7fff4ca-3831ec5abe9mr31087051fa.21.1768233140744; Mon, 12 Jan 2026
 07:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com> <20260112134900.4142954-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260112134900.4142954-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 16:52:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLmD+50JeZdcpDfhk_hv8xZukjAng15woDE_zFaxh=cRqQ@mail.gmail.com>
X-Gm-Features: AZwV_QjeVsmFIXPVAfMxBTLxxVXBlmyoPLa2yVuN3Ez29-sBYgkr3sMPDrlgVTQ
Message-ID: <CAD++jLmD+50JeZdcpDfhk_hv8xZukjAng15woDE_zFaxh=cRqQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] i2c: nomadik: Use HZ_PER_GHZ constant instead of
 plain number
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jan 12, 2026 at 2:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use defined constant to avoid the possible mistakes and to provide
> an additional information on the units.
>
> While at it, drop unneeded 64-bit division, all operands fit 32-bit.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It makes perfect sense, I don't remember why I put ULL in there
anymore :/

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

