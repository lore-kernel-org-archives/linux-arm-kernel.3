Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5BDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 21:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF2OkHBOjK8vjJ3vlRzHmsm/3qQXun/URonDEmawmZU=; b=YBJUz356x+t6W9oWlAYrQckGNN
	0Pc21X02khk28SEfKSANVaSICNS42HMvGJB844zVPb7EsoLmIVdewCbRna6iBXG0VJg1e5NY8rVTH
	BYXQTnHNmnEcC6hDKKL14cCcU/I/ng6jbyvbyk4zoZlAx1mXjLv5UW0lzYVOdd6+dQUUI2w43ZupQ
	kzFXtbHo+RUyxp2queRhgAdnwcv/xJLPn67sl4BhTdPEu+Sh4uT/MEqjQZJSpiNYbaXx95gFUmmKz
	6vhgV8gcufCK+GccMuehyhSwRMc0RceXrJ0qG/yebomUumAPEGpP0dFncVIbhEsiNTh3QP7iTJabe
	mBt6WepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj2pf-0000000BLhd-1FbF;
	Mon, 04 Aug 2025 21:34:59 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj2n6-0000000BLU5-0vUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 21:32:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E862344487;
	Mon,  4 Aug 2025 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754343134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vF2OkHBOjK8vjJ3vlRzHmsm/3qQXun/URonDEmawmZU=;
	b=kTdn889lz4zxChAjFptOF4R7nE1TTpJ7wNCh0MIvUBYP0cFuAdEnP7zH8iBbL/+CsaD0Av
	QVCZYmxQvN38IVUGseAxzz9mmXd18jFRnXeKhIZ163S28K33E+t2XADnwTblkix98jFv1X
	AGjezf9mZBGYQK568/JmdNGKrjKZjBvYee93zAzx1rxUCGr8XPIAPk4IgUlDFGD3tw0BnD
	eeglKwDpxC1QsjIrIPZs5zWJnIyocmtQrsFQc9x8zojYvNH8kmlEIUv7HicpeiCUEbREEV
	/pzBGZ2hhXOyhlVgDM0QGKZMXjE3tsV/Tz/CHBEsC4l9aeb+2NF6D23Y7E3hkw==
Date: Mon, 4 Aug 2025 23:32:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ivan Vera <ivan.vera@enclustra.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
Message-ID: <20250804213213d4844d4e@mail.local>
References: <20250804154750.28249-1-l.rubusch@gmail.com>
 <20250804154750.28249-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804154750.28249-2-l.rubusch@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudeffeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefgjeffhfdukeefheeugffgfeetjefgvdfhgedttedttedtffdtiefgvdeiffdunecuffhomhgrihhnpegrmhgurdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeeghedruddurdeikedrvddvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeghedruddurdeikedrvddviedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehlrdhruhgsuhhstghhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtohepshhrihhnihhvrghsrdhnvggvlhhiseigihhlihhngidrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhvrghnrdhvvghrrgesvghntghluhhsthhrrgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_143220_923320_30BD0960 
X-CRM114-Status: GOOD (  22.72  )
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

On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> From: Ivan Vera <ivan.vera@enclustra.com>
> 
> In the event of an uninitialized calibration register, ensure the register
> is reset and properly programmed during the probe sequence.
> 
> At present, only the calibration register is evaluated. If it holds invalid
> values after a power cycle, there's no longer a way to reset it, for
> instance, via a devicetree entry to 0x7FFF. This issue is documented here:
> https://adaptivesupport.amd.com/s/article/000036886?language=en_US 
> 
> The fix prioritizes an optional calibration value provided via the
> devicetree over the value in the register.
> 
> Fixes: 07dcc6f9c76275d6679f28a69e042a2f9dc8f128 ("rtc: zynqmp: Add calibration set and get support")
> Signed-off-by: Ivan Vera <ivan.vera@enclustra.com>
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/rtc/rtc-zynqmp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index f39102b66eac..0c063c3fae52 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
>  		if (ret)
>  			xrtcdev->freq = RTC_CALIB_DEF;
>  	}
> -	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> -	if (!ret)
> -		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
> +
> +	/* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB entry. */
> +	writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);

Doesn't this forcefully overwrite the proper value that has been set
from userspace and so trashes the time at each reboot?

Isn't the proper way to reset it to simply set the offset from userspace
again?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

