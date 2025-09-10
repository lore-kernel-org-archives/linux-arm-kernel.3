Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE91FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+34w++d6JhUpPaZf6kT/i8Q7gTXYQRzM0sD2LYXYwk=; b=Jfukv11gtKDDlwT4Bf6WpTGLq0
	q00bpfnDH2vsHjoWALrunHFqfoTjTiJxXIb1OTtd8P8MMTAiyr2cNqsJPQj3IMKrUZjmz59ECawEP
	pTNxVHQ4GMgVCetPwEehPHg9hmtviJeF3TSpX960ZNtuny/nk+Bcm4wvf+YnkEaDChnc0ioNMY4W1
	JLMo8DVHJwVo+tY5l7Yjtju55dTvYBZvwme25AqIo3t+efR1CCcar/xDuB+SsuygOqQkH1jfw/FvA
	V8NWjfZ6ZYKo1SMlV7s3fXAUgcrLOAAmwBQGRKSpBW18ZVzT+bROW03VjqVVnVnRcVny0hAmcKZ/V
	+uhLyr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN1q-0000000FDsI-1HSA;
	Wed, 10 Sep 2025 15:46:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN1p-0000000FDrp-1ZPk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4DA9601AB;
	Wed, 10 Sep 2025 15:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53624C4CEF0;
	Wed, 10 Sep 2025 15:46:36 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id BCD525F752;
	Wed, 10 Sep 2025 23:46:33 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250830170901.1996227-1-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/8] arm64: allwinner: a523: Enable MCU PRCM
 and NPU
Message-Id: <175751919374.2641871.13986088170214893044.b4-ty@csie.org>
Date: Wed, 10 Sep 2025 23:46:33 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 31 Aug 2025 01:08:53 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> This series adds support for the MCU PRCM and the NPU.
> 
> The MCU PRCM is a Power, Reset & Clock Management block that has some
> clock and reset controls for the MCU, DSP and some peripherals that the
> MCU could use.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.17 in local tree, thanks!

[3/8] clk: sunxi-ng: mp: Fix dual-divider clock rate readback
      commit: 25fbbaf515acd13399589bd5ee6de5f35740cef2

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


