Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF09E9DE68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTaUCr1A2I+1wqTvl3TKv6QTLEetojWJo60VzPZFc+A=; b=lty8PPnzopPVwokR0JtyfKZ7oL
	MkSO2XeOmpMoGWtV2SJgus7vKd5jof1XrjX9BAOVXWl+R7m/aFogrxGVDWwOKDLG7u6AM5EsrKt9k
	D/J5UdtPephHi1BomhIZEkAiCKxevZGCoQfTYpLxO53ctbhYXkYb2hpf1wVmsHq15O6imjYk2M8sV
	8EF7etIq1NYIPyI1MYTMH0b011bhtXMRfoajs0g+SDr5iV8T6rBUxIfgjcXWrpQQ1aedKmii53vTg
	Sw7Rn3SeaUhBv5zQKmTfj7s3gbF4hUiRqv1XEQ40b0PRLabswxV0IhgTVyJ/VNx5SM7b6+eH3zd3W
	XKStQGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkkE-00000009wZG-10bn;
	Thu, 09 Apr 2026 08:28:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkkB-00000009wYp-2Uzb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BF56440F0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 08:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD30C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775723286;
	bh=aTaUCr1A2I+1wqTvl3TKv6QTLEetojWJo60VzPZFc+A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hFmWyjvjjainN0waFI5SgxxVEcVbJNwNrL0mx+XuPVAsRyyMkxghRurUAIU+4uiOf
	 fXljosaAod1JlDrJMGbseZ9MuWHidtbqP+d6gC5EYv2oJ8BKH0kdy/rebKAbU0ShkJ
	 ANEHl4nDw5Wfvrm27lOHVgA84IclOfaZ7z5Wr5XkxQtFCNzpbRADM9pBYskD/2rVQh
	 RV7WryA3gluS5oyR8WvDWPPq0YicpANCGngJcqdFAOAd3bVB4Po+JJse43tdThFCEj
	 23BvfTpLx0m7cN62ig1JkvJJZTB+ysqsXcPoVJnTO7lWAiOOhqrW7PQCrE9fP7ptz2
	 VJhgVubw101hA==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7a43424f861so5440067b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 01:28:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZVuvlAnLIthPUEHtBGQxuSWAm0AofDUDaV7lqpn6kx1oro50Dr9K3JVO1kysBdDQ/EgOfJFdm6EbD/i4v69kf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/3OwyskhXanqShBtdoFCYiYJZEot0Dde6GKBmXcsyTAvYvUCm
	oKPqZNw+bBObCl9G0YrXmYd8V+UQrE6Mrphz9uAbQlDBiN6GhUCrTf/JIk9qF427rAcogrXg9ai
	9yImj8LEVDBCn+wA45+vQPu6ktdLNxvc=
X-Received: by 2002:a05:690c:86:b0:79f:b903:88be with SMTP id
 00721157ae682-7adf1f63befmr26878747b3.16.1775723285630; Thu, 09 Apr 2026
 01:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:27:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLkcoSyt4ag=Vtf0HW+UhnvXAQH=RqdiZ0LB17UdURjTCg@mail.gmail.com>
X-Gm-Features: AQROBzCBPK9j1p1wyGlpXng0vuJPY67DBxyZqUb3UmeFzFxdcTXTQHWBijmLSC0
Message-ID: <CAD++jLkcoSyt4ag=Vtf0HW+UhnvXAQH=RqdiZ0LB17UdURjTCg@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_012807_651595_9CC9BD9E 
X-CRM114-Status: GOOD (  10.51  )
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

On Fri, Mar 20, 2026 at 1:23=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> The pin controller on the Apple silicon t8122 (M3) SoC is compatible
> with the existing driver. Add "apple,t8122-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl" used by the driver.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

This patch applied to the pinctrl tree for v7.1.

Yours,
Linus Walleij

