Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BCBD2F00D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=559PE9EUDws7nLXefn5hc2HC7NxfEB4hyMktnlM5TR8=; b=n2m2/FcZo2uKN7xJbxoYIosbXK
	LemTWU7wY75TgTbSqa0+a02cm/EW6VGXlEK1sJUYSAwIgWt4E0QbtXCveIbX5Nis9AuP6SiokND9o
	xIEL2hBHkREYIiYnrxy3RU5Nzp0zMmnTcrKBopLT8o1/ISJgJuDJtY7gLr5LhdyGucVQBY+JtZiy+
	LC3WbnHkAWkO8BAi9SU+yyYMsZyVdIS/VmEDeX8F3t573TSYO/sl/t/ACI5hcea74Qb0cs6/N6Li+
	e6xevua1F2+8XyAl2aHOCc8llWpKDuxyoxvl0hf0LeqVcYhq27GeH+WbgiUKkK/F6Dwy25fxmjkau
	5TG3sAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkidS-0000000EHV6-02OK;
	Tue, 27 Jan 2026 12:57:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkidR-0000000EHUt-1KTs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:57:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DCA960097;
	Tue, 27 Jan 2026 12:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6540C116C6;
	Tue, 27 Jan 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769518652;
	bh=Uksvj+xXNbVKjMG5czjlohyQ4d21ktvK52mNzFdDWSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2titWdaXnkx9/wH5ayXFTvKiWmyHCAO8bcKIHk4uZrSAs2NX+pxPZdkVMuOoshFa
	 z2f89ClcaabsmFC5zc8BHWMsac5YaecrFYqEIMVJF5gyjpgMYX45Ml1DqTTMb+0l/6
	 xJrX6e7Xd8xG/rY9QA25VZjGqvXckuXAbh/doJWcC4YULkXmQy/iv5AiTRvp+L0lto
	 KGkm4paaRX+qB+0cSzTnY6aDlLbwOPoUC9fb3EzM4pJC5Vs97KC/bFwzz8pzWYvEZ4
	 ZOnuCJ4wpITzFDsJ8YBiKUcOOA9i9p32TSXh8efo4+bfc5P4Vv6wWlTuTcLYs1UUOu
	 8xZUI4lq6HPEA==
Date: Tue, 27 Jan 2026 12:57:24 +0000
From: Simon Horman <horms@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
	kuba@kernel.org, festevam@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
	shawnguo@kernel.org, mbrugger@suse.com, mcoquelin.stm32@gmail.com,
	linaro-s32@linaro.org, davem@davemloft.net, s.hauer@pengutronix.de,
	edumazet@google.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.li@nxp.com,
	chester62515@gmail.com, netdev@vger.kernel.org,
	kernel@pengutronix.de, pabeni@redhat.com, jan.petrous@oss.nxp.com,
	linux-stm32@st-md-mailman.stormreply.com, s32@nxp.com
Subject: Re: [v4,1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
Message-ID: <aXi2NJcwM4-mrgrj@horms.kernel.org>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
 <20260126152430.1390514-1-horms@kernel.org>
 <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
 <aXeP1y7cK0XRx3Wo@horms.kernel.org>
 <aXh9lcfw6D6KouI_@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXh9lcfw6D6KouI_@stanley.mountain>
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

On Tue, Jan 27, 2026 at 11:55:49AM +0300, Dan Carpenter wrote:
> On Mon, Jan 26, 2026 at 04:01:27PM +0000, Simon Horman wrote:
> > But at any rate, I think the key question is should the case
> > where regmap_write() returns an error be handled in
> > s32_gmac_write_phy_intf_select() (by some means)?
> 
> Generally if register read/writes fail then there is nothing you
> can do a the software level, you need to buy a new computer.  However,
> in this case we may eventually put the registers behind an SCMI
> interface so probably checking is a good idea.
> 
> Could I leave the error message out?  The callers has an error
> message and if you ever see the error message, and even with SCMI,
> the fix is probably still to buy a new computer.

FWIIW, that seems reasonable to me.

