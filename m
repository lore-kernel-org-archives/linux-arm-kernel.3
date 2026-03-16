Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EBFF506CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9yZUuJFFGk4gnRKvzMu6LLsSeZw6eWPtqDfuAIYlQGw=; b=QMdsFh3VQNzgDU
	lWEkd70lFZ5o+IG+vu7MyHJZlYF1g8ZPLV2hOS43lKPXbyJijGNwvBqNftv6SqjIJLxLzAzEiAYnv
	E9Cxf9BzUZUlwD26NAAxJzcams8q9JO9FM6dryHm4w8vnwRrzeFroTQKzt+5nMFWZAgvS8jXXiSwX
	EnB+uwmVK8fMe6qSjp1gZMvSjfU2va/VaMa9SadYx312q7kN4+v0yO+NyD6mrBYKKY6FhoWr9xWGz
	QG6wnz+6DburRM/37SkRLVah0VgnOSnv2ldotgEDhEv5rHzTsPyArFDcoB1dV4pxg1eujDwdhnFmz
	zX+D/ViIPWIEV+OCg2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27fK-00000003zso-22yd;
	Mon, 16 Mar 2026 13:07:26 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27fF-00000003zpx-1qtU;
	Mon, 16 Mar 2026 13:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9yZUuJFFGk4gnRKvzMu6LLsSeZw6eWPtqDfuAIYlQGw=; b=o7EAdcw2sYkPQsol2/wD4tI+ae
	COkU2var4Q4WCtW8BNGo/3lGMHJkCPRD6X1M5H6bWmUox1s94VF3OuW/rTzqvgo63UCspEuuXapzK
	ZkRZntRKyb36lmosJwXGJiVJyek4oSvG5gEuL4YF7a7g9YLHXi9T/PN7DxYc0ghEAqqSxzJTy5wg3
	bMAD02n/YHLPWIVxsC6rf/00c9T8UtHsTbDQZ0odNy0OA3BYHE1+GZn1Jp2vjfu2R8y8afxOhV9xd
	pnU5/04Bmc1j8PC+AsRJefeXSPYnam0PlaNOfiAAI0RXoAlGN8WtMM3r92uP7qZ85SVIfDgelNiYq
	MzgOOICQ==;
Received: from [185.94.132.237] (port=54871 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w27eW-0000000BDZB-0kRV;
	Mon, 16 Mar 2026 14:06:35 +0100
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH 0/3] clk: rockchip: rk3588: add I2S MCLK output gate clocks
Date: Mon, 16 Mar 2026 14:06:30 +0100
Message-Id: <20260316-rk3588-mclk-gate-grf-v1-0-66fb9a246718@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZaq1K8irjQmtbgl1REEO9uc
 fkWMw9EEqYITfaA0MWR9y1B5xm4qd8CIY/JUKiiVkbXKLOprMXVLTOG/iQM4tGVg7aqNNY7BSk
 9hDzf/7bt3vcDFzyza2YAAAA=
X-Change-ID: 20260316-rk3588-mclk-gate-grf-c4b180438fc0
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773666394; l=2347;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=E36lowatpLuY/OY8y9/Hl0XNxREfhNrdukb3xvYuYxo=;
 b=Oe9QKQlor8RRH8UbErzyI2J7eDZ9AW4kri/Jhj4WZnnv6/BkP2SrjfJPJ6ziJbqeArjUjMdkN
 r0g8vkRwqR7CFd+AtHWVr+c1/yVzUrsczG1iBrbvZZJub1jcd5SmIhn
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_060723_670955_AF9CDD99 
X-CRM114-Status: UNSURE (   7.29  )
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

On RK3588, the four I2S master clock (MCLK) outputs to external IO
pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
are set-to-disable gates with hiword mask semantics.

The TRM documents the reset value of these bits as 0 (gate open),
but in practice the Rockchip firmware (BL31) may set them during
early boot, preventing the MCLK signal from reaching external audio
codecs. The kernel should manage these gates explicitly so that
audio functionality does not depend on bootloader register state.

This series adds GATE_GRF clock entries for all four I2S MCLK output
gates, following the same approach used for the RK3576 SAI MCLK
output gates [1]. Board DTS files that need MCLK on an IO pin can
reference these clocks (e.g. clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>),
ensuring the output gate is opened when the clock is enabled.

Patch 1 adds the four clock ID bindings.
Patch 2 removes the grf_type_sys exclusion from the aux_grf_table
        lookup, which prevented SYS_GRF-based GATE_GRF entries from
        being resolved on RK3588 (where ctx->grf points to PHP_GRF).
Patch 3 registers the SYS_GRF as an auxiliary GRF and adds the four
        GATE_GRF clock entries, each placed after its parent MCLKOUT.

Tested on a Youyeetoo YY3588 (RK3588) board with an ES8388 audio
codec connected to I2S0. Without this series the firmware leaves the
gate closed and the codec receives no master clock. With the series
applied and DTS updated, audio playback works correctly.

[1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (3):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

 drivers/clk/rockchip/clk-rk3588.c               | 22 ++++++++++++++++++++++
 drivers/clk/rockchip/clk.c                      |  7 +++----
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 3 files changed, 29 insertions(+), 4 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rk3588-mclk-gate-grf-c4b180438fc0

Best regards,
-- 
Daniele Briguglio <hello@superkali.me>


