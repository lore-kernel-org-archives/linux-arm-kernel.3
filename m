Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9302BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 00:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2Iu3SQtZT0pgrBbmaX2ODvL22y0VCuuqoLeFUJLbI0=; b=rZFYrWlyVkNQwfh7hua39+WgdV
	Nkxt+Wbf3o28Tltv18GL7xhA5NcfHnOet/6cJlbHmDTtUA48zOHCI7wXc86eHOvn2TYjNY/PJn25y
	WTCOctreDTjJh1kOJeHEYdwJKXn7vZGMW/JhMUAYkukULkiU3Oy8kwjiBURaPNfXnd3pQCN5pZm54
	9MzJWcqI1qtpPHYdoMHLf2RpuTXX1FFaBx3JLFPoiOX1ELbBglyaQ5wIq0M3QOt7uVYcvjfTXCglU
	jvHykKFR0sXpc6glSWv3GnMFWw9p50OTpnr2vZ1D7Wczbt9HsfOCPoax7GbMEPTWUua83QZC7eO5l
	/yNb/Wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQJM-00000006Dfh-0RiE;
	Tue, 31 Dec 2024 00:40:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSQIB-00000006Daz-00rK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 00:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D436B5C3FAC;
	Tue, 31 Dec 2024 00:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1AEC4CED0;
	Tue, 31 Dec 2024 00:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735605566;
	bh=DebDtKWVcH8ESuuP0gUMAP0mpjt23oiaM+dD/NQMrrw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h3bWGKFJblMbN7mV4PEaDApqhHXlIHioiHhM57nEeRpZjKsdmENT08ASeaO84EkMv
	 AzfmI1kqVBSq2/+3np+FbroYnkxlj4IVzgLFlHPYOI7fneCoQTL3jlvudgrEFdD9lN
	 sBjppnIwEdKNe+7ILjL03aAcSKjBgjtPGqfjc3ZD4taKGFGDEg5o+ZjlV0m6qPEsCE
	 TGn3UIjSYFD3p5G75zeJs9rjFGr1i/8TsWPn0ejmzHSz1L0RdTQRufo9TeKPyvzFpw
	 MeMbUq13pdNku8a8OamO/QZKaYsxujW3VZ9YM3V8opwXq9fEMZ+0J6lCpHl/VTN0wg
	 djFBe5neV0FYw==
Message-ID: <5227cdd506bcb0239657216bd36de12f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241226122023.3439559-2-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com> <20241226122023.3439559-2-rohit.visavalia@amd.com>
Subject: Re: [PATCH 1/3] clk: xilinx: vcu: Update vcu init/reset sequence
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Mon, 30 Dec 2024 16:39:23 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_163927_100882_CFC80101 
X-CRM114-Status: GOOD (  13.36  )
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

Quoting Rohit Visavalia (2024-12-26 04:20:21)
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> index 81501b48412e..f294a2398cb4 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -676,6 +679,24 @@ static int xvcu_probe(struct platform_device *pdev)
>          * Bit 0 : Gasket isolation
>          * Bit 1 : put VCU out of reset
>          */
> +       xvcu->reset_gpio =3D devm_gpiod_get_optional(&pdev->dev, "reset",
> +                                                  GPIOD_OUT_LOW);
> +       if (IS_ERR(xvcu->reset_gpio)) {
> +               ret =3D PTR_ERR(xvcu->reset_gpio);
> +               dev_err(&pdev->dev, "failed to get reset gpio for vcu.\n"=
);

Use dev_err_probe() and friends.

> +               goto error_get_gpio;
> +       }
> +
> +       if (xvcu->reset_gpio) {
> +               gpiod_set_value(xvcu->reset_gpio, 0);
> +               /* min 2 clock cycle of vcu pll_ref, slowest freq is 33.3=
3KHz */
> +               usleep_range(60, 120);
> +               gpiod_set_value(xvcu->reset_gpio, 1);
> +               usleep_range(60, 120);
> +       } else {
> +               dev_warn(&pdev->dev, "No reset gpio info from dts for vcu=
. This may lead to incorrect functionality if VCU isolation is removed post=
 initialization.\n");

Is it 'vcu' or 'VCU'? Pick one please. Also, this is going to be an
unfixable warning message if the reset isn't there. Why have this
warning at all?

