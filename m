Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FFCCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC1xNdpfThPoEU7AeOqS+ELgjb12wf5EpBZH0iSZt2U=; b=PIgOAI/qcytOia5yoC5YsHDWg5
	EnVWtABtvJLJW72ydf9Xjxjn1qHJTLozYzQfNg1j5nD3zucN3qckODtPhJEM72qNfD6hRzojyf96A
	Sji+evQ2OUFhqWh0U4O2AIEuMyy/moeFMNoL2+DDGlcFfHHxY+0g+mO1NjyeEBAE1vVrHskoAa8yq
	HatEoUyavuJXlckopqAdmEwy8j1n7k4Z/uPl7zyHENcWEbfI5FK+iTuWq2/Byfc2hkN0WJ519nSNo
	XPjmbDDGNo5McM8Y8H+oTIY92dXVuxo6kpWKLVgRxaKZFUiaGZQLbWD0XcjKdk92qQzYHQwM2oo84
	H1IzB+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhwQ-00000004SbH-1m6W;
	Mon, 08 Jun 2026 21:55:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWhwO-00000004Say-3HL6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 21:55:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7D3601D8
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 21:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850F01F0089A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780955727;
	bh=lC1xNdpfThPoEU7AeOqS+ELgjb12wf5EpBZH0iSZt2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bzSQe99D36YekRvVKmGLFfu3rNXzukdWlW3oMg3HAfj0UNq9D9y7UFyMrAlFD5fLg
	 e6T7hqbBJBeKoFUyFSrtS1Ml+JGWhhx6qBfvf52NoUYuRZafpMmnuB4qg85hHYdYEu
	 PeM/Yw7Anpo97bVrdrK7y19npfD3qQQPASXcXm3lCMkdLOWstQnkOihqTlNtHp6hh5
	 naA5lvqlc/ep1nU7heLQUsf0cA/8dldiaJ15sdsLeqheEN3c11aVCvqEfMDFXuY4bJ
	 cT+qX4RtWWgVqMFWE+/dkzgcIr3+2l60tE8bc0iAnoMwTuf90q6Arna1hn9JNfqT5G
	 7Jf10B3J2rq8g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so5241921e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+9VqTCs5YeQ74Lu+MqRtSi/xovepEcfHmQk2NH7vlrMKUwbuQ0+T3hvwJEmlQ83GoY1PfBzkwwe5sEw+juqs25@lists.infradead.org
X-Gm-Message-State: AOJu0YwTLYOSJ5S9z2aVAUrcACagg0V2YD7MbMHUdgP1KirvoD4qWqCz
	TOWDflksZldKbrGApJZJUbdMBy8kLQxGTDos/lI5qaM4jCAry+mVQ8rfa+6aIgkFpr1bdTwQ6Qg
	qNaWk5vvb5c+T/7+NB6NU6ID9EYW2zrI=
X-Received: by 2002:a05:6512:10c3:b0:5aa:6ede:61 with SMTP id
 2adb3069b0e04-5aa87b535a3mr5504788e87.18.1780955726290; Mon, 08 Jun 2026
 14:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260531162237.5290-1-l.scorcia@gmail.com>
In-Reply-To: <20260531162237.5290-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 23:55:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=g+HBHrisHz5xpCQ19PUAgETg5Aup-TPW=z8OYYbbHDw@mail.gmail.com>
X-Gm-Features: AVVi8Cdd7dUgCoIF72SNZ_fl1W0Mlc5iGGOTuSyuNj18UF2jvt6wdQnX3ggGyEM
Message-ID: <CAD++jL=g+HBHrisHz5xpCQ19PUAgETg5Aup-TPW=z8OYYbbHDw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8516: Fix Schmitt trigger register
 offset of pins 34-39
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Fabien Parent <fparent@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Sun, May 31, 2026 at 6:23=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The correct Schmitt trigger register offset for pins 34-39 is 0xA00.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Fixes: 264667112ef0 ("pinctrl: mediatek: Add MT8516 Pinctrl driver")

Patch applied.

Yours,
Linus Walleij

