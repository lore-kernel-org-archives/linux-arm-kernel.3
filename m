Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18298C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 01:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6U5ExAOwpuC9HkpTj1w+MoxH5Zx9pOSlze71yGpb08M=; b=bSL+vbkJOY1ZBeLy/CXI8HUxhy
	BirWGA5Fhm+4sMq4+OZZg/yHlt3eyAtY638P5n7rfYM+Z7ZvcOutX0l6qf+FsNcRpcFa1J2ChY+1m
	yAqSnlVwEfhwSpepghD2l9SwvWLsEYsaOd4pOTz5WRRf4FPTjyL0c9YUsHPy17bxThuepUYdibSay
	FrG/NFs2OHBeRXF02zxncsCjBJLfkojcLEbpCK5AyA+J33CdJeU4kVhuI9jzl9bGW896qBw8YOnUz
	UdjVkwdtf6HhIx4bKcdyXdP80qaVl34yn6/LyNR3VRh24n9ByPWGw7R7uqOsWDiuBoUtRGdoTCYvq
	9ei27HEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzl21-00000004yTE-3zq5;
	Fri, 28 Aug 2026 01:05:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzl20-00000004yT8-37jg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 01:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BAEE42155;
	Fri, 28 Aug 2026 01:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F2C1F000E9;
	Fri, 28 Aug 2026 01:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787879120;
	bh=6U5ExAOwpuC9HkpTj1w+MoxH5Zx9pOSlze71yGpb08M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMgM+lk7XLVXONkznjgO7m5hNyJIKapRLi1xZUitLCCHqPSXV7dQl5j3JIq5kde3u
	 GrcuKOg9TLqnGiFhSzalDeu47dIfEgqM0eqQyLVur0QTcaNvdUQfhNZB219+SZJcVa
	 3C/EXIpJFgGXhKLrCtnd0uzqXTREumhh27MvTPViIPjrIXXdhIBcRWSm3v5Yt3w1L4
	 FXRDV++HiHEloECuDOBJUIZEgTkWyzxpVL4kLdlrWcKROTJ6RYzvsYk0I6/sa0Qebt
	 gnzKQ9LxufAsjl5dG34QS0R+HGi9DV0MYwK6m/Zkqvy3CljLC6apm0vD2xw/RBidbj
	 Z3seq24nBwrUQ==
Date: Fri, 28 Aug 2026 03:05:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@oss.nxp.com
Cc: aisheng.dong@nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: avoid accessing target registers on
 master-only controllers
Message-ID: <apDetAiapLq-VVRb@zenone.zhora.eu>
References: <20260803032705.2250373-1-carlos.song@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803032705.2250373-1-carlos.song@oss.nxp.com>
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

On Mon, Aug 03, 2026 at 11:27:05AM +0800, carlos.song@oss.nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Not all LPI2C controller instances implement the Target block.
> Since commit 90311787f483 ("i2c: imx-lpi2c: reset controller in
> probe stage"), the driver unconditionally resets both the Master
> and Target blocks during probe.
> 
> On controllers that do not support target mode, accessing the
> Target registers triggers an asynchronous SError and prevents the
> driver from probing successfully. For example on i.MX8QM:
> 
>   SError Interrupt on CPU2, code 0x00000000bf000002 -- SError
>   Hardware name: Freescale i.MX8QM MEK (DT)
>   pc : lpi2c_imx_probe+0x280/0x594
>   lr : lpi2c_imx_probe+0x224/0x594
>   Kernel panic - not syncing: Asynchronous SError Interrupt
> 
> The VERID register is implemented in the Master block and can be
> safely accessed on all controller variants. Its FEATURE field
> indicates whether target mode is supported.
> 
> Read VERID during probe and use it to determine whether the
> Target block is present. Only access Target registers when target
> mode is supported and reject target registration requests with
> -EOPNOTSUPP otherwise.
> 
> Fixes: 90311787f483 ("i2c: imx-lpi2c: reset controller in probe stage")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

pushed to i2c/i2c-fixes.

Thanks,
Andi

