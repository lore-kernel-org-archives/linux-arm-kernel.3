Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E49CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKOCvjoNQtwRqFI066qdcmZWGjZbp8jaY+FDxN7dTcc=; b=PwXDR9WO0eCxpLju+0OXaoe29A
	+JI0qeY/7wCNS1zA62qgr+et4n6UM+o8sDxjaNETLVJTHcAsxMsTs1Jt+HQCGLFz6B7pggA2xG7iD
	+UxH8xU86nXX8MeTwr16MXCa9FDjh2cRNcY+f5Z60/K7+TSxGGha6gQFIX6x9Mc5LWd8aIr+QtZQN
	oEY5e4AOgx2G9DVJIo+qPQ/aCNeuurHFkKM2LvgBId7RHdpTBDqh3x6inE4Vn5HqVfLiaJrr/sQY2
	OuVetmB8eTAIzhzDit/j3hcN+EKl21IH0BFoSQS83RSwxQ43vv8DK49k3rY4IMr+l54ZKxxGmVw6+
	ObrcFgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ0Y-00000002LnH-2Dak;
	Wed, 07 Oct 2026 11:40:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ0X-00000002Lmw-2JXF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:40:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6A1243482
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F43F1F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373224;
	bh=fKOCvjoNQtwRqFI066qdcmZWGjZbp8jaY+FDxN7dTcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i25gWA+/BKLg3TJBUNxM9g1wPMz2Jd2k0rRtVH5gzvl0N+WAoLKmZgmomQI5MUIqM
	 QjhKugvm02ZHL4j71MoW/sn/NAtHgybdhk7vxmgchTSLfSrE8jSyX+I1RZfKlDj10v
	 jS7thfqmx0ZAh+FSeiez7fkJWNde5unlCkg18ttSR050jBqcvekEX7aeL8Ly4JXnkQ
	 A0cxXKUwk0X8WHPJ44sn6g3hI8HPMk9K6wEzTpBJAv8toRWbABUsd3j5exzGC/xWJP
	 2hCiKXjyoVxSoTIFIhvrSomoRqYtY3xdcVGOSApBa7BJJ0vnHRgKtJgmQCeaCwg/ST
	 SgEqv+I5eeTpg==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6df0b02fe91so1342233eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByw+BtKMRSzKkOyfS3ftYShXUO7ZOuG/els3GmXTK+SrbIvpwlkJHlKSvbknJXCV/Hag/lK3etFj7+5397gd4Kv@lists.infradead.org
X-Gm-Message-State: AFuF++mKmK/gZSxYpI3TnrS/9Kbv7E3hab0YjbjSVMhj0g/JpMBw/YFr
	wplA1Dm6evoHzj8p/V2pJzaRP7L/Mh0/UsqZPCjLPHItJ8TXgVDcB50wFgHtk0vGSOQTwwqUZO6
	E633ySjL5+z8HZoSiej9BBIoQ90Mdb6A=
X-Received: by 2002:a05:6820:200d:b0:6dd:7f2c:2bb6 with SMTP id
 006d021491bc7-6e4a7e43471mr4207285eaf.57.1791373223883; Wed, 07 Oct 2026
 04:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-4-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-4-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:40:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLn74bT_Fyr_Og-4UCHzesesgzDUe9UiFWNX2zQrJ92-gg@mail.gmail.com>
X-Gm-Features: AclHuK-Qje_8nYjYN9tMFCPYQzKct6wydoO2oDonV_Y-5ca_xI58bQphqW6iRzQ
Message-ID: <CAD++jLn74bT_Fyr_Og-4UCHzesesgzDUe9UiFWNX2zQrJ92-gg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 04/10] ARM: goldengate: Add support for the CS75xx
 SoC family
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
> The Cortina Systems CS75xx ("Goldengate G2") are network processors
> with two Cortex-A9 cores, an SCU, GIC, the Cortex-A9 global and private
> timers and a PL310 L2 cache controller. The family includes at least
> the CS7522 and the CS7542; the CS7542 is used, among others, in the
> Securifi Almond+ router.
>
> Apart from the vendor this has little in common with the Cortina
> Systems Gemini (SL3516/CS3516) supported by mach-gemini: Gemini is a
> single ARMv4 FA526 with Faraday peripherals (FTINTC010, FTTMR010,
> FTGPIO010, a 16550 UART) built for ARCH_MULTI_V4, while the CS75xx is
> an ARMv7 MPCore whose UART, GPIO, interrupt controller and NAND
> controller are different blocks. It therefore gets its own directory,
> named after the Goldengate codename like in the vendor kernel. The
> Kconfig symbol, ARCH_CORTINA_ACCESS, covers the whole family and is
> named after Cortina Access, which last sold these chips and also makes
> the newer 64-bit parts.
>
> The generic DT machine is sufficient for the platform, so only the SMP
> bring-up needs code: the bootloader parks the secondary core in a WFE
> loop that polls a global software register, so boot it by writing the
> physical address of secondary_startup to the register named by the
> cpu-release-addr property and issuing SEV.
>
> The CPU is a Cortex-A9 r2p1, so select the errata workarounds that apply
> to that revision and can be enabled on a multiplatform kernel. The PL310
> is r3p2 and needs none of the PL310 workarounds.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

