Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06913C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCVjDkbQLFPdmT42ieE/D9gwThDVlwRuyUtdsBm7ClE=; b=nPGtEHCu9T+VP0Mq1b58qztpne
	p90Y0YGH/8tWSrNtVsW97D8XLlNheYG+5KHH/aqIfCnYfYPHB5xkHvDLQJgi+aJCk/2PNd9c/hJQB
	ELRIcjB5SL7IwqMIbsCvr1DLQjULglENQ95llWtJKCxBZ+ssz4VWpozf4CBwtBuS9egdI6jMrD/Xw
	1YtCLZKW60p8ln6A3a4KqlYuZwTbv7nkzYhqeHTjXNj9GXnVt7W0R8cEbvT0ZP9TsYaeBHJqitF8D
	VT13OqkHVSY66krpBx7tXgcG7IVQgGYqbOwKhrj0Q9FJSFEf81kdw3FVcnk6pTR/ZWUV8qzE72w3e
	zG5ZZtxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62AD-00000002lGC-30uu;
	Mon, 14 Sep 2026 08:35:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62AD-00000002lFw-13Vo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:35:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B148E437D5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3031F0089B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374944;
	bh=JCVjDkbQLFPdmT42ieE/D9gwThDVlwRuyUtdsBm7ClE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DrXx02p/lFBEhSn7NH0u38TVYG9WuR+dxmCWZcuPsVfVnDzR/7hsmOzbSmChbM14A
	 gkufea8hSg+N+K+fyspiEnn/DX39Rbgcx1XVu1HU2RNdVrNLramMC8ySTkv404kryz
	 XdH56e8XihY6CZYtxPUtKvcxJjqGgMeiVlbpBirvDS9RxzarWYi0ILoH39xVJoEKfW
	 30Fz8yhbWMIBLDDWWiqDluWDffgHxG08QMuZUfO5armfZ9bDpnuYc1/nftke/Iz8N5
	 3gSd9V14ONvXEGLro3UebOz9G5ZtOQ/gn7ttRaFgrmImCYxHe8hJG/dDs5H8dZPHNk
	 nT9MSC1bwceyw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso1321349e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:35:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTLTJ/49JFXyqFNO48ZOj9+/GPDBwp/58i+8b01lzkU7vY0bTiPqBuePZn3J27sV2HlgKamkE7LXqJiDYbnkW/@lists.infradead.org
X-Gm-Message-State: AFuF++muW1p0e7VghFqCcQcmRvDLJ5o8/9yT6RBFAMtPxxIeybGC9HBS
	OmxpVJyFoPA6dz+i8Ae6f23vnDTggcXvX59HQ0lsrnfyw3rWd3NXIru5/0TXgeurRkVNgPyw7Xc
	qT5Y2ZaNejOr1Itd2B82Vr08O2PeUhAg=
X-Received: by 2002:a05:6512:3d0b:b0:5b8:9b7e:4941 with SMTP id
 2adb3069b0e04-5b8ae69f2f1mr385616e87.45.1789374943281; Mon, 14 Sep 2026
 01:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <6A7910FC22A9FEF1+20260827015739.3314298-1-liudalin@kylinsec.com.cn>
In-Reply-To: <6A7910FC22A9FEF1+20260827015739.3314298-1-liudalin@kylinsec.com.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:35:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=qWv14873iDQ7vvGPtdHosZarEY2XG4r7jaBeMZU2nTA@mail.gmail.com>
X-Gm-Features: AcwNN1VO1mJUgmGkmDzeoood-mB4SIA0XA3D3cl5tdifQfTtvKGhkdNV6v0UL-4
Message-ID: <CAD++jL=qWv14873iDQ7vvGPtdHosZarEY2XG4r7jaBeMZU2nTA@mail.gmail.com>
Subject: Re: [PATCH] rtc: ftrtc010: fix clock resource leak on probe failure
To: Liu Dalin <liudalin@kylinsec.com.cn>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deng Yingchao <dengyingchao@kylinsec.com.cn>, Qin Yungao <qinyungao@kylinsec.com.cn>, 
	Luo Qiu <luoqiu@kylinsec.com.cn>
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

On Thu, Aug 27, 2026 at 3:58=E2=80=AFAM Liu Dalin <liudalin@kylinsec.com.cn=
> wrote:

> When devm_rtc_register_device() fails, ftrtc010_rtc_probe() returns
> the error directly without releasing clocks obtained via
> clk_prepare_enable(). This leaks both extclk and pclk resources,
> which may prevent subsequent probe attempts or module removal.
>
> Capture the return value and jump to the error handling path to
> properly release clocks via clk_disable_unprepare().
>
> Fixes smatch warnings:
> - drivers/rtc/rtc-ftrtc010.c:189 ftrtc010_rtc_probe() warn:
>   'rtc->extclk' from clk_prepare_enable() not released on lines: 183.
> - drivers/rtc/rtc-ftrtc010.c:189 ftrtc010_rtc_probe() warn:
>   'rtc->pclk' from clk_prepare_enable() not released on lines: 183.
>
> Fixes: fdcfd854333b ("rtc: rework rtc_register_device() resource manageme=
nt")
> Assisted-by: smatch:2.0 [static analysis]
> Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

