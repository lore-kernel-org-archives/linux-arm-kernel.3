Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CC8C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSiuNqSnQi+WEHYSwYz32Jb8s6xw/xyPKLioEiJqeGk=; b=GALcI6+ZN8YiGAK0O2xeb6eUYS
	NRuyQGSKcQvsAplWtQwYMmkGuQ9Klhqpk+sREu+EQbw4obEK3vslBHRzVvLRhbS4bUqr9VqOJjRZN
	VNpBpIIx/5VpGuaSDiEpJk/dqqTbWIAmlHxhGcZP8UTZVTe36DPSc9FHLW75uQCoaVuoKpnWpCDuO
	3WFuoVZMcn7CioA+hRnK7ekMH9nldyiDCS6+wTpZd8v+WZkXcxf2enN5UzgztolJD7RD9nTC6zUTb
	3zwlt26ho4U3XN4j0Ed8XVS5YsX2WfjwtrHnrxFXFp290OBmc+6JNCEFgDQyVFLNvmRJaIj+d2KRP
	S6KEzR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEbO-0000000Fg3k-0b0T;
	Wed, 14 May 2025 16:05:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDof-0000000FXza-1YDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D4325C5877;
	Wed, 14 May 2025 15:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92A1C4CEE3;
	Wed, 14 May 2025 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235679;
	bh=Y+K0CTNazLFlZpMgylFelX29INIzg+H1k2D8sZ3bDcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDl1EynwApjePrzqmYaRrqbwX6nnm/wMyxORcRzAaGmYbRq3J0exTHedYZIokVLqx
	 p3FqD3hdkB3pXgRwqpPPfEDXe+oFlCu5Klz4JiyjsaBu6H98BFH4UmWuA1ohiNLgvm
	 D75u7YH/Wt6zY/mw4npsQHfHbMORIsPkRvEewfK//AZ22J7moOPWUTZxbZHHGivW8l
	 VCYOdmCjMUwCvDDYZFxLVWE/7mgOVY2EQfEgIp8pcedDFCMY6CRPvM3qZLQedePs8o
	 EOu+b5IqY0/YFHMNOmtH/ISof9ldZevBTgNSwY8uJsT/4rgbR5/x/QdMDvNIPFV8E8
	 HM6KjfqQKg9/Q==
Date: Wed, 14 May 2025 17:14:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
References: <20250319145114.50771-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145114.50771-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081441_447915_20DE7309 
X-CRM114-Status: GOOD (  12.68  )
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

Hi Francesco and Emanuele,

On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
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

this patch is causing a build regression. I'm going to revert it,
please check the test report that has been reported and you are
cc'ed.

Andi

