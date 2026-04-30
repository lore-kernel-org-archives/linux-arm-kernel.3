Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EF3FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/klmbLlHjty1gUUHqY2Dbg+r9lnLNSpnZBORzQfjJQ=; b=ek3dkzB2lnlfnzF+mR7g1kvcE4
	/j30DN+3+NVHb+DSDd6Oqy2dymrHK/wfpGl8pudHt/X3X/J97dMeDVGXfr2v0dKREtIKxEYk6vP1Z
	zG/oj2+KtEV4uNhUdU1UhARf0hWadAxBUUt0vPFWPKkhoICIARqJg/Vb00e3IO6onYjLy41fOCn/L
	0x204I1WAi8XucFtMJAgAaDBWOWLyST4vG/E78xRIoVfqeAFjPQ+JF46/WbHW6qKOcJX50R+Ubnej
	G3XNofpxbzZZS2GzBGfls9IiQPOn9redAqsJq4h5hVxdB3Yonv/JdvCDVhmiN3p16nRI2WtXQCNsq
	uL5uRR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISEe-00000005Zqf-3Ect;
	Thu, 30 Apr 2026 14:19:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wISEc-00000005ZqM-2f7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 14:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD9A244529
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CEEC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777558761;
	bh=F/klmbLlHjty1gUUHqY2Dbg+r9lnLNSpnZBORzQfjJQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=I4P/LG7tkJ62TA4BzqdV5EF2UiWWFowy2id1mu3WJfGMqtDHJ6CGzB8xg+DjTBfUx
	 inXNM5WQe+V6D/jPCfVPl5ILLXQmTIvGFx7hID3c3XT0BADAKicUNCVfheKbTczbIO
	 PNUBpb7TiNv2hz623mQEGrU/zjTtAYPUpdK92zUChqA95lVwllzBAU1v3PQF0m6AQF
	 ZVRQsq7Kkd6RDCTPyeveaeOH5V+cbiUsiroG5VGU+W4cC6SCy6h56gPq5H13IRsEbH
	 WQHZT2zVf+Q0Fba+E9f4kuYAcfqp6jTvQRUrlABUY3UojE7mOJN52qYH7cGQ+pdlgW
	 qac9vM6Gv/JKw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a337552604so954107e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 07:19:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UKxbEBwufp27GuW93J5Vy1CXHK9K6CRQMzSdHfBmxSF+GaX0IoWbAy1LUeONVvkrLVaJHOLTpwGIXl0guG/G+@lists.infradead.org
X-Gm-Message-State: AOJu0YxJwg7k6LMD6hkYLe3aW4jLWLzzK/K5Y/6nEBPOv6rav0+HdlOm
	GZbFR7xuT9OSOPHgrr8/an19EbDoLYtISdjovX1wsy/6amNmZNmJGfOI2Zw4gtqBhVjw9LhEbRr
	aZQvCBL1n9SwOox0CpP6PZmh2AdFlqru3f19eeQWBHw==
X-Received: by 2002:a05:6512:2385:b0:5a4:18cb:884e with SMTP id
 2adb3069b0e04-5a8522d7f89mr1123970e87.26.1777558760093; Thu, 30 Apr 2026
 07:19:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 14:19:19 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 14:19:18 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260430081242.3686993-4-arnd@kernel.org>
MIME-Version: 1.0
References: <20260430081242.3686993-1-arnd@kernel.org> <20260430081242.3686993-4-arnd@kernel.org>
Date: Thu, 30 Apr 2026 14:19:18 +0000
X-Gmail-Original-Message-ID: <CAMRc=MeYOxDdpS=AEMX7ChHcPTOsz1+DxuSNcNtV4PwOagwyUw@mail.gmail.com>
X-Gm-Features: AVHnY4IpV9J_wm_g1EdQYCGOE-gGqU5pWdF_TAuz210HOf5B8hJhqLIEur523_Q
Message-ID: <CAMRc=MeYOxDdpS=AEMX7ChHcPTOsz1+DxuSNcNtV4PwOagwyUw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3 omap] ARM: dts: omap2: add stlc4560 spi-wireless node
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_071922_714907_1785D413 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

On Thu, 30 Apr 2026 10:12:42 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Converted from the platform_device creation in board-n8x0.c.
>
> Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org/
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

