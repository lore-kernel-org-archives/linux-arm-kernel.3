Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E72ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLU+evSr9Yr5I7+bxIvZFtnl9Tc1V6u/KdtkDVmD0Xw=; b=Ya9EUCG7QW74XhAuqmZqdOGNjd
	jwF3I1+FDkiCfYVVt56eJQoCbbfnr/sO4YuRzr5lCWZdXnc+gY6R/8LBJF7UNajMxwm6olgiaJ1uI
	90yEPdY8XIeQEAVpc+szLk3wABl2z6KNu1OPfHmy4ukvYjTYmrixXqA5W4g8NnkhRCYb38u0ck9Zg
	TxP43spwgNXgWjCM0P73pqeq2zvSOwV8S63qRcDKizSeMLpdumdIkUzeEjc9g8+88++9Z5/VE7V79
	cNKEJKmsENzrJrKdXwUdmBc8QQGuJ+6ru8E58h/d+EyBqAObfED5Dxp4ohTPcb7pxxhF99CKrmFRP
	x1o/Gmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2a9-00000000XBM-0AZt;
	Tue, 06 Oct 2026 10:39:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2a6-00000000XB2-2Z1y;
	Tue, 06 Oct 2026 10:39:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1BEF602D4;
	Tue,  6 Oct 2026 10:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BAD1F000FF;
	Tue,  6 Oct 2026 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791283173;
	bh=dLU+evSr9Yr5I7+bxIvZFtnl9Tc1V6u/KdtkDVmD0Xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GiIWmASu/hUtJP9PSjFKsoGZ8HfL8gn3fv8Wdb1OtfjjpMiYMK70/HkRIwBpI9ZcL
	 NuHFpwrIudVF2nlswRK3ZrtYnLjewRPxctLvsQSsQD/FCCA/wKmSA9lEGdPP+i3h2T
	 /15gINR1QV9O6K14Marxnr5smQPx9HF6AsH1aNSsim+M2O9ayRPq1sSHYHC+jFg2EL
	 CTpsowTfxdMpwoyxn38DNOea3u3Srl1xt4xC21u9urYoF9Bcdfu2/bq12Dc04xZfbV
	 Dr/OfztyGpURnYxKzpMXW7+nAXfdLWb0moUetJ3IGO3f+miod5o7vople0CH2grHDk
	 Lpk4iK3VhAVtw==
Date: Tue, 6 Oct 2026 12:39:30 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Message-ID: <asTP4lI3psLy5GCg@parshuram>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com>
 <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
 <asSzYUA5W51Ngn4X@parshuram>
 <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com>
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

On 06-10-26, 18:22, Joey Lu wrote:
> 
> Vinod Koul 於 2026/10/6 下午 04:37 寫道:
> > On 06-10-26, 09:37, Joey Lu wrote:
> > > Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> > > > >     */
> > > > >    #include <linux/bitfield.h>
> > > > >    #include <linux/clk.h>
> > > > >    #include <linux/delay.h>
> > > > > -#include <linux/io.h>
> > > > why is this dropped?
> > > This driver never did direct MMIO access (no readl()/writel()/ioremap()/
> > > __iomem), even before this series - all register access goes through
> > > regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
> > > unused include already, and it's dropped here as part of the broader
> > > rewrite touching this include block. Happy to keep it if you'd prefer
> > > not to bundle unrelated include cleanup into this series.
> > Then it should be a different patch explaining this
> Understood. I'll drop this change from the series. I'll leave the include
> unchanged.

Nope, pls add it, but a separate patch. This in unrelated to this one,
and should be added but as a different patch.

-- 
~Vinod

