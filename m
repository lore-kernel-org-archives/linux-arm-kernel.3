Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11170CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZA9NOgmrvX40bJArbpwfW7XATqFagxk7+begPN1XXr4=; b=oGJCP4KVkgZ3qBNoyAgSgfdf7S
	eP9EBXqeGbXdyx22qPUjseEmlHBj7TASfv9tIW5gcJWyhYcNAR7ekLjc5u49bST+QYWTZrrIlmQSx
	ODi4T3XEt3axeEA6uYUXiPj5SoFYrDx4nXzECgJgowcisfACrhVMIik92f/C29+rFAkGzksw64l2H
	i6sxH3hiejUrvCOomLI06oCqtxIaN4YDssl7UziBeWo+F7ALmY0l9ZtH5Igvo4ClAhWVhyakYJ/2a
	1dB6265tFG3XM4WC1ZaeNzCSY2ZbBGjhEIK1FXahubEQN23iwjHoTO7e0f2nUc3uz5Y36YmXFol8n
	GZ3+LzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ2I-00000002MFn-2tll;
	Wed, 07 Oct 2026 11:42:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ2I-00000002MFW-0Mzh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:42:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 54C22601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2A71F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373333;
	bh=ZA9NOgmrvX40bJArbpwfW7XATqFagxk7+begPN1XXr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=coPLoxwiHy/rhvSGNptLPSOdnfM5FeL9O7GZwjRhdIyKzpAauG0qxwlNYpBn/tr5/
	 fm0HPfKqb7ugfFYuZG4xlmj26ljHAfBmiDpnl1e14Cqqge3pTBey2ta9thqud+4Csk
	 WCC4jdYpWsTvHteeHz9HwedTM5t3yUBwnp8bIvzSCaZZzxQDRev/VJrPIODBSDspGb
	 KuiVc1p9s3OUIo6jIt49yWoTJtth7343U3cBglgZXb4nBl1Lx3fPLoP7Q/UtgTwyBr
	 1BPZ7v5O2yUb2D0BPWG7fa4gg4W7Ae+wl+its76AxpjBhBeW6ZRs+DOzjUhn35z3IW
	 JpxQbwGtnnC4w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1423166e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy1xWzsHz+z7SJQCAyX98mV/QveobdCRVSJVdwTPbTOdiAUPo1O+5pc5Rjl9PnAxj7HYPqMQvIjpX26wmAlf9nW@lists.infradead.org
X-Gm-Message-State: AFq9FYKvdL1KoYDXx7IGv/5l4cO7oup1mZssIiUdtNqfsoi1d0oydbHD
	uyOiqg+ttHA897HYDD01EBWPp6AG6rChWrPsNq7i1UKDOsyc7DmZzkXdPoYMf0GhAbCR06ntI6s
	27AkyRs7ztdcqibab1WmKKXVBVxjzl80=
X-Received: by 2002:a05:6512:6d0:b0:5b8:f3b2:429b with SMTP id
 2adb3069b0e04-5bcd0739e4emr797570e87.52.1791373331700; Wed, 07 Oct 2026
 04:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-8-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-8-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:41:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmnhSoEoXRZWTwFXmH=5rXXj2-LVZEtXNnEGK1W=BJhCQ@mail.gmail.com>
X-Gm-Features: AclHuK-cGfMV3wC_JnZ2yidK3ahYmAJBUguZTaFkKK4-5UvxJ1sv8QtWH9lA1fg
Message-ID: <CAD++jLmnhSoEoXRZWTwFXmH=5rXXj2-LVZEtXNnEGK1W=BJhCQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/10] ARM: dts: cortina: Add CS7542 SoC and
 Securifi Almond+ board
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
> Add a minimal description of the Cortina Systems CS7542 SoC: the two
> Cortex-A9 cores, SCU, GIC, global timer, private timer and watchdog,
> PL310 L2 cache controller and the four on-chip UARTs.
>
> The peripheral clock (APB) runs at 100, 150 or 170 MHz depending on the
> boot strap pins. Until there is a driver for the global control block
> that reads the straps, model it as a fixed clock whose rate is provided
> by the board.
>
> The Securifi Almond+ is a touchscreen Wi-Fi router with 512 MiB of DDR3,
> 512 MiB of NAND flash, a QCA8337 switch, QCA9880 and AR9580 Wi-Fi and an
> ASM1042 USB 3.0 controller behind the SoC PCIe root ports. For now,
> describe the memory, the console UART and a ramoops region, and reserve
> the top 64 MiB of RAM which the vendor firmware hands to the packet
> engine queue manager.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

