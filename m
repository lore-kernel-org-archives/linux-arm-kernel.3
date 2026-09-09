Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F702C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3TXa8ZqMQb4DnauQKRwN/9Bqzakf4XtPXYK7Pd7tsY=; b=Pqn88isMtZD70EmH+nn786SAz5
	GppPB7800ijPdXl2ld861R4R/IiXGT4NR15MKXHd8lQ57ty/6V4k9ryAFeY0h3Xb2DZvDi90jGZS/
	v5ZQwnmyr3OsPM8pqVXVgcsbhKfpRqujby9f7Zl6BVGYbugStnRiOmfTygkfZwh5Cs60n44nTe+T+
	R5QGa5uCslQGsZ14ybiBRom5jAIR1OGEydCmapGH1VAGfOiWWoFLYGIpqui+kpooEKURPo4xzSfKD
	RuGzx6i0tln8Q5qnvwj8YqSb1LipHjhaKxRTlFxBWWiuvODZw0P565N01IPsIfSYKbC0ZADEeE1RV
	6QVKCE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Iib-0000000Bqn9-0Ig0;
	Wed, 09 Sep 2026 13:52:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IiZ-0000000Bqmk-41Rm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 13:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X3TXa8ZqMQb4DnauQKRwN/9Bqzakf4XtPXYK7Pd7tsY=; b=gev0fCv6ouK7fAQdMBOmpZ/m9W
	5O+XgtRlfMTscM43ZAgiQoqcGXe8O8pffvAhR+QsZm4yY7t7PqpJfb+lyGkZr8KTJhNj18aEPcCfB
	w6Zcxk4TxboWZPPPADWhvpJwS1hKi6m3xTB9huKjJXpKF7vT4qFWI0VPOPVQCeprOpWnW2FZr2ecE
	M4QylSU5RI+PXnTEqvYvmbByY4mCLs5roqzxIiOo3AG3qxTYygi63Hs1aPqa+3KubqvzrRCrys+OK
	DJlAuCXSbgrw7pmF/avsQxvGW5jAabuEernyb6Bcht8+26V3PEDraoJOiNbQmevIieST/FCpduOqT
	F+gVWDUA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4IiW-00000001GCe-3dPC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:52:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07A784E41592;
	Wed,  9 Sep 2026 13:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD57B60448;
	Wed,  9 Sep 2026 13:51:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A566B11C7AF8E;
	Wed,  9 Sep 2026 15:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788961916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=X3TXa8ZqMQb4DnauQKRwN/9Bqzakf4XtPXYK7Pd7tsY=;
	b=ioCAXYPVeyyJMca8ak7CEqrnzMHTUnvRr+T9Em1q2K55JSPptr9oF0sf8wq+LQEdMpFEKD
	00Vkzm8CTC+NdwdC1gZZ9VtovHy1m5ebKW8EgpOtx8a6YUjVa/AU6YAMdmkFMBXUnNt/NX
	09GgLdWETkP2R+00Kf9hLVtcVDO20S1blQ18HThNPki10EisBVPE0hTs6dtgpE5pofHJc8
	YP07DdcaByF7h4IU4ii4lOqWfFZiccMDPuveULOScrip6ulVUSm+uyjN8NNdXeHizLT7vS
	HqNPdXLA9lk7kniz17hGVcOlsGTDe8/Z24UFy3FJqS9SaDzfZNGprIAeNTOJ8A==
Date: Wed, 9 Sep 2026 15:51:49 +0200
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
Subject: Re: [PATCH 13/14] mfd: remove unused menelaus driver
Message-ID: <20260909135149e7d73952@mail.local>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-14-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-14-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_145201_050928_8D4C1391 
X-CRM114-Status: GOOD (  10.71  )
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

On 09/09/2026 15:21:50+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Menelaus was a companion chip for the omap24xx platform, which has
> been remvoed from the kernel, so now the menelaus driver is unused
> and can be removed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

