Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1582FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2bI2UoaLvX4gCevaU7qNOHhhCPcAax0k/u3+iPwhos=; b=BDCXCGeUG2M1QWSjwn1aBULYJK
	TOf3lX8pMS4Y4nIxfh1rEcI9WiYMGRK5D8LNGJk7PqZWCZ/0c+OplCvW+76JhKq5iWeBGu2HWsumu
	Ll0UJb1lU1R1ZWkdbb9DVQ7VG+CqfF4LjnKZVjLTf2o+dAB1aqrX7d3e8gzHwdTStT47PhP1cG8V5
	8putcedXcMSuCY9PtRswnC56BvXkG7Plw+KDFdX2JGo3kJlR83hdduovpB7eHpKaUvsv41hxKd+gp
	bTcPtt9RPAhtqwXW1RlkL9TUUElSLb9RTAD5gbX/Dp24wd9j9+Lp7ol+EWDX6/cuJ4sd34kJ6msG0
	WAmvDxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSRC-000000007M7-1bit;
	Mon, 27 Apr 2026 20:20:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSRA-000000007Lj-20Jx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 20:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6D4B60142
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6F8C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321211;
	bh=X2bI2UoaLvX4gCevaU7qNOHhhCPcAax0k/u3+iPwhos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hy+7mITxsY3RF9VGJWL98ljKzomsIoVK2oIa2YDlwLMIUaCCYD4eNixLrsMYXtsmR
	 AIRHtSZWpFRDRDqp3k65eLE984AYxIAWHqla3UNhGY2HBXHCsii4MunlzQZPCD+elC
	 UF+zR0neDgrXsafnEilm7MpJOD9/wzaWVLXgIjK3UH5X14DlAqXYCK7EzfQ4en9htp
	 VPw+61liIAZGZATE2rXPbohATDSeqQGDdji0bgp+lHA3+mp4fPFKgb3uFPKrZfM9jm
	 4u2PmyhX+YD4cn5gmYBoeKpdICvenvNqPk0fnTJGpV1ex6n8wtThP313jPv1ECjBkJ
	 n0suIDTqNI5ZQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e4a04f059so13025746e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 13:20:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+sE/jUvJcCowpM3gyxp7iKSV7EU0xNuoGb2AEz5xUBkNMiicrbOvwquQe3TuGJX7GOMfymtD2S2w+MHidFRj4b@lists.infradead.org
X-Gm-Message-State: AOJu0YxR+fB2DAmbAp3Mqat3+RZvs39YFuKnhyHpdh6L+5JO+A14uUSf
	ktRJZUIor4g7ICg398liHLRJKdfqaq0HmpPD+GkU1/UdCKn3zpPtTsfB11pRMbyz5NJT1TaLtGE
	SX08cnr0D5UMFTBatwNbuOWyA2ORaSu8=
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id
 2adb3069b0e04-5a7466234c2mr101158e87.21.1777321210358; Mon, 27 Apr 2026
 13:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
 <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev> <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
 <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
In-Reply-To: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:19:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=m6RGc8Lv0Cn2xsnn8kzV-paAMos4saYNFTpjUcxwcvg@mail.gmail.com>
X-Gm-Features: AVHnY4I-QfyRqRKRQSMK3sajFg1wZNjagZwtf7cBxvDJnumElCFBOdrk7T_ZX5A
Message-ID: <CAD++jL=m6RGc8Lv0Cn2xsnn8kzV-paAMos4saYNFTpjUcxwcvg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Frank Wunderlich <frank.wunderlich@linux.dev>, Frank Wunderlich <frank-w@public-files.de>, 
	bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Apr 27, 2026 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> > Fixed up and applied. Will be going in as fix for v7.1.
> >
> > Yours,
> > Linus Walleij
> >
>
> Hi Linus!
>
> It seems this one got lost somewhere along the way? I don't see it in
> mainline nor next.

I'm just slow at pushing out my tree, it's on its way!

Yours,
Linus Walleij

