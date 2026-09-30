Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DCACA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZJmLfEfCXYjoCzTqdd4D4IU51K1LeQ0vlEIkGanjNg=; b=n1fsJoOhtozpq0ZTP6EZw3LaYN
	OJolVoUY3TG+uyQuTJO9EOihBTApixJnyr+5EP27lshsdGM61CxOgFhPkPxqAp3LF94WhOR+uJ0Og
	vEL5+6ulmvpos56d4HpqKPTW5GyT0VC4xywdTpilePxl/8KYR9YRytzrmsZOTsys/B6qAKH7e5hoC
	aNtsizRkXF5JPL/QFIwbPNyilHhpRMyWDBqOaoMfB46ru1P+OX1hg4xzvddAgrrIYm+QmSf3P9Zf4
	CB7DG0C5Ump+7oqyTKEZwDASYgrG6S+MeXhkbNaTVdCCIlrMW3S7Yz4MP27DZMDBpgcpNHFumGIV4
	/4zMMDmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuFs-000000067Of-3LDk;
	Wed, 30 Sep 2026 13:21:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuFq-000000067OC-3mVu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71576438C4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562381F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774510;
	bh=wZJmLfEfCXYjoCzTqdd4D4IU51K1LeQ0vlEIkGanjNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ID78kKzRdVuD0vOY0tb9F6hE5AypyIV35VXl/0TB81aW0KHwIN5+n6sU+GTCqQo22
	 zevVzKiTAGXxkdcZw20zUWzWjtqLRox6z2840aLqZUoaSzH8+vJJ2ysDYvvmCn6JBy
	 3+wpaJAa+8FTC6nuJsYtylLcqW2drm8hpoq4e/V3zbdfyQnfw4A6woBxpcUz9btCfZ
	 MbSn9Ny9SeR6GSEh4orWEwKXooBbUCTwbGuUr7O3nlu7y9Is1tfmeiKtkBfY/ldlNR
	 TqoyyV4EVgBe6EQPT8zP8LvUX2ArIjyPlchgk90p6WBk17c5Gs4NEb7L4rJcv9SVox
	 pxYV7GOmr67og==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so51487201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRwSWOhfvxyWhKgcKXJiX4r11YFSqkD2vGQCLkudF4bAcKUpjGD+DKBT8f5v0XdypK04arMt572ah1ihEoyKAR@lists.infradead.org
X-Gm-Message-State: AFq9FYKGoaTq1m8YUObDQ34g0mkSj1mX013FyGOu/QFYerj3Hf+glpTz
	uXWtvDFQrOguPGSojDMlaIlXbpnSqjoi48MknYf2iCFM6ckhRWGVZJtcPJJTX409lwjvmPW5BsT
	8H4ob68QqD9UvFAYqCUaDrzBnhmDcohs=
X-Received: by 2002:a2e:a550:0:b0:3a5:b6af:2973 with SMTP id
 38308e7fff4ca-3a779170e26mr4566541fa.5.1790774509117; Wed, 30 Sep 2026
 06:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260917211446.i.153-kees@kernel.org>
In-Reply-To: <20260917211446.i.153-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:21:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TbxyEiZUhPYtqiXBJTekvE7g8uSqwLbuALj7Y1iso4A@mail.gmail.com>
X-Gm-Features: AclHuK9we1Pkw_SnEX45VNI9ZkjWr3vMHJERGZiaBSgi6q9Y8UmCTh3tVaYbMI8
Message-ID: <CAD++jL=TbxyEiZUhPYtqiXBJTekvE7g8uSqwLbuALj7Y1iso4A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Remove const from group_names allocation type
To: Kees Cook <kees@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Kees Cook <kees+treewide@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
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

On Thu, Sep 17, 2026 at 11:14=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees+treewide@kernel.org>
>
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>
> The assigned type is "const char **", but the converted allocation type
> would be "const char * const *", as the size was taken from
> "*func->groups", whose type "const char * const" is const qualified. As
> there is no general way to remove const qualifiers, take the size from
> the assignment target instead. No change in allocation size results.
>
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/freescale/pinctrl-imx.o
>
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Patch applied!

Yours,
Linus Walleij

