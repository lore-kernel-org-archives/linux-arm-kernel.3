Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5554AC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVNg8W4i0W6hja2INdKL3BkLpr6NjK1WYIGNB9EYZTs=; b=w9PEceaqFFWw1dOke/XGO8pekg
	C1oq45D/vpst94xseFtLh8VxxVYiqJv8fG5WsdXVbmUjIXZG4l82R64bOl2ZLe4qw0hoiJu+qKPjn
	yMI5gfBS/8GvyrisxU+iHZEpop4cKNsciNA9804cpBJEAQ0oZt9rq9Jq/+cNzgtIhSSv/xiqPXF53
	Z4/DuGa+MZGnGsTvCByksqFst67t7r99X8aFP77jpJxoLWxEjOfnxBTumznkL3mcZZo2Hb6XpJZtr
	Nw8Zm2RPl1TUuL3mgTq8anMD18giAaA34DP0dgOLZPeAvfl9jRMxZgIzbBRGoCFrxz22uf794oLr0
	V4T/n3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD66Q-00000001YrO-3aXz;
	Thu, 08 May 2025 18:36:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD61M-00000001Y1i-1TCQ;
	Thu, 08 May 2025 18:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NVNg8W4i0W6hja2INdKL3BkLpr6NjK1WYIGNB9EYZTs=; b=tgYxyzAoFJIkQjDHxpq1IA2mKj
	QMmT3FjrrCGf1hmiQYDv4/FohIY9hi1jqzXV5qSNWTOMloLUICITIewfEAgiVQFGPVwrWe6N5Bzsy
	PN4WaQTebkuPHB1NaRWd3pbEvMrr5mR9D4IifUiuF/92htZ7wUI0p8wiEMB5DNHpLxi8g1uX7YCmi
	OtD3oxAl7zvNfnbGaTq/1NMb6A21ulTlxKGnZPL7NNRitvQ8DT4IOg8AseniXtvRLSm+lIYmEiePP
	C75ley7LqjytEywyqhlZPZeRbYfXxZAaOE7q/s5c/5xh0w9vR8/GvLyUA2YsLQ8kia/kW7XJT4Hik
	y46fSMFA==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD61K-0000vi-Hc; Thu, 08 May 2025 20:30:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Correctly implemet the usb480m clock on rk3036
Date: Thu,  8 May 2025 20:30:45 +0200
Message-ID: <174672902827.1927548.11178117072822465092.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_113100_384778_500D0616 
X-CRM114-Status: GOOD (  12.50  )
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


On Sat, 03 May 2025 22:25:28 +0200, Heiko Stuebner wrote:
> In the original clock driver the usb480m clock was "stubbed" as a fixed
> factor clock, but instead it actually does have a mux-bit to switch
> between the 24MHz osciallator and the actual 480MHz clock supplied
> from the usb-phy.
> 
> Both the register layout, as well as the implementation is very similar
> to the rk3128, which seems to be some sort of cousin to the rk3036.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
      commit: 6e06b641ca96c232e0b13f9b44b118742986bcd5
[2/3] clk: rockchip: rk3036: fix implementation of usb480m clock mux
      commit: 897adaf536ab01f130ce0b53a635a592733c0f24
[3/3] clk: rockchip: rk3036: mark ddrphy as critical
      commit: 596a977b34a722c00245801a5774aa79cec4e81d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

