Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B32ECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D7duqRcD3fdsTRow2UhPRWiLjw5TIDW3U11ZLjAtzg=; b=Vu22QW6GZLjdNJ404OE0FEplfa
	vZzeoU6tTUHES0umF5uQat+HZnZUum3YossXTvIVQrT+KtoclUhBFU36GDHEqbemrNX3bsFu5Zc0E
	hKN2y/JjuytGqkLtZe1p5ie6eFLgPZv1qke0dZ1Sls+13nYz49vkwctxRJRByToRENlmYVRbfQ1V6
	JpXo7wj17GcP9gQcgw/Va5mWehkNf+MvlPjHMhajr9L8YzGMvrdjXyV6B647QgAKyxxVGNdM9QE1Y
	kp1iSBnAls72+goggkIRA51+glIiBRXgPSysAB0vrEGBW9BRGnVY412zsUoiFBs8Tt7eXncjFHkkX
	jv/aSC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tV-00000006S1q-1b0V;
	Tue, 09 Jun 2026 22:26:01 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tS-00000006S0c-0XOZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:26:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so2639958a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043956; x=1781648756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D7duqRcD3fdsTRow2UhPRWiLjw5TIDW3U11ZLjAtzg=;
        b=lNypZYM6M3eh9j2/8ZkDDYn4xGAYuPQWuoWjr038maNXCGlg0558H33ckPdQLU4O/q
         MDungkfmosicniNnTsaITASnfEZ4MdEO0ya3x+kEDLd0Tim/kEBJ0694XjgacSUJR7dO
         ekZXaGkOsi4SR61hHAPBz2Ny0j18Kg35W9CqzDyoIp+8rQgMxeqxFx82GFEd4gGNDcex
         sstpq4RlSLA6E09OUqM9A88/HYIrvYYwg7C0ZtPJv3GWNvW6I9QHMJPM4dlFsTHBz5Z/
         WejiTtD4BdeEP7zyDxdLjz1EMFydsEqWRPUGYNoifzHrOvOYLwyGA2re9abVDt5WYTTw
         rY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043956; x=1781648756;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6D7duqRcD3fdsTRow2UhPRWiLjw5TIDW3U11ZLjAtzg=;
        b=FKgLjAOsg9Y8ja6D0qGt8UP0W/R23nMgEIVTyKIWE6Vac4Q8GlznQgqEHZSeLlflQt
         a66l94VQS9JsnjBhhrPGFEdOIhZRy6VLRHYqRV/xbUaWvmiccDgeRL+8JiRc7788uWEA
         GQnvpwtz6lmOUckTke/jYkOCQSZkDO+x7gt5fm4zeMMb0VaCrnA0R/csV99b+lXe3kZ/
         c/m3pOCKMR/NOhpDqO5B3ANDPlmwSsF+F5Vsa1M9665pHcWWRTLjQoV3idZEiB1XwEC3
         D+winCUavRERNmhC+Pi8As8tsvTOmK6+DQfuAVIGbtISte81ULSlCjJ06kg/E+JlcV+B
         Zn/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+CRNrRqFZPIq/xE1EVHH703307R2WCmazJENrdc/0lOtBqddN/rDqmjxX2CS2RVUQHRlkYvCj/95ba+f21Lti6@lists.infradead.org
X-Gm-Message-State: AOJu0YyZoC7pjc0+hyUEIpWh6j6uZNHM8c+9umfC9zZ6x30pa9f/bFvH
	K2QYJ8e938w9pkvCpwy5ZNKrU9+UPWxr6gMU0cqpXa+gWDwvNGfwpFg0tlHcAdgDLt0=
X-Gm-Gg: Acq92OHDVV9FxSC4gUeUh5WCsQpVY4N1iy/v5mGQCqlCyATsK7UhDoL+qgLmtIqCHLo
	NzB0ttzZNKgqtN1sYRDvw1zZcVMNcPV/ekhMetmlG6/pHOkau92XixI0W5eL+kW6PHxZ5/BB/OA
	kbaVxXB+rByq6swiiLNKUVPPaPsnvae1xD1vpuXMbSpakTamPP+ccFtmUqXjx1vEOPVavKgWfLO
	jIXQFj0TO6Dpa8nXJObJ5wBZRfYYukuuHq0+7k1ghss0lrgH7iKFhvtXRf9fNXbmFW7kdivJYqU
	skj8h2SwByikfroWOviTya7mxea7CVRcdTY6y2LUJ1RdZ5p4/PplGax2z3aBZ9sw6h+lHxB7EoU
	IN+R+IvPhVEtNly8oelVmki7PC5iu2fo+tFmKHde3A1rYJylIbMkSXuXmcZrGMrmRSQic5iFc3E
	dn4L4iEhDyX6C+4lbXIrararrXaJLiIBQ=
X-Received: by 2002:a17:903:2381:b0:2c2:27be:39a7 with SMTP id d9443c01a7336-2c2a1c9ac2emr57718625ad.29.1781043956535;
        Tue, 09 Jun 2026 15:25:56 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2c164f6e2adsm238181875ad.5.2026.06.09.15.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Christian Lamparter <chunkeey@googlemail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH v2 00/10] gpiolib: fence off legacy interfaces
Message-Id: <178104395573.234140.4413143072350533512.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_152558_181328_011E532B 
X-CRM114-Status: GOOD (  13.02  )
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


On Wed, 20 May 2026 20:38:05 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is an update of all the patches that are still required before
> we can actually turn off CONFIG_GPIOLIB_LEGACY for most platforms
> in the final patch of this series.
> 
> I originally posted this as a series in
> https://lore.kernel.org/all/20250808151822.536879-1-arnd@kernel.org/
> 
> [...]

Applied, thanks!

[09/10] ARM: dts: omap2: add stlc4560 spi-wireless node
        commit: c5a0ac76b364bbd1d4fb7e440edabcd2a369343c

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


