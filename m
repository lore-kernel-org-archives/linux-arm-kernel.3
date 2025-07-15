Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E197C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkhFOYwdRSyGscGrBbX7jloahWVxL8wW1ddI4bWJmds=; b=jeOpz1gxmrzsRq9ns/AfbjIDtT
	JDJIyhBcxYipSvKsxVJ+cSebK+1r9hmgW7mhkQAFISI0BkGcokf9+NKDHgilDBzYkpLV6J9j7fShS
	lRF3VRGMv76BjkFkDW8BT/WFlZ7mWJR1JIO10nzUsHYWR603odBkgmUWhrJ9KNXcYMuPa9kGjZYPh
	7CpNBLtSPvqP/Hw8t7ZJH+j8HRTy5LQM3vdOFREWYi2o9oWQ5udAm1QmQ6oo9zxghGvy+GCvjjTqJ
	LoZRzhTPs37ftsVCitij1Sg3TaUo8LxFM40ARUDZOG9pEH8xiHAe6Rkh1lO3OMevHcQu9PLLh+ItR
	KZF9tr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublC4-000000062PI-0vbk;
	Tue, 15 Jul 2025 19:20:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkGf-00000005tST-1p5C;
	Tue, 15 Jul 2025 18:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lkhFOYwdRSyGscGrBbX7jloahWVxL8wW1ddI4bWJmds=; b=hkoabe7t+nW2G2kXb3q34Tsv9z
	D7A6olUIkKsWjxYBFrZ5zUBmCITfYVuNdzFgE/gVxSXtwi0Y1F3UFVwbFupLCZkdNGOGFQf1krUx9
	albAA7yBIqtlQow2FnS+oi1M2ZK3RJF690e+LyEiMDvzvD3U91C3RU6/6AtwQFnTmm+TuT4BVaekm
	AGS2dOFGEkTqvr6LXLrQg521ji2ya5dCl6EVXR1Z5+C4OW7zmGZkAS/Rp3TjyQMuzh5ZXFHg/GprT
	jdjo/zqarZs0ydEbJZGOd7zFEbaEGR302jTqxyE+DI27yVZIjatKjUuA0idAjpVaJ2FNZkT0MRYMX
	bbofTJQw==;
Received: from i53875a5c.versanet.de ([83.135.90.92] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubkGX-0003l0-56; Tue, 15 Jul 2025 20:20:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/10] rockchip: Fix several DTB validation issues
Date: Tue, 15 Jul 2025 20:20:23 +0200
Message-ID: <175260361882.2550944.901009051285494437.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250709132323.128757-1-didi.debian@cknow.org>
References: <20250709132323.128757-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_112041_498752_F1C8518D 
X-CRM114-Status: GOOD (  10.58  )
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


On Wed, 09 Jul 2025 15:15:13 +0200, Diederik de Haas wrote:
> This patch set fixes several DTB validation issues and consists of 2
> parts:
> 1) dsi refactoring
> 2) various low-hanging fruit
> 
> ad 1) The display/rockchip/rockchip,dw-mipi-dsi.yaml binding had:
> - #address-cells
> - #size-cells
> 
> [...]

Applied, thanks!

[04/10] arm64: dts: rockchip: Simplify VOP port definition on rk3328
        commit: 776d8e75d4a3a422a680648e30c5bfe607a99805
[05/10] arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
        commit: 25937eb02f0a5a7e30fe97333ecc94ec5582ecb3
[06/10] arm64: dts: rockchip: Simplify mipi_out endpoint on rk3399 RP64 dtso
        commit: dfb549bbca62fe4b2c06bf203a3a9c1f86fcfae2
[07/10] arm64: dts: rockchip: Move mipi_out node on rk3399 haikou demo dtso
        commit: 4ac334d40e7022f091c65480cb7a01bc89135989
[08/10] arm64: dts: rockchip: Fix LCD panel port on rk3566-pinetab2
        commit: 8c17c938dd94f70fd37db476f8b965dd2775b874
[09/10] arm64: dts: rockchip: Drop unneeded address+size-cells on px30
        commit: 2fe00f4611637db677be51d7812dc177e4019b6a
[10/10] arm64: dts: rockchip: Drop regulator-compatible property on rk3399
        commit: b2501f327b8a136dbdd1fe7bad5d113eeda2827a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

