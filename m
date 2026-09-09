Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F045EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjNDOXDeuB2hgWmjfXk2EUyO9cutSwBc1XNCZLTUAlQ=; b=KblIpwqQfH/TBhWoifV7R/eQmV
	hkLprA4pwELGLv1VP2bxQdVm8B5CKiqfifs9uXpxdV6nwK1hmIf3yFBaRlnWNxaRFEnRLPchtZJln
	6xf3zoNklQZ6KKy09tslyP9waFAD4jNXSkpXYEtoQu12LII4XwMfjkRFEtuLXSPU/Ol1cMTGfL1fK
	bMPx70rYkdF6TC7WC67V82ksU+/YnlMIO7qUHNAFkm/rsPegslw6LXbUCXh25Krz2h6LOn0vW1Osp
	yd1cmpl0gMcvDmzzWPAcZHGklk3Uol38DsdCgPRmX9TW/CYRkC27C1trBHicAbeGjq3kOC3EjjGE+
	dJwB07Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IfN-0000000BqLO-1yUE;
	Wed, 09 Sep 2026 13:48:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IfK-0000000BqKc-0R2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:48:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C18A01A1A70;
	Wed,  9 Sep 2026 13:48:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92C9460448;
	Wed,  9 Sep 2026 13:48:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60FF411C7AF7E;
	Wed,  9 Sep 2026 15:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788961712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=SjNDOXDeuB2hgWmjfXk2EUyO9cutSwBc1XNCZLTUAlQ=;
	b=e4hV0USw2592sArlmqCFVDTCozCtOc6LjMSbUDXNj5N8xWuQPilc8ETI4F3BiY8ykW8CSK
	V7FAYn/uQfEtyQZp5rzZwuRicmERsJRGQQv+4DILDAZXhYfMKwQzHcnKX7rpvzN8QR21Dd
	IJXcAHyZKNbstaLcijpTwXaDTSqj+PZCY0BtnIbX3ngZ+smMvutnMSpa7cW7FLgXbgiKt7
	Mxb4rVD5vU178/mSnWvSrGdrmvEsrxcRBrkwPvmCJfF/0+8IsfxbL+gaYLQqHljWPs9+RO
	tsTofIw6j+hBiz1+Esu6B9+hGjveoYmKfjL5g4jEgrwMNi3GO3FYOOk5CKsUag==
Date: Wed, 9 Sep 2026 15:48:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Sebastian Reichel <sre@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 10/14] mfd: remove unused rc5t583 driver
Message-ID: <202609091348246a76051b@mail.local>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-11-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-11-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_064842_301687_38D4E376 
X-CRM114-Status: UNSURE (   9.68  )
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

On 09/09/2026 15:21:47+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Ricoh RC5T583 support was added in 2012, but no upstream code ever
> defined the corresponding platform_data, and there is no devicetree
> support, so this is all dead code.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

