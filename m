Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFA5C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=; b=O/+Cef8TkKY0nput+qfD5z5b8H
	iaeZnMTau7CVpjFljMGnT1K5UzNm1X4Q12iaftFpWzbNNs5qiFq41NizwBWCQ3HkyFhAdTbabSWak
	Km/qRh39bUyIk6ptOsxavt9y2Jz+71SNB5Z6S5GMXrwDCkJOeoBFxoMxEuwIZh0RewliUoRSN3RbG
	jRrdfUCEByfNLOm8/jia7I+s4pcTbqneUy5TAcexEPeYXQZ3xy0k8fpjW7qds70bPYK2xKEstUU+a
	jHfDyHmDiqQNnT3/zX4hlkPd+16Nz73eWvpeDLXqs34VZnnjpdy286zZKyP+yvnGWjpH4iGKEamQC
	tQ0GpvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502t-000000098rB-2FF6;
	Wed, 16 Apr 2025 10:31:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yGO-00000008qTW-2SRi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:36:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54963160818so7881063e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792615; x=1745397415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=Mk4R82EaKhkISjJ5NZT3bSFh7UtnZQLNIn5D73p95oZej6t5HBad5qf+oVIGrDvxxQ
         hpip8KDF3gF43LbQOFUui5MFxoOLXYP7YAdQAL5zMidcCkiCvaI6Orozyo2UTPMhbEim
         8G/9i2cJxynI68a1mPSyaygQ2ZSV0b3Cr1OLvqRw8cT1aeiBjFYmUkKqOUG/oyk1jacx
         ZIuYKUazTZ1QDiY2DV74TOxAxU9UjXMVuhjzqfGPeoH6cqXdc4iv7qWF+opLzDhQkL9X
         3oH7GaDrvuqU7gSNUQbM4gJT1/qeoupwoQ8Tn+npEW8Q4H16smpm9cj35OxRi6QupKbT
         8E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792615; x=1745397415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXCImHbhgaHYD5NXAki2E5LHyVFHbeqj7RL6q2PIT+U=;
        b=AYxPqE6FEXg+/yfC4MSg6Na77Tr7dJO9Qp11o/82iq4prDKZOiji5qng/dNcAApEMX
         6ekt28Zt07MktKJGyWZdZEMXfFC3w2Fta4Efr7mab0BQwtPGY1XYV2qzbn6tVw8dO90/
         ujvNyjqE9EfkitrPd8xzBWp3w2j04GGQaxQ/4qj3IVO2fKCob2v9xDE9/20WBegDKdg4
         jxy2nheVZlEGvbtBbmQu5vKtThEo9+EIxDbaYXxqD3D2HF0QJ6EfioM0i9b6qCs7MWws
         T/Db2IQiOCH4YNuFmEG0RlIphoo+Smn8lc7wg45RyxbUdvVx1TgfdbECDpEeDe26Jg9V
         MjEA==
X-Forwarded-Encrypted: i=1; AJvYcCVRonfdG3qgCElOdrdLSEqBVh8AREXQ2vzvbOsUuTNYErCzkVXIlsyYmwoW7EKM2eFKmqx7KKn9c7OUfHtDzXi1@lists.infradead.org
X-Gm-Message-State: AOJu0YxpJeO2s8q6vJQGfBZZ6DN7vqr4zB9roiakyI0YfitvCxvxQd2r
	0gvYOIRUFCjU8iqw2wckpeNTgVTKLqIS4UtpVix3SkFuRZi35Rif15uwjV+jncivKkMV3cEKLtx
	kyN0JnILu7EhTGWZgYdkPkSg6XBeFP+xSaBsfGw==
X-Gm-Gg: ASbGncv2aNkTZYHZpkl2srQQFdyT7QLf+fpgX/CJSOMyOsja3PG2vPzE/LASzIuWaDy
	SHp3N40qhU3cw09eUD9A5LCwP+rNzcu9x9jyTBv1Gmva2rAwq8lh/nPtWRs4VFqbuJm/gruypI3
	QMkUUoEvWUzLO5hG1QAr4/5ksU2vzSX0KG
X-Google-Smtp-Source: AGHT+IFnTyulj/0oGbeIikzilFJSE7sEuMb0JSQLD2qCkdI3QvGlZH639PCmqr2wKnbHsJXFbiOa8zKp3Mk8GGtQ/fo=
X-Received: by 2002:a05:6512:3d02:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d64a7ae44mr362901e87.3.1744792614952; Wed, 16 Apr 2025
 01:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com>
 <20250322035307.4811-2-ot_chhao.chang@mediatek.com> <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
In-Reply-To: <43nd5jxpk7b7fv46frqlfjnqfh5jlpqsemeoakqzd4wdi3df6y@w7ycd3k5ezvn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:36:42 +0200
X-Gm-Features: ATxdqUG40hdym0n5Q2fxGBsUSS0OPVO8ybbpsBi47RVMjHapZZipAk2JRY_FG-A
Message-ID: <CACRpkdbhGJhmNhoS-rqWEtqvH=D_2Q2+djaXWmyEu3o8UEcaZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013656_624572_A6687715 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 14, 2025 at 4:57=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> this patch became commit 3ef9f710efcb in v6.15-rc1. It breaks booting a
> mt8365-evk.
>
> With earlycon it's possible to see a null pointer exception:

Argh, does this patch fix it:
https://lore.kernel.org/all/20250415112339.2385454-1-wenst@chromium.org/

I have applied that one for fixes.

Yours,
Linus Walleij

