Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED0FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjfLTmcyKD0hrkOGEYEgBYNd9aUyIP8bdXAALh7Ab8g=; b=LsCbZ42RSA+u44wYGg/Zw8+dyR
	SGvTq8q6c6w8LDtxsVgfSJXvMc6jrdlkQUCYhKnn08As/PFmVq+roC6hVwp6MPAG2aO07W4Km4/xP
	cBHvbuUNNfblVvZ64VyARDYGQcS/p5zF5Butcjt7RIqcgaQ/lbEZGS4umzSdedAeGvytsKopTgSen
	PV/3qMiUyilbmO5L4U9ViqwvcsKYVbnljWWSTkmbYmjDW/dfu50we0Z9YJwDrlkYj8Sl/Txs9zShU
	uuA4zczDZf8lJ7fi+yTHeuKv6Cr8uc0n20EDwK04gjgLSp68Zs1IIYbWS0/5Z+nfyyNW9ozlfPj5Q
	VrCCCvUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL0O-0000000GtL6-39Co;
	Mon, 27 Apr 2026 12:24:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKzy-0000000Gt8p-0cnL;
	Mon, 27 Apr 2026 12:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jjfLTmcyKD0hrkOGEYEgBYNd9aUyIP8bdXAALh7Ab8g=; b=qzViLN7HGQxYtfONvHpZgmKw3o
	eJMHy8bhLVX624B78Rb2+FrCMB67RXfZmovbCA5qe6ZgW8NrKkaX0hqZc9E0OFTik5ldpsxIThJf7
	GEZihLQ135ZMQVp6/ZgRxZdr/Z78OmQXVSR3m3mZvUbgMl2RLDpx/L/0kRVV1gYRvsbflv7hApfmE
	v24OrauXEdTct7U2yFuqi6DPCuJm6gTwTByvqvk9MiRtcc9OkxCMDAxQ3HQ9aPIJQyswmhQYHMmZ0
	4IXHF8KiLfY2HCv+DH3HBbqCTwA8Wk6XfdO5KGTx8NboZyFYtuRQFPy2ZbvDJQFH6PDfxu7g164Zy
	Ti0PyRiw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 0/5] clk: rockchip: rk3588: add I2S MCLK output gate clocks
Date: Mon, 27 Apr 2026 14:23:21 +0200
Message-ID: <177729258228.1866089.5793149531492182650.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052338_207339_C65D65EC 
X-CRM114-Status: GOOD (  10.69  )
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


On Sun, 19 Apr 2026 13:43:05 +0200, Daniele Briguglio wrote:
> On RK3588, the four I2S master clock (MCLK) outputs to external IO
> pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
> are set-to-disable gates with hiword mask semantics.
> 
> The TRM documents the reset value of these bits as 0 (gate open),
> but in practice the Rockchip firmware (BL31) may set them during
> early boot, preventing the MCLK signal from reaching external audio
> codecs. The kernel should manage these gates explicitly so that
> audio functionality does not depend on bootloader register state.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      commit: 56c2ca0ae7cb9254c4c2b82baa0afe29feaa274e
[2/5] clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      commit: 28820fc7983b9c8e160c0095067a570bdfcae1f0
[3/5] clk: rockchip: add helper to register auxiliary GRFs
      commit: 32d1d88c4165d0da31d3bfda912e80e8110d6fc1
[4/5] soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register offset
      commit: 06c990bffdbea7cf655e728f4423ecd13fb030f6
[5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
      commit: 02b9b0bb626989b947d82bbe4e050f0254e2046d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

