Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF8FC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T46aT6b6jrcEqP7BKbyuJ+Dqx/tXTl32zZ60csvLnD8=; b=MrmLJ56zvc9E/CCoSGoJMojg2J
	YpA0EhRpTT7b0TzN7NffpJsBsJVbF8rnEQel3d30iC9J4Dl9lOJDaT5IwJoEtTuacrQczGC2TSL+7
	NR7EOiRRvQbAJ2GXLER4NFWVxshznGGLp+KJJv231Xmp2FXg34HCQDc83VhamA+kKyrEZEi/5bLRZ
	qh9UdJKjIvRTK2+3zpesSki2RYqGnzl/ErUeblcIT+nqXaVE+Ejs9ANjeQvOjs4D+At2IP2EZsx6C
	gZkcVvyUOedAZFZXUeG+DjmUXKYQpMKFFYJQZg1FRZWBdbIoQdcZLCYPI/V7D7FweNoX8ShpawpXQ
	wpkna1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJwY-00000002cZP-2ggi;
	Tue, 04 Aug 2026 18:32:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJwV-00000002cY4-3gHJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:32:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso117418a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785868367; x=1786473167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T46aT6b6jrcEqP7BKbyuJ+Dqx/tXTl32zZ60csvLnD8=;
        b=tJtikfivZdEjbl1FKOzzrRR05iCy8BXieNThz9Bd+tLnbvtcDwzEH6SBJ1mHQxLKLT
         gSycN83TD7ZdpnUBaFUBa+HCxDF/ehn24TxpFQzoP0j92NkCQ+yNS+7Lw5xsr9i7BR4e
         liAfu0MnIQfhTAhnd4Z5gCCu5bFQ9NY545geKXDDKBuI6QZjG0QRavET23XMzRrgJsm+
         mXVWoqNCk1IR0Psp8M/b2mvMrn3VhUEX8xOJmXmoFRKjjK0hKVVPWvSf1U3qH0ees7y7
         9CfKU0eT5jRaMuB2WHkXJyq+h9+Vh8oN/ACwZrt3nfHZYsKe1RshQlB5QTYYm5qaakSr
         vFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868367; x=1786473167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T46aT6b6jrcEqP7BKbyuJ+Dqx/tXTl32zZ60csvLnD8=;
        b=JbhnMZjlKBholGLYYnTVNU3gLfw2RdpsgYUQ6Lal1RPZwYxNc0x+qqjGmVKHNu0r65
         7z7KrZI4UHqekEfjvp9vqOKvW/It9PLn03OzrOXg/DubJHAadtXUlVoXibCXbv52djCr
         P9wNsqogAUKPrqx2rHeUASlFwRFZeqQw9U/4j+pad/vxsxKhx8WsRjpx8ueGjc76JMQT
         k4cBkG0Md3A+dBY2dC7LAm/E2c8xFMOAYWtXPuaR9Agqm6Leue4bedqv0fIMMGN1vp7q
         gLKExFb1VALqbPGKs7Gt6CCy8iRc8S3BIKGgUG3IFlj2Ht6BZO+xKPe+1qZcgBHyMZCj
         KOYA==
X-Forwarded-Encrypted: i=1; AHgh+RqfMD7zzJ5E0ootcZboa1SG6kW5z0eHNiOKjwIuxGDY95/feWHolpEp2QXxuXA5Yuv6HPT8QD/MGn73EZyOT+Up@lists.infradead.org
X-Gm-Message-State: AOJu0YzRPYud49xbUsgTQOauCins54Ven9Jeuy46nNaaA4iQv02tBMre
	sXrqDtzPaw/yBpIfo/lk00votwaGVRK20HOw93wEbmKSN3noW1kKkDtA
X-Gm-Gg: AR+sD11K6xtPKXX9dgi+FRx2YX5lUWyYT0YQCG8EzKO6jwOMcXKhvV/3zRWs7Yz2YvX
	VHkwexmFKGTwsq6QNxoMGU04ERITctfYzeii7jN1p5jcwkgQA3UerHKpjmhq82Q2chPEZQwg7pM
	/gyoeNwcteumhzoHTowFHk/O3cI9XxV+j0ZmWaajsDyisMYIryFzgKWIeuujHGE1ae9H5QNADp5
	Z9rLGHhfZFR6P3Z41FNewp83+QmJZanv47RsbdrSv9df+DNqtdgpxhm3+TLmIq6giociyxl4rFT
	OU2R3V+uF7pqg5U7R9MIkCEZxBU2xIMxNx3SqpiIp2L2Dc04Tw2ZpT4bZPcI1UjfAIpyE3nVzj/
	sBK48Cm1wzY5DG0QIF+SWlwdcJsvWeli4QsmFJPYU1Fkmf3Sl1dciwn8xNfwnapQm4ovh+maKWJ
	mv3s4i4Da+R3+9xPyObDdL9ufX6UHKixlw1wZQwVzjFX4if4Mt4Sqim2dFaodx5QkGUMaMadIQt
	MKs
X-Received: by 2002:a17:90b:224e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3903c5c443dmr636262a91.16.1785868366824;
        Tue, 04 Aug 2026 11:32:46 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca926c0bsm5440864c88.14.2026.08.04.11.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:32:46 -0700 (PDT)
Date: Tue, 4 Aug 2026 22:32:38 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ahmed Naseef <naseefkm@gmail.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX
 bits
Message-ID: <anIwRrQT9qMD89v5@DESKTOP-TIT0J8O.localdomain>
References: <20260804113511.3371248-1-naseefkm@gmail.com>
 <ab2f7f4f-0f46-4c6e-b3b1-ea713dbd08c6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab2f7f4f-0f46-4c6e-b3b1-ea713dbd08c6@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_113248_169931_2D7FD4C0 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, Aug 04, 2026 at 08:11:21PM +0200, Andrew Lunn wrote:
> On Tue, Aug 04, 2026 at 03:35:11PM +0400, Ahmed Naseef wrote:
> > MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
> > from the RX blink bits instead of the TX ones, so both TX masks are
> > identical to their RX counterparts. The TX bits they should be using,
> > MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
> > by the per-speed branch of mtk_phy_led_hw_ctrl_set().
> > 
> > A TX trigger selected without a link trigger therefore programs the RX
> > blink bits, and the LED blinks on received traffic. The masks are also
> > used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
> > as a result cannot tell the two triggers apart: an RX-only
> > configuration reads back as RX and TX, and a TX-only configuration
> > reads back as neither.
> > 
> > Fixes: 7f9c320c98db ("net: phy: mediatek: Move LED helper functions into mtk phy lib")
> 
> Was this bug introduced in this commit, or did this commit just move
> the code around and it was broken before? The Fixes should go back to
> where the bug was added, which could be earlier.

It was introduced by that commit. Before it, mtk-ge-soc.c correctly had:

  #define   MTK_PHY_LED_BLINK_TX      (MTK_PHY_LED_BLINK_10TX |\
                                       MTK_PHY_LED_BLINK_100TX |\
                                       MTK_PHY_LED_BLINK_1000TX)

which 7f9c320c98db removed, adding to mtk.h in the same commit:

  #define MTK_GPHY_LED_TX_BLINK_SET   (MTK_PHY_LED_BLINK_1000RX | \
                                       MTK_PHY_LED_BLINK_100RX | \
                                       MTK_PHY_LED_BLINK_10RX)


Thanks,
Ahmed

> 
> 	Andrew

