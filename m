Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D01C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hILmlDnmqlI3hydqaPdsiAxJcFYVILLNwYATRnJKd0U=; b=T0UbF8oCTcyaMTReris4mwl4N2
	g9vkvWMJJu7VYMccmZmAriYcNzcD6UBVlMpINwKMpEXsc1AqPKgmZd+kdh/hWlIlLJpj3/NYC6dDD
	ab3imbJpt2SY/yMAoVCxK56nJ0i+IzZ6oBc6/AGfFxPMl+/NU8yOeobHc8fIAYM5UMtLP/i6IS7tX
	kLoaO+sGAWpe84iQzXuJJgJ8gG4D9dN2oxGidQXN55eq9HH0Zq8iP1/1guov6T62JGwEWAG25yiBT
	En+JpBQLsvqZ3G+39cxwPVOJwHXAE8ffgAey1/ysc7Cl9hu2yIzUy7+wBpISPxW1IcGLqyYBjBY74
	lmonF87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8kF-00000009vnK-2eox;
	Tue, 06 May 2025 03:13:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4p0-00000008w4z-0Q6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C275AA4D2DF;
	Mon,  5 May 2025 22:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A89CC4CEED;
	Mon,  5 May 2025 23:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486121;
	bh=MruHz70q8C4LHPMWLrcifiaLFqr0szg5KcDA46S/mnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8mrYBtmF4fTFyUfX3jbyauHlWz8NT6nK80QoKyLfppZNoP0O6PRoE/FkS0bP09tc
	 lPerD+IaP9PP7Xn1p5PtIr3NY+RmdTX2N7oDpQisLIFa2XiAgS5xrjHhePnE8tBLP+
	 vppqTSQ08gZ+mPCskQiwsvXpx76Zb+W+r9dMI6FUzv6NWzRmHKYyFQETjUO/RKHNNs
	 cAnx7xj54ziPRX5HPaZbBBdQrJDSY9Y3t6AT5U4kc0QBowQwbE9eF0ozbtY+cgrSNs
	 KmhxxVmOowe8Hv43UkEGqKPhRLuxELrmBWsZYwKUq3qag0ai2divO2HUfdNXW3TmrL
	 9pyvLTi6IAI1w==
Date: Tue, 6 May 2025 01:01:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <aotznndpptgl5qtmkavmeuqydzpkefncnovddzyqqst6ozsm5p@fewoclduusfz>
References: <20250319145114.50771-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145114.50771-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160202_201927_289C9FDA 
X-CRM114-Status: GOOD (  19.58  )
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

I'm sorry for the late reply on this.

Can someone from NXP help with the review? Carlos? Dong?

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
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 258 +++++++++++++++++++----------
>  1 file changed, 173 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 0d4b3935e687..f34b6f07e9a4 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -16,6 +16,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -187,36 +188,35 @@ struct lpi2c_imx_struct {
>  	struct i2c_client	*target;
>  };
>  
> +#define READL_POLL_TIMEOUT(atomic, addr, val, cond, delay_us, timeout_us) \

READ_POLL_TIMEOUT is not really a name that belongs to this
driver. Could we name it something like
lpi2c_imx_read_poll_timeout()? I'd prefer lowercase, but I
won't object to capital letters.

Additionally, the timeout_us value is always 500000, could we
just drop it from the parameter list? Same goes for LPI2C_MSR.

Thanks,
Andi

