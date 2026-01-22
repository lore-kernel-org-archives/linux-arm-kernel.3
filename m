Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126D5D262BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NshjYFUffTPn7Y/VWXqwFCdDoXaersEomkK4SDzB2hg=; b=W+kYnyanJxfdOvH+rFgOoKwcgj
	T2GVerRXsACD7xCW4ys/G4+sLo9u9OYvLayhJMkgiyBOf3fn9k47d8MnuVGPNnyiQwGrpwasf9Sx0
	dMdqe80YDc7uh7mitTGaFmjrqDa/dilQ5lv7EmfSQXqZdyv68rZP9V5XiM91bJvqLhyl85t/DHsxC
	Q7/g6fDbmwuUkmkZkbZgz/m69ht0yu4XbId9wp4ZIepNH0CyaIZDLoXUW5bdjQRZO9XO54H9Ng3tb
	qbQAhVt+4Ksm1P7fFl6JVZYfYMO3Nvhd2xP/bQp1ecnP4MVV/qxmNja8BtsDBPOZ5/bRYmj1KkP0/
	KAVGNosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitwI-00000007420-3dE4;
	Thu, 22 Jan 2026 12:37:30 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitwG-0000000741d-14rg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:37:29 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a7bced39cfso9210285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 04:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085446; x=1769690246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NshjYFUffTPn7Y/VWXqwFCdDoXaersEomkK4SDzB2hg=;
        b=mL6kb8kj657quaKJZ27ZJBzRqnGMksJx7DkbQs3imKekez/FB0pvXmAdoYGUEVUy4i
         DHUpNVgwWl9mTdEYVoZ/nYVuKgoT4r1HOCvNxp9lPH/fyuTcDzVv0N56cDmgY7gnPXz3
         41t75SARwDyGt3bEtV0AK9FFi7vQEVdYR+cAXsIl2xAdWpiD/ArVgH4w3/+RvJ3ZIKU4
         0MaF/CjKKJWMIUGvYqlAE1M3C3c/y8yaQbMYHVGR632bVtkXn+1xqCqP53zO4+t34tMX
         N2rUDIML+cwcPhKFaZgVFHt2B40QKGFaxntl39+MkbaP0IuQOZaY5Nfit3wuENh8aj+z
         O5tg==
X-Forwarded-Encrypted: i=1; AJvYcCXLMPDYw8TkRGi+yVjJunb+OoggJA6//Uc08nIWEKt3xDsj9Km5XyELCmSFU7bQ/QIDXgCI0b41ZvnlGTFYUrFo@lists.infradead.org
X-Gm-Message-State: AOJu0YwWH9egLnTomxhygAt1pQtDDgQP3Y6/h/jKuVJ+KnjeS0Wi5glN
	Fk7YdaVr9W2y3MiWpOEaVBG53GnnOnnkDDvkHUlQaL7SVDzbd6wN3Q5LVmWBCio7
X-Gm-Gg: AZuq6aJtIa9jERBSAszhzroYcBcLgHKg719s89lSCMzXT2Olgcht1wOx0gBRaw+3PvM
	IFC5dQWwExYryuopjRyQ4SaUd80G8YS6AJI6krNo4eVjlGiE+mjupqpENk/QPG34zEArx1pEgyI
	FgXxxbZKZ8li/KIqXpOJMBoYLBqDTzZBaHKMKuur/OllChA3oY7USiL8PcF/vw0wY9n0NI1Sl23
	EkgVaqDmsv18Dhv2+TKCfBQiNEM18nfLYx70N2Tsbp3AYB/mSauhghUrlU7TNA0ZkLe8wU+bOal
	ap2hT+L+riVuS7DNA+iPzqPDj1mftet205RVVGHMceLlAKFT+6F5DaIj7WgxeT/t60Y8F7UtlUq
	dRtj0SG4jY6t+BsBsFLJM9pRFZ8ab0r25Zc/1FGObZH2cZVYVT/FbgM0qMpR0G7SASjJphGizV7
	eS3juZrPKseohOiW9BCals4/i3NhZhQb2EmufgiUeQga6Y4YzI
X-Received: by 2002:a05:6102:c4a:b0:5f5:2e08:bbab with SMTP id ada2fe7eead31-5f52e08c575mr1044357137.6.1769078726980;
        Thu, 22 Jan 2026 02:45:26 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94813be3d27sm760184241.10.2026.01.22.02.45.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 02:45:26 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5f52fa0d48dso261589137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:45:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHDCu605WWkaW88Tz8/GSHlELhL9gOu1fc0djUOPctfFswOrorJSPM0lE/WOROeVdAO0a2kPeTYtpor4r5U0fT@lists.infradead.org
X-Received: by 2002:a05:6102:304f:b0:5f5:3719:19d8 with SMTP id
 ada2fe7eead31-5f537191b24mr421545137.31.1769078726495; Thu, 22 Jan 2026
 02:45:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1768559762.git.geert+renesas@glider.be> <cover.1768559767.git.geert+renesas@glider.be>
 <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
In-Reply-To: <20260122-fragrant-auburn-oxpecker-33aa7b@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 11:45:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHJY1774N5m_S99u6ETJdyuj7GdrXv75DRoDty9j8tcg@mail.gmail.com>
X-Gm-Features: AZwV_Qh9OPSpjre26zYtA49UvfUvRCXHMaoKfRQXbtFLez-kbSzjI0P07of02JY
Message-ID: <CAMuHMdWHJY1774N5m_S99u6ETJdyuj7GdrXv75DRoDty9j8tcg@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] Renesas DT binding updates for v6.20
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_043728_320251_170B3116 
X-CRM114-Status: GOOD (  25.50  )
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

Hi Krzysztof,

On Thu, 22 Jan 2026 at 11:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Jan 16, 2026 at 11:50:17AM +0100, Geert Uytterhoeven wrote:
> > The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> >
> >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1
> >
> > for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:
> >
> >   dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)
> >
> > ----------------------------------------------------------------
> > Renesas DT binding updates for v6.20
> >
> >   - Document the RZ/N1 GPIO Interrupt Multiplexer.
>
> This belongs to the driver patch (see submitting patches in DT) and is
> not supposed to be separate pull. If you wanted to share with your DTS
> branch then maybe just pull it as dependency, but the problem is that
> Arnd just merged all driver pulls and this one was skipped.

Right, in this particular case including it with my drivers PR would
have been more appropriate. Sorry for missing that.

> I'll leave this one to Arnd to decide where to pull this.

As soc no longer has a dt-bindings branch, he usually pulls my
dt-bindings PR just before my dts PR (which he also hasn't pulled yet)
into the soc dt branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

