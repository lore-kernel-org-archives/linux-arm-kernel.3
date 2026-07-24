Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A7BC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOPaKmNckDvcgQmmExHska8Z+3r6aiIwmxBNHoTxxaM=; b=nD5iTuIcZcdrNUgB5yx4CMPE7h
	TYXNuwKoncXUKKLRDHN+iOxLLnUl9zlQvxFpf0YikMdTrKYW1Wj67k6jmIKZdJZ8Je7AqohJNtvni
	hXyUENHz40gjDA0dFR9NtK93uImJC7SK5ONuoFs0g9teM1dPKV9LDhsCh1cdSfNd/U8DyPtd1iAeV
	t4cZEUgkfBHGVoTq9Ooa7XrUSeLx58lfBgAefFfK8zCvUz9j4ZI+nyhpzpVgEl0krt7gv8pZygIBc
	6jeQ1zFd3TjKY2wcR7L+OBqjCmLcOtfQDVpVdQfQB19ADZ5btc0YpVJPn9XZReaKwCXO7RnsNVuse
	NJ1D5iIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOAM-0000000HISY-3Bfx;
	Fri, 24 Jul 2026 22:14:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOAL-0000000HISH-1lZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 22:14:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EE98600AD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 22:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5788E1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 22:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784931288;
	bh=TOPaKmNckDvcgQmmExHska8Z+3r6aiIwmxBNHoTxxaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LtHfqT3sxiWYryab8npI1acPJKFsfGsVSzgUgoFGYGeiZDK5rIqhQYMh49wBjXSU+
	 J28V3wNf3pHBVk0Wdvj2m9AYfeFf3IvHZj0qctHZMbgRO5AAmuDCo870Dvy1dlMdkv
	 Z+NTiXip/JjIYyd1bNpkk3GW60keNeZcUPiNRr1znqzCZCQfdo/I4axuNfcDbtDa3v
	 3eIl2OVHITS7qU6YKrkfNcJ1+ulkWfuQUcVETYEFn9YkebqvZkZLwCbHd4zEFXUN0w
	 hxKxFVUdPWJMEd0HvtqNg5h+BeV/LXdEwjrWHu03oKI7mBaB15+8Jq5LY5AatJ+t0k
	 eatiAyAMIVAkw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so789717e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RphamPUstEs5nrps+HLJbTWvw1mtM8iHdr6XZh/mn59F9J1qNNwwgNT7MjlkvASKpG0/PLbFSN+uJ+0LZNvo5gT@lists.infradead.org
X-Gm-Message-State: AOJu0YxjX2S6ymNmtvOaq1uaQJSVZydskU+LD7onwfBwkHbecVCYk/I0
	Kbh1Qmq+tr1e6pAZV6IjMA9TrDse8jd9++/9pTPT5+K1oZWuwK34xW2Xv2gFc83IGUdXkMrS6H5
	r2Uzr8bsGN4kB+Bah60YbVckuJI6Xsuo=
X-Received: by 2002:a05:6512:3504:b0:5b2:8de5:ce9d with SMTP id
 2adb3069b0e04-5b2b2f74b53mr1739071e87.50.1784931287156; Fri, 24 Jul 2026
 15:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260717080045.191538-1-panchuang@vivo.com> <20260717080045.191538-8-panchuang@vivo.com>
In-Reply-To: <20260717080045.191538-8-panchuang@vivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:14:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVWUVAnb+UzUPCypHid_r68C0JFaSVdTSw1jftnpJ2Pw@mail.gmail.com>
X-Gm-Features: AUfX_mwHY8wlQTjuQQHMEE-3RVHYLAEpXSek3Hma4TN9-jsazFca-kzi2Q8HfIs
Message-ID: <CAD++jLmVWUVAnb+UzUPCypHid_r68C0JFaSVdTSw1jftnpJ2Pw@mail.gmail.com>
Subject: Re: [PATCH 07/12] crypto: sl3516 - Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Corentin Labbe <clabbe@baylibre.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:GEMINI CRYPTO DRIVER" <linux-crypto@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Fri, Jul 17, 2026 at 10:02=E2=80=AFAM Pan Chuang <panchuang@vivo.com> wr=
ote:

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

