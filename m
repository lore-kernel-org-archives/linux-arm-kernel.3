Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929A2C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJGadgBYIYlqiYhBz+V1s41vhG2hQGZQ1l7A7eqIcQM=; b=gjd5atEIGJ6nI4kP450D/0be0x
	LvtW4tPtmDG4PrPPsS5e8u1FwHNlxmx47HfKIbC6wfqm1CHQo2ibuFq7DkwAQgA9kyJr6ZEnNlLl3
	TLw2sLdi2tLZrW5mYPTEi1cmZA6WJOrOYVxmvZBJPqPd1AYK2sZ1ZqByhBasexwizPecZRSruOldy
	m49zEWiOCxFaoWuGRZcqXV13pRKHPcmdyYo82A4JeYGzRbrIYZSW+OE5znFbHQyWdhhyKSPT/li/3
	b6COyxvV4RR8tynZ5wCm1ur6ehoTBcwYpvBD47wMb40zb9Ihh8D/WbEO1LXHm7lHmebzqoSj3McFX
	xbk6Wntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pwb-0000000AGxo-0FPa;
	Thu, 10 Apr 2025 11:19:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pKZ-0000000A7a7-1afu;
	Thu, 10 Apr 2025 10:40:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so472819f8f.2;
        Thu, 10 Apr 2025 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744281622; x=1744886422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mJGadgBYIYlqiYhBz+V1s41vhG2hQGZQ1l7A7eqIcQM=;
        b=LeNIBFJhQSO3NH62vTADi8Bq18h105S6B2sNgUxNh0xherliEqDUF/Pu8WXjas3tkU
         XdTX7DNjzDSGrlwZac0AlvbRy2F2UHBy7IgglmhPEO4Owj2mduHkD9NJlzX9ItttMogM
         O1fDBTyIvjIZuoGIoNWNig9KBOwwDK+XlSkqQ34Jle9Hb9Dh+uIKjFt0jAWch62gpbBA
         Gu6bQSVr8pJLSrqkvMHE+8srbva5Q30droCd+18TAvvy/mhVPIVjoBaewwkdRy5+LFuN
         5ZFtcm8kDqzaDUeu2Iz6cJ9MRriJe3ycvr2DIkAtsOr+UfdiVZvZtBGApZnTaBs8x+Ch
         Qzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281622; x=1744886422;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJGadgBYIYlqiYhBz+V1s41vhG2hQGZQ1l7A7eqIcQM=;
        b=Z7lSawEFIoD1Owx+WqC7uSBbhb9GALqmQthVjnNhY3wg2n4voYcOfz8G0kzMqm8CpI
         PgnGLVjFF/Qp4myJMfVRR4uWpeLTFN9y2gbzhIuPHqbu3s22YmCwZFQO9TmjFcmPrmY3
         EKwQZcBoiVTnxsABX79TjKMaX81OloVuuFBJwssVbfMTddzhX4xA164SAANrsnBaiFQ3
         tXcVpAbeQMa6JIozB7vsJLPY+rswp0CooJGBX9jewBJTixHaa+II/DH2M259lVFPcRNz
         13v8ZH07uES7K1KSZLBWtAjj3RqiOT9J1/mpVDca2Nz69AKs4XlLjKNDGwPE0tNZA8ba
         Y+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+FVtDgbyiI4dPEgxkJtWj1VGPjoSrZq9Cit/9VVs5l7Pmq+eNBFLsrGfMCqEg0CFGexC1R4CsB6X+Wlb0XKhd@lists.infradead.org, AJvYcCW+N+FnlDG3f8u36QsFplWWAtKap4WOCoatuu8XFoMRiluCer66OIZ0q81SBYGmm35OWv4IZa2e53EvvpG4s/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZSEk8bCZR94mZWyOJWbvO5HRBTRZbfBcfaLtD5ydwk6iiOt5G
	TPlrhkhwwpCMNEXiPmckUZ21G0fDVf3yCavXl0dNVMb3PE1ble73
X-Gm-Gg: ASbGnctdYrcvmhjZoAk7Mm3Oe5SCcc5Z9fPUEil9PbeytATYlt2VksZgku5Ge7MpHLW
	RV/P8fkBomJxtwWZQs5rfpLYq7bDhdL732jC5/74OeQuMw/cH1Oapu8xJSBXJIuJRpy0mtO0Lvf
	mTHiPAiT0rTTi+hok0TDq+tZP4HKquxD0I1pXDLZfnNoW3ji/fXuA5Sw1CwusH5hTTw8UHRyYqh
	/1qOGzBPzJ2a70wv0rVx164BaiKdFTRa20cSdFO7kUpo3J6U7Xkbncg6tb7ompEGLCDucL2aYWZ
	sNyzCTPb411zS+Wcv6niMOWzb92hfzEjdkRuHe8CR6QLx0LdZxw0WLndvo1Far9Rv8QqHBU6
X-Google-Smtp-Source: AGHT+IHea/6EMcI+woiOfL8twpzyhy68IJoIIZx3j+61tAoN8k1aHKMVBgM8Xr/g0L/vw/3o1JZNLA==
X-Received: by 2002:a05:6000:1a87:b0:390:f358:85db with SMTP id ffacd0b85a97d-39d8fd8c84bmr1746608f8f.30.1744281621529;
        Thu, 10 Apr 2025 03:40:21 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938b7afsm4426302f8f.58.2025.04.10.03.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:40:21 -0700 (PDT)
Message-ID: <67f7a015.df0a0220.287b40.53b2@mx.google.com>
X-Google-Original-Message-ID: <Z_egD3gd-YO17vpQ@Ansuel-XPS.>
Date: Thu, 10 Apr 2025 12:40:15 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, Netdev <netdev@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile
 test GE SOC PHY driver
References: <20250410100410.348-1-ansuelsmth@gmail.com>
 <c108aee9-f668-4cd7-b276-d5e0a266eaa4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c108aee9-f668-4cd7-b276-d5e0a266eaa4@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_034023_416764_7DDF39C4 
X-CRM114-Status: GOOD (  24.86  )
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

On Thu, Apr 10, 2025 at 12:31:05PM +0200, Arnd Bergmann wrote:
> On Thu, Apr 10, 2025, at 12:04, Christian Marangi wrote:
> > When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
> > dependencies") fixed the dependency, it should have also introduced
> > an or on COMPILE_TEST to permit this driver to be compile-tested even if
> > NVMEM_MTK_EFUSE wasn't selected
> 
> Why does this matter? NVMEM_MTK_EFUSE can be enabled for both
> allmodconfig and randconfig builds on any architecture, so you
> get build coverage either way, it's just a little less likely
> to be enabled in randconfig I guess?
>

If we base stuff on the fact that everything is selected or that a
random config by luck selects it, then COMPILE_TEST doesn't make sense
at all.

For my personal test, I wanted to test the driver on a simple x86 build
without having to depend on ARCH or having to cross compile. Won't
happen on real world scenario? Totally. I should be able to compile it?
Yes.

> > diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
> > index 2a8ac5aed0f8..6a4c2b328c41 100644
> > --- a/drivers/net/phy/mediatek/Kconfig
> > +++ b/drivers/net/phy/mediatek/Kconfig
> > @@ -15,8 +15,7 @@ config MEDIATEK_GE_PHY
> > 
> >  config MEDIATEK_GE_SOC_PHY
> >  	tristate "MediaTek SoC Ethernet PHYs"
> > -	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> > -	depends on NVMEM_MTK_EFUSE
> > +	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
> >  	select MTK_NET_PHYLIB
> >  	help
> >  	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
> > -- 
> 
> I would expect this to break the build with CONFIG_NVMEM=m
> and MEDIATEK_GE_SOC_PHY=y.
> 
> The normal thing here would be to have a dependency on
> CONFIG_NVMEM in place of the NVMEM_MTK_EFUSE dependency,
> or possible on 'NVMEM || !NVMEM' if you want to make it
> more likely to be enabled in randconfig builds.
> 

The big idea of these dependency is that... In MTK the internal PHY of
the switch needs calibration or it won't work hence it doesn't make
sense to select the PHY as it won't ever work without the NVMEM driver.

But from a compile test view where we only evaluate if the driver have
compilation error or other kind of warning, we should not care...

-- 
	Ansuel

