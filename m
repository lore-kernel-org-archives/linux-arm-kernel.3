Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5EBCFD2EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 20:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mDPcISwzK7xAIdWy/zIW/Nj+iQrYmcCUccTdjg4sNk=; b=kxKAi8oS+RdhFNtFK5y7grnkkl
	mGsvMrpFPTy9SHCZDhFQukW4/WMSUrwkdHiFVp97NvabymMCcBt78evlp8mNciwKXnYUpXHUtcRkj
	8MdcsoX2LYXvtSN552AQlw60+KmJ7cxTMqr1G1yIq3ml6zlqne5420ZXf1CHkou3912pESjlTycmv
	ETiARfcbX14jPw3A9b70g5Q8Qz2+mxVXCmAdwMR2mjEt3f6anioqlV5iAMRrM4fTAC4d96v0hl2+Q
	33cieXc0iFFJGN+hlUOOElFYo9kmujDL80HEUwgklex9v/e4RnxgKyyZwX8Ges/f9BiTT7fLkl1ak
	F/ySSmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMuNu-00000009sRn-2FPa;
	Sat, 22 Nov 2025 20:39:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMuNs-00000009sRJ-035b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 20:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BDC94385E;
	Sat, 22 Nov 2025 20:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE83C4CEF5;
	Sat, 22 Nov 2025 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763843943;
	bh=LytqE/ino26TpMNy7C4TEQXxJLwP78jNqt4RMla9zf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fp6XCUd8jijkalz67G0GS7Yd4xnEiOcWIRxKyxdkRCjDAT4IN2n0m5Pw9gshzl1YP
	 eqNQcllFJhFRl2L4k17c53DgF5kerAX6Jrw392QAafvAvMRL0OB1/YTsCW3FacfqB1
	 K2ZxYZAeKHp7jxYUEx1JS1ozQQK6WpSqbq/8UvWEzWmgFi7biCmuH6tCWmlKnWJaLS
	 fGCKkKsJ1DJfzFm6URVZbvIQ6k83wq7oJ66rOjRQ3wXYjdaET2U9ZflFAGm8ZFl/sW
	 Hg+WqGoZnQuhnOGQl7Kpcg6/f4EuPSt7QsEfoV2EpYUPOIM9JJTUYsz7ETmf97MqVR
	 CU+VAKMu4nyCg==
Date: Sat, 22 Nov 2025 13:38:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jochen Sprickerhof <jspricke@debian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, 1121211@bugs.debian.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: Bug#1121211: UBSAN: array-index-out-of-bounds in
 /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
Message-ID: <20251122203856.GA1099833@ax162>
References: <176383554642.17713.6408785381758213911.reportbug@vis>
 <aSIYDN5eyKFKoXKL@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSIYDN5eyKFKoXKL@eldamar.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_123904_096855_B18E9FB2 
X-CRM114-Status: GOOD (  15.58  )
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

On Sat, Nov 22, 2025 at 09:07:40PM +0100, Salvatore Bonaccorso wrote:
> Hi,
> 
> Jochen reported the folowing while booting 6.17.8 based kernel in
> Debian:
> 
> On Sat, Nov 22, 2025 at 07:19:06PM +0100, Jochen Sprickerhof wrote:
> > Package: src:linux
> > Version: 6.17.8-1
> > Severity: normal
> > 
> > First time booting into 6.17.8-1 and first time I see UBSAN in my logs:
> > 
> > [Nov21 08:31] Booting Linux on physical CPU 0x100
> > [  +0,012977] ------------[ cut here ]------------
> > [  +0,000017] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
> > [  +0,000038] index 0 is out of range for type 'clk_hw *[*]'
> > [  +0,000025] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.8+deb14-armmp #1 NONE  Debian 6.17.8-1
> > [  +0,000018] Hardware name: Samsung Exynos (Flattened Device Tree)
> > [  +0,000007] Call trace:
> > [  +0,000009]  unwind_backtrace from show_stack+0x18/0x1c
> > [  +0,000042]  show_stack from dump_stack_lvl+0x54/0x68
> > [  +0,000036]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> > [  +0,000025]  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x88/0x8c
> > [  +0,000024]  __ubsan_handle_out_of_bounds from exynos_clkout_probe+0x38c/0x428
> > [  +0,000029]  exynos_clkout_probe from platform_probe+0x64/0x98
> > [  +0,000034]  platform_probe from really_probe+0xd8/0x3ac
> > [  +0,000031]  really_probe from __driver_probe_device+0x94/0x1dc
> > [  +0,000027]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> > [  +0,000027]  driver_probe_device from __driver_attach+0xd8/0x1d8
> > [  +0,000028]  __driver_attach from bus_for_each_dev+0x84/0xd4
> > [  +0,000026]  bus_for_each_dev from bus_add_driver+0xf4/0x218
> > [  +0,000023]  bus_add_driver from driver_register+0x8c/0x140
> > [  +0,000027]  driver_register from do_one_initcall+0x50/0x24c
> > [  +0,000023]  do_one_initcall from kernel_init_freeable+0x288/0x2fc
> > [  +0,000022]  kernel_init_freeable from kernel_init+0x24/0x140
> > [  +0,000022]  kernel_init from ret_from_fork+0x14/0x28
> > [  +0,000015] Exception stack(0xf0835fb0 to 0xf0835ff8)
> > [  +0,000012] 5fa0:                                     00000000 00000000 00000000 00000000
> > [  +0,000011] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  +0,000009] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [  +0,000007] ---[ end trace ]---
> > [  +0,000226] ------------[ cut here ]------------
> > [  +0,000012] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:183:29
> > [  +0,000032] index 0 is out of range for type 'clk_hw *[*]'
> > [  +0,000021] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.8+deb14-armmp #1 NONE  Debian 6.17.8-1
> > [  +0,000014] Hardware name: Samsung Exynos (Flattened Device Tree)
> > [  +0,000006] Call trace:
> > [  +0,000006]  unwind_backtrace from show_stack+0x18/0x1c
> > [  +0,000032]  show_stack from dump_stack_lvl+0x54/0x68
> > [  +0,000033]  dump_stack_lvl from ubsan_epilogue+0x8/0x34
> > [  +0,000023]  ubsan_epilogue from __ubsan_handle_out_of_bounds+0x88/0x8c
> > [  +0,000020]  __ubsan_handle_out_of_bounds from exynos_clkout_probe+0x354/0x428
> > [  +0,000024]  exynos_clkout_probe from platform_probe+0x64/0x98
> > [  +0,000031]  platform_probe from really_probe+0xd8/0x3ac
> > [  +0,000031]  really_probe from __driver_probe_device+0x94/0x1dc
> > [  +0,000031]  __driver_probe_device from driver_probe_device+0x3c/0xd8
> > [  +0,000028]  driver_probe_device from __driver_attach+0xd8/0x1d8
> > [  +0,000027]  __driver_attach from bus_for_each_dev+0x84/0xd4
> > [  +0,000025]  bus_for_each_dev from bus_add_driver+0xf4/0x218
> > [  +0,000023]  bus_add_driver from driver_register+0x8c/0x140
> > [  +0,000027]  driver_register from do_one_initcall+0x50/0x24c
> > [  +0,000022]  do_one_initcall from kernel_init_freeable+0x288/0x2fc
> > [  +0,000019]  kernel_init_freeable from kernel_init+0x24/0x140
> > [  +0,000020]  kernel_init from ret_from_fork+0x14/0x28
> > [  +0,000016] Exception stack(0xf0835fb0 to 0xf0835ff8)
> > [  +0,000010] 5fa0:                                     00000000 00000000 00000000 00000000
> > [  +0,000009] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  +0,000009] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [  +0,000098] ---[ end trace ]---
> 
> Can you have a look into it? The downstream report is at
> https://bugs.debian.org/1121211

I bet it is the same problem as the ones I fixed in

  6dc445c19050 ("clk: bcm: rpi: Assign ->num before accessing ->hws")
  9368cdf90f52 ("clk: bcm: dvp: Assign ->num before accessing ->hws")

So something like this?

Cheers,
Nathan

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5f1a4f5e2e59..5b21025338bd 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
 	clkout->mux.lock = &clkout->slock;
 
+	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
 	clkout->data.hws[0] = clk_hw_register_composite(NULL, "clkout",
 				parent_names, parent_count, &clkout->mux.hw,
 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
@@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 		goto err_unmap;
 	}
 
-	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
 	ret = of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get, &clkout->data);
 	if (ret)
 		goto err_clk_unreg;

