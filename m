Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F112CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohAxfRMC3hfwx3bWNwqhsVIp9/GkRkVmDTq9tXa2hWo=; b=qDOmES5shU9azA6pWH1+jimjhm
	Bu5fe/OVF2Q3JeVFB2Sb7iqAZ1Vke9naAwuqM+OUuK++wKFqOLuQlfHAaK+yxl2RjvuUYqjEs9U3h
	GFWAA5WEVrOoziZeYvdu6oKSKcJ73yFS6bGqOtCeXhFzAFdsdhCJR729ya8jbhy3VZ2McwICflPee
	qPTrC7hnmC4ZJnYGiSa9MdmsSmA2njyzioV+TazgrUj10dxqApUvNt7zIiOu9iuHH93HmqTOr6yXf
	/pQ1cU9H+g3iuw5yyAZl68yibdxnCyQim6YFGmcSNYZii3y7vmgEr5jEDm7NNt3mNpGJiAjh/rS9w
	nLWvmc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphra-000000046pI-0x8L;
	Sat, 23 Aug 2025 06:36:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTML-00000002woj-3JrY;
	Fri, 22 Aug 2025 15:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ohAxfRMC3hfwx3bWNwqhsVIp9/GkRkVmDTq9tXa2hWo=; b=hXO651aHiuKcKK9LsfPxhe2tEp
	/8OWWYskvDMRuZTlbG+4fOkc9r7tDDxYQ0QqX/7RRpFesk0ufQbFKGouuGM6nqhVi2yDJBf3rZ/aw
	4FPAtzdypX427e2MTU678VK5lIBfIQmCAKbDrOc6E4MNirID2u/1RTotan2tqz2Ju8dyhS6LthjLL
	43+yXto27VZDs845hMcae/pE0gIiCsLmOYKLC+82oXRzGQ/p5ZM1dHoaT55M122dhefJfWdcvM9fC
	XevwYqlfLWY+mnN0oJzNkcj9ieqI9ZWjM7+7KCrwnpeV80xCvvwgCNA6xNl+wLL/DhNhjjq29AcRC
	orFl6uaA==;
Received: from i53875a83.versanet.de ([83.135.90.131] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1upTM4-00016y-MI; Fri, 22 Aug 2025 17:07:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/6] Support RK3528 variant of Rockchip naneng-combphy
Date: Fri, 22 Aug 2025 17:06:56 +0200
Message-ID: <175587519618.3220879.13156903990488376391.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250728102947.38984-2-ziyao@disroot.org>
References: <20250728102947.38984-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_080717_853507_80A93D3F 
X-CRM114-Status: GOOD (  10.93  )
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


On Mon, 28 Jul 2025 10:29:42 +0000, Yao Zi wrote:
> Rockchip RK3528 ships a naneng-combphy that operates in either PCIe or
> USB 3.0 mode. It has a similar control logic to previous generations of
> naneng-combphy but an apparently different register layout.
> 
> This series prepares phy-rockchip-naneng-combphy.c for variants with a
> different register layout and add RK3528 support.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: rockchip: Add naneng-combphy for RK3528
      commit: 70bb21cbc8c704c664b5d3ea417f3e35376fc229

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

