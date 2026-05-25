Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDD1CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXz/GYVV9QSNbeC/HxJ0KuDPx2s68Hc+e5zq10KEVeM=; b=yujSKi9l+hBBL5/rW4xyYfK5qw
	1oHo2de+oWnlvWzKf17wT9rt8SBSiTDuFsQeL+OifkSRuXyM9mDSp3pfvabqFGbfYGfpOgp3wjRDf
	Pk+Pt/HkmJUlDjSqhxKdphWB2fXvdV0YxHuToGvLvsN5qTJdel1S7lKdJaMApCcijEZ8MM2hWkyAU
	NmaVtsX9H7x4CM3THizdYXBiIhmo9T90Zo8+TLBoXEGQ6MfqDg4KfR3wmZ6mXxbUvRh4JuBTaBaHO
	yEBrpubI7FFm/lD6tPSwDHZqQthL6J3zcr31JqjlWBr4SfTnE7S+JLRmzi3NM0dC7P2nmLk666sIv
	0qJp9fHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRR8P-0000000GkMP-2TD3;
	Mon, 25 May 2026 08:58:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRR8N-0000000GkLr-0YlM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:58:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77E7B44598
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543461F01564
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699482;
	bh=xXz/GYVV9QSNbeC/HxJ0KuDPx2s68Hc+e5zq10KEVeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PsfSJ9qsfwUwMwGEQi9C5gkghGo00zi/UHVZXT4fQmDaGE2tbo69FkGJUMDmJx5ZP
	 ajPVIPljZ4PYnb9NQO2JuaYOFz0uSSzjinXFbifeiuH7Y5hFnmw/pg0AbsywCXU/SD
	 iPUkHSnbzPHqA1uoorTRRt7DninH/J/mgesmdexSXzDEg3Ao0pEGi/C476ZUYOoNjo
	 DhVby5WWmAzJI1rJokBGqtXYfB6crSo2ze8eCNS3Z8HpmjitJ5phMuXGeqY8YpS/IE
	 4iv+mYl92pOnQMXUwDk8yLuuzxK9SKUDmBR1sZXJrfOae8y4hAMWzbqZLbeDzEDzc2
	 WZ12vmUy0grtA==
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de7c57b52cso8276382a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1GuT6kZZYdig6v59g993NM7eckFgqadpbC59eK7tSpzKEMCG1yKSovnIbisUzrjwCkBhs6g7Qpj4U0ISwcLF6@lists.infradead.org
X-Gm-Message-State: AOJu0YwBP6I1TxOH7gYYxNkwBZsI8YCY3IPgFG7g1+hbY8/DSHWej5vd
	Vb4hM0NsX2ROwjm4zIMkuxrAJuQ73wbK1sJixe+8Vw4fM+fB3JZatXxYgqnmUtQygukf1Rzbp1L
	mpDBJbiuHb5CyyQE1AuEi2UWQyldGFNQ=
X-Received: by 2002:a05:6830:4985:b0:7d7:fb8c:3c29 with SMTP id
 46e09a7af769-7e5feeb63a7mr8912823a34.14.1779699481274; Mon, 25 May 2026
 01:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260520183815.2510387-1-arnd@kernel.org> <20260520183815.2510387-3-arnd@kernel.org>
In-Reply-To: <20260520183815.2510387-3-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:57:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
X-Gm-Features: AVHnY4KW10_QvipgU3JqDhFdOUhRtRqnFXdZTNq6fk963CfrOH70VHOW3qgjj1k
Message-ID: <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Christian Lamparter <chunkeey@googlemail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_015803_211733_CF77B0F3 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, May 20, 2026 at 8:38=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> interfaces, but there are still number of ancient sh, arm32 and x86
> machines that have never been converted.
>
> Add an #ifdef block for the parts of the driver that are only used on
> those legacy machines.
>
> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> passing an IRQ number instead. In order to keep this working both with
> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> the gpio number if an IRQ is passed.
>
> Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gm=
ail.com/
> Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

