Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7136EC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnHoQ9hJxT1jx4dONrAt87VQ3Ef84mxygQ9fqqx65vM=; b=tMtqxyic7v2JzM23p6+DJ58aI3
	OwOMWTfQBpez6QogvbKQCvcoT0/chKaW1c+gYVXKAZrWS2/cnIvbYRnA+M6fIdaGMMjyZRa3DfGCl
	tUhwI/WkMH0Q3Z7qLusOjfsPk1JQlWkWrUpCIFIf+ckcR1Bjo8AjCBN9gdm+NWpGbtEFGnNJ9sev6
	b6ZwJM7HTqcW9+Y1dqCxbVfKAp3ktcEgybDBX1XFqBmV70LMwKHsVVczgQuUHnpne/dLOooHXNg3W
	Kz2AzMrH/al18pNfqBrgUwhQB4JoSOrZzJu1A7zwt6a8F5oLqYYU002UnH3qbebR3drl8Nv+IdXJX
	i+2S13QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8urd-00000004V4W-1U9f;
	Tue, 22 Sep 2026 07:24:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8urb-00000004V43-2DKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:24:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3844843CC9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5501F0089B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061867;
	bh=dnHoQ9hJxT1jx4dONrAt87VQ3Ef84mxygQ9fqqx65vM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f+ZiLe9N+4HhobIOiXEkHSOzJPiavcqREHehqAwNFiC6345vzVqQ0XkFyy0KZLSon
	 mL8vlDLDMcccOzT/PVl1scbUyc58IKW+EpJhksVggpBN7qVRYVOFrfk1dfoi8DTMLq
	 XTsyDObN9lrEAZIOn9ddRz8TKaRrnEs+mS0QUYuqlPXuQqg0i/3o4HQSnBnBN2RlkL
	 t/d7Mf/CRnjOGt/CFEOYqI1b2ZQ3umC3r4HNuAtWJ9HEwmjNVNMvGGPEdmhDctmzKK
	 /MlckJ13teVFVlHezc3sFsPaWvdMGeBM/MWBUTpKBBKPDweGpMgVU1disO8Pej0Myh
	 3y51cbIY09riw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c3de61a3so3242809e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+VEI8Cg87sEM34hI5ziiNWp5jUzJCDcymU4L5+SGcyKfuiekGZLkOiUVlzJEvx9tLQ+e73ZtYKmHQM8Dc+hnL@lists.infradead.org
X-Gm-Message-State: AFuF++lzm4eavNL04UylyK77B2AFTe6pyBfS+qi0zFKPP/TmSy1/jXnh
	sbcHAk0STfZigwAIg7gZeaZjnX78msPoK4gAMH/McQHMF6ZHInm4ONxTQPnLFJZk0kznM2Zx7Is
	VcqoSNK1kHhmUZPIrOmvHVFjc9Ux6Ydk=
X-Received: by 2002:a05:6512:b95:b0:5ae:ba8f:f9fa with SMTP id
 2adb3069b0e04-5b8c18411aemr4246334e87.18.1790061865764; Tue, 22 Sep 2026
 00:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-11-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-11-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:24:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1WEwWRFdLjkbY3YSJmbQ3oLaoNAv3Ca6ZJ2ebubp2jA@mail.gmail.com>
X-Gm-Features: AclHuK9erJBC7wstRYz1ZiKk7AbclZKt0-cY_QBUwQ7InLcjPRkXXHSAcSuac_8
Message-ID: <CAD++jLk1WEwWRFdLjkbY3YSJmbQ3oLaoNAv3Ca6ZJ2ebubp2jA@mail.gmail.com>
Subject: Re: [PATCH v8 11/18] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH
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
> Use the standard IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH helpers
> instead of open-coded edge and level comparisons.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

