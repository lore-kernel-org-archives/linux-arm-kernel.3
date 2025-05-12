Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F98C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d33HsV9Q2ExG4jEFNJ1KZZxRs5i/Rdno5huB+BNquRs=; b=Gs+nTK3G8XiK6IrqIQhrnX3OGl
	KDqlZomKfs7dKw9eTf9lby88IieDt5ZI39xI9rIA3JVXE2R2rdiPfg/ZYdIrjAxjSl6b4cE3yjF6Y
	MOyQVSc4WOB+dbiubgYWOIRAc9qApqVg1UawIthYy1lbkUVCJJi+gj5Svi78hMF013H25VOCDhicY
	H/0yu8WSiEsIBxbDDIjBXkyj+Y+VJJoZxSsFEzxW1Bb908VyvMQAZAI4BLuP5DMjaZYoxPp9U9A9D
	xUPILGz8yTKmDeMpIpGN1mBpMeWslsimWlFRZSx5dOkSDyoKi/sOTANNq8lJmCvgVE784iikq2isx
	sRTNQ2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEae3-0000000AiNo-2tTd;
	Mon, 12 May 2025 21:25:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEab4-0000000Ai7T-1Dog
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25B5FA4C875;
	Mon, 12 May 2025 21:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1944EC4CEE7;
	Mon, 12 May 2025 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747084920;
	bh=aFYcDwYxXrLjIDCIgnPMduQEvVa991+JxlfnAmkMZbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L3ZZ5w5cHA2B336NXZh4FoaRl+FdmeJtSBYbt4pp3Tv7SIFI0B7Yz8au7yDFPZ51/
	 1R4LXgUzBO0OAqu/1Dqc5zVkqo15Qzh/kYoVbtpiMeV7C1LDp53W5k7nUCc+OUhlNh
	 HrK/B72mGkZko5InZEXAjc6yoqNWt9c7XNTghlZ9IrCWjtgfRH9+GrBrT29Y0m4X/S
	 XlVTAFahKkNf/qTZqibff9MDui4wQYEhgIhdt8H5F50B2BFu4NDTDb6Kz0Cg5nW5XM
	 I0V9GN6vJkez6x0k4KwkSLnfb04d7AYmcBR8ANa4hrDaMSprQsz3iMrRoku6ftGr/B
	 XvbhP7M9NPVJQ==
Date: Mon, 12 May 2025 23:21:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Carlos Song <carlos.song@nxp.com>
Subject: Re: [PATCH v2] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <ay6kzvpilixtbiki4z7splkvp3dukhocuxlpmawcrakzdrwedj@qmgb5aiv5ud7>
References: <20250509140949.56324-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509140949.56324-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142202_397060_2C73F016 
X-CRM114-Status: GOOD (  11.95  )
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

Hi Francesco,

On Fri, May 09, 2025 at 04:09:49PM +0200, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> jiffies do not advance in atomic contexts, so timeouts based on them
> are substituted with delays.
> 
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks and thanks Carlos for your review!

Andi

