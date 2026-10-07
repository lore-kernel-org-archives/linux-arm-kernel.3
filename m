Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC87CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivEueNLxHk2vH0nhb5BeLMWpDwc53kCrNP3a0jUDX2E=; b=SjWQoieSZ8CrUYK/5CgnLHSaJX
	TOTRlnUuMmZGOzC3UzcTXeeljH6xzxSH1SPGTnS5GcAHHeohi0nReKEUd/sQ/0eVwsikPXlj9GlPp
	0dnSM07hbs8x4mT+g+I19EWFZm0e1244wnZl/DluvT7NiINOfnjKLM6zPU5MU09zhP4w9cIlxgjA8
	MbKVsT27rRGDFdYTRD3u0QotURwrJycvI+jJbk3RZ/MRmDP38sk3AyL6B8JWGOhKYTJ8L8na1SbJZ
	Fp5o07PcRo/5xvQ7nNVaWwIq+OxVY1kGfViykk7nL+1Mjfdr9fjJ1bYx1IZKmnd2iSTsbO+Yfk/9r
	ZuTCcosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ2z-00000002MTu-01uO;
	Wed, 07 Oct 2026 11:42:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ2y-00000002MTh-0Mpw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D57A4444F7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83521F008A4
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373375;
	bh=ivEueNLxHk2vH0nhb5BeLMWpDwc53kCrNP3a0jUDX2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Absiup7ECYSXtrMLN/bQJldHdg5wxZGDLix0U8l7vCt6iJ5wXNpBZmIZqT7C+5lHq
	 27PTTD4MsUwJmOOuo3mI9KClXBNcemGkTqBc75zSm8ywK/a1kOT8bsCzs9DKtNh5fq
	 ulv+K8+ZCyA3qODDwnMeU8aaH4vpY6oT5LIGLvRN/rfTLyPIOVGbXtcV8z8mecRZ3b
	 +t8oiIH+2V3L1ciu9oGJQvQIFIyV1XLMKbkeB0NBcTea0TaPuafymBDujnjZ9wrKIs
	 084xhaNxwgT7ZmQwakmkMkT1vmNxyUsFFF4UPjTNLsHFKPbdnSC68reF373N4Nyy7r
	 uCIZ2h73YJHwQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso4631839e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:42:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDINcPAJeKNurgRl+hry4CWketw9nf6AOrZk2oygGZozxyeeW6WClqfFBKFrOYt6MBEqPafZB8jrXqsTgDiUYx@lists.infradead.org
X-Gm-Message-State: AFq9FYJXXOuSjY7jyfzG8dT3GHmtE4I01ITyjXpDet4zOSCFUyUBgdcE
	cjgTS4KgDBe/2yUGvlmlM+kwV+uDsnaKPVlyotZb2PjaDm5T2FP/JbQ2R6Fpb+V+PNV7ysFfxcw
	KBdYAmOrC7M1jKVuaozH0FefHbN+Lq7g=
X-Received: by 2002:a05:6512:10d6:b0:5b8:eb3a:759b with SMTP id
 2adb3069b0e04-5bcd071739fmr695555e87.42.1791373374528; Wed, 07 Oct 2026
 04:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-10-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-10-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:42:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnRQtkM70jJG4+a399jAoGTX14uQVV0VRi-xqUeA9xXw@mail.gmail.com>
X-Gm-Features: AclHuK8nAoHDN1ANkg2tOlHkE-yX--9Ilsr5akWlC4NL-_UZZlci4TouPpcsIFE
Message-ID: <CAD++jLnnRQtkM70jJG4+a399jAoGTX14uQVV0VRi-xqUeA9xXw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/10] MAINTAINERS: Add entry for Cortina Systems CS75xx
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
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

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add an entry covering the Cortina Systems CS75xx platform code, device
> trees, bindings and UART driver.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

