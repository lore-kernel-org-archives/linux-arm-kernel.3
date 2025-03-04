Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA0FC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jboAJ0TDh+OlkHuwftLCsZ+FXL3CIibc36b0PSVLhec=; b=Y5DoVHBZvtB5KxBukvtI/qV8ve
	CBkR/x8VVKpGtVf2v3cMTSyDeb1LEvMQJDO42lvCmYxoXagWfrW+5sWn+Dsdpkfs9dvlJgCKSTKo1
	EJRWW7jPua4kzcQnlcWbL/K7pvFc9ohTaL80NaQY1mfuZuaLIzxW8E4ImyUZFSur8dVOhoEre5iTt
	UOY9DVrJ+9sVY2laGP6gzLu8iyhty/H8Y/T/5UxzTt4cx8PKJdfnESWXMvMBMdSVFe2gtFcc9COF0
	h6veHg0xIPAYrboz3iOzIN37YjK93YP7MsLJ0rOKuTwg11ZSHQ6GuhosiLXokiCpFdOLDwFzJQAHj
	xgADF8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS6c-00000004ktM-2Cim;
	Tue, 04 Mar 2025 13:14:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQz7-00000004Vks-3AXh;
	Tue, 04 Mar 2025 12:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jboAJ0TDh+OlkHuwftLCsZ+FXL3CIibc36b0PSVLhec=; b=hVXnd9mjU1mx39Frs3fVXG4nsk
	PypU+idzTuaxwZRaKhxK8UKH/Y5nNI+DFbbX39bSMPWWetpees56ae1Bd+zkuGCBai6pxlIQG17pA
	DBD20/NGKrGHP4Jw2Zv3SDF4BO3wGju/8FmqXjxriq3UHfCkSTNFubTsYZXO/nZSBAFzxCsQ7TyQK
	6lg2mZQgGOFsaGXUZX17nHiLcs/MhK12WArWUsOygCfjkqRou1HL214UOaZH6q064XUfByPmo9jUQ
	bpzjtku3eyNLrlToGGxik1MPckohT9tTznEUH/tPzIX+wcrnEmDrOm8whuV06maozrQWVQvZo5fIQ
	V96IJMpw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpQz1-0002ws-FJ; Tue, 04 Mar 2025 13:02:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] rockchip: Add support for leds and user button on Radxa E20C
Date: Tue,  4 Mar 2025 13:02:45 +0100
Message-ID: <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040253_819679_0B8B15ED 
X-CRM114-Status: GOOD (  13.80  )
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


On Fri, 28 Feb 2025 06:40:06 +0000, Jonas Karlman wrote:
> The Radxa E20C has three gpio leds and one gpio button.
> 
> This series adds dt-binding, driver support, DT node in SoC .dtsi and
> gpio-keys and gpio-leds nodes in board DT to support the leds and user
> button.
> 
> This series builds on top of the "rockchip: Add support for maskrom
> button on Radxa E20C" series [1].
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
      commit: ac32ad07a97648eb8330b2c4cb840b0ef46903ae
[4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
      commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b
[5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
      commit: 0d2312f0d3e4ce74af0977c1519a07dfc71a82ac

Patches 6+7 depend on the parallel saradc support series and thus
do not apply - and need too much rework to safely apply.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

