Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FA3CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 06:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQyCjn/OWf2+VSIqgIH858jrK7O/hQpEjAyI+XpYzBg=; b=ubTmuWkMYz87L/mHlIAk67wboH
	2aux4A/tCOmt6qO90Tg9BNsZdr75PvlTTROnfXfsYtRYuKJ94WLTAyk1Qy0k60XKgTtMwnVUi64MP
	WpNERQoC2QB+/sBPvZ7QoxFCU6zkXB1tceNyyObmkDQbgjjoM4v2LtagBW0YtpPJrKHjJBYA3lw4k
	inpekiuCmOSd2gBXSeccnlTr+SPjFlQkv0NfxzI/ua5URZZLd9qafCi2RPGFR2Xctmg5iKViwIvD0
	IY+FqaY52LhpEg0yx8ota6eLN5AHbnU2Vn8pzzTC0peaZHDuVB4dFmRGpgHxtp6MaQEvc9sEu7y1D
	jYR4387A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJYb-0000000DUgS-0IvY;
	Sat, 13 Sep 2025 06:16:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxJYX-0000000DUfQ-45J7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 06:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 150C6418C9;
	Sat, 13 Sep 2025 06:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE707C4CEEB;
	Sat, 13 Sep 2025 06:16:14 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 344A95FBD7;
	Sat, 13 Sep 2025 14:16:12 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250911174710.3149589-1-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] arm64: allwinner: a523: Enable MCU
 PRCM and NPU
Message-Id: <175774417218.3827849.2965288836170499623.b4-ty@csie.org>
Date: Sat, 13 Sep 2025 14:16:12 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_231618_041619_2C42C14D 
X-CRM114-Status: GOOD (  14.13  )
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
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
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

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[6/7] arm64: dts: allwinner: a523: Add MCU PRCM CCU node
      commit: edd63e54e516b54c0b7071463d6e839445efab68
[7/7] arm64: dts: allwinner: a523: Add NPU device node
      commit: a1845487afd06899502714a3500b60f815d98203

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


