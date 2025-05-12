Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A239EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfQpXa3tBlUEYjokNIxHFziqeEJgVAZbUffZzLdfAGE=; b=WLZ33IihMlBgUvCsjHciKOrOg5
	qUa+9NvoO6hlJvPU5U6S4Ypkzb5z6T8mkZkls8mIb2JrSwmCOZY7R5Q0wpL9OwsXgwoQ1ujgVxhUR
	qDWTfynmwYZXY/AgnTUkwfJrYZ4YyVu7WcTAhTSD5W2tmHrKcxcd3TR0peJ3TJ3Vj3j6KG0dhgZSf
	czQpvj2clx1/acqgJV5W7o9UXEXjjWo4/LVD4ozTUyrd/+e4GsZSBpHKTkty29uTri33oQeJB1plN
	uwp0vM0VSsQAFEvDSLivJaozfJ8tomrL5sECO7NgEjUFTDrTaumW5rhnCNhBAVZxzHfODd8+LTUsf
	WswAuwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEajS-0000000AjAe-2okX;
	Mon, 12 May 2025 21:30:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahO-0000000Aibh-3vwO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AfQpXa3tBlUEYjokNIxHFziqeEJgVAZbUffZzLdfAGE=; b=vOSg6E9hchsbTwy4bBgAN2i9am
	RY+v8KoYMRNADVKOAGMzuZ9rejgNNyeCrYc99dHyX0+xDAWrGAY73O0jlz6QfxLektakpmcsKsE+3
	Km3Jdlx7BihLma0y1eCeL4Wyh8fgYvm5LfGSnJ4k24DM4zi/x7O02cxiMYFh9I4mEe3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEahF-00CNqq-On; Mon, 12 May 2025 23:28:25 +0200
Date: Mon, 12 May 2025 23:28:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 1/7] pinctrl: armada-37xx: use correct OUTPUT_VAL
 register for GPIOs > 31
Message-ID: <d5fa1e79-8204-464c-b12d-de8e59411146@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-1-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-1-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142834_978165_369F0978 
X-CRM114-Status: GOOD (  12.21  )
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

On Mon, May 12, 2025 at 04:22:37PM +0200, Gabor Juhos wrote:
> The controller has two consecutive OUTPUT_VAL registers and both
> holds output value for 32 GPIOs. Due to a missing adjustment, the
> current code always uses the first register while setting the
> output value whereas it should use the second one for GPIOs > 31.
> 
> Add the missing armada_37xx_update_reg() call to adjust the register
> according to the 'offset' parameter of the function to fix the issue.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

