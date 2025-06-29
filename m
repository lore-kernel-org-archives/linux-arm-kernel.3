Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49474C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltkWoDNxaQzn6WgDitU833meuC+rNnnAKkywgjF6pqs=; b=Jv9PAVhOKE0I+etchnKy0AKlLk
	vHapuDdvV54gnAy9zfFT5naMCsolMNbiDchFKH93Jq0F4uhh2wcEq2FsVT0ig3iLn9y5mh8gousDq
	rR4F1nk/RbAyC5nGvteiRe76Nf/VlNGFtgKHfTy/EaoP23SfTfinx7GJKg5lYeOzUoKYXFqFp+vTB
	bDV8FkOVeEg1ViAgg0jCGMNBZeUxN/OE/5Nc/HbnCcYjA7eiThl7T9aeYFCHsSA49XABsnK851xvr
	/d5y5yD4G3wctclqC8stHfxFyZSTEZ2RpYLJdnCkUAtSMXyJxt3wQbAYKrDPi4AqMln51m/3XgrJA
	tsrAJGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvIh-00000000To4-2tIE;
	Sun, 29 Jun 2025 16:54:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvGO-00000000Ti6-1fLs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 16:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BB97A52C96;
	Sun, 29 Jun 2025 16:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A7C4CEEB;
	Sun, 29 Jun 2025 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751215939;
	bh=MPyVmXt/3QyZszVR5nGrkX1tRmk/RGhsjU/EYDV5kPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C/Y0EuMAJPH67735Bw2p9Gb263mrkQs0Ypxx/NyH+jChrhvuCQw+XNKMEG66K1s72
	 BGASN3zYpJ2FY/Nb+uiKN6102z0E/X15r/8/1K8Xz7tz9QoQX/oo0toexZmYukj9M7
	 yPoCSzMCByp61ZFJBUGjR0f1FWQ7yIe0L4PX4/Lp6AjhD70y19SG4Yby2MLiN+0vP4
	 GpKES0lkroqnlSQbLukis+ykWxg6WrEKQK5IIDUvoKbtGLFL+uxorMr6e/lW6N7Q2K
	 Zy+4c+h5DpcxPwYK7kFa9tnHIKInVYRiZyjNwmeMT4enTMvg1fR5Oe9UXOA6zhAs+D
	 EtZ04z5+I1etw==
Date: Sun, 29 Jun 2025 17:52:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: at91_adc: make at91_adc_caps const
Message-ID: <20250629175210.1d3d33f7@jic23-huawei>
In-Reply-To: <20250628-iio-const-data-6-v1-1-fbb1ca5edc8d@baylibre.com>
References: <20250628-iio-const-data-6-v1-1-fbb1ca5edc8d@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_095220_506936_2E8ACEA7 
X-CRM114-Status: UNSURE (   8.39  )
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

On Sat, 28 Jun 2025 11:19:36 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Add const qualifier to struct at91_adc_caps at91sam*_caps. This is
> read-only data so it can be made const.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Applied.

