Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BEF105F7B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SQqEnyd8Ym6Ru02MK+S6GOZ0uWuE7fHmLVfyAGsPMg=; b=OXQKgPgoyxjBkp
	OnHpulKWMH7v7fgP1IN/8zjVgntYDPKNtq7B2H5f0IV7DV+8Z6ZahFFXQhhw5YI/638L1Ry3dX5ag
	xrA/bSMdgzw698RorXiY7Iav1l8sA8i0ZiDnBhjcbrqHRvR6cSYa7xhWJexxI7OjN2xoICVoymcQu
	UGqQ26GPF4xav8wOK+VPtmoBfy2a1ZUjxudKCTxqIM386jeJMFbCMUaHxVaFVjPPFWzL9hgoleUT1
	yUO8Y5hRzFrcm5NfUF249+4xAbirSuio/9zTQ/nRJrfgJF4yjxBzQl4PPD9gULaKw/UYsPnnQ5kZv
	gGwWos4tFitvDf4qvaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KHQ-00000001cyj-392K;
	Sat, 14 Mar 2026 08:23:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KHP-00000001cyb-2S1E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61F476132D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 08:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB8EC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773476606;
	bh=8SQqEnyd8Ym6Ru02MK+S6GOZ0uWuE7fHmLVfyAGsPMg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=cOzy9GC2DTXK+k4f56wA61QizXLZqFsQsaIxotqWcbToMEH6t45IiyoLwP7PQwUfi
	 EqsUzYVoG/gCZ3/NiPEikqjSgYPbdBKnftK231OidPGL3CTHN1Q3YAlZWMFpLufIJC
	 OD4VuvW1vcBHgw4QyU91qWCFOc2tfSnodnH5lLnQpChol1eFLs1WE7jBs3e35pL9bj
	 mPWj3e8V9iemQTbu10sWYqLUylh4/JM8/kV+hzANClhob71xRLK1rzOd8LErw6ZiIL
	 lctd3lFlVK3JSMcV2N6HQWNrVBCNrm8z+ft9LbyBAX+9EQ7lvApDpGfpZwLsCchnIO
	 qhNYtW+VIGV2g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a41026318so25672121fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 01:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA+Ni+HPpTrn9yKVbe01Ka5vPucXf/xSLTjNBqbe3u76XjwamTbOfdHgCNOxgUWwQswPP5YtTWx/0jbH+NMSti@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQS1VhHDX4DFDByhO0l1hQut1m32XLf1roXgH/zlPjXPdQLhq
	Jl5eErnubX96HXeA6dxXcisAGzG3w5xSlReYVz6VFwImhmBDj0pYv3DNT5SJr2p882cluxgIQ+m
	aFbkNQTUKskTjkLkXk2mDgomd0k8mO/o=
X-Received: by 2002:a05:651c:198d:b0:383:1c18:adfd with SMTP id
 38308e7fff4ca-38a8965a613mr19950571fa.7.1773476604352; Sat, 14 Mar 2026
 01:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
In-Reply-To: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Mar 2026 16:23:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
X-Gm-Features: AaiRm50WuEF8U-AOW_wk_AUphFoKyP9ESXQMp8H01_1K7MXDXNBxQrTOlyOt8gs
Message-ID: <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Mar 14, 2026 at 4:10=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.
>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>

Interesting solution, not at all what I had in mind. :D
This fixes things immediately for sunxi, and keeps proper pin lockout,
i.e. one can't use a pin muxed for other uses as a GPIO interrupt pin.
I was hoping that the maintainers could provide some guidance as to
whether the core could provide helpers for this, but for now:

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

