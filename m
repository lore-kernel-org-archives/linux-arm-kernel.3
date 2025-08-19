Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46AECA0EF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2Y1K6HB79wPbB13eorFlD3Q4TKy6//6RBaK9l+jTVU=; b=S/iy0E3kbo1XnyObfow9mKG0PE
	JwoXJH/vxrfQzF0+KrxRinYp6eHTI/Qc/u6uRnNR1Ez5dMgMuCobJ6hl/WLZm3ujoXtlDc7ZWOgQu
	L+RbfxcFg/Ye7AF+tA3xm9rFsj/jq7/7FwLR9OlI5orlul3wYttcF0hupwi0c3TT/g+OLsxxPVOtm
	7O/ZvwkFFfNsu4fWdFiWLrJkAykojqhZ28NduNPpaiKIkpysXHboOFSHSJhqAbrdu4SHxwKPnymfO
	y+M0si41FXMOsf+tVZ9wK+wkTn4blQhKSZ/UAThYFqYxrmBPw+kG/YBu67N/vPpsy2IyvjuaZSHKQ
	T9qIn6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQqH-0000000BDB3-3nUP;
	Tue, 19 Aug 2025 18:13:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMUw-0000000AcBU-2XC4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2D0461428;
	Tue, 19 Aug 2025 13:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F45C113CF;
	Tue, 19 Aug 2025 13:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755610533;
	bh=21MYMk6EDbZshX4F6YaaOm3J6l+vP3iaeBbvkcl1Nrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COYgvlkit94FrgDuTAFmmLQmf3vJNoWGB6yyEQVhfXnQi8TgdfL2BMeJuGsokhMLV
	 IGcsDG1Ctr3uBZIcioDK/zBbEbZxGjAEydyFdkr7ZhtmfTvKyible4jevW86vnAXRR
	 NmOtrfJAwLiHXD9Bw3WYTD0QVJW2rrFZB2n/DS4l5TLIvU3FqI0tpxN7YbPmYDn2o+
	 IWkAJn1+hlHmsyOJwOOFton7IDr7oLvL1ycRUzKCP2wc90rBY61Hl8La+v6C/UU+8E
	 o1lGQ3L4wDgBGxuq8C2vEHsTWdJ6mV8TSgr4P3oP0pGaq4tpQ8Ebw9QLIWUUEjP1yk
	 tbmKzAw6bYu3w==
Date: Tue, 19 Aug 2025 14:35:27 +0100
From: Lee Jones <lee@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Message-ID: <20250819133527.GH7508@google.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
 <20250819123505.GC7508@google.com>
 <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
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

On Tue, 19 Aug 2025, Sasha Finkelstein wrote:

> On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> > Separate patch please.
> >
> 
> Per the discussion in the thread linked from the cover letter, the dt
> maintainers have requested the bindings for all subdevices to be added
> together. Do you want a separate series with just the dt bindings and dts
> changes and the actual drivers in separate series or how do you prefer it?

I'm only concerned with the part I highlighted:

>  drivers/mfd/macsmc.c            |   1 +

-- 
Lee Jones [李琼斯]

