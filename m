Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F5DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 05:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaX3EfWly9EKv+mSFFVdeGWYijGUhWag5BvIAxHZ2h8=; b=A4b/+yYsWIdUZr84/N4FzNvKQY
	22Lg/aqn9vj0RQYjRu3h+rQoxUgbb0eqIKihQhX23x2KNbLm+HA0Fx7mT+EBTiiVog3fkC7jTeB16
	GdirXtMgVN+/70NCqymJIDEGnR59u05d4ycuulszgS4K5fCOqhp7uq1dnT4dXf+vK/P1mlojT2N9T
	5B55FuuNktLXh5NE86+F4BqYgd57ByjnTCJxVVz9D2oHDPFJe6NBNAOSo+QcSPvfjNjH/+WOgcGbD
	2EbvA/pGz82lESIoygzDvcBs+m1byF0kFtpKlpmON6RVxKbqYnO7jxtbtZ6GRXf7W6/GYvBLMJWly
	85Yry7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJEZ-0000000DPz4-3DUE;
	Sat, 13 Sep 2025 05:55:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJEX-0000000DPyA-2h0f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 05:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61DAA6020E;
	Sat, 13 Sep 2025 05:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4F9C4CEEB;
	Sat, 13 Sep 2025 05:55:34 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id F1B455FBEB;
	Sat, 13 Sep 2025 13:55:31 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250911174710.3149589-1-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
Subject: Re: [PATCH v2 0/7] arm64: allwinner: a523: Enable MCU PRCM and NPU
Message-Id: <175774293191.3795761.5114630927586047824.b4-ty@csie.org>
Date: Sat, 13 Sep 2025 13:55:31 +0800
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

On Fri, 12 Sep 2025 01:47:03 +0800, Chen-Yu Tsai wrote:
> This is v2 of my A523 MCU PRCM and NPU support series.
> 
> Changes since v1:
> - Dropped dual divider clock rate read-back fix that is already merged
> - DT binding
>   - Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
> - Add NPU clk
>   - Move .num to after list of clks
> - MCU CCU clk driver
>   - Added comment for "fixed" dividers in audio PLL clock
>   - Corrected variable names for audio PLL divider clocks
>   - Added comment for the reversed order of some of the DSP clock's
>     parents when compared to the manual
>   - Added comments for clocks and resets only found in the BSP driver
>   - Corrected register offset for i2s3-asrc and bus-mcu-pwm0 clocks
>   - Made "r-ahb" and new "r-apb0" external bus clocks the parents of the
>     bus gate clocks, with comments if guessed which one applies
>   - Moved .num_clks to after the list of clocks, making it obvious that
>     the value needs to be added if more clocks are added to the list
> - MCU CCU DT node
>   - Enlarged MCU PRCM register range to 0x200
>   - Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
> - Link to v1
>   https://lore.kernel.org/all/20250830170901.1996227-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/shared-dt-headers-for-6.18 in local tree, thanks!

[1/7] dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
      commit: e9671ddd82eee96146a7359431a4e1f04ac2b076
[2/7] dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
      commit: 0f610e650d4e979490ccfa4c22ca29ca547f41e7
[3/7] clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module clock
      (no commit info)
[4/7] clk: sunxi-ng: div: support power-of-two dividers
      (no commit info)
[5/7] clk: sunxi-ng: add support for the A523/T527 MCU CCU
      (no commit info)
[6/7] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
      (no commit info)
[7/7] arm64: dts: allwinner: a523: Add NPU device node
      (no commit info)

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


