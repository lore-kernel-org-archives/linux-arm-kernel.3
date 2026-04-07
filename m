Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F0EDB7C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDYNJnr4ETlKa/GKXVghhxv0mku2PXdivqbDDAcFYYs=; b=cOsaGqAKZuT0V+kzLQA/lHb5VV
	p1U7hKXoXy82gzIrxZF4qdnGD9eSUnbgJG5OpW6oH4l5hxUn2RqbAznp+gHJcBTL2NwewCr22n4rZ
	mz1vD81HtKopmv4/ZgYr1A8yd8i8ucn0BsdqDnN4x/Xrn25QshkWgB6xXSd5xvph0gGgiOXNfzbvO
	6NwkaXzmEne6dehacAGhjHkgw7+i+8CbIaAK1KGqtPCrC9PyMkXx1miLgpWQpo6FL5P4ua5LjpqNI
	iqa/agHffQcnyq2Dbr1KjvhbUVuXFBv3C1Mp2nOyzHh/NGRIPOy6C/eZCUaAsKUTO4KALFna6wAdK
	DpTdGchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0dw-000000063GJ-3rsM;
	Tue, 07 Apr 2026 07:14:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0du-000000063FO-2StG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 07:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B282E4448B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 07:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C89CC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546073;
	bh=eDYNJnr4ETlKa/GKXVghhxv0mku2PXdivqbDDAcFYYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e6RHv0Yu9urVko13Ln68xAueF738ZXzS7tdsaS/46PUUOPlP5CuLpl91YXHvKXBgk
	 PDw1oakAOBB/J13Ko+DJMWeaTOv/oUniEwsd5v7ULt2Dst3BuuY8GARf99TUM1rHx9
	 NpCDf867TsKWmxmsIhCZdqhcJwNxWczRo109DvsvawKWBJtf7FUoNsDmTg/nGNLbT6
	 /kZyEheo9OQs7hBmcqiWaIUvO9hvVdd0tFdqRxvEoHIw2RkY12FRzMaf+VBucAFrAz
	 b2H7LLkAMITli4l3763xxC3gAX5dOUj2AgzMCUN5vvem3rFZrC4EGFeZljhu+oBlFx
	 XS6pkfloyDCMA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64edf260b49so6682981d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 00:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUKRyKiiRrJnvaZrb0VLDfynguMSteS/vLnri8xEbTdUHGRM0oyY49xs4i3HQ2/CNl/srD45RQT8f5GbVkTAE4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKkU9IqNCkb2Bc6jVmq9qGnBzSVOCGgkRETLIGU18EMvJRAG6O
	TpjU/oF66KVCMaU1arvS8voQqEJBaalFadNxXKcfFrdhWwA6cvd13Hh9hngitQsgtTf3wjxqN7n
	0SiRsdB9fAKWJpouaaHnFLjwBhVVHG7o=
X-Received: by 2002:a05:690e:d07:b0:650:7b78:2bf6 with SMTP id
 956f58d0204a3-6507b782cc8mr1364136d50.21.1775546072903; Tue, 07 Apr 2026
 00:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
In-Reply-To: <20260331-pxa-gpio-swnodes-v1-0-f66d86d10d8d@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:14:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLmEstHo0CYq=ifqm367UXqFcMgs7669s-1P1Y96rKcTwg@mail.gmail.com>
X-Gm-Features: AQROBzD3uIlbGSM9X7dypNf0x3ZZt8RrcOHCg4-dWSS6NmwEI15IRO13jTknXdg
Message-ID: <CAD++jLmEstHo0CYq=ifqm367UXqFcMgs7669s-1P1Y96rKcTwg@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: pxa: attach software nodes to the GPIO controllers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_001434_647913_82E35485 
X-CRM114-Status: GOOD (  16.99  )
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

On Tue, Mar 31, 2026 at 11:11=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> I was looking for a use-case where automatic secondary fwnode assignment
> would make sense for a DT platform. With the paz00 issue having been
> addressed by Dmitry, PXA looked like the last one that could match the
> idea but it turned out that we can just easily attach the software nodes
> to their controllers enabling fwnode lookup of GPIOs.
>
> After that the only GPIO consumers that still use label lookup with
> dangling software nodes are ACPI platform devices and a single PCI
> use-case. In that case, I won't be doing anything OF-related and will
> limit the x86 tablets series to an ACPI-centric solution.
>
> With that being said: here's a series attaching software nodes to GPIO
> controllers on the PXA platform. Since everything happens in a
> bord-file, it's quite straightforward.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

This makes things better, thanks!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

