Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB95FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deXaYFm09T8W8zpiUVroL2c82PFP/2T0UpkTLLVytow=; b=3PDzb7FngBcoey1sJ8j6ugJzVo
	Ddpp2TEAVuGNjLphep0B4SiibA0KVt7VQ3Cx2pPJjOFTY56r1JsJXZ6cbinI6EGpP+PhqO/RfZBxY
	C4ss2B5Lhb6CsieAs2NMOEWyJk8zHDzhJwCA35I5rvQ7oKONwmv26y5GsU+ja76etZbNoGIj0G0LF
	UDJk+z8nwLqGdCUOUGh9flGdboncCn+0DFfcARydOAIGHnNUZp/yOw8QWZZavXhR4Ribo+VlsUPTm
	Qka+2Oe7H1eRspUI9KBzolQHacrrf+55rwh6N+sIEblWmbelShDxmSVh/5AxrcT9Edv9CyUcNDGKC
	GY6Kym9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJiG-0000000GkGC-4AYa;
	Mon, 27 Apr 2026 11:01:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJiF-0000000GkFs-0qm4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 11:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B6BC6014C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 11:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DC8C2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 11:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777287673;
	bh=deXaYFm09T8W8zpiUVroL2c82PFP/2T0UpkTLLVytow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=klCMvqH3lcHTfc517flfRI98Mj5BiWKrv59/YzHQT4CagEa//BJoD01ky9pEAhiy5
	 cnTZq5hwCSkBIfCjntizBIGS9+wT0RtWBf13iHmPjxjGwB+XjM4ovAj2ILnYbcVbL5
	 sBnYiX7LOEfaXpkL6N6AEEj8kilJQ7CCXLAyQSXKbDW/gon1hb1ZRvO2GDQBGOWJTr
	 bOb5BxQxgTPlDx48h52oNycAdqXZYozKSmSxm9dd6rp3V64YpmnKPrz5oDoen+SG10
	 7qquWrWdGMdQFCChRP70FXy3WByB/26B+GZhu2pBCqbIH58rAT9cI/GsE57PMOLhsg
	 /fd79CchWacGA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e96a071c3so101788361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 04:01:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9oGggJi7Bhivyj1cboSDoz2HzgZy05w+BipCjeZ07J9ApP7M3DnUYXJcltGxolO9DOqqTHAoy86iqk93KuWme6@lists.infradead.org
X-Gm-Message-State: AOJu0YwZCABBMek+u53d8c9ziOSGO5AcrcMTqdRw8j9EmTeR+5J8SQQF
	9Q4Y5+/Qmlg5AfHgQRb6uXHj9E/bo9BlEqWgLrHkh5amx8+RhBo9Y70JR60/N0Skjlr8bwcvPnR
	GYBBUKWAM3e7DWpgq1fSJEsrrl556yDusODfn8WiqmQ==
X-Received: by 2002:a2e:bea1:0:b0:38e:af87:8dee with SMTP id
 38308e7fff4ca-38ec7b4019amr125485421fa.22.1777287672128; Mon, 27 Apr 2026
 04:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com> <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
In-Reply-To: <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 13:01:00 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
X-Gm-Features: AVHnY4JVN5ThS1AXNyXIFweQGeK9zT5ke6ojgo3woFXxSDQljm-duM54ZeA11gQ
Message-ID: <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> On Mon, Apr 27, 2026, at 12:14, Bartosz Golaszewski wrote:
> > Convert GPIO controllers and their consumers on the PXA platform to usi=
ng
> > "attached" software nodes. Since everything happens in a bord-file, it'=
s
> > quite straightforward. We technically now have a way of passing an
> > unregistered software node to platform_device_register_full() but that
> > requires using struct platform_device_info and since the existing
> > platform devices are either referenced from other places or defined in =
a
> > different compilation unit, I wanted to reduce the impact of the change=
s
> > I can't test and went with the older method.
> >
> > Signed-off-by: Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com>
> > ---
>
> Hi Bartosz,
>
> These patches are individually all fine, but I was hoping to
> finally get around to removing the pxa board files completely,
> sorry it's been taking me so long to rebase my series for
> that.
>

If that'll be queued for v7.2, then I'm fine with dropping this
series. Otherwise, I'd like to see it applied as I want to get all the
changes required to remove the software node name matching from
GPIOLIB into v7.2 and then finally remove it in v7.3.

> The only remaining board files I expect to have soon are for
> the omap1 and s3c machines, so if you are going through the
> board files to convert them to over, I would suggest focusing
> on those.
>

S3C does not seem to need any changes, I already sent out a series for omap=
1.

Bart

