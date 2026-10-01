Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98D8CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuZLwo8L/Pz3tHEl/pgaDbc4NC6C8bTc4OVbV4XoCzU=; b=dxr2Q7nfQVH+z3sjf+qF0J8Ylz
	C/yP54dSiQJKTqmEz8FfqlzK3+c8xv3P5Iyh/dhY0GnQAHFV5lJd1PZaaySYOoRlgc7nFKkl8DaE6
	xzg7P+bEiRghy8ZFyhuKtBRxLz+F3vnvMjFurBfEkCWVbHNHBxIUg31F5rsHyHTAT75zC6h9LiKvh
	xJLi9cZj4FvBihMRJcjFuDFab7rVL6syi81bmNraaqInuGrLuuwpWixkRr6O/41vXP+X8rYZCmo0b
	dhvrf/SecsjjmlwzgPc4USXF5yEIw1na62vtOn278+5LW4L5lXlAjkEerzr6M9Bh+EoHm1uzdpNue
	F/QSjPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNMe-0000000A9PY-2ohH;
	Thu, 01 Oct 2026 20:26:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNMZ-0000000A9Op-1sjZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 20:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E921442E31
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 20:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4531F00898
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790886402;
	bh=cuZLwo8L/Pz3tHEl/pgaDbc4NC6C8bTc4OVbV4XoCzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lSQa0Q1Tmp6AnEKgZnzPKAv/nZxq4L0eN0mmIfFPzFE5VKiKhEGw64PZ7Kest0yXV
	 RzLDkDkLeYWVXbGEQfwzqJqjYVVNGGYhRgrR4HUFdg4s+OAustLvpWFzE92VIwrb0/
	 9ZvmBbLQfjnX+M7swxzFDVVEoTPUkJDTYRC8dlpLkW7wTbrvs35hfgqRrt1jOTyFJd
	 oyENsUwCm/haQNacO7s9VBgPOEqYf5dFgNjh3hFEAW74RIKj7XbxuV330RPHQVL+El
	 +Ngt2IDbG2nLQoLI4gAr4xzgufiAHYXlwgqjBnar7jYmCiPqHE3X/YbOX++L6davvF
	 fiRa2L2zsx+rQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso21161961fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByc71DeLo6hxCzs3Xp8rUuoygQdKNCuicSha5glVKU5dJFlpNdOx4YwoUoH9cu7TWPZUHO5w1j52ChryglA227T@lists.infradead.org
X-Gm-Message-State: AFq9FYIV3Aw/e0fBd0kDHs7CAhFzeWvhkeiWCjK7iyysswgc6zlSQXj3
	XC2OJHP9kWj5VEWg6CH+DSOzMDmqc099x44sxrcN4X/g+bZD40PsGI94SXLS9eNoYQdkP2FiXMo
	VCM4ChXxJ9/+GQlB0Hrdk1TmxhLCN+q0=
X-Received: by 2002:a05:651c:982:b0:3a7:83fb:a2f4 with SMTP id
 38308e7fff4ca-3a783fba4b6mr9981301fa.15.1790886401618; Thu, 01 Oct 2026
 13:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-3-745eaca28b1a@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:26:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCXt2jPps1+X3gmT-+o_ST59GOT1Huhqx70NK1RDCExQ@mail.gmail.com>
X-Gm-Features: AclHuK-u9udZl77wTM7_r_7heAhhugb-sGNthmiZZXg0N5M_CZnxPf-YeiEWQxc
Message-ID: <CAD++jLkCXt2jPps1+X3gmT-+o_ST59GOT1Huhqx70NK1RDCExQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, Brian Norris <briannorris@chromium.org>
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

On Fri, Sep 18, 2026 at 9:05=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> From: Douglas Anderson <dianders@chromium.org>
>
> Add initial device trees for frankel (Pixel 10), blazer (Pixel 10
> Pro) and mustang (Pixel 10 Pro XL). These device trees are enough to
> boot to a serial prompt using an initramfs.
>
> Currently only Laguna B0 silicon found in mass production phones is
> officially supported. Further revisions such as A0 silicon and EVT
> devices maybe added in the future if they are useful. As of today,
> these device trees boot fine on EVT devices with A0 silicon.
>
> A few things can be noted about these device trees:
>
> 1. They purposely choose to use the full 64-bit address and size cells
>    for the root node and the `soc@0` node. Although I haven't tested
>    the need for this, I presume the arguments made in
>    commit bede7d2dc8f3 ("arm64: dts: qcom: sdm845: Increase address
>    and size cells for soc") would apply here.
> 2. Though it looks as if the UART is never enabled, the bootloader
>    knows to enable the UART when the console is turned on. Baud rate
>    is configurable in the bootloader so is never hardcoded in the
>    device tree.
>
> Changes by Peter Griffin:
>  - Remove dtbo overlay approach and add individual board dts
>  - Update to lga-pixel-common naming like gs101-pixel-common
>  - Reorder nodes alpha-numerically by the node name
>  - Add ramoops reserved-memory (tested with console=3Dpstore)
>  - Add reserved-memory for bootloader & gsa logs
>  - Add reserved-memory for Android BootLoader ABL (used on Watchdog
>    reset to extract boolotader logs / parse breadcrumbs / ramdump etc).
>  - Add osc 38.4Mhz fixed-clock
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Co-developed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>

I think I reviewed an older version of this yesterday or
this morning.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

