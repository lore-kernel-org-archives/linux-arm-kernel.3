Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B0EA853C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COX7CpTb/27v5+RAJjpmWzEICJkLOwS/U54SdgdwvJ0=; b=xwV2hppIlMCxbL/zadsBnuV/GT
	oeJm+xpMal1OxATjYnQkkFifL+Xtaos7a7OxnR/eGBmc45Hnl8xcznKDwp1tfCBD0zDrDprgEYdE1
	XKItQTgVhLXZRDBBq1F2w7fbHw7Nvu/hykJO0ONugJPcorPvRBWeaTrR+SXIuQyF28cGf8HiAfKeM
	WMA1f2/+ZjDj6oYVVOaqbCJBbLn58XH6nMJy5MD2timTlN/zWdtnUcVJOeEZpDxfXh0yIuszULjWe
	sNpv5ju37XMHicuFaeMQ/NoyQ6Y23wpg06T5RUQRZFQYqHk5S7yCnE8RC3fl8udzixgDSmrzbzA8t
	7FmxrjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzIQA-00000006Ef5-3lsr;
	Sun, 08 Mar 2026 18:00:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzIQ7-00000006Edn-3TDG;
	Sun, 08 Mar 2026 18:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=COX7CpTb/27v5+RAJjpmWzEICJkLOwS/U54SdgdwvJ0=; b=dT
	Mvt5zreya8sYFTIdBVn+u2Cr+TZpKI2sHjC2eOz50+u7Z9bcgWi9rBmOKKmEgNT9xNvbN2WV71V+Y
	MTg2bknSvJlEcZlhzC8/RD+LOfjFVJwRy0Suiwp0bqKJXu0GL9C9yJfORHH9scM7YznnM23vGIC03
	WMxQMzpeato1q7o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vzIPq-00Ajv8-GI; Sun, 08 Mar 2026 18:59:46 +0100
Date: Sun, 8 Mar 2026 18:59:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZC05Yeh?= <12321260@zju.edu.cn>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	heiko@sntech.de, romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: Re: [PATCH] net: ethernet: arc: fix use-after-free in probe
 error path
Message-ID: <1bb942f0-d512-4834-bf01-49f9a9d7fd77@lunn.ch>
References: <20260304025303.145493-1-fanwu01@zju.edu.cn>
 <b6ac1471-e33a-41d3-9e67-e6463612f05b@lunn.ch>
 <54c76f66.7eea7.19ccca93975.Coremail.12321260@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c76f66.7eea7.19ccca93975.Coremail.12321260@zju.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_110003_871549_AF835207 
X-CRM114-Status: GOOD (  14.95  )
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

On Sun, Mar 08, 2026 at 04:56:08PM +0800, 吴凡 wrote:
> You are right that normal device interrupt generation is enabled in arc_emac_open() via R_ENABLE, so we certainly don't expect regular RX/TX traffic interrupts during probe.
> 
> My main concern here is the lifetime ordering in the error path. arc_emac_probe() installs the IRQ handler via devm_request_irq(..., ndev), but if emac_rockchip_probe() fails later, it explicitly calls free_netdev(ndev) well before the devres cleanup routine runs.
> 
> In that specific gap, if an IRQ is somehow delivered—perhaps from a pending/latched line left by the firmware/bootloader, or other non-traffic anomalies—arc_emac_intr() will immediately dereference dev_id as a struct net_device *. Since ndev has already been manually freed, this results in a UAF.
> 
> So while I completely agree this isn't a normal pre-open traffic path, the mixed lifetime management (managed IRQ vs. manual netdev free) still creates a real race window.
> 
> Switching to devm_alloc_etherdev() puts both resources under devres management, permanently fixing this teardown ordering issue. I would be happy to send a v2 and reword the commit log to emphasize this as a potential race window and a hardening fix. Let me know what you think.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#clean-up-patches

  1.7.4. Clean-up patches¶

  Netdev discourages patches which perform simple clean-ups, which are
  not in the context of other work. For example:

  Addressing checkpatch.pl, and other trivial coding style warnings

  Addressing Local variable ordering issues

  Conversions to device-managed APIs (devm_ helpers)

  This is because it is felt that the churn that such changes produce
  comes at a greater cost than the value of such clean-ups.


Some percentage of devm_ conversation patches break drivers. We
Reviewers need to look at all such patches and try to detect such
breakage. In general, it is nor worth it. Hence we generally reject
patches like this.

This is however slightly different. It looks like this driver was
broken from the beginning. The race you point out has always been
there. That is something worth pointing out in the commit message.

But take a step back. Think about interrupt handling in general. Do
you think it is good practice to request interrupts before configuring
the hardware about what interrupts it will deliver?

If the driver wrote to R_ENABLE in probe, before requesting the
interrupt, enabled the needed interrupts in open, disabled the
interrupts in close, the different lifetimes would not matter.

So, for stable, please add code to put interrupts into a well known
state before requesting the interrupt. Please use the net tree, and
add a Fixes: tag.

You can submit this patch to net-next, but we might reject it, because
of the policy. If you are working on this driver, adding other
features, this patch is part of a bigger patchset, we are more likely
to accept it.

    Andrew

---
pw-bot: cr

