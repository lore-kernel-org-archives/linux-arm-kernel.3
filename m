Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244EDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=1S7UvtE5YJz6If9XRzgRvok0t4
	12R7lVAMKr4b3zUitSrCjYS+rCiu3Yp8fWf36/baN/W8YHWCmelkx1t2OZRWAaJ3A1aPV6wa1RVjS
	LidGUjoImZ/NztGzyPFgu/yzL3APFWKvS7JatPzimwFpG87RpnHOPfO4/vNU7xvfyaF0OimmkvzEr
	N/hsbGh1BTbF9XTBOl8KIfLxDvopXkaZ4rGZvg6+jZBVAsPzzBNpBf/r9rDtZk5OeZenNJaujwcJ0
	qF63xtmesL8XZ43Gpz6wIyzJZP9CdMOy9VC7iAkTp1BUxNZIQqdJM8bvPKNzbVCkhjFNe7CeyR+8a
	ikw6i0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcbE-00000001jL6-2hti;
	Mon, 10 Feb 2025 22:49:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKg-00000001fOp-1UaU;
	Mon, 10 Feb 2025 22:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=bN1rutURALccVrVkY3k1M2Oz3x
	MojcnlsuUegxM8DcVv4rCdie7jlvZm0z1bGOeX49Wi7DIuRtWlmY3hU2zgVIKWxLVPcDBt6PrhdWL
	715op1BnH+1jnHtARvv0MsnKuhRJojnSwJBCJxd/Y1d1evimuLP50PICzgwxEshwga+RNv21gdYrX
	xtma2J72DVxBo9KrLzVdTooog1poy/qXJHF6vtQNldlP/T0rgYXC1UIMpMyW3zd/tzGET+dOdqy4B
	9XJdJh2TX/LFHubOn5JEwbZi8LRQdnijMsGBl5iedvZ0vSjz7GYQi/GXMFZIglra8+iOpgbhuYqpJ
	iTH8HUOg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKc-00000000K7A-3XZo;
	Mon, 10 Feb 2025 22:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=KQx4IXFNJL5vV7eAiGmhZkA1eh
	dkbm7i7f0satR1STmER7NhHbuYLgQMSu10QYONFacXh4acrTAK6+gfw/6hREN8yK4yTwqT87z1Udg
	BBAVrs9JY5Pj50yyr0iPsdSO2znO8ghDvKfoyTMr60+wvOsvaYM1u/ZoZUPtn2su5hw7OEinNdEO6
	OvnM7tK1fIIFoCrVsg4m6WVR/V6oJ3Aqg8MFY80w8tkHDIO1tcnqEIbU96EBGFYjJFMuqE/vYb9zT
	zTZOXAZZ36nv3lczVrizPzEgsrYp4USeYV8ut5atmPI3rFkdHTj3RPkvaH0s40Bs/c3A39dB9NGOb
	WjnEBH9A==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKb-0008Cw-DG; Mon, 10 Feb 2025 23:32:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH v2 0/6] RK3576 OTP support
Date: Mon, 10 Feb 2025 23:32:13 +0100
Message-ID: <20250210223219.1193346-8-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223247_053525_D68A3781 
X-CRM114-Status: GOOD (  12.85  )
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

This enables OTP support in the nvmem driver for rk3576.

I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
myself, after the nvmem-driver and -binding patches have been applied
(patches 2-5).

But kept them together for people wanting to try this series.

changes in v2:
- fix register constant in clock definition (Diederik)
- add patch to set limits on variant-specific clock-names
- use correct limits for clocks + resets on rk3576 binding

Heiko Stuebner (6):
  clk: rockchip: rk3576: define clk_otp_phy_g
  nvmem: rockchip-otp: Move read-offset into variant-data
  dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
  dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
  nvmem: rockchip-otp: add rk3576 variant data
  arm64: dts: rockchip: add rk3576 otp node

 .../bindings/nvmem/rockchip,otp.yaml          | 25 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 39 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3576.c             |  2 +
 drivers/nvmem/rockchip-otp.c                  | 17 +++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.47.2


