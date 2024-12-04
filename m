Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDF7E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqMF2k27fPawUzrAl3XJEzyyoJ0D1NckOE+oujV0MnI=; b=GF8Dq/tvQEmEhKIIhyl6wz3ViH
	3HY+LpxQ7CWxLyMXa78FIiQNyu/qFLVigIiqdyHV0KNRct38urT9xpR9ydeAGAIFhLhm8GG52kPEk
	sCzVhGSJFU87R7x64NgKlM7G1yAtb3yL91PVyRHCau1J1gqOEQio/tVrhp+MKI0sL0xEh5RS4qUg8
	Cqwhv1uWosM81eXaQqJWSj9bbdtHsfFB0W5xMr0xdphSFJ06ku0hnVIGeHJxhyQHzhE6SaQrbRpYv
	spgCZl4ZTdM6HIRKG7f0A61c5GcBZzIYSuQbdIZ6wz0Mt+pkFc5b6Vl0DlGkohXnihNqtZNwrG/gm
	z+K5CYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIr63-0000000Cxv5-25QX;
	Wed, 04 Dec 2024 15:15:23 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIr51-0000000Cxfm-35mW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:14:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53e1f673ca8so516446e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733325258; x=1733930058; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqMF2k27fPawUzrAl3XJEzyyoJ0D1NckOE+oujV0MnI=;
        b=p4ELrjpIJULDXCkct4fi3dy8Dkwv4XGYx22pZT66X6fz/48tgnSxbv0LqQVGfQw42O
         NA0pjU9So+0cMCx3Q/JkXGXF6159a8EwrrauzE39Bkek+eX6F5AkmdgFEtonXmixr/6x
         J9bZVgYKj/Q/4mX+Jgkl0wmBOhy4Lbx/f15vsFgWZ8BQA/IjYuD5px+pvVltMY4aim2e
         bVLF/zSb3KnPFsh0/icGys2lSHWPA86HSCb3uBHZYcU8BfG0gvWpesHLccN0AJV7aCv0
         tREgzlgRLDa7bY/PKq1PXeZADPEcisLwMTL0DJf2RUV2X0KUKM7HNwHsShjzw+v2Tm9z
         XWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325258; x=1733930058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqMF2k27fPawUzrAl3XJEzyyoJ0D1NckOE+oujV0MnI=;
        b=jh30X497tPTPxwz/m0CYAD37KfGPlhc7OWOjvA10gVILVQ7FRxQrUeH5LcJW4ABwb2
         IzseSqdxTOXGwQnZWvxS9ZDakDc9i8RvdWm9fAgVOTjvoIWUfLB62uTmbefp/bQrQaSj
         NcupcCSW81yW5nAU8f+x4JGXwPFmOpFGWHXAN1vsXOdVSo/RiAiP91QGXFQ3HJBodvSv
         ocjAeI1sE79GyD/zNLERHecVCtih4W14JfmkSRISqgNuGRsye/rjSwjQluuOPGUllOJa
         +6I1fB8zY5+ViiUjXzFvBmmTmJpB0HnGNK9UiKKVeuenUCBEbhxpNs0mhlY8MfmLiaA/
         +rAg==
X-Forwarded-Encrypted: i=1; AJvYcCUBIviIkOpl8zLvP9wOj7J2Yf2iTq1LLy8GVU9800WYTrBjcfkA/ckS43JWiOl/bM9W7iXIQi9kyX8Otm7Cmhez@lists.infradead.org
X-Gm-Message-State: AOJu0YzJXuHQPTwPZpv+9o/fIX2d8JhzZOa2L/TGuBR3H3lFEKcBajpU
	JjessFrI/R6x3bqAJOjpt90KxE1pqO4w+ofg3G0dxcB/++FmPGLKv3MhtD9zZ5QQ1j+sAIPt2w4
	45HZo2IaSuLOmPcxeQjpHoemAQuG61AyfIN/8qw==
X-Gm-Gg: ASbGncvQEJsovqDlzrtypK7CQKwsOm2OGXmLBSqSh9EGlxTER0iGOrTKJ04z+qgWOsw
	n6a3RggeVL7Df0UrwahzBQCB0FciQ/Q==
X-Google-Smtp-Source: AGHT+IGzAxOlrmRmaVD/uFJ7prnu9I3o+zsrfRheOQRN2CTC8TTOFFz7x6MNDu8NIaQ/3T2TJdwvHmEkIfffu9SlLQ4=
X-Received: by 2002:ac2:43b7:0:b0:53e:1bc9:7aac with SMTP id
 2adb3069b0e04-53e1bc97b65mr1243440e87.18.1733325258036; Wed, 04 Dec 2024
 07:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-16-arnd@kernel.org>
 <CACRpkdahQhj5u9ATghszi-N2OYhFbvHF_W_eAMDAU+vhmvdrJA@mail.gmail.com> <Z1BpNQjWwxEKFbg0@shell.armlinux.org.uk>
In-Reply-To: <Z1BpNQjWwxEKFbg0@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 16:14:07 +0100
Message-ID: <CACRpkdY-uKYqAR2Sj_cG7dPAtXMFG0Ldka7U13qZSFr+w15WxQ@mail.gmail.com>
Subject: Re: [PATCH 15/15] ARM: mark footbridge as deprecated
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Gregory Clement <gregory.clement@bootlin.com>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_071419_772129_D42B30EC 
X-CRM114-Status: GOOD (  20.04  )
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

On Wed, Dec 4, 2024 at 3:37=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> > I am booting it occasionally, last time to test my KCFI patches.
> > But admittedly that is only to test it for other SA110 users. I remembe=
r
> > that Christoph had problems consolidating the DMA used in this
> > machine as well so it is standing in the way of useful work.
>
> What problems with DMA? The fact that it uses an offset between
> physical and PCI bus space should be nothing that causes a problem
> for the kernel. As maintainer for Footbridge, I've heard nothing
> about there being any issue.

No issue other than testing and iterating the patches I think.

I was thinking of this patchset to do dma_direct_set_offset():
https://lore.kernel.org/linux-arm-kernel/20200917173229.3311382-3-hch@lst.d=
e/

It seems to have stalled some years ago, but maybe there was
some other reason.

IIRC Christoph was onto me to test it on the NetWinder, but I
couldn't locate a good DMA capable device to test it with.
(Would be the soundblaster but then I needed some userspace...)

Yours,
Linus Walleij

