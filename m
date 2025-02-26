Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB84C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ku5yxor34R97PptL/bWBzHcwxaDWA+nD2jWwQfiBU9k=; b=AJI4e1wTLmTVeSvV4CPjef9YdG
	uPG8tzlYlqDVFOd0FpjsHelRm2N0GD/DWdwtsPfHBCfgc2r21y2rxYGxZ4hiW+KOGSum0tCUx9EGy
	QfNjVSOKRBUAvIfu/W8WijOFbtbhS7h9oZwz/6XpYTfz9sOyn99tBZNsFbDdN3LqoPIf+5XNLCQoF
	MIxI9dHNEI5mw5vWfS3slwGpmXkgIDVFnFbMvcWZ5IlVSYW9Uc1OzgQo9rMgzVn5LOrXGA+Yg4MAR
	n/FTDyU2uFODuZVQk+KOCE7Kt9wLulRdO6UHaVOJ0xBucP0NpIljb5ySzIRUh4LkeKZ79EomNdYRd
	aEzYLXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNSR-00000005DUn-0zpg;
	Wed, 26 Feb 2025 19:52:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNPQ-00000005D2N-1Jqx;
	Wed, 26 Feb 2025 19:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ku5yxor34R97PptL/bWBzHcwxaDWA+nD2jWwQfiBU9k=; b=HtYbCdnMWAHo6NFA5XsdBmmcQn
	Ef+KnVrFRzpAsTGw9UzBFFmaD2Q00/+VRBjXFYuaW+hpLtCd/vBh99Q9N976u37SktbAWc6uwfRS2
	2v7SQfe3BRISiN/ARIVCmqGsWLpfM5WR49VN5jJQJJdtHZyrlnoafQhotz1eeMA6oT0DQX7DsbFrl
	0h2BC8REVdZUbikN1il1qv8kITxjOIymx18KTgFCTUql7kjDeTk0T3G2zJH/VdRFKCt6OH7UmfGCy
	bLg5pk7idc8F5BYsRFLBJWUmysbtopf0Vjk3tM1m8LhA9V0O1lYUZOmNUUVLSQ4Qdqa1hQmawVsK+
	OMWCylFg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnNPM-0002zz-4B; Wed, 26 Feb 2025 20:49:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Support clock and reset unit of Rockchip RK3528
Date: Wed, 26 Feb 2025 20:49:15 +0100
Message-ID: <174059933845.4008853.13382525452883280453.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217061142.38480-5-ziyao@disroot.org>
References: <20250217061142.38480-5-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_114932_350889_3E15A576 
X-CRM114-Status: GOOD (  14.52  )
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


On Mon, 17 Feb 2025 06:11:41 +0000, Yao Zi wrote:
> Similar to previous Rockchip SoCs, reset controller on RK3528 shares
> MMIO region with clock controller, combined as CRU. They're represented
> as a single node in dt.
> 
> For the reset controller, only bindings are included in this series
> because it's hard to test the reset controller without support for some
> peripherals (e.g. pinctrl). I'd like to first make dt and basic
> peripherals available, then submit the driver.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: Document clock and reset unit of RK3528
      commit: e0c0a97bc308f71b0934e3637ac545ce65195df0
[2/5] clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
      commit: 651aabc9fb0f354ad2ba5fd06a6011e652447489
[3/5] clk: rockchip: Add clock controller driver for RK3528 SoC
      commit: 5d0eb375e6857d270f6376d161ef02a1b7183fa2
[4/5] arm64: dts: rockchip: Add clock generators for RK3528 SoC
      commit: 858cdcdd11cf9913756297d3869e4de0f01329ea
[5/5] arm64: dts: rockchip: Add UART clocks for RK3528 SoC
      commit: b9454434d0349223418f74fbfa7b902104da9bc5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

