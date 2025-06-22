Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25AAC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 01:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1xiX4hb/LcwQfGAeaxcHm5LS+eMHunMbHuosly4CU8=; b=ATIem3+DDye1PWCBO1vJgVJ+kI
	K2eut4J9WISYVxTA9XK3ytV9bs+xifixMqEhhMg6+Vpp+b8ioXxs1gyd9qFv5yEYIj1bwgf3A7VEm
	6IBAVK5xnmdIr91ZFnX1hxTcbyDmzkWk+5bMAw5rpBT7K9K52qj4WNYkf+Z2knmNC+5XM4ipRuOl3
	aQI5D9SzrTt6RfQ+YGjj6ZlDUG8V91vOxsirL52XzSuNnetAJ7Eyic6tX8Z5VE4MqeE6S+Wli7EGB
	BzxoMeYZ5eqgWSorniqbYHtanUzWgRnQKtoQyWPL7n56WJ0qLhb4Dx8cG4E86x4qptK8/zLHxUwOk
	QzviRJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT9d7-00000000Qcc-3TQu;
	Sun, 22 Jun 2025 01:36:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT9ap-00000000QY0-1YZh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 01:34:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B8AD4A769;
	Sun, 22 Jun 2025 01:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF2EC4CEE7;
	Sun, 22 Jun 2025 01:33:57 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id CB21A1806CD; Sun, 22 Jun 2025 03:33:55 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: claudiu.beznea@tuxon.dev, sre@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mihai Sain <mihai.sain@microchip.com>
In-Reply-To: <20250610124545.175492-3-mihai.sain@microchip.com>
References: <20250610124545.175492-3-mihai.sain@microchip.com>
Subject: Re: [PATCH] power: reset: at91-sama5d2_shdwc: Refactor wake-up
 source logging to use dev_info
Message-Id: <175055603580.241833.5864244509904076181.b4-ty@collabora.com>
Date: Sun, 22 Jun 2025 03:33:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_183359_434499_58D172D8 
X-CRM114-Status: UNSURE (   5.93  )
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


On Tue, 10 Jun 2025 15:45:47 +0300, Mihai Sain wrote:
> Use dev_info() instead of pr_info() for more consistent
> logging in the driver.
> 
> [root@sam9x75eb ~]$ dmesg | grep power
> [    1.678542] at91-shdwc fffffe10.poweroff: Wake-Up source: WKUP pin
> 
> 
> [...]

Applied, thanks!

[1/1] power: reset: at91-sama5d2_shdwc: Refactor wake-up source logging to use dev_info
      commit: 6af8ffab2db3199f22298641880dd111f3a630e2

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


