Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B1E109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPCFRtgX3A3wlaUT/6rWyHaLSFxVZ51xuZ7BWdsOpu0=; b=yw5kX+tkuF5VtMBpREh/EWN7DD
	LmbIjooFlGDyrjyPjkwVT8AGWoHAQrY08PkXBGbm6wdyvRQBAD33Gk6fNxxOLCL/OPAilzbV51qWJ
	ZlgVkuvT1KTXMOn/nYa0CUHWSUOlRFrkwRMseOJd2twqJkKZFLKWyDfOvNvRPZxy/7frcwtOXOvIH
	rPKGrbf+KEsygXEarrCc2Oys9tNCBE9E+lrB/vE7dEE+Mi5/6dzVukwTAiBE7k9jkrW0IeV1eC++E
	uL0smBfx357uSDh9Kg1nD1YJXF7XFdAIWCwaMojuciX8unpjpnyeVnrvfiJDAp9Nd9UAGj/mBlo36
	69RIXBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IUO-0000000BPMl-21gS;
	Thu, 19 Mar 2026 18:53:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IUM-0000000BPM5-2Vdp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2D6E41B4F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 18:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4508C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773946377;
	bh=hPCFRtgX3A3wlaUT/6rWyHaLSFxVZ51xuZ7BWdsOpu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X+lEj5y0jCylLOuWl4R4Lgi9gOz3ujHDeWkRbyA62cN/P/51ZWHqxkKyROJOgPRZr
	 XzY2xsXICfCJp19Ls99bCgdI+KQ9nZ2l6CXJ+JX+Vn5YnLoECxsdL07hXyVWMs2PTo
	 o6qlXByurdwwt3ZfgzkKk6EWjsDl5uSgu1RpX2nosv3Z3pgIlDg6yPCySta5DngY1H
	 P8s5+2UXTKYx06EuDQdcmlG/4uhFCrimZSlh2i5icRHFE2ZRqSNvRFqcg+gxTwFEsu
	 NJaQDmnz3ZptDSrGPHcbOKMlSa89NYEhjkQdXjIdItif2xhZ8lRnAQIU4UfiyrZdOb
	 +z+nTOo3TOXfw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a5a37113aso14484767b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8Cy2SCbI0Gbm36aDsn81McmagDMXB1T6FpXf8T3hLRl96bv+pGP7oVXxDe4GOjmmi9KbmlIBoDifJqIFDNCDN@lists.infradead.org
X-Gm-Message-State: AOJu0YzYQNCPCZ/zeIQh3W2qXdcgPv7/HzYuGP4wg2ByMNpjlWAZ2eU9
	yvGbjXQvDS7GEqKTTZM5+22AQR6tmsvT+kcV+1ejeGs3d9Q7ne9wT7rQ3H6Q61J7AAR/eWqi3tU
	vghmk/clFlxsmCdOTOIYCVc4tYiJq7FM=
X-Received: by 2002:a05:690c:6608:b0:79a:40fb:9339 with SMTP id
 00721157ae682-79a90c01f52mr2050597b3.47.1773946377172; Thu, 19 Mar 2026
 11:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260317110249.391552-1-l.scorcia@gmail.com>
In-Reply-To: <20260317110249.391552-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 19:52:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsyNHE48G-Y_Xm0+8qdPxFg_uLjmu-ECJ6WhyLic21Qg@mail.gmail.com>
X-Gm-Features: AaiRm513TfYe7uCQq0CzURF2vQO5mlP7suiM71DI8BWW-DkDxWdNC_gZ2eSCMv4
Message-ID: <CAD++jLnsyNHE48G-Y_Xm0+8qdPxFg_uLjmu-ECJ6WhyLic21Qg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices
 without EINT
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_115258_651591_43D0EB8A 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, Mar 17, 2026 at 12:03=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
> the mtk_eint_init function is always called and returns -ENODEV, which
> then bubbles up and causes probe failure.
>
> To address this only call mtk_eint_init if EINT pins are present.
>
> Tested on Xiaomi Mi Smart Clock x04g (mt6392).
>
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for a=
ll MediaTek pinctrl can fit")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij

