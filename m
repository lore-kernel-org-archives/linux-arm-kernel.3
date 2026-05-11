Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF88CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odtlCf4rIw0DAK3X4l8eqMLcnAKeYn+1YikUttO1+3g=; b=n3n8FK1xT9DzUubR2YFCc9NrSr
	L/W16lAmwZvQj82yfIMDYBK0LzO7uQC8Px8sIeLEIMVTf1Gxm8vS84YtweuAV5b2F8q55KvQN7F+g
	Y48YQhstV/dk6qRrI/1qNld/M7P22ZAGM6Lsvp/AC8b4ATiTni+Fe3HZO+bXaCgdTxbAVw6N9yAzS
	IQbMV95VNv7I0nqmTNOzhwE3yeH9X8rUTYNfkMiowwrc/fixifc/u4969486kzrv0da7ND9mf9Qj/
	owi49Wzx4pHyMa5i/vucXwFRtaVkCa8dZAdWir6+o0vfgQHfdO5L0Bh58LTc5ECkOlO1bFPGV4OAM
	eHPFDVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWrJ-0000000EfCQ-0PoG;
	Mon, 11 May 2026 20:04:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWrG-0000000EfBr-3CSX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57412444C5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347C6C4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529846;
	bh=odtlCf4rIw0DAK3X4l8eqMLcnAKeYn+1YikUttO1+3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uzCl32cHmsLYYMmy4oExJqEv8+Di9wjh49qyk9KHzEGnYFtXr8W7PJiyJnE0EVVHz
	 bT0F6XVNgJ+UcgiaWUL8qlL82z+ixmAAN7sjUUe88/W2i3uPs7Pngw+oj3/aLmqGxI
	 TMM6s6yoayzX8p+OXRNa9m/Ruq4eP00cnT+/Uhg6UWtc1DXgo1LyF5qGxLeUz0Ydwm
	 v57sQJs2UUFbwOdx9+NWFiv1/eR6spbuNXCbPUXxX9uQABg7+Ku/bL7u/0FkjfLYaA
	 ikHf55Pi/jAekAJZ8vyV/sXmOtSzoCH1wPAhFc/+6W2eNWsvellSmzZdCZKbdmLZNw
	 fBhgHT23UcBdA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso5356105e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89jSWplzxDqEYEAgzXUyEnZBJvzAYltPR/9A7mXeIXsx6bg+DTkXhpuB/Y4XpXHXdq1AWKamEwRNaaPyKB4FYR@lists.infradead.org
X-Gm-Message-State: AOJu0YygQ5LcFiTKl+VZTAmQi8QbMJzCMEgGZLEeN+rvjfERleLNTmCA
	Hf2+heUqjGsqgSx7Yl5OhC3+TlMc5jbBGVUfY895XNz8DUnbxnj9HrAlPXBFilHZT8ePdVxoBCc
	B0reZa1pjMD0YgtW/J3VMooUdvRPC7NA=
X-Received: by 2002:a05:6512:1053:b0:5a8:6ca1:425c with SMTP id
 2adb3069b0e04-5a8e31f2461mr6054e87.36.1778529844902; Mon, 11 May 2026
 13:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com> <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:03:52 +0200
X-Gmail-Original-Message-ID: <CAD++jLmMNFJ699OnHmddO+xRWgLCVj5BoSzOsooM3U3QuSOdrg@mail.gmail.com>
X-Gm-Features: AVHnY4IeBgb1SfMX7B73p8P9k7dubKkRwUr_eFji7cM7YkQeG5UUDe_o_9aehh8
Message-ID: <CAD++jLmMNFJ699OnHmddO+xRWgLCVj5BoSzOsooM3U3QuSOdrg@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: pinctrl: Add aspeed,ast2700-soc0-pinctrl
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_130406_822615_3092C9C9 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, May 6, 2026 at 10:12=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied!

Yours,
Linus Walleij

