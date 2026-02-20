Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F7CC5B56B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2YnY99ilY51T44Hk6pBP8c5WmyCaOVYtJKwr53Ct4M=; b=rjOVu5p5EjUpLA2sVXnqkFMhLU
	My1p3Yc2txy3v/xZvknY0xMSh6QGF+mb9x39FRwUC8qVH2KGhmDbwUSAgFQtYIyCvbHQ5+nd/rCUw
	Qi2jqrPezg/K9JPDLG4ndcZGTmPJamJnsglPDoJEOvnOO0OadHMkVzAV1lWBPUt/mHiKEak7lYuhX
	vX/NaJOGZCnxDZj06SgmS+i0nfWpJAV19VoVgmTd3dGAlFuNi8/vo/FxqxOkmf6i5qVsSDQFJf6Pc
	TfuYUxAEj9zTi/ENMv3EmC6JcHj4lyqti48YOMDHyBgtVfBYXZls+pLSrQzix0xKeCZ2EwwoK1b2k
	DaI0Gy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtY5b-0000000Fcyc-2GTM;
	Fri, 20 Feb 2026 21:31:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtY5Z-0000000FcyA-1HFx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 21:31:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso3367083e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 13:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771623063; cv=none;
        d=google.com; s=arc-20240605;
        b=MMRlew8P4+yYbODfrVoKeN3juHcigLGOr/DNJG/fyX8DMuKks7CeZypjRfti491A5U
         XhugEVCeDgJHUtgUFwQe6//r95Mz/J6tsV5uK1iHwRR6sxGoLr6FaXVOAERm9W7rQtnv
         acI31grD7Qt5QRZFUzMLR8wY4kOfdxFGof0nlF8ZpvrJOHWyCoVtKvtAf6lQySFdIjXw
         YkfjdI8wqUNdDlZRcuoy0uHtpzjPWwvDMXbdB4Zr9BiUYjF6hHyCk5v1/aWmBbD2BhmH
         FiQIwcfBiKh04HzGFMP2Ldyk5xt4rkTTU+BySkHTKymdsnSIBcGUzr9D7GtMLZP4sYS6
         D1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j2YnY99ilY51T44Hk6pBP8c5WmyCaOVYtJKwr53Ct4M=;
        fh=JMjcJh6g6wYgKtmznZS7U/4RZZ3fBKdkptmu6PrZ2Sg=;
        b=OqeLPWy5GE0PEanyIUAz8zfyJenEl0Qi5Auk+jukwttZ7m/+s1Cb7jDGmjW8ygev9O
         Xclw5w4+rl1XmBFi0CLzYyEavCyAgj0v8F+knX8JyLwqgTfgZYLedxdnOPRRIGbQGgtf
         odXdd4Le+2/+N9Z5NtYWoQbLerrTNmNNf9141pLhb7YLJ9B0VuObfxPOkuo5JM/0SEXv
         0L+YY3bsNUs88+BkzXXzMe3MwuPGvh5jUcKQE1DS09lnnEE+zry8SaiZqsGIMcqA1xII
         +k858a4dnT4PI2l6T9D67W3pRYX4xoNx4IDb+oPfClJbEroq/CEkEbAhJRh3Sgv54iT6
         xlQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771623063; x=1772227863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2YnY99ilY51T44Hk6pBP8c5WmyCaOVYtJKwr53Ct4M=;
        b=fbWuRhCVAxNuB0tiQKGBOM6RsRwS1dKhVG6rDOpgZBbtq71f8Z1WB2SYZsyh1EUSgB
         0o9YfwP7Cu5FaRzxbcWhPOcos7117QdTvCfAyJD9OZYeIqVOQP99VzIzTwD30v9++6NQ
         p0pA0/gbA2IjDc5ISEdGXKSuJG0jD2RstaB+j21sd+frR6n9MRgTKveTNODe3DRTDzZs
         50+Nfefzi2uIoKyn4uRkS/++h7QOnYaLBrJt3bBc9UNZGj/zHPmqngfPeu4GywntJPKg
         Z+EoyJHnOjuqm1LUvfuUZZSmlDWnyGHfU6NqIH4L+L6GyAJuD7Dj8UPzSxYZ2lJzKgZR
         i+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771623063; x=1772227863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2YnY99ilY51T44Hk6pBP8c5WmyCaOVYtJKwr53Ct4M=;
        b=RXmUNQjhEJecC59niuoGnR3Rm2rBstM7Zcfat1ip1VxfHEamSsd29DXZRGYWQTUOZ3
         SHqcjDZNXu4SwwEusujK8d0XNwwBt3CdASBC2FRO9qve6a8NshmmJDMVnz6QsQaP2M06
         Gf2AywsJIBU3q6S+lXau5WT89K99+MvKPkkdvsgkWIoh4ZX5qk/SZ6ZV7h8dTHK8ZR8U
         S09XdWUwwg5iexzj3VVKCIfi/RwMZjHUXioLGgpXAHtgdCRAAdaAN7MiStVXlsG4MPuG
         yIXL3i2v4hTPqRy6atKWlIj68nw28e0NlCCv/59A5Z2pBj+8BEywd8UXmXU2Xiw1Oe5V
         Cd8w==
X-Forwarded-Encrypted: i=1; AJvYcCX+W9091tqXOdR2yKqCdhFL9QjCWCRQV23DitpYVZwDlrBdy4+uPkvgwL1A6Dktj43RSLE5/x7X9h0fAzQKbrue@lists.infradead.org
X-Gm-Message-State: AOJu0YyCeP56H3gauT7yAOrZPqnddd2slnkkAaJZpGqsE3xazs8QhfYN
	WHqwXsXzt6wUF2fzyq796q4xYi4vo/HsY6R0xie6AuCa2e11kOxbAUd04L6slnvPxXN0sQ7nPaa
	jn6RYpEuMPV1oIN/+GEvSgjG4bo2snn4=
X-Gm-Gg: AZuq6aK/ijVG7z5XJDuUIO11VObkjnZ/VexcCl9qzrG64UqOC6hs4LrRymiZTH23Bzv
	QC37X2TJwZ22uBB4Y/2wB/i92bWl42SWSt9XjEwfx3TPs8CiHJC4dop1ygRj9HwzbsGC0mBVN5k
	M3dBwOqI9IbG9mdcJ2/x1Or5li0v/Mp25EI4epey0MrkTYB3Is0FZ2zzH9tkTlKEmEuQBIvXpM7
	cvllHFxgy7NAeqdPC9hKLjwZE0u4QH6AaMkZIB9CWN5SvXTGV1u8rnKvcgXur84G1/jB97FuBcv
	BwggI0sLlQybKi3soscluib3xKLj4b727pCqtw==
X-Received: by 2002:a05:6512:2c99:b0:59e:34c6:88 with SMTP id
 2adb3069b0e04-5a0ed9a3697mr245998e87.39.1771623062940; Fri, 20 Feb 2026
 13:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20260220021353.40554-1-rosenp@gmail.com> <CACna6ryBW-6b0UYaMq12Xf6bdgQV9AxYajb9use7g4o=VK59+A@mail.gmail.com>
 <CAKxU2N-UYZyUdc70H-=Em7ydBve5HP35agu7=pqozFTQo0A_Tw@mail.gmail.com>
In-Reply-To: <CAKxU2N-UYZyUdc70H-=Em7ydBve5HP35agu7=pqozFTQo0A_Tw@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 20 Feb 2026 22:30:51 +0100
X-Gm-Features: AaiRm52wkUXfPJNVFsXIiL0xPK_eCy3tss8OlPr83It1CXt3msr27JwAkcDh-GM
Message-ID: <CACna6rxvsPAt7PSy3y=+HiFo47d=tc2p1E4xjuc7LixHUU+G=g@mail.gmail.com>
Subject: Re: [PATCH 0/5] ARM: dts: bcm470x: set MACs where missing
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_133105_364861_6469ACAD 
X-CRM114-Status: GOOD (  16.69  )
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

pt., 20 lut 2026 o 22:20 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> On Fri, Feb 20, 2026 at 3:21=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@g=
mail.com> wrote:
> >
> > pt., 20 lut 2026 o 03:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a)=
:
> > > I believe these predate the bcm,nvram driver, which makes this
> > > possible. Downstream OpenWrt currently assigns these in userspace.
> >
> > Changes look good, I just posted one comment about commit description.
> > Thanks for submitting this!
> >
> > If you check
> > git log --oneline arch/arm/boot/dts/broadcom/bcm470*dts
> > git log --oneline -- arch/arm/boot/dts/bcm470*dts
> > the prefix always used for NS patches was:
> > "ARM: dts: BCM5301X: "
> >
> > I guess it may be preferred / required to follow that.
> I didn't want to make the subject line huge.
>
> Actually in such a case, would it make sense to fold into one commit?

I'll leave it to Florian to comment on. He's more in place to decide than m=
e.

--
Rafa=C5=82

