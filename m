Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3601CC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p39rJHQ8AzeK+WJsX2y7EKX2VVM4p/4mCnZmjamECbI=; b=fbyjzDBAdADIw8HFp3+hGtlthD
	wkgNYOYwata3wGCI0Ymgfl5lTZ0u8f+lIVxoA6JBJQd+wVT8TYKdf9o9OLW90DJ3MAOOkLuj65lTs
	ht1a2v7y29inHhhUpTmf1CAgh+AVzAnmiUU7pZwebJBcsUk8f3HrSHhzq/w5zHCKcfwgnd03/G6Yc
	FGO52jJq4eQUNqW/UVgMuX3UC1oXwp8rFRKySfL6+49Nq00jSJU/8hBbB8ebbyrS0S3mNKEojuIKP
	vQD8SmJgsMFJgd4Fq5mDq7hIgjEbXs4tp6LxRN3mD+YNUSNvX2NZUKMo5pwm8Iy8YKyRPTlSxgkDQ
	/HILj/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbZk-0000000Apwh-09KG;
	Mon, 12 May 2025 22:24:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEami-0000000Ajsr-3utE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 May 2025 21:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p39rJHQ8AzeK+WJsX2y7EKX2VVM4p/4mCnZmjamECbI=; b=jEPSmdv22NTadNGeMPN8XsAd3a
	lj2lANC+GSmjLZjWP1/vB/DhZCfeAR9rTnD/ziTZMW+CSL/gCiMo+YNCTIf42uTKUOnA/dOeaF4sD
	cQthebx1TVQYm6nehBv0Z6K7ufYMocCJf6NhkcdZXT+ObiDNYbVF9LH2qghevIWOnQ+RSUdLBIGxC
	9WirXLIwCYVs5xL2xedVZoQMdm44BECyjHhTdyrg0dedTp7U4+AXQ9ocU/EpTKxXMUddaOlJ3nO1O
	IqHm3rl18YEa5G15E4nMchFtQ6pSPYRaGys82AX/xRJa6Rl5zHcJGRVvQCLNxt+BCh2qQFr+9dhKU
	dsysRbdA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEamf-0000000GqDQ-1xT2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p39rJHQ8AzeK+WJsX2y7EKX2VVM4p/4mCnZmjamECbI=; b=ehK2iGAcS5aPnTGjJTnqU6Q0ia
	/Tg53DNuq7cZrXR5U7SzHUX7OGIz+MHMTrU7+Sgyj1+8qPbu499qwB1/3fTMmllnT7TrJvPzc9hI+
	qEnntpwsYvzv3s31StaJBYfkvvxsIiEcplmapZIeRSlP8ApHKaIBUzUmKFOOQlUPctJ4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEamZ-00CNux-OT; Mon, 12 May 2025 23:33:55 +0200
Date: Mon, 12 May 2025 23:33:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 0/7] pinctrl: armada-37xx: a couple of small fixes
Message-ID: <60ef3803-4f8b-4d9b-bef8-6cf3708af057@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_223401_966253_E5855CB1 
X-CRM114-Status: UNSURE (   8.32  )
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

On Mon, May 12, 2025 at 04:22:36PM +0200, Gabor Juhos wrote:
> The series contains several small patches to fix various
> issues in the pinctrl driver for Armada 3700.

I'm not sure all these should be for stable. Some are clear bugs, but
not propagating the errors has not bothered anybody so far, a
requirement for stable.

	    Andrew

