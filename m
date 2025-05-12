Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEA2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJD3G1v8djv/XvZ5jb2IlZ2ijtfQheho94GC5N3EbLU=; b=F/ojxCLB+UKC7+MG9qaG0OXLN6
	YGlsNZ6DqKj9AaEpzedCXyTF/WvLZ2q6dXadCoBeeENIO7HyA6LNXldNBHgsULAhkwR03CFxsuFtI
	MIJGs/YQp+Ks0Pex8EsZeFiPDLxoGqPBw6w0RducQeB65a73HKqgvdMvAg1wo2QO0PvzN6M2aWv01
	eW+2pkzRo6oLUZoU7mlfJ+kN5z7sArcrvLOFUtOWzsnsiOzokuh37XXpwCxPXYfH/FrvMNEVk4AHK
	4me/fxMP8IQEfsekZRZarrZxsKOeHiwILX7NqT7uM/v+KoM90N+GOncUOEZ5EA2qHROKuxHihKryh
	eMRP//pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbVi-0000000ApcM-2kje;
	Mon, 12 May 2025 22:20:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEakd-0000000AjS6-0t54
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qJD3G1v8djv/XvZ5jb2IlZ2ijtfQheho94GC5N3EbLU=; b=WoxZ6F8fHKBW6J7DMjriamMW0n
	uSJmTpMdXB6heFOReFbF7VA9NiUV+9Zd2jzFg98uSc1Ggbe+c1PYrKNgK3ZYU1pc2goOHfWZKUMOz
	88ESZGZ97UBgGSZauhIX/PgqdpW6ZKfwTL+Wt/fDcLfyXGsU8InA40wvvtyZdnB7jYsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEaka-00CNtp-Qx; Mon, 12 May 2025 23:31:52 +0200
Date: Mon, 12 May 2025 23:31:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 6/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get_direction()
Message-ID: <9fc2d6fa-5e16-41aa-b996-a9933473640c@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-6-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-6-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_143155_245801_7FE1D6EB 
X-CRM114-Status: UNSURE (   8.30  )
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

On Mon, May 12, 2025 at 04:22:42PM +0200, Gabor Juhos wrote:
> The regmap_read() function can fail, so propagate its error up to
> the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

