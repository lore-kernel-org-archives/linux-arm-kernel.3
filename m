Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC0C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5XPMcckjmDVkHGDw8w21+ux0A2sZ5HJ62F/iHvIQ+E=; b=IzCFzFEmsPn5saJWZ9AoeNT9uk
	yu20ekVBweJe+19H8oreg8nYTS5OTt9ehyRl6VImDAKGRcY+9aGgrSDkfyRKu1Zf//v24uZDtnFjL
	lGXehsJkmf+O7Doj1aPVYftcb8dHCcpERZrkj5AgjJLJg3egDoc13dYHHMZTh3vD6vME92opvcVzp
	k5ThN/aIOXa/j+7sP1PsZdx9N9HgcqHKWtfSQPfQphNdxjcqxI2HaaEEjgoFCh2/mybonO16wrc3q
	bk3uxZWviMgg/JdB6RyTQWdbeP4mlOPuKGbpVZ5yGF9w2o8Umckdz2xOIosstMoXYzKCPN5pSkmGk
	/8dqN0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsH3V-00000007mIM-2bCX;
	Wed, 12 Mar 2025 08:03:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGni-00000007jvS-0rPK;
	Wed, 12 Mar 2025 07:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i5XPMcckjmDVkHGDw8w21+ux0A2sZ5HJ62F/iHvIQ+E=; b=kpFBKee75VSxjlRgtAgD1lkUuR
	dYMVNKJQY/VTwFqstKyHjwOIM/AICZIX+vNG8twShJ9imJOk4/hs1yp/IEPMVOMl6amC/2GiEr1Ye
	2sfTgboFTOF89X+krJN/pUPpw8dlEkL5GGnA3aQbf3admlFKKEk6dNraDp1VSAy/bK052EQhnCKRL
	nIx7MO/YZGwHbBkU/B/Ve/1lq1fljszLVvECU9QU1/7J7NXAZCxmN9FXOX5qnatycMWhuo8V+9YZ2
	v53XU4KinGhFX7exrtU7xh3ofBVo1uI8aR9+cFx2EjqIiAkagzZL/NCEs8RuT4V/JUcuoBSMB31Kf
	exN84kGA==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsGnY-0005zY-HN; Wed, 12 Mar 2025 08:46:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix CPU and GPU clocks on RK3576
Date: Wed, 12 Mar 2025 08:46:01 +0100
Message-ID: <174176555624.249409.2523115865031259262.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310-rk3576-scmi-clocks-v1-0-e165deb034e8@collabora.com>
References: <20250310-rk3576-scmi-clocks-v1-0-e165deb034e8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004650_245233_E9794158 
X-CRM114-Status: GOOD (  12.92  )
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


On Mon, 10 Mar 2025 10:59:55 +0100, Nicolas Frattaroli wrote:
> As Jonas Karlman pointed out on the #linux-rockchip IRC channel on
> Libera yesterday, mainline has once again chosen a different set of
> clock IDs compared to downstream, with hugely detrimental effects to
> mainline's ability to use SCMI for clock operations. This is because
> TF-A will use the downstream IDs, and when we reclock things through
> SCMI, TF-A will get the wrong clock ID from us.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: rk3576: add SCMI clocks
      commit: 33a409dd1fc8be5ef8f33ebed76856c4cbc5bc15
[2/2] arm64: dts: rockchip: fix RK3576 SCMI clock IDs
      commit: 825f48a12e597e7556768088b74f3384840df5e6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

