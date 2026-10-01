Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED45CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJQFLPwEiB2U+G0jhY28xaZPlMUuMdHQiQDqXqwoFSc=; b=bSCL4QjBg1EP3jGi0Az/bw2aGw
	36yY6pbhYqRrRTDc+/+K3tZ7LTXuUAkufObQZ8E1krx+YsRjWo7fqmFJOT4UchNhaFUr52V8QdMUI
	BANDyo9BDP6Ak3qBvx+STuOB5FKEui3qwtArv2XSdcxhKu6CfC5lNvjr3G9bObCiHwMr1rghwpbti
	vsg1l3sGhxIQQ9+53sIYvidRLpeH9pwfgs343EYYWybeOiHSg7XaXCOq4piqWFGZVfFM2AVwMsVMY
	lSSr40c7A+WM+cq3+js2vuKIcgejnO7+yJY7stFL12/IdFW3Tre0prCoFE/JbWEJNrwSXXdnFDX3d
	XCJE2Tnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCArX-00000007x2N-1VbS;
	Thu, 01 Oct 2026 07:05:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCArV-00000007x20-0goA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:05:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 312F760A60
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79F51F008A4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790838347;
	bh=zJQFLPwEiB2U+G0jhY28xaZPlMUuMdHQiQDqXqwoFSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gBDOsQBNJzpUqY1/sE5r+FuZvteuFCYvlS/9aAq7t8Pei0ivGYP2oPomogViHdaKJ
	 bCeOvk3/JGRtmOVbC3SbRB9TU+Jq2aNlGGb4/U5kBTj1kvYnrOhG5DY830irFuMbS3
	 FEJr2chISl/g5Irl2U457T92b+dOnuyjfxCMSQL2RvIqvnmf/M9rHNMoBnimfqFcZc
	 hpHgHQUS4HICZbjGfFC+nKlcwS2G3gPC70wkshrLqfEOgBX+WshIkWhekkbwk7kbmX
	 f8PzlmeHjbKxhm5InWuKNsk9Dyg5BAlOIdE91fJtyhYyIkKHwxbMU2OsIUh/VN8CH1
	 09VIak7FpLPog==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3feee1d2so1181730e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5cN3Y9OcUwvTOUufjz0aJFCcOSa3awh3rN91+O9VM5GiMnAURHKzN8hdLxrK8AA0aZj72+8T5y7sOat0rZYjD@lists.infradead.org
X-Gm-Message-State: AFq9FYLMldAfLR4tT4Gylm69DWItq8134LTxzXA7eVdE0juouLu2xfdl
	Y5aw1Nhd3SgDPG5gZxJHFhAWFfhErq+lZ90gJ+JPyR9aM/gky3ztD+E9M1A6ZbqQ0jzhX3EhJKd
	qYQTB3sQwPGahciPqlj4Q2j87y/NmIB8=
X-Received: by 2002:a05:651c:556:b0:3a6:566a:5cb2 with SMTP id
 38308e7fff4ca-3a77920046cmr10708401fa.29.1790838346608; Thu, 01 Oct 2026
 00:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-15-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-15-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:05:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLkUuLeBFGPPToPN9sG6r7ZMT0Mh7YdWVr1enRr524go7g@mail.gmail.com>
X-Gm-Features: AclHuK9FiDhUvTmGZLlpW2ckpJiMt5-YDu8gbt1OvSW8Kjgx3ohyRLoc8rSCwAc
Message-ID: <CAD++jLkUuLeBFGPPToPN9sG6r7ZMT0Mh7YdWVr1enRr524go7g@mail.gmail.com>
Subject: Re: [PATCH v8 15/18] pinctrl: ambarella: add CV75 pin controller
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
> tables. GPIO is handled by the PL061 driver.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

This patch 15/18 applied to the pinctrl tree.

It's on an immutable branch along with the bindings, so other
trees can pull it in if necessary. But I don't think it's necessary
because it looks like only run-time dependencies.

Yours,
Linus Walleij

