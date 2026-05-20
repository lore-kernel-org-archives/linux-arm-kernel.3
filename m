Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425D4CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lqFsUI2+he6aDFO+JHJcddqbluM1re8BxjczmtcwsYU=; b=ngKJJh+qbuM5u8VX3Fhc8TUuSj
	3o64ZpRPd5F+kdiPy0EmRUyOrfylz00l2s6WAjh32KWvRGvhkFzC5yYcRS7z99y7SNGoo+FfVvmCE
	9SzSH2/TerDX57NmMfFgvV5a47XJDspo/NbCeGXhL6JFBI5vZs78vL9bUy1bxEkXwbrY3qPmZXGSM
	IwRcjRPM2kLEQR9xsdfDyJyMPge/8GzFr/zgxkL3z2mf1SDPTrysxGCWkHNeFmVUq0GwlSTOKoBow
	flVQhDIiMZ5Ycm//n8qBn15y29EKfLQWD8lAXIAK24v8oslfWjSdCNdhplR3R8HuFUayzf8sKaoZe
	CiXrCBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPokr-00000005san-3fsa;
	Wed, 20 May 2026 21:47:05 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoko-00000005sZr-47dA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 21:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lqFsUI2+he6aDFO+JHJcddqbluM1re8BxjczmtcwsYU=; b=Nye50udS3+S16QKqPmqjLGkZGZ
	P4ZC1dR5vf/b552eDSWCdh4s9yL7Rw+8GDSV4Gh/udyebqupg0yQ3qLFBf0k9XEKrIwqpOiCsFhl3
	AUfegZ5TlKFTS8fRpdxUsujDU5EIHFm/G7dJ7pJu1mCbwciR5F+PsWhHDb4K2XIhQdCNix284xznX
	uSo1zfxQm9vlncrXn/3FCVQeMz1yOkKvjR8bqWsxT0G3Hd7rb9YYRis1nRnQ97VIPBMSmqAeCUvd3
	+xuG1xxOa8rIYmDapZZtncXV7MQj3u9KWslfjrZDA11t01cHCCOSuVNfRQeb3nvWEoJVzVBAWth/r
	SdoFPTMA==;
Date: Wed, 20 May 2026 23:46:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Christian Lamparter <chunkeey@googlemail.com>, Johannes
 Berg <johannes@sipsolutions.net>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones
 <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>
Subject: Re: [PATCH 09/10] [v6 omap] ARM: dts: omap2: add stlc4560
 spi-wireless node
Message-ID: <20260520234627.3cd83158@kemnade.info>
In-Reply-To: <20260520183815.2510387-10-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
	<20260520183815.2510387-10-arnd@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_144703_026270_94A467D0 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, 20 May 2026 20:38:14 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Converted from the platform_device creation in board-n8x0.c.
> 
> Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v6: no changes
> v1 through v5: adaptations that correspond to the binding updates
> ---
>  arch/arm/boot/dts/ti/omap/omap2.dtsi                |  4 ++++
>  arch/arm/boot/dts/ti/omap/omap2420-n8x0-common.dtsi | 12 ++++++++++++
>  2 files changed, 16 insertions(+)
> 
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

