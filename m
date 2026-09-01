Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75336C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=; b=h2qdASLkCzs81ZPU9wMHlFNJ6q
	V2Q0yrXoW8K6BrmC6AIHLmuDsLIFyksNCZP1nNxdHLvQXzZy9FZvJx39CWRciiRA69BJ1+R42NAVU
	d5SIae1IWHQqk9kd2zcEASi2vbvJMmJrsf0n+pv0qxLsaqV+B7dPuZa/AIq4d/BvnbVFmu4ZfPBcy
	qmGY5xAnknokdkIa9RUxMtBmGJG2zt4658d34gmQfBngI5GQNHGQVOm3JUNgTnEtYdlzNKIECHXYZ
	lptlZvMoIwHKgUO8OjuBQomqpwEnZ9h3ix432LX8exbt+ResJf8Q6lG8MQaXkd+PohYNPj2NYAsMq
	imvOHMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1VDe-0000000DL3C-0Pzb;
	Tue, 01 Sep 2026 20:36:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1VDb-0000000DL2o-0tbX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 20:36:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482dbe4d247so142368f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 13:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788294988; cv=none;
        d=google.com; s=arc-20260327;
        b=WVimUOfl18kiOnGReR11QmLP6HYF8IKZBi6LG5SKTIaNzC8NENIpLhHVj1w9atU1kM
         0WczfNxZJ5nureyG3z9TgBB7rJEcaWyNR3NBpcrUJKFSKf658q94yCZTtC9wShOQbTW0
         l3QHme1cRgi0jLckICHQxzHVVFB7s1OTA0USgQUNVjEPeaC5eSdDiLipWpef54LxfPvM
         Z3d3RuP1fN1dEPFx7JKhOWjXSwWfhm92n7ICxEZ2p5o7mdx7FpvT4uIKsGNv7sQXDq6f
         znmBKcOmyzm45tZwsEIfzowoBE8XOsczyHWBg+SeXAmcr+ZoTwT4whwX3Cyi9tlh3Zjc
         sOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        fh=NdbseM6W27XwRx78tLa8KD3QS6irnto3SH6s8/daGkw=;
        b=kdzadlS7hjWBkepgGkUo7k9ChMMFw2MB6EVl0lmkn1t7QyFgOpbTILVGsiDBRF8Bak
         z3Q3klFxxEDv2x1PwVj8bgA3eNVvPIpFRonnLUHVnxh1dmKqzmFbe8nh8DnCF9xMCHHh
         hzvhgUPIsbA7FxFJU3Itw+EmqIHttX7TZ8mCpd1EyVLKX9Lr3vhkONaojJGucUzovRFo
         3So8GaVdRDELUcC2SUamsaD5ytOMuc5R3fXmYSdvtG11HimusBqqtVPnCxhdwC2t67Gb
         nIO5BDGL7JUGpvBWaSaqcV6mzUkRY+i+EIsURva+1gOX2HEt2nxNxFfa5Ih3k0P6HdSg
         UmEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788294988; x=1788899788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=krZJhUw6dZmWsdr8lGeQStQsxyta9b6Q6gd4LM7RDkCU5jUrGyPsR/gBEvcidOK5HU
         iqJJs1a+vj7+sFOVDrI6dZEekcOSlpSSjS7dB0SmlZnOAONXRR8DN8iE2VnDMougn7tG
         kX3MiWzOPvj1UxkD3zOBUcVOsDZ6qEqr9U7/Um+M8MSo7LrEURTtKFsmyrKVDlt+S5Xk
         QEK02VUvMlrnr42/H3OD5TQAb+0pKkwuuulzXGK1CiX18NmjYk45OREAao0C0pKKZ8x+
         2UFjlUqUf50ysY1yK3LXind2gu3YZSdT/mpek52l6lj6iRKgB21ND54EqlfcYADeGWJr
         /h5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294988; x=1788899788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=qx3jkYZgvRrfPFwBrTlLzZH4hd0b08rsyRyDGRGPo2kIvTXCFUTHjoZ8wrXwMmxyNA
         FaMpDYFY/YqXdUi1IZOULjF+lEllHQM0bAt7bwvNr9dv4GOf2QKiH58EGgZWggVVrcWd
         E2QEVNOMZBssmubmo9opkifLvXbYfUsAm+uxEkyphcKegK6BN1eSS+jNKJs7jYh8ZDMr
         Q2gbWGUoDgMPYUoVYn9N/WO3Weywdbq5zLPc3YLn97yXan2dlpHQ8ncmvLK3TGLqB4j/
         U/CLVEUGji0TLooo9qfmVMewOfi6TS1wbjkkn7/gLJrfZLbjH+RH5393MNJpSkNPd3TV
         2+ag==
X-Forwarded-Encrypted: i=1; AKwUvBzOF6kQaIrUFdn6cXbL+MUCQORB9zsXn4qt2PDeYRysioEyafo9NO7KW7boQp0I3zFv70cTEwFsTO6b5nnKFvi3@lists.infradead.org
X-Gm-Message-State: AFuF++mdbksopU2wl6xzzyodfJq1XBi8mBuOyyV5Pw8nvkhBQdTInBO3
	PZMyaJwv7zF1L2qXj2p4ldxGFiHrqRmeXsBT9u+A9j+zOYwfEqlKDzlyPOC5M4J9Ul//Fo8LURb
	R5xpV0K/ST/WqZ5lwjmVBhvfJyKbXiTTuKXcgwogP
X-Gm-Gg: AYBFou1IHmWRWZnOpXQR1TToZRK5TeAoNUg1lK2rg/4NFa95xzg5V9UnsSdhLc96Qks
	HY+8ZzI0oYblEwNTuwPByfP6usEpshfwCTrvmztYF8163hT0D+IwzchOqmoJwCSy9gmN5jMlq06
	qMqrID5y29Qe68bB6hsSd2zJY36JIbCr3RZ1N/I7l0LQK5z8Tee/6wqDZ8vW5Kcq/FVT8xSAzOI
	ubOyLmZ+HRpCCRIq4+THESrJzcrVjTt4Io5dTrjyYdXznsbmopdeoip08JB7Ttq1LwJa7WwrrxM
	lEnlH8ZUHVzoenukYZiszAjVlCZF8jqeDwIMAMBMff+Tp3/xMyAHiWae/uKYaOMfQjz29zRyw26
	AVW6SWyIrPoj3rvFgoBh17w4NX8yes637e6v/65IWtxEBBj/l4GJPRXY=
X-Received: by 2002:a05:6000:4910:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-48488df9e0dmr42483f8f.4.1788294987371; Tue, 01 Sep 2026
 13:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
In-Reply-To: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2026 13:36:15 -0700
X-Gm-Features: AcwNN1XLVY2qNNwpmvPqR9vii35HawK0FLdCW7a8C92cPutToPYaUpHoOUGoDJI
Message-ID: <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_133631_271931_1C91B610 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Sep 1, 2026 at 12:46=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> > omap1 might suffer from the same bug: their suspend routines are also
> > fncpy()'d into SRAM without a type hash and called indirectly. They're
> > all ARM, so asm/linkage.h still seems like the right place for the
> > macro.
> >
> > Do you think these need to be fixed as part of this patch, or as
> > follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm no=
t
> > sure how to test the fixes for the others.
>
> I think separate patches for the others should be fine.

Without devices in hand to test on, I'd be hesitant to claim 100%
confidence. Maybe reach out to the MAINTAINERS of those, and see if
they have cycles to help test potential patches, before
writing/sending patches that potentially don't get tested?

--=20
Thanks,
~Nick Desaulniers

