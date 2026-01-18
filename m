Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FB0C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 23:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypc7h/otgx8IvHFGe/9jEz1BLL5oHc6ssefcvkjwgVU=; b=36by1oKCZF7y9L6U2QqBrHlCKo
	UAQ8ZP4tEXUgmEaEJQMmC1B0n3nHR2FzJFiYqXyYAJISSqCB8DNNy7NIjbKQCQqpCdKsJz5Cfeh3S
	fQqUa1aHj9LC3UA1/YWntZ0Zd4vWanLfDAP/w3h0cjfXp5h1vaZMt4Senjof9YdMZPei7PueOTp6Q
	uC5s6wn88aoMDMw3n0ADk1vfB/gLgW+FR0isWesEh14mPNKbzUtIZD97fFvzJTXVD1BawdDLXrkVB
	UiD6ImI5GdY5jzj5CQtI0iORDch54bhySbe2X8WK8scxdw4sQmVqXoNs4MRN08jLg1s+u7xZx4BU7
	fhcu1twQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhcet-00000001BCY-2rHo;
	Sun, 18 Jan 2026 23:58:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhceq-00000001BCI-3teA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 23:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ABC560010;
	Sun, 18 Jan 2026 23:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82652C116D0;
	Sun, 18 Jan 2026 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768780689;
	bh=6bMKJ5lG0PNdrSpn1+M0W36NUJ6bnMbRMOKJStqQ4yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuTyV86wzK2Ik/Ya2XK6dOYuwvctqTKnZO3kTt4mNF4DumN8NWsF96RjVQu0ZXjKa
	 i2s/HqLuyalOM7Gw2f2ZG/3QTXaRpSXqixHqWu09hUqBZnNzTk50ljCqePctcx87G1
	 zb3yE/FsZn43FxhjfnNo/RremMNUWzXDtscaSpMlV7Y+fCRsMDwgGcm0kOdkKmomlR
	 Uq4gw03GebaUUU8BlXgmcrgTA17ecqQS8p228GE2SnS+OnbcC9wRao6CrwM64O5X6H
	 yNjpqH3k5cZqh6KzWgbRSk1ihvx9a9VFBAZKQNpBVGB+zmqfYggbq6V0Lr/DQQWGaE
	 X94BS51f5yNyw==
Date: Mon, 19 Jan 2026 00:58:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: Add runtime PM support for IRQ and
 clock management on i.MX8QXP/8QM
Message-ID: <aW1zaXZsC_8KaM3N@zenone.zhora.eu>
References: <20251125084718.2156168-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125084718.2156168-1-carlos.song@nxp.com>
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

On Tue, Nov 25, 2025 at 04:47:18PM +0800, Carlos Song wrote:
> On i.MX8QXP/8QM SoCs, both the lvds/mipi and lvds/mipi-lpi2c power domains
> must enter low-power mode during runtime suspend to achieve deep power
> savings.
> 

...

> - Free its IRQ during runtime suspend and re-request it on resume.
> - Disable and unprepare all clocks during runtime suspend and prepare
>   and rne ble them on resume.
> 
> This enables the lvds/mipi domains to enter deep low-power mode,
> significantly reducing power consumption compared to active mode.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

