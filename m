Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C76FB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFXSKMwR0XlgLDLIyJxwMfmA1neLi9/CshGkcjxghfg=; b=FZ/bLrH6Skp1Gp17R8L0ecuXeG
	+TlvEsGYHdLIHMCzHMC+hVMVj60/qI+rYuk1ICeiGlSS7heZN20GGhgLOVbBB2cAxeoU1hfyzmf/g
	QnJGLAAgXn2f+Y6/B6XAGEDPo5LKv4GtcAav8Kj6iQPIjqjAIxxEt+2ph+sVLNLEGqhimeNDm0pZ+
	xseA349USRGKIK1UilJ1EDjVjzTCLscdXyc21w11AQXhFApfE3EHSHfxs/UsNX8kFHZ6UaSb/axaq
	udeW/In9+FTw5uVd1FvRqm0Y7L0eS59Q1pRVfcA7h/hHDbtfnOjRTene9A7cEztpg/W+yayJVNWH3
	yLGhuApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAcv-0000000Clwm-28DS;
	Fri, 24 Apr 2026 07:07:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAco-0000000ClvL-1X0h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:07:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1898740539
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8AAC4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014414;
	bh=rFXSKMwR0XlgLDLIyJxwMfmA1neLi9/CshGkcjxghfg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JRAym1wsAl/ksV3GSU7FPEfP1Jlii2RQfYmQAQpIqvnyQ0b2/ud8dA6XDXU7sU9hR
	 mskPbdKpicBfTouQfGQC8DOwbnJP9neDM/BJgsiSaL/OOvof54mTzGuY26AXVYVZcY
	 sJXPWWdwgfK7aBVwEz9iJZk8GbIQN1hApTCVA87+w1r+Jga7pM89jaTgVbmBqkGNdG
	 +njQmz6sYg+6CHan3Y9yvRpG1T+a+f2qPDYU0173BTfBzD2oJkS+g0TnC2nh0JHQxl
	 2vT8YJ6JWUc0k+Bvz1UuJHcRKpkzA/7NLA47GFftZBCbXGofuD2Ynd5HyAf47zAMpy
	 Se/2heNSjA2Rw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1307438ddso6839317e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/O9EyNgCdcb3MTYk6uDrHirc1P0amEQxi8RHgBhXrQ8Ncu3M9sdtIfhU6h367pmzagvkBQlSGxTbzdB6MhNLTg@lists.infradead.org
X-Gm-Message-State: AOJu0YwkxDKy+THUWGK5EBX8D/U9M5rnsutliYZUYiXapsYbAY2JHQtZ
	MWzYNMVpmh7inU9kziTBcCLFUqEiQvySNjfWCLurFBy5rIO/YIqyOZvsKDGBJAH2WvXFdLxay39
	hSKDxsoDB5h5EdAK4oPgDMS3P4U7WMGI=
X-Received: by 2002:a05:6512:a92:b0:5a2:a851:b00 with SMTP id
 2adb3069b0e04-5a4172c0fb6mr9394355e87.3.1777014412658; Fri, 24 Apr 2026
 00:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260421-send-v5-0-ace038e63515@gmail.com> <20260421-send-v5-1-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-1-ace038e63515@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:06:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
X-Gm-Features: AQROBzAkXXHaECougTpR5Akx1BQv74bjgEPuXg2NkWEW6SVAF8JXYWHStj24kKk
Message-ID: <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] ARM: zte: Add zx297520v3 platform support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_000654_423773_BECC9DEE 
X-CRM114-Status: GOOD (  12.76  )
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

On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
> and sold by ISPs themselves. They are widespread in Africa, China,
> Russia and Eastern Europe.
>
> This SoC is a relative of the zx296702 and zx296718 that had some
> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
> platform"). My eventual goal is to enable OpenWRT to run on these
> devices.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Didn't I review this already? I don't remember, anyway:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

