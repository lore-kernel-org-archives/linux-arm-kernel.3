Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB11EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dly2a8f3IW/oWjPBuL8fZv6s8UgI5PKrdR1UMnyqqeQ=; b=a/ZS5N3F3XwlG+AF+z7xmOWkli
	6YwJO+sLAehLxVrMcr7N53uXQRLipMOHxQvxJHouck2lqhYn5Yxs/zAtZRWFTmX+rsS2j20FGqMq5
	Y+KUvUYR2mYY7OVfaZQ8wRcU7H+e+bBbIgamnqIoY4QGtplj7wHi796G9by+Kbb89HIcWG7LCtHsm
	TXr7una4WJx63DTucp+flOifHS6k9kHy4SCiCiz0ySKZFQmHjWij5X+7Al9yYh8lrL30eOddGx8PQ
	lEqUpAD1w/pjMWwJj8qBKU5/ygtc15TlBXbYMzGF2IsgQ9qonCsXhSw+tpHYbFw+Da8w52NkY6ifk
	755yrfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuXV-00000003U2U-43MS;
	Thu, 09 Jul 2026 19:36:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuXU-00000003U21-1ivx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:36:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FCED43F87
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 19:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1455F1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625764;
	bh=dly2a8f3IW/oWjPBuL8fZv6s8UgI5PKrdR1UMnyqqeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i8q+Jr2oLcdULQBrmuesody31HxF1nJz5bSx0ZDJh95xbWIg0fV/ibc1kqMHdT+6J
	 KYH7vUp/Ydb4+0gLZ8H8fA1v6PIiQ8/HV33019e/WMXJCKNOpZt7NrGupuceOrIXK0
	 5uEetFiXybR5uOwb1UB+OTn16d7D5ZLxacjOzMn2Wh7zo39PY7t1qyDy/VbPYVfPMf
	 fbS9DDdchzR8Bv0ewBX+wy1cmRcruZBJfz+iy+xENZ7vPJoML8UMZWzpeVGsk7YFbZ
	 A+acBD+5H/KhFa5hx3nuWEXN+9HC7xVf6yBXG0SprqIMFoFjr3MzdFQ8xgIRlgyHpM
	 K7mSS0IGkd7jg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b00d1e7082so124539e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZ+SMENC6H2Ld15OXQlyYsI7orvfEa8gJpodjQocA/2kQkP7Mhu/d9y3RVNWzQo2TqadJCsTLe7SWp5FqSJESi@lists.infradead.org
X-Gm-Message-State: AOJu0YzqyGPeAcVg6+H2bl5ltV8+1nTSgLnufCHEF96qp4uBVTHqQR5H
	mVZ425IMzh67FSnuJYBwBSktteRLtrikUMekPPW4XG+/3mAOgadiuA9lyTpHUSlOb/6VCDIeZvc
	2uxLlE73C9goZzztjIPNrmGJXp9NOnrE=
X-Received: by 2002:a05:6512:4287:b0:5ae:befc:97ac with SMTP id
 2adb3069b0e04-5b01147358bmr1837128e87.55.1783625762855; Thu, 09 Jul 2026
 12:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 21:35:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5A+qcU4FQYzBPOVK8t+9xPRX5p9ycijkwOa4Oh1XJcQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiwakv_8MfFTK61QSlgw1o70cNyg-w0pnD1Pyj-FexX_pcKllaNbNT9oU
Message-ID: <CAD++jL=5A+qcU4FQYzBPOVK8t+9xPRX5p9ycijkwOa4Oh1XJcQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] mfd: Use named initializers for
 platform_device_id array
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org
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

On Wed, Jul 8, 2026 at 1:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

