Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21BFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oMGzN03CHJLCXRmF2kf9hbHZWYmgAo98CZVUtghVsQ=; b=ojYboKy3Tdrn+qLk0dlCKngSEz
	hu7DsQ6OzOeu13fSgGod+y0wqRmHN9Hv//vn6mKlK4gESFdIVx7rjKdcUz4uLR6oC2/jwyQ+SvFvh
	Y+HaAMsPe+gTKBpHh9tMSprcst+uKnZpRDl8r1iN+wA+eDksuHtwvIzk+zZBs+N0ItK611D3rweT2
	Bz8k8Nl/k3s/aZkqbnWzgpFPobCxpAJy3RDjWejSHZFqyZMnyrM665UoJn0A/iCUOrlgzRRMRa4Hn
	BFmLkR64bLrB1fN5BmIit/zdWCoG5yp0ANY6zYWNkXrTUiyxOuKAJ22nm0oAAv2Z5AvGtifU3vpqy
	pgpuWbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMl-00000005LB9-2c0G;
	Thu, 30 Apr 2026 11:15:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMg-00000005L7g-2DPc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B9F0442EC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E705C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777547729;
	bh=WbVGwnhMK3bVP2dooowUwCI372Q+68vRv53kKfxGrKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pJDvayFIFBrQ48FV6k0MBJTE7omjJhnCiCKI627UOkdRQaAlxmgxjw/VBYEY2TFZh
	 M75KGSB6FdqISbX8ea1mMWiz+u4xP/OMeXC9zsm1gApiA8nigQ0ib1TzQvamF82WMS
	 gZaidfIliv/1zOe7DntZ9niRlR9DFGCcKjHCxBUVHJzaqOMLqhnCZsZXZG3xgOiu42
	 eIRRcQ0GilVVk2LUHKddLLkgzL8D6e3EiyYzNkzR0MMZXghLMs1iM1sZOx9bS55d7x
	 BY22wMlZaVFDU8tEhDKpCLHrDllX34Ui7ck037ifV8eZvSteD/xP+xRkLC0K1x6PqD
	 jUIkfuOTEZ+/A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so740274e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 04:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+U1+6Zgr8PA+jpdIzH/qAcVtJ9fuAGrY0HL4XO1YAqoVu9PmBlCzMBQDVAOyRBH3BfUk9jO8Zmmk0udzqdVaEh@lists.infradead.org
X-Gm-Message-State: AOJu0YxgEVZxTso7b0DYS/Xs8gRO4x6wPfi+UvWkbo+dqS6AC0ECEjog
	OYv/wivd24F2e6/mXuVyRQZmJ5mQzXBTePcym+ai+Ta1WUGiw2Hk/n2UMIuyjWN77WRypMQfHid
	yPm11L+QPIDZhSnG5ux+eAgmoUuWcuxQ=
X-Received: by 2002:a05:6512:3b14:b0:5a4:a4c:658b with SMTP id
 2adb3069b0e04-5a8522dd8f1mr808421e87.40.1777547728018; Thu, 30 Apr 2026
 04:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260427021148.2049555-1-wenst@chromium.org>
In-Reply-To: <20260427021148.2049555-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 13:15:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKC4o6e2p0qJ6_2s2CfK6y+yKTw8gcGAJQnpOOmML_QQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ink9nKnmzrWklC6PMDhHtyVmdHrdEJDfXlUWMPbQa8lwjP3yaXXRPJm1Y
Message-ID: <CAD++jLnKC4o6e2p0qJ6_2s2CfK6y+yKTw8gcGAJQnpOOmML_QQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041530_583824_751C04A1 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Apr 27, 2026 at 4:11=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> When support for multiple EINT base addresses was added in commit
> 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses"), mtk_eint_chip_write_mask() was changed to write interrupt
> masks for all base addresses in one call. However the "base" parameter
> was left around and now causes sparse warnings:
>
>     mtk-eint.c:428:44: warning: incorrect type in argument 2 (different a=
ddress spaces)
>     mtk-eint.c:428:44:    expected void [noderef] __iomem *base
>     mtk-eint.c:428:44:    got void [noderef] __iomem **base
>     mtk-eint.c:436:44: warning: incorrect type in argument 2 (different a=
ddress spaces)
>     mtk-eint.c:436:44:    expected void [noderef] __iomem *base
>     mtk-eint.c:436:44:    got void [noderef] __iomem **base
>
> Since the "base" parameter is no longer needed, just drop it.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied because looks correct!

Yours,
Linus Walleij

