Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AA6CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9sxbisFtWpwoKU7G3mS5YfDApAUtM0f1mz57V6Gziw=; b=oEk0RPRd7molJyqx9wh1h9X32x
	Ytf/aOC/M9n3R+PG2ykDcBADnJaw2Rjl8bdiHSEJYYvtCtp46Wl31fiZ8awAkXN7WnIpXecGV+wOO
	I+I3M4WiHLvq5aOAiDU0Nq+6m8lPa6rEXUPtr2yv8ywABYaOZF3kxNILeRkcU4BhdHPJCbIuIxIbe
	IhmaNygHghx/wd/91iQJz4bi0c9au3tQsF0ouaM6nFWWFDT0sYJ7jZG9WqHQkXcWQUsgQAZY96Xph
	nLHFpZVReKGgkrTjqaHFit1Gni7IrRyXDhWrkqc7rrJPed2+0kr3UT+ajq61aHzRqheiJaKvfg9MB
	Tkh543Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6Zd-0000000BaqB-0YLp;
	Mon, 01 Jun 2026 17:37:13 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6ZZ-0000000Bapb-3oXV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 17:37:11 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso598942e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 10:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335428; x=1780940228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9sxbisFtWpwoKU7G3mS5YfDApAUtM0f1mz57V6Gziw=;
        b=JDvNeEyqDfL/OKiEe7u7aKyrW8tK6+naQLd7Wn9wBj7yr+m9++ao5jr50AxsusyVBt
         QGUdGLzooO42KBI7mN0JGnhlgn3beZWXOr6T6QkhBGBvQ5XT33itoo5sTLetdqJRDXPd
         TrafjmyObplnNQCKgIpGrkVH5ICHi4sQQY2XuXg4Ikdosq25vtNxey/aH5rJITKTSQNE
         Ys3em+gFIt5ZWafH0dlo+Fwr5bhO6rmhhlYpo3psHWq+4yELcaOcmnsQY46QVDouKbGO
         yUbKDhsPiVFT/WhAXLHIZY/z55xkmEruSK1mjWcU8NmGYk88efSzbjxtMn01GucKfR/a
         WZ9g==
X-Forwarded-Encrypted: i=1; AFNElJ8p3CyknfirZx45XS63mH2BwuM152A+Fzjj1U00XiOBpGNTGo+JqffQQGQ5jX8NCLc+OtB0dEdyvFSLGyzcji1N@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7xAfrBx1IPsCRtjnwRcF0o7t8m5gWgxaC5SfTpCcXE0SqFp3t
	Wxv/z5DCMY//V95vbqV5ArFEU8RZG5bXlVCdKIaBl0yIZTzek+tNihPX6xmccMIw
X-Gm-Gg: Acq92OEom+BHjE2ae87pvkhQmRs13lhWzH2nEnHsYbeMWgNVsMt0miTXJL5Ion58bOC
	nvcEcUyP1p1QeDw8lTvL3Xoqbb4FMOKqnP/fsXeCRmzG3kvXUirCKSEAAD2JAH3jcJjItjRnHwg
	hDtBd3cXQq7XWi6svA1CyIXKXmekLz60UIOhNQ5WMTzzV6z+h9ayNKz/pSnuJC0MV4j9a1B2PwE
	BcGl7yytk33bE1ojQuYUJqyPCStlqq1K3JMeW0Vk6P6n2i53teMLv/MlVryYGjeOSjtSNoTF3iU
	1nxU03T/0eD83xyoLml93BBv/3LJJheH05seWMxQWn8zi7s0zrQcmG5lxR5FLCnNgCxiVcUGKpB
	Pn27q9vG35GM3ak3P8c3AjSRvhPoveFeh8kbtXT8d2Kr+xT1+FfC171p1mO8XT2oVbDzyDKFzKi
	s24oK8054eVS2ehADIzUwFI3Zd1ODWauKxJpiKGKw5bICAl67DiuuZxC9VrKaDCJ4DauLlXm7Yv
	Co=
X-Received: by 2002:a05:6122:6084:b0:56d:9e98:4676 with SMTP id 71dfb90a1353d-59bfe3e8573mr5350316e0c.13.1780335427822;
        Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599d3c978e3sm7704293e0c.2.2026.06.01.10.37.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59b40115f06so1153604e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 10:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/QppIJNBvo4oE2W4yCRdDTXX4WFgFZ/SxbCyWDk3Gfi50GFuQt+0uQpCFOOFUfSkj+eEHrU2c1793wj5M+ij01@lists.infradead.org
X-Received: by 2002:a05:6122:a26:b0:575:29ef:7df8 with SMTP id
 71dfb90a1353d-59bf84c927amr5742975e0c.2.1780335426878; Mon, 01 Jun 2026
 10:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.178031911driver8.git.geert+renesas@glider.be> <ah2t8FPZpJCF6CL7@shikoro>
In-Reply-To: <ah2t8FPZpJCF6CL7@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 19:36:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFUObHJSaFg5Xb359AWwFejtA5n-Hn2dF4WFtC5-eXgg@mail.gmail.com>
X-Gm-Features: AVHnY4LGrjuiK8Yupb4kRE62mimooYo_V8U0dBYQY870ZETHUqYjUyV_8zVtMJo
Message-ID: <CAMuHMdXFUObHJSaFg5Xb359AWwFejtA5n-Hn2dF4WFtC5-eXgg@mail.gmail.com>
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.2 (take two)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_103709_961622_09D4274F 
X-CRM114-Status: GOOD (  27.41  )
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

Hi Wolfram,

On Mon, 1 Jun 2026 at 18:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, Jun 01, 2026 at 03:18:17PM +0200, Geert Uytterhoeven wrote:
> > This is my second pull request for the inclusion of Renesas SoC updates
> > for v7.2.
> >
> > It consists of 2 parts:
> >
> >   [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
> >
> >     - Identify the R-Car M3Le SoC,
> >     - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.
>
> The bindings patch for this V4H update...

[A]

> >   [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
> >
> >     - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
> >       SoCs and their EVK boards,
> >     - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
> >     - Add support for the R-Car M3Le SoC and the Geist development board,
> >     - Specify ethernet PHY reset timings on various R-Car boards,
> >     - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
> >     - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
> >       R-Car X5H SoC and Ironhide development board,
>
> ... depends on the initial X5H binding addition in this pull request.

[B]

>
> >     - Add serial DMA support for the RZ/G2L SoC,
> >     - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
> >       SMARC SoM and EVK boards,
> >     - Miscellaneous fixes and improvements.
>
> I am confused, does this really work?

Thanks for your comments!

[A] does not depend on [B].  Both [A] and [B] depend on commit
0f63ba15dde8748e ("dt-bindings: soc: renesas: Document MFIS IP core"),
which was merged through renesas-r8a78000-dt-binding-defs-tag1 in both
renesas-drivers-for-v7.2 and renesas-dts-for-v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

