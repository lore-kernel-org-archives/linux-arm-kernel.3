Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E58F433CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZdrZIkOSqbzGAWUiUFdmBRnxHfqO64E/VC6vDSmexI=; b=fnLrxwgohIJ4NiSG53lqdKN2fu
	RRwJhZOepzAyp7qfr+hh1K08ey01LQXQMxyqjTKoiv5ysTBL03CggTUUCFq0S1fBuFscI5x6SX6cd
	ZSdvFNAr/P5Z/xMMs+Jd/WEPxLhLjIHY81EZ9LE0JTtg3OJWZ/vlzbnXI7XTAOaFlS11BWXLM86w6
	iAsNvWyWyI2sT8cffPyOKGUhulXTPepiN3ydEVnmnu0oSbHknG3tzYO3WqJ/wSLWGvsByU2RRm3JU
	kjhtltPlEuKhBd4H84uzsBCk7KHsuyvPbkQ9t7Q8Rn4O3fnOd7zkRTma3n3kwWoVzEBW9+sqm7s0f
	dKBBVb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8Rt-00000001fMo-2Gkd;
	Wed, 15 Apr 2026 22:11:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8Rr-00000001fLb-48oa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 22:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33D90415F6;
	Wed, 15 Apr 2026 22:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9759C2BCB3;
	Wed, 15 Apr 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291061;
	bh=4MjkOgWu+H/4IbKFLTcEqaA80AYv/7LFnNzAZ1Q9/eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0G82jNvv+WdUrzCg0FXEUgFE67KoF8lsRoHLR1Eixg/LXzBOmBt72ny96ygZ1Yh7
	 5pjtAjRmscQPZ3vzTHEJVK2X3F5iY9VBGqR24yPawyJQ/gAIlyZBVqDlxU6RxtLQOu
	 GIOuEzZ4IIVyp1JVp1Bd0caHsANeP3Y9FjSY0dKokZFCp73u2B9/2SZh9VaeNP9dKw
	 bDqy1aSrrHxSChU/DDEkPqQ/9mXmyBZFULTx7CeyP1LoiLkGahr6y7zWTmj5JAf+iF
	 LSKM2823g0Z3h0jTPv9V+xvD6mu4GBgiebxCOKq/m8zV5ubcEy7dHDB71HDaXfInaG
	 zk3lxaVX52GYQ==
Date: Wed, 15 Apr 2026 17:10:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: astewart@tektelic.com, linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, bhelgaas@google.com,
	maz@kernel.org, linux@armlinux.org.uk, kees@kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Saravana Kannan <saravanak@kernel.org>, netdev@vger.kernel.org,
	linux-serial@vger.kernel.org, davem@davemloft.net, andrew@lunn.ch,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, brgl@kernel.org,
	jirislaby@kernel.org, mani@kernel.org,
	Johan Hovold <johan@kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, kuba@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	andriy.shevchenko@linux.intel.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, lgirdwood@gmail.com,
	andrew@codeconstruct.com.au, hkallweit1@gmail.com,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Eric Dumazet <edumazet@google.com>, linux-usb@vger.kernel.org,
	alexander.stein@ew.tq-group.com,
	Robin Murphy <robin.murphy@arm.com>, pabeni@redhat.com,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	joel@jms.id.au, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v5 8/9] driver core: Replace dev->of_node_reused with
 dev_of_node_reused()
Message-ID: <177629105858.764226.5689083905556313606.robh@kernel.org>
References: <20260406232444.3117516-1-dianders@chromium.org>
 <20260406162231.v5.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406162231.v5.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_151104_061414_8C151993 
X-CRM114-Status: GOOD (  13.56  )
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


On Mon, 06 Apr 2026 16:23:01 -0700, Douglas Anderson wrote:
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "of_node_reused" over to the "flags"
> field so modifications are safe.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Not fixing any known bugs; problem is theoretical and found by code
> inspection. Change is done somewhat manually and only lightly tested
> (mostly compile-time tested).
> 
> (no changes since v4)
> 
> Changes in v4:
> - Use accessor functions for flags
> 
> Changes in v3:
> - New
> 
>  drivers/base/core.c                      | 2 +-
>  drivers/base/pinctrl.c                   | 2 +-
>  drivers/base/platform.c                  | 2 +-
>  drivers/net/pcs/pcs-xpcs-plat.c          | 2 +-
>  drivers/of/device.c                      | 6 +++---
>  drivers/pci/of.c                         | 2 +-
>  drivers/pci/pwrctrl/core.c               | 2 +-
>  drivers/regulator/bq257xx-regulator.c    | 2 +-
>  drivers/regulator/rk808-regulator.c      | 2 +-
>  drivers/tty/serial/serial_base_bus.c     | 2 +-
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 +-
>  include/linux/device.h                   | 7 ++++---
>  12 files changed, 17 insertions(+), 16 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


