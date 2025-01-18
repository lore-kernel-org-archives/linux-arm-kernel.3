Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8A3C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8S9ixEcY8abMh6hBNRFz4AKcSH2mJNqJhoZUq3Q+OU=; b=sznWFB5wBZNKkzuQ507+N+u7OJ
	wJxBSkWRGmkFxySfMFPspzjJ+B9MadODj6teFhNHkgf7ow96Gmqt+EVJZoE8bYRiDmO1YwWgCw826
	05YU97WnLGGNQm41G4TXUQXlcfVvBBIY+x73YFmtWrlKQzprefgKUSOA0tN/gfYXcKlvlQA3bXity
	sh7b8PBaC2i+Sy0H/s7asUGFVYSUneZ3sDNX6bhqYnmeZyO7Mnil/Y5Fb8Osp23vUhpF7g8cXYG4U
	rTMLjycdH8UpieshwINCDK0RwqD7MGlMhxM0qxM+IBgnQmDBmM3GSf1ZCGXWdLRijrrrZv/u+ylbh
	K1Kf6X4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9wI-00000002XdJ-3h0e;
	Sat, 18 Jan 2025 14:36:42 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ9v1-00000002XTQ-2t7m;
	Sat, 18 Jan 2025 14:35:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso5418271a12.0;
        Sat, 18 Jan 2025 06:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737210922; x=1737815722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8S9ixEcY8abMh6hBNRFz4AKcSH2mJNqJhoZUq3Q+OU=;
        b=GzEXY4XwKtV2cnR2WLhd5TAWbUi3LC0yzgvI9sKqDQ5pmC6zNSNZ9sQKzUkjI4FLnG
         o9DzReCk4VtSXAy8TkftGAMRhtD8wHH2iNQji8ZI1ZXCfh9kGExXsXpT9vqhww9gfYPE
         nn4aX70d/boZse+eHNIvMQXQPupyBduAOKWeXybHXedff+2y/e8bK6/SGlFhD1RjGpES
         qKrzux8MeWxhYzGT5lxblvCE+tAq9Sdbdfan+IN1ta1Gvn4UotOT+DtGPtCDKXwXfGSk
         MBNhJtBmF9smsYr+L1pspoo9jhcaO+UZcXBwdYifGoPGAJRuRGTkxqFZdN3RS7J5KogA
         SsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737210922; x=1737815722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8S9ixEcY8abMh6hBNRFz4AKcSH2mJNqJhoZUq3Q+OU=;
        b=EuuRVmcnpbjUmfmtaNzDa7zcbVyURrrnfScMAmEiLfCtYQR/qe/p0Xy/PIDbLGF7Hq
         r8WxN8R2XwuECFgphpF4C5nkS8FTTpOOXAENuaPx6hV4R8gv6IzTp5OBNXnJDdseqkg+
         oqBRmVRo3lEQ5Lwav+a9Mqsa6nabcAURpOgyQa+U3LbKQwsYRZoFkzCsIbrTyTtNZplt
         5lSYwa5pzlkj1gnCMwquKBr6JJr4fmmGQLwAZLVGHUKny4e/Ijf/cgVJ13lrbMMT5IyG
         mKkTYciHQaKzRCgA3fp6zbLJ7hj2vNo3W6hN7mnmUEUGHCovGxOjBt9TR8JbarjP6I1d
         EPqA==
X-Forwarded-Encrypted: i=1; AJvYcCUpJDN/0VTGMw1Gb2iP1gSrZDmiUUJnkjcHB56yRXrmRpy2qgnRqaMMbmKz2RO4bXBbGLLY2bVZ647j@lists.infradead.org, AJvYcCVMXAwGjj35gT+ISQfePCg5XX6TWrWcXwDtzI7I6VNMpfT+hNR5z79Napxm0rwZg7S94uMLOzXZe00MJAiJkdqp@lists.infradead.org, AJvYcCXobEtq0iti50AI+lCu+LIYmWujhFPmSP8QMVHt/Tzc/6mN52/8jStYd0+Y4Ab30ky84EOj4NOYez6XencfaLI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxiFVnXaYLwi4Br0NpvsAZoXujajC45K6ApJMFiwFyMqYW3yKe
	XIUYkRgbqWW2OfQHwi75wOq1YHKedRH2lD5WP4wJf53g7x3P2Pnmhs1ewx4QDKvzNvkK6c6uCci
	BSAAVeL4D1Ch39AEnGjKTP8ss5sI=
X-Gm-Gg: ASbGncvjj9RJ5EHUIl5U5VVuul3aew3InkkJap86ftVNp2msqWZ+c7hcLol/FM4xP6P
	gecSYvBC5D11Owj1ckx2Hmbmh2mrsnVDVwazwSAsUb1vrGq+BVyUy
X-Google-Smtp-Source: AGHT+IFDZpftdKqBFqBjBkAeeMYE15CR2JHURmc/olRPtILwjDfNNssQSQSY8GDDreU8V095+cJIkrJgg1PZfxTj8hY=
X-Received: by 2002:a50:8d17:0:b0:5d1:22d2:8965 with SMTP id
 4fb4d7f45d1cf-5db7db2bff6mr5038044a12.30.1737210921703; Sat, 18 Jan 2025
 06:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <00cbc2a1-b4c1-46a2-8234-f66edc19fac9@kernel.org>
In-Reply-To: <00cbc2a1-b4c1-46a2-8234-f66edc19fac9@kernel.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sat, 18 Jan 2025 09:35:08 -0500
X-Gm-Features: AbW1kva6DFr1RzjQp9KXMYYlhacM2koJu0uBfxOzcSRq7CyYw1cACxFrw_KEa_w
Message-ID: <CAMdYzYoE54PSdTH9JPBFLggDy9CZsj47N6qFKJFZz4xe3VVbBw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com, kever.yang@rock-chips.com, 
	frank.wang@rock-chips.com, william.wu@rock-chips.com, wulf@rock-chips.com, 
	linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>, 
	Algea Cao <algea.cao@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Dragan Simic <dsimic@manjaro.org>, 
	Elaine Zhang <zhangqing@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Stephen Boyd <sboyd@kernel.org>, Trevor Woerner <twoerner@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_063523_729479_2E395B83 
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

On Sat, Jan 18, 2025 at 4:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/01/2025 02:26, Peter Geis wrote:
> >
> > This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> > based loosely on my original version, but as of now almost nothing of
> > the original driver remains. The main fix here is the discovery of
> > BIT(6) in the interrupt enable grf register fixes the usb3 disconnectio=
n
> > detection (mostly). On occasion an unpopulated usb3 hub will take
> > several seconds to disconnect. However this means all of the hack aroun=
d
> > work to reset the usb core manually is no longer required.
> >
> BTW, RFC for some maintainers means "do not review, work-in-progress".
> For some means "review, but low priority" or "review, but for sure I
> have bugs here". I usually review and then someone responds: "it is not
> for review, it is just RFC", so to avoid my wasted time please always
> mention in cover letter why this is RFC. What do you expect here or why
> this is not ready for review as normal patch.

Thank you, that makes sense. I marked it as RFC as I'm aware it isn't
a perfect solution and there's a lot of undefined values. What I was
looking for here was:
- Review for code quality, so if I'm completely off track I can get to
work fixing it. (Thank you so far)
- Sanity testing from others struggling with the issues it fixes.
- Feedback from USB engineers about the issues remaining.
- Hopefully someone with access to the IP can provide insight into the
magic registers.

>
> Best regards,
> Krzysztof

