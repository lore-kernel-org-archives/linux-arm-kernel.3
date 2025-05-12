Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E2BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhSlUCo/MY/IK5ARlS+anjyhtV9qBFHpdoCvCWxFhmY=; b=Fp6azMo5/GVQU7mlK0jz+ILgvT
	sh5rJkyan5yCeNHYd3aHhUgmYk8C2ctdFQx381HaOWiqNgLVaukqA5N0Rw3bps0je/mz+s7w9PNiK
	/5yp2pufY9loOcI5UBpYyL0ms4gUrW/G1isXYZDSC6EeBzFdvJRNS/X2+LAsnh2RFOjTM5Sdd8L4w
	Zg6O9bwpSFUvtG6SNadQvp3ygQQhTIUi/+UDgcDzHL1dIF+gqj33uEqPfefjAfH6cG+E3N0WBoeDt
	em8d4+pNOzyFEjbRw14VWqfu5zpWBCfg5sgEWPuS2yE1DougNyNaH+HGeoF9TZ9qW5bpD3uRE/46S
	H+u/bB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbXj-0000000Apn6-1Q1U;
	Mon, 12 May 2025 22:22:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEakw-0000000AjWS-0yVn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KhSlUCo/MY/IK5ARlS+anjyhtV9qBFHpdoCvCWxFhmY=; b=4FCyK6XYvs5oqYzhabmxefyBXm
	0CcKUDbxaz1dKEPc1U1f5xnd8r59E/y8DCIzHLq7A7TTAx5HRYRTZHy4Thu1vSSlUHi8JcDHl1mF3
	kv16oibHSQOwgPjdRrAAnoarusRLbgIRa1g5PghZfA33ltJpWZhoMXuzEWC+IG9gBDEY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEakt-00CNuD-V1; Mon, 12 May 2025 23:32:11 +0200
Date: Mon, 12 May 2025 23:32:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 7/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_set_by_name()
Message-ID: <e8b9f3a0-980d-4045-ae23-f796e852fde6@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-7-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-7-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_143214_266525_486736C6 
X-CRM114-Status: UNSURE (   8.27  )
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

On Mon, May 12, 2025 at 04:22:43PM +0200, Gabor Juhos wrote:
> The regmap_update_bits() function can fail, so propagate its error
> up to the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support for Armada 37xx")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

