Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2509E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sen/KQvowlVDuXXQp6C1WU9Vh4kdtp0pCZBfFYVlVk=; b=P3xHMHkzabLX6v0sTrhGgU+GJf
	UG8lcmJZwqEN1hfusNhWLeBCDdmBbxeWLFIPmboBgQpehbke5yFDCiWpVG5RgKfW9ABUhUkTez/Kc
	eXrohiQNriyONCSHLsAXNdNpzLCfDa6glALORv0QbsadKsS0R9hxiHzzzCIF9+hsTGSwSC36HFj8/
	zrIidjS2LgJ41gVWFUItIyUR7Cp/xpLRaTbL6H8nitKdD9eiw1KCv+FN16TuTua/AgFa40czDac5w
	7GtoHIR8Ufggg8TZOTQ1tN3nRLxJeVSlV08wYLZO17WK78j/ANimIQsH8qx0f6oXlrrA6r9xHgFru
	2NoQCP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX18s-000000035Pj-1rPz;
	Sun, 12 Jan 2025 16:48:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX17c-000000035IA-0wO6;
	Sun, 12 Jan 2025 16:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4sen/KQvowlVDuXXQp6C1WU9Vh4kdtp0pCZBfFYVlVk=; b=d5hw8F+xTeAqzu4BiYHbCWkGBP
	atom2+LrfuHb383eByLuiMaRP0Wm8aBJeVo6zhtblFvwIfFHwWNlXyAV/qi1EDOxp8RUxdRkdZERt
	qDKR8+a5+MSbySi8vPZCqC28vfyssjmkcxal1QH4IJMTmnCB64OV2sj9Vm1dyOcT2Ndc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tX171-003q0p-8Z; Sun, 12 Jan 2025 17:46:55 +0100
Date: Sun, 12 Jan 2025 17:46:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com, Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: Constify struct mdio_device_id
Message-ID: <9dfeb860-3c0c-4f16-a150-fdce133281e8@lunn.ch>
References: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_084732_293906_929A97D9 
X-CRM114-Status: UNSURE (   9.90  )
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

On Sun, Jan 12, 2025 at 03:14:50PM +0100, Christophe JAILLET wrote:
> 'struct mdio_device_id' is not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   27206	  12600	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seems sensible.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Is the long terms goal to make MODULE_DEVICE_TABLE() enforce the
const?

    Andrew

