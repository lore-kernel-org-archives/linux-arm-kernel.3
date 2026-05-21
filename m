Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516B2CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKLGSf3GBjMP36BA0MEdaSC8c160hy43LOrQEKAZGHA=; b=AzbC1rZtV3JMIHCEz+Wd38VS40
	IuMGt1xEo2d5hdmW3V8mfrt10iUzIY+iNmhVWN5tkcpxitW9+EjB3E6btVHkDgcsu4C1Mq0wNERi8
	z2lfeTuAjGFj6fEaEkZ1Iom+EDsJNgdU/Xe00LbcaXmV2oRYtdtrBk5ISRKlU0y95LEWANBjY2DJD
	S0UB6cDS752brinn7Sb/74PVZzUwFqdesshaf2R9x6vVitJEEm7O1J83+Sv7u2SLP0BlGKmVgYeiF
	cU9uEGzhwEEyIs//0FcGbofXv4eXQcO7p/3KoSrIVj6me7Z4G5FZhRx4mLjYfH9QYxZz8WX3SLpjd
	Oyqw0s7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzKR-00000007Er4-1LG9;
	Thu, 21 May 2026 09:04:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzKM-00000007EoY-2fPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:04:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 331C1445A2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC841F0156C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779354266;
	bh=TKLGSf3GBjMP36BA0MEdaSC8c160hy43LOrQEKAZGHA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eKQomMCRdagq0CrKNNAbWd+5SdT7HxEZk8SS5c8YukUkxYbmsHDNc/MTCkRogOOAR
	 Pt90hL1Y+9+RT+N3XxUqrqLtC8PCPudBhj3TVnarBl21Gv9NEoCrtJ8+d5Jb/WMAeC
	 ML0j7DPXCMlI6VpU6g8SKFHinb03aCauKOqSAnYd6mmg/ByxqHRUMCYHVZSLCbjYjR
	 Jqr3WTarjbmTW+joe5Y++iCVDIgMGOqSp9V1U1/HCam6x7pvdtNk1FCRJOo8Tkv7FQ
	 FOLySF45LYKr6CJSo7I6TQ3iC18Zx5azfFzHqJN/J5myRPJSuw9bweC9nSI3U1A2dq
	 WJy66QWmIaooQ==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-132830d8281so4827228c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:04:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+L738BXuRn2lIkm4DiYpRilPvPTMMyOxbfejeWekShqNL/Y756K1CoPRHxVvA31SUL5ArQcDNSWbTL/szulo0R@lists.infradead.org
X-Gm-Message-State: AOJu0YwtbZfYNvHu5w/+erHtl6osYAOmPP4Rt+usaCTCWMmxkbxPvj6F
	fCTUXrpWJHdR3k9lTBi1ZGW14ZRLjpPobB9uExQpHia238UZL1PPju1Grs0rF9JOGlLhcWWkhJE
	M9GOvE4XXJDTpiWZxrgObqq9nYd0cYvAUzkcmFTJKCA==
X-Received: by 2002:a05:7022:ec88:b0:134:a731:e778 with SMTP id
 a92af1059eb24-13632f6adf6mr920006c88.39.1779354265385; Thu, 21 May 2026
 02:04:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:04:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 02:04:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260520183815.2510387-8-arnd@kernel.org>
MIME-Version: 1.0
References: <20260520183815.2510387-1-arnd@kernel.org> <20260520183815.2510387-8-arnd@kernel.org>
Date: Thu, 21 May 2026 02:04:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mebt+hpSBfpsnHh1+SKt9b1cRBNge5WSoRrsfX1BBFgtA@mail.gmail.com>
X-Gm-Features: AVHnY4LWqhGtTeBYvpB-D8gN85zif4ar2-h8NZZ1yCLGF3pH11futzwzVDKQXSE
Message-ID: <CAMRc=Mebt+hpSBfpsnHh1+SKt9b1cRBNge5WSoRrsfX1BBFgtA@mail.gmail.com>
Subject: Re: [PATCH 07/10] [v6 net-next] dt-bindings: net: add
 st,stlc4560/p54spi binding
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Lamparter <chunkeey@googlemail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, Christian Lamparter <chunkeey@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020426_750021_9AEB44CD 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, 20 May 2026 20:38:12 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The SPI version of Prism54 was sold under a couple of different
> names and supported by the Linux p54spi driver, but there was
> never a DT binding for it.
>
> Document the four known names of this device and the properties
> that are sufficient for its use on the Nokia N8x0 tablet.
>
> As I don't have this hardware or documentation for it, this is
> purely based on existing usage in the driver.
>
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

