Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B196CCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUiOFm5hwMEoRqR8C48BxuLPMKnSrYEFu/PW03tLYHI=; b=Ut+Z+crOEOJWLRvxRrU1hWiyg4
	H1srsXHtj8Y5vm77toZPgc1jqORT9+yeJobVdBnW54X5Ptbrb0ai8arL/aFrrEu3s+O5+L8qGbfDD
	HbE925i0wXINFrM0hF+mE6RO3m7A8teclhLtyM93aSVq6plIlkabdPDmznG7st/kz4oznN4Dp1hbU
	vlVTtNaWt9kFomO/QXOscKnir1GiZcMIa3kjWbWsQl210d7nekZwlDHNqqHg4177mCDXqwigwFb1y
	TDdpkDyGRAdc43ABINOE+FVbOlN9sPtNDFyfK+KWMIvmpccA1U70vpQIZH6xptATc/UkqlUtP6xdu
	YgnMiFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mwG-0000000A1nc-3Frr;
	Thu, 25 Sep 2025 14:27:16 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mwD-0000000A1kE-2ek3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 14:27:14 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71d60504788so8851297b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758810432; x=1759415232; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CUiOFm5hwMEoRqR8C48BxuLPMKnSrYEFu/PW03tLYHI=;
        b=pEnSqRZe4K/R3oNh0AHkmvulHx8art7zZKAXuND3F6OSYEDaQvTcYJAkB9Ch77JTEM
         AIE3O1ks87zovoU/UHHlxbAi94svflhrQy1EWYMqgIXU4YLDH6WK53729KpcsfO8ZICs
         /nLLSSKsMC8IaDz948eiAqZodd4uWMLoX/nNzK/8ywTN9zt+2Xz5mRZ+MV7i8tnj1Yg0
         gfyW17+7MBaeP4fL3kROikm3njaR2p1ckMb9fW5CuVpOCgz5mkQD0PfzR8F6VRPOlREX
         LFy20wHR63+s9b2VACKa8L6lLuUF5yKWXlLuV2qmJgqaW3E+fIFDj/P86gooucIo4Tcj
         AAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810432; x=1759415232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUiOFm5hwMEoRqR8C48BxuLPMKnSrYEFu/PW03tLYHI=;
        b=sLBLMF/jWiM4MS3EfOa625mYEAQqySvrfLIoHMeGYjkFef22peM48TIxpMv7dznXSv
         8NOq7HjIfoR5yYlwSITslPEyR+b/PS9D1npy/hGNeTLEJ+X+s+vEYVSbPh5uovTWeaZm
         YhOsVGqxSUtXWAj7HUmHChLMtSOre+amxNNzQB9Dn+awFSTK6mx+MuBqH7UCMGfbObl4
         vL3DQNNEjfHFvS/n+hxd5RjgP7i+DHVw+WTglrsqp0oZdVwxwUrPlB0V09m4pYXBWJxM
         SpjUGWTJeur69L6DniXnJlQ8Qk2ZmYaGu1r8vdzprPMNScD2DiYREnym4xbl2q1kKxSk
         Ow8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCN3KCa4+PbVC3yAOqrXqou/6VXFd6Bgdh5Ol1KhTZSO2RR6+d9niUFc7WzzabQSybsMff4HmgIgPOcUNwBvdw@lists.infradead.org
X-Gm-Message-State: AOJu0YwtijvTxtyi01xOAVVqAZFMgIikq2HvQYDteYLPluXugaduXnJQ
	lx0GZyyA0Bz5c96SaxGnDIizuDmDit331vSky04HmM4POx2FI+MxzHTVjyObzadhEoYMQbTGpuN
	wZWs1wWCUZnThrGSugjMRLP+McjRXzk6HzqxjkpXVSA==
X-Gm-Gg: ASbGncusAhsUkYVHCGh0J22cCip26uIrMGwr+nXPDYkATh5u/efOeVvC2MrwAGt80NT
	BnkbjULRi3qnPtj6ZZgURtntUZYO4tBlibKDk3NY4ktzqLYp6mUqMgqWmrU/ixL3UA4O5CzOUr0
	+JRGlQr3KBwDxN/Q2jLX5+FXHTZOfwgLAvlsJWBbpgJb3mL0sNbJLNu3vhgdBYeS9lw7mIdbQl6
	vmqTRUE
X-Google-Smtp-Source: AGHT+IGZDWxk3kUzyiqmiLMSS2P4wkC9enG4su6ICOnqjad1NL8jWqFtTK574aJMRmZcQx685zoXfiL7rhOftMqCoUI=
X-Received: by 2002:a05:690c:4a04:b0:737:e9f:92c3 with SMTP id
 00721157ae682-7640500f570mr38653867b3.41.1758810431921; Thu, 25 Sep 2025
 07:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250925115924.188257-1-ulf.hansson@linaro.org> <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org>
In-Reply-To: <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 16:26:35 +0200
X-Gm-Features: AS18NWAs7GCXJJuWoTSq1H6YyuNpTzQ2hjA2VwzXclsSEUVoMXRaFtxKv4YK58g
Message-ID: <CAPDyKFrKP2bdpKTHzqDdhEpRAjYu+PFd2Bst=-WPddByxcAX_w@mail.gmail.com>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in fw_devlink_dev_sync_state()
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_072713_689628_E3F881B3 
X-CRM114-Status: GOOD (  28.36  )
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

On Thu, 25 Sept 2025 at 15:59, Diederik de Haas <didi.debian@cknow.org> wrote:
>
> Hi,
>
> On Thu Sep 25, 2025 at 1:59 PM CEST, Ulf Hansson wrote:
> > Due to the wider deployment of the ->sync_state() support, for PM domains
> > for example, we are receiving reports about the messages that are being
> > logged in fw_devlink_dev_sync_state(). In particular as they are at the
> > warning level, which doesn't seem correct.
> >
> > Even if it certainly is useful to know that the ->sync_state() condition
> > could not be met, there may be nothing wrong with it. For example, a driver
> > may be built as module and are still waiting to be initialized/probed.
>
> "there may be nothing wrong with it" doesn't sound very convincing.
> So there *can* be something wrong with it, so warning sounds
> appropriate? If there is (certainly) something wrong with it, I expect
> an error.

Sorry if I was too vague. See more below.

> FWIW: most of my drivers/modules are built as modules.
> I do seem to run into 'problems' more then average because of that, but
> to me it just signals there is something wrong ... which should be
> fixed. Not silenced.

Well, why is it wrong to have drivers being built as modules? They
just happen to be probed at some point later, then why should we have
warnings printed in the log due to this?

>
> You're the expert, but I'm not so sure this is an improvement.
> I do regularly check dmesg level 0, 1, 2, 3 and 4, hence it landed on my
> radar. I do not regularly check all the dmesg msgs, so this change would
> result it dropping off my (immediate) radar.

I personally don't have a strong opinion about the log level here, but
the reports I have received so far, clearly indicated to me that we
should not be using the warn level for these messages.

In the end, it seems like these prints are not as straight-forward
when it comes to deciding what level to log things on.

Let's see what other people think about it.

[...]

Kind regards
Uffe

