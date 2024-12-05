Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C13E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZVgTlvIlXpPnlsjIlZk/dwWHTcz6Xo0XD6Cuu+iUl8=; b=VvjF86zmCAOUU0XQG/4SBqIu/M
	pUYiyfaJb5cqf/l+2/0TvtJ4xUs6mHPgEuT/1WCXyNkDJrZUQL68PfLfHJ3Y1bXONUmbk4bCH5Arx
	438qXhzwdNCPM0S7Uf2LZabZsgXRtkELsG+XaGZC2MzCWCZev4ERiYJ54501AoZ0ustSRQvkbCwih
	ipyMBmRFTWfMwyMK1OP5PdhtHxwgGFkQFsXXWEr6y4BQrkX3cCgntOjkMw4KgxGWs1mckZBwAA1uO
	tc0K4ELbTEpQTRDPKaOtEnelPRWhDjJ1o2UokU9FHSWxATaVozD9v63tedhSHMSv7rP0kckEkCCig
	qsFbCDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCqu-0000000GKVX-1yxe;
	Thu, 05 Dec 2024 14:29:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAQV-0000000FoJs-1jEr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A86FE5C695A;
	Thu,  5 Dec 2024 11:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD39C4CED1;
	Thu,  5 Dec 2024 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733399626;
	bh=tSQQ66F4jeW5K1srmBU98kc4DpfJggoVb0IT3KWdT8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieC3culDSl2VwB3HHzWGwlkamj/WY1/e5j1mLUWW4S2mVZY/C+bwQMltWEIliycbU
	 duO3nwxyBS2rQeuoa6YAPdIIyRSEsr7ygvrAIJDwKTRrpfu0l6ESZJ/uwLVym94KNp
	 ok/4jBRqVfeFpAVGZdI08wbFFgm2KYnT/Dn4ReD8ARJ+6+c+J5CdIEsBipqUEdvusY
	 5GLl0yOyQJMwy/mBTvAYUIyXuHUtLjwK7ZPy1voFRC8GQRybdDp5vXATfF91XrP8/l
	 Il+6hFX3C7Ep/Bim+3oG3QgWJHAP8Pv7rqHw0BpdugQWiMTUip/z4hlLviAumJ59Jf
	 pFsBgM34RZwFA==
Date: Thu, 5 Dec 2024 12:53:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Message-ID: <6d6xgvuvu74hm5466xeovgr4qqkwxaxaoeemvfdty3dqnl4gjp@axlzm6mxnzkv>
References: <20241125142108.1613016-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142108.1613016-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_035347_500329_16DDBAA1 
X-CRM114-Status: GOOD (  16.29  )
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

Hi Carlos,

...

> +static int i2c_imx_suspend(struct device *dev)
> +{
> +	/*
> +	 * Some I2C devices may need I2C controller up during resume_noirq()
> +	 * or suspend_noirq(), if the controller is autosuspended, there is
> +	 * no way to wakeup it once runtime pm is disabled (in suspend_late()).
> +	 * When system resume, I2C controller will be available until runtime pm
> +	 * is enabled(in_resume_early()). But it is too late for some devices.
> +	 * Wakeup the controller in suspend() callback while runtime pm is enabled,
> +	 * I2C controller will be available until suspend_noirq() callback
> +	 * (pm_runtime_force_suspend()) is called. During the resume, I2C controller
> +	 * can be restored by resume_noirq() callback (pm_runtime_force_resume()).
> +	 * Then resume() callback enables autosuspend. It will make I2C controller
> +	 * available until system suspend_noirq() and from resume_noirq().
> +	 */

Just made some little adjustments to the comment above, please
let me know if they are fine:

	/*
	 * Some I2C devices may need the I2C controller to remain active
	 * during resume_noirq() or suspend_noirq(). If the controller is
	 * autosuspended, there is no way to wake it up once runtime PM is
	 * disabled (in suspend_late()).
	 *
	 * During system resume, the I2C controller will be available only
	 * after runtime PM is re-enabled (in resume_early()). However, this
	 * may be too late for some devices.
	 *
	 * Wake up the controller in the suspend() callback while runtime PM
	 * is still enabled. The I2C controller will remain available until
	 * the suspend_noirq() callback (pm_runtime_force_suspend()) is
	 * called. During resume, the I2C controller can be restored by the
	 * resume_noirq() callback (pm_runtime_force_resume()).
	 *
	 * Finally, the resume() callback re-enables autosuspend, ensuring
	 * the I2C controller remains available until the system enters
	 * suspend_noirq() and from resume_noirq().
	 */

If so, I will take it in.

Andi

> +	return pm_runtime_resume_and_get(dev);
> +}

