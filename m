Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6374AC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llV8+t5XVFTw1AVjhesFZp1A/YnFQGo0lCxhv7P61wE=; b=zAOuxUAKjUAGy/k8q/0veQJQeG
	7j9l6TXxtGc4VV2XFRHiHzYJsULJm3p5zdKKwHCkV7gNnWqyoaGtZifQSFp7Hettv4GMqwfDLmq1N
	B2lF39vwifN8qkf0kjpuA9tW4XU9GT6ujDLUieLipZThqfYbaFaKQOutTfHf/3mNAAAOp0+11lPwL
	1v7f2k5oVV/6sKe0+wNhiKz7atf8v3Xpk31B3RjD9nXXyChIxyAiGhcp/bUAUjng4Oci1qCj64vB5
	bUqFf/0ZKu9gjGGZ7bpYpChRHf8X/k2Cu+U9zLz+3MUtDHFp904zFdWKhHc3mX6TATt8bg4rkAdYj
	EPyRL0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cZG-00000003Q8B-0rbE;
	Fri, 04 Sep 2026 22:39:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cZE-00000003Q82-3eA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:39:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8285444226
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB171F0155A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561568;
	bh=llV8+t5XVFTw1AVjhesFZp1A/YnFQGo0lCxhv7P61wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TmQSKZ88V4EGqJifsEp+kZ1YixheuM0ONQhC6ST5IL01g+nhibxZhhf862xYvGKiH
	 zsL6NdJqRE+8cN1+VwhP5RbcocJ2qECR7DnI8Iv+IHuT7vV9bFqiv6IxNyNxc7AnKC
	 jvnCWfirZFg+sfpoGgMmQfw5FMbvxJKL8jrVzg6wCknRaHWEIQW+26xRLPkPp6IIA0
	 1Ij41r0fZpIF5xen12KtRMK1loX6JFhp82ACkNDplK8bRD363CGaVx4pITobwiNhEO
	 UkWhB7Xwkr33bWh7UYYSA9OPrUsRBgpEwUZDefYoz68AWWve8POgu7uDBwiSMOKzcx
	 qryaovYBoxAsg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so1222661e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:39:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpUbMl56PUJrTkd5mEI5+ZNoqiVcDRFnfEhvJzPvjnwpqy9zQcmb0SKbX9l+RwqsFGHBmfZMR7XCZWWipWKcTx@lists.infradead.org
X-Gm-Message-State: AFuF++lXvG5RqNpP+YKTLDL5HXu1KNaF5xL9aoaHza/yuR7F8jxkfq9c
	Jq9qn3KdWYimUgEWVwa20rG+Y6ZNkRY7KXb5EypVqmqshi2EHlHZqgcB2VamJWe06/xccfhAJam
	LZWWxgGbRHjOg+E79+CzgC4yUxyPsGCg=
X-Received: by 2002:a05:6512:6186:b0:5b6:1a7c:3b with SMTP id
 2adb3069b0e04-5b61a7c02e6mr1037141e87.62.1788561566902; Fri, 04 Sep 2026
 15:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-1-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-1-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:39:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLm3KLqaQZFsb2Yu0pERjCfrskL=x3arMtrY3Gq6X4rgZg@mail.gmail.com>
X-Gm-Features: AcwNN1WuNL_yJJgNrKZTtl_t_1Ngwep6ljsejiCgS8bZ3EgANbDs_npxnarBzq8
Message-ID: <CAD++jLm3KLqaQZFsb2Yu0pERjCfrskL=x3arMtrY3Gq6X4rgZg@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] dt-bindings: arm: add Ambarella CV75 platforms
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add the Ambarella vendor prefix and CV75 EVK board compatible for the
> initial SoC bring-up.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

