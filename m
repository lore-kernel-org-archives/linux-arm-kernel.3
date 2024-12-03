Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA373E74ACF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ1LPy3NSmQy+SzwaDXLdVo0s70qu25XnuFjTAFswfQ=; b=JuKpmiKw0SI9bgiOfFjAPINyuT
	PFKCTnBWwNlI1luCQue1cZmImh7OKgQeji2IY0SL9A3GtMJGpwZIwfRmlJfvVZNIh0B2F27CqkZA5
	SIkuCYulxFlmxmSDyZ8WfkXiocTjEqIzRA8GP86KFoCC15kOZfRFk1u9vyp6+uVXQC/AmhvxRz+6H
	raoOCrNNiKuGeJrDoJzrHEc25AHZADh7g1l/IhNR6T0tFBOItLb0QI7jiwxobGCmSaYNYtMYptkXm
	vTojs7gjYc2L6LaI0/mLcKo+RV/ZqE+shWAUdN3yH1yfemGJkAFXIiuI++YTNZvDbAaGOGDNAdbqk
	n8fGkyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZHa-0000000AbNp-2ysM;
	Tue, 03 Dec 2024 20:14:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZGa-0000000AbIA-3GZF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 20:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HZ1LPy3NSmQy+SzwaDXLdVo0s70qu25XnuFjTAFswfQ=; b=G+Y2E7VYchXEsKpwtA1eYmyyOg
	O5BZO2GXie/+araqCIqTstXa39SVmWYI9F6QQObQOOpEaXkoSM/35WKrOhXIaEBhK9CA87celvjxE
	+lNpVOnfLxXmBrtq3ALkaTGIlHlSVf8seCbljMm4N90Gs3miQ1TAXIYoX5q+el5+7jEQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIZGW-00F7xL-5i; Tue, 03 Dec 2024 21:13:00 +0100
Date: Tue, 3 Dec 2024 21:13:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: GPIO_MVEBU should not default to y when
 compile-testing
Message-ID: <f552b813-1817-4507-9699-fae87575a762@lunn.ch>
References: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_121304_815536_B4661CD3 
X-CRM114-Status: UNSURE (   8.08  )
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

On Tue, Dec 03, 2024 at 05:23:16PM +0100, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.

Sorry for being dumb, but i don't actually see what is wrong here.

There are 4 GPIO drivers which have

	def_bool y

COMPILE_TEST is about building as much as possible, in order to find
build bugs. So i don't get what you mean by additional
functionality. No additional functionality within the MVEBU driver
gets enabled by COMPILE_TEST.

	Andrew

