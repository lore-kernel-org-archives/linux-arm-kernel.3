Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C5CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcy7vptF/hy+DPHjB4Gbv52wsdaMVtOZt/3bPVoHJCQ=; b=qC9PRXl7Li/oNWpNNHBl4+jhrU
	+lzuuppEqFvOe+We7z7HdKLMOxQWft6TBifWp1KGIWg6QoPC/SCtBRCS9baN4SujcT4lU35S4h/b8
	GjxYcuWp/v1Oe/MwcOd5YQfP6Uge5v8ISitI5RWvTmna7i1wtEkYMpr6YtYxttcNyU0oza5luixdX
	RmLLINGmBHXnxcMTYZ6OxyqqRI1jt2bB4CG6YbAOTHZOkbyt+kb+zu5wyMLu+APEIEnrD3W+YFzds
	emWyE13m5tQzpr9OGwWz4ZxbWpILzKVfoZW0QQyhBMVl20eplknr6CP7EHQ/PGuJoB6wJHZWO0AN2
	pMfqVW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5yl-00000006kp8-0PUA;
	Thu, 06 Aug 2026 21:50:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5yj-00000006koo-28DW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:50:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C396943DA6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984A91F0155B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786053016;
	bh=xcy7vptF/hy+DPHjB4Gbv52wsdaMVtOZt/3bPVoHJCQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ngV5zpVu+weQOpvh2gMXaltxq8rXyXczgW76DqK2uqSDkzlHCp8bcelPQ7d9NZqWu
	 9qcU6Qmwhv0CHSXt1hjnP7i9hY6paI1gyIO8etzTx27D5tz0rjwJMs7odjmk8Fr/Fu
	 kD8cNNMtuOh7eTnilBSaWt+3HS5KaxzCmqjHLCDnEobNlUay3H5N/UpT8jXqE4EXbu
	 BWkLtbYFL/vasv6axsDMLMoFoOc+KR+15lE4BY4TnTwXM2uhVshbKk8FTOlfGLEKbO
	 gulS2mOt6lSwEKUHsnrowuAx8G14Cr2r/6lHEwtvFRkrshhUrNj/uSVl2Bk70oiAoZ
	 jB2+/rorUgz1Q==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1987292e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RouMVCFGNGxhBUas0D2x09mBMYnQYeYs084DX0wOksAWAVsV7PoVpMyCbAv5SyT/8HUk+jikuo7k7Jo6OSiF4LC@lists.infradead.org
X-Gm-Message-State: AOJu0YzzjBVhiKnw898j12bvcQjjhqtMOsgH7bvSTQAObw6t+wLkdFMQ
	iXRe5TYPfjcYY6oOS94AJIvdHCC8yePF+5PNQ2QTxVU/V9JmdDPgfDpsXcD+LXe76HYEBo74+nG
	IiuTEV8tqEIrETWjhdG4a+sbl4qOBlus=
X-Received: by 2002:a05:6512:304f:b0:5b1:5807:50f2 with SMTP id
 2adb3069b0e04-5b303cb381fmr548646e87.43.1786053015336; Thu, 06 Aug 2026
 14:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:50:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLmFruzsuSCgzKCZoy63dgTPi=Hci-xgj76315ht9ttFyQ@mail.gmail.com>
X-Gm-Features: AUfX_mz1H-BHPNicMG_kro-JKcpFPgsijOdPLrxM4JqaXBQO7QyYZT_KtNKmkEg
Message-ID: <CAD++jLmFruzsuSCgzKCZoy63dgTPi=Hci-xgj76315ht9ttFyQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Keerthy <j-keerthy@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
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

On Sun, Aug 2, 2026 at 4:11=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
>
> No functional change intended.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

