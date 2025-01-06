Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14DCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMhP3lUe4bz3uhaZL1VCjp7V4DXLl8Yg3/5gTHem+9Y=; b=aLQuUgtqN/PKfR2SuQUAAAM8Vh
	rp8VEKkxlR0EoUNL0rbsc3qymHZFcEskXHQIqTaddbDBAv4hQwPO+7JTuJoCCm+KIATVJNLzCfmnG
	1in3LNciCLvbUOE+v2a3NfzsMNLf+dMqgAyhM1teKz4DiupIPtEYaiXavifhO0PHVmd9sTs2hL3jG
	g4PZ9alwPux4Sa1sHQgYLl2jSLABhKmn1Vl9/DdcCd5SAiFfdTQBBSAUVgzV0bYaI4DuTC3xjD4Jr
	Us1brsOVvYBDwkKmKQiIlKE0m8TxWjTSiYQ/a0dU7wh4hIY11EV1BWF8Hhzev5N2m/8Q/UX4UhSEh
	vq2d6ZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpKy-00000001ptw-0hWG;
	Mon, 06 Jan 2025 15:48:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpJ5-00000001pdf-2bIi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C65FA41A72;
	Mon,  6 Jan 2025 15:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB13C4CED6;
	Mon,  6 Jan 2025 15:46:18 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 5D88C5F814;
	Mon,  6 Jan 2025 23:46:14 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Vasily Khoruzhick <anarsoul@gmail.com>
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: allwinner: a64: fix video output on
 Pinebook
Message-Id: <173617837421.3282465.589306007023383641.b4-ty@csie.org>
Date: Mon, 06 Jan 2025 23:46:14 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074619_725833_361EF2F4 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

On Fri, 03 Jan 2025 23:36:56 -0800, Vasily Khoruzhick wrote:
> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI
> in TCON0 mux"), TCON0 clock parent is always set to PLL_MIPI, but
> unfortunately it breaks video output on Pinebook.
> 
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment
> clearly showed that whenever PLL_MIPI is selected as TCON0 clock
> parent, the video output stops working.
> 
> [...]

Applied to sunxi/for-next in sunxi/linux.git, thanks!

[1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
      https://git.kernel.org/sunxi/linux/c/9897831de614
[2/4] clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
      https://git.kernel.org/sunxi/linux/c/0f368cb7ef10
[3/4] arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
      https://git.kernel.org/sunxi/linux/c/8715c91a8365
[4/4] clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
      https://git.kernel.org/sunxi/linux/c/383ca7bee8a9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


