Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9689CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5eCQ2m+9ZnT9BEwMkn6XIzbcen83Vtx+Hp/s3prw9U=; b=uteIyg/lFr1/n/VQI4QeDxxQRV
	EbVxinRUCCNGufBCbiBMP7pB8yBqieu1F8j4RmEbP0h1lDe6ua2sPGNwY0vgS7ZT74xZrN08OpskS
	z3m7maoCNA72WWT8HUB6t98AXxJEyF7XzqwnzSYfJfHf2UlZmejp9NBMrMnAEPWZwUpEcvl5oDrHR
	4NhipR5I95tw4RV6PQuLq9qRsok9TMkCnep6X/ahtaRFOuB+OT/+sjBqLQzh5LhI46Y1A+smF9fib
	VjABgwnbRetIuWnmmcwErKxbFR2tDMCF8SsJXw/t1FOj0RdJQkrrCNj0OnYfGJjlerlSwzNgxO2Ui
	d1aK29Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe3Q-00000009M1U-34CU;
	Thu, 11 Jun 2026 11:58:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXe3Q-00000009M13-0l5T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:58:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89EB544539
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEC61F008A4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179115;
	bh=C5eCQ2m+9ZnT9BEwMkn6XIzbcen83Vtx+Hp/s3prw9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=doeezvb2/5zokwyIlK+Tpp+JQbgxLLB8ubmaGu2t4ula10p9XR+AXSK7qrfa8YFrt
	 Ar+eN6O0mlGTAciR3AAV72pjHLeRr3hzWTd3pF6fkzADeepwFMitmBeLk5D9iLC/C0
	 qiTX8r4VbvrvIrZ4LgYKwd7Of6gUD038Y+3+y12uDxguF4tPO258SqJzjqKt+ZoisR
	 Eo1O3rHYLz1sRuWg7Twbsd/+KCFbCcEIh1JqyvoS+8JqwkmYJPucbURlrRq6rUGi3l
	 AEifYXahqRCENJxgHuwbqmHl1DAIKi5R0krcLHWL4jvESg+VA5Qi4NIlu1VU8Yg2ey
	 u+XHNQzAP+ebA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-396771119c4so78773861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 04:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ951y4g8BhhsTetx174D4X1SoU7CCszw6izgWvxOtjwjkHRMF2jt7N4XRp7chS+1A2lre/axp770jhJ/rjyZVFC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3EsgJX+pwvpN5xkKmoERl85if35ZTUIFlIoUnWHl0toVmTpMK
	4iRc32PKpZV9DrU/e2E9r8mYMihSqw3DNt5FJ+rwUv3Fq8Q6S9qFdInYSx9P9Q705xE16NCYrkl
	0aIBPwjY9CPsaYAcd5mBHbQXTVkowF1A=
X-Received: by 2002:a05:6512:110d:b0:5aa:6c89:72d8 with SMTP id
 2adb3069b0e04-5ad27ac49c5mr780915e87.19.1781179114160; Thu, 11 Jun 2026
 04:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:58:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
X-Gm-Features: AVVi8CfHelBjMWn0SWXQfsRaUfTwlnx7-cxwN6bRp62FY340cXBs5nRmH5Xbr2Q
Message-ID: <CAD++jLmzfnOaz1h-e2CP7++AYi0CW6cDF9dTO0aU2m3tRfWfBA@mail.gmail.com>
Subject: Re: [PATCH 00/18] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Sean Wang <sean.wang@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
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

On Sun, Jun 7, 2026 at 2:17=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes a series of issues
>  * split combined driver on common code and several SoC specific drivers
>  * adds support of en7523 SoC

This seems to be a collection of previously posted, reviewed and now
also applied patches. I don't know what to apply and what not to apply
now.

Please rebase the remaining patches on to of my pinctrl "devel" branch
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel
and repost as v2.

Yours,
Linus Walleij

