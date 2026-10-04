Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A3CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl53g7rpe8c2NvDVMufClYtHeiVeKNLfh36+hYUKK2Y=; b=naSntT85Oeymhh
	mXYOHVUGtfQo0d+r2nEeqqA7DrzN56FnV0P7xZBe7SSXVm5VYGEx9qMSkys3dY0/nypo5VGecjmrF
	5PRrwHDNtAyZ8WUGI5xKQf8UbL7oJTXJf21RespASB1IH01pWZaBPrlTIwQqVrg3N5J9Z7IlsHHMB
	sq/NBtsUfYQkhDvUGr+JDh2kV+DmeAA7Znysr3LDjZ775lN/0I2bdE1M5n13uIYQDPHN+tocOvCRj
	K2sBFJR+PF51FT8nraHYUIyPVAuAEYX/BtFuxMAHU6wwDdk+d4oP7fgkqeQHEWtHZHJfcFkiAxQA7
	dVi7no99TdkW+DHFsO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJKh-0000000Eeh2-1Sz5;
	Sun, 04 Oct 2026 10:20:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJKe-0000000Eega-3p6Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 10:20:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A6AA447B6
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 10:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319251F008A6
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791109236;
	bh=Vl53g7rpe8c2NvDVMufClYtHeiVeKNLfh36+hYUKK2Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=gqt4DRaVUlq3TTRXsfIWM+ZzYYHZ6izGC94e7qbADl0A3FjKHf+5f1eVeRUpRQrZc
	 5DY8JHzmgVqA6kEoot3HwdiD/d1WFwBb48n/s7/ChIUU74xfsCIdfNd36BBWVuQ4TW
	 LQtAiG06km7HbsGvLOX5c5DVettgRpizHcRL1V7iV4RSyAEJc/iV2dS94XP6IzmQcP
	 7R/2fRXXTipw20v9loYNPUVdUid+cxZeqqHzasSLqM0XNZOIdflqUZkikTG6RLt0Qd
	 q+OC4Mrc/1g93NatVhYQYpmDjlxeaHlxONdl6f5dbmUGMgalzDZYohMJ+5F9jXNQLG
	 aGKwPaUyOm5Dw==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cedd9baso9196751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 03:20:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQG6HkyUqhxHQyPjMqKVfWeFEqefM4/Ocj1P0Q4DOGaHJAW+uAmmDqhH8kiufENg1nXGfgDQB9gWrtq8PkG5XR@lists.infradead.org
X-Gm-Message-State: AFq9FYLWcMXUvFeyXxPJ1TVNcNVHLe4oqkPvYMLs+tzXNXE9ECf9ebYp
	Ra6E58sW247QC+6lnzAlVcdpgKwnAPZ0bgBoLFA0GWo07iOP1W/32P+w4nzj+wr8eIFj75FG9Sa
	glGKtNVWRvB7b913+eCi9VgoarEQvl98=
X-Received: by 2002:a05:651c:1505:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a8877ae1c5mr17889201fa.7.1791109234518; Sun, 04 Oct 2026
 03:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 12:20:22 +0200
X-Gmail-Original-Message-ID: <CAGb2v66YZtRW=1igjZogmO7qkzOggBDZs6jsE7qnSygrFR8XUw@mail.gmail.com>
X-Gm-Features: AclHuK8lO4-Xwk9IPWxNxJj8KXMJSBu0Tti5GLWoVOI0E89DZO986O0ZYPGFHF4
Message-ID: <CAGb2v66YZtRW=1igjZogmO7qkzOggBDZs6jsE7qnSygrFR8XUw@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] clk: sunxi-ng: a733: Add bus clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2026 at 7:28=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add the essential bus clocks in the Allwinner A733 CCU, including AHB,
> APB0, APB1, APB_UART, and MBUS. These buses are necessary for many other
> functional modules. Additional clocks such as trace and gic are also
> added as they fall within the register address range of the bus clocks,
> even though they are not strictly bus clocks.
>
> The MBUS clock is marked as critical to ensure the memory bus remains
> operational at all times. And the hardware requires an update bit
> (bit 27) to be set so that the configuration takes effect and the
> updated parameters can be correctly read back for the MBUS clock.
>
> The GIC clock is also marked as critical. The bootloader may leave the
> GIC running on a PLL parent, and disabling that PLL during
> clk_disable_unused would hang the interrupt controller and the system.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 105 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 430a535919c6..eda4b347c540 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

I would prefer comments here for the skipped over CPU_PERI and NSI clocks.

Once added,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

