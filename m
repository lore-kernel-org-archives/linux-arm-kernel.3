Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF6F108B8EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tmhqVAw1SequYpgo9JNsSALFszo5CegfJjcyU0KkUec=; b=4S5pf66wDo26B/
	rbPCfZC9XWFI0RhIeabqlHLfTvyPqFH9cyDorv9AZRuoS6ZjMx8L8AAamInED+TbuDI+lR8mq5Iby
	B9d30wdnKsDEwndGKLkbJD/Mn5ff5h8BHI+tSJr1sRBlQphOvr0vHkX6u/e+mAkRxhcMXI7X+/Q4a
	i45ItWdJXOv4fYv47CRI5My+qD5FvEsesIKjZVvs2OiHHTR+nOYX9oDz0Onk8PAzZSBvNqpBkyWpU
	XycCUiR7srwDCLq7fSQj8WWnZWnRO21KNZbiRKXiJRCc89rbAL6zCGXkyZW9VYeshK9TiGxc/7hgA
	UtkktzzhEkuY6rrvddQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XCt-0000000CcXn-0nUh;
	Fri, 20 Mar 2026 10:35:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XCr-0000000CcWY-0ZYD;
	Fri, 20 Mar 2026 10:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tmhqVAw1SequYpgo9JNsSALFszo5CegfJjcyU0KkUec=; b=tekfB58jNaXJpLSH0UaFqUyC1l
	QlPqHi6e1el/3ttKYCXzr5aUksWv6e6A8CnPGGHQTuVoGuIJxZIw6FmwhkmYPladfGMHcsEZE7mq8
	SDVnT9y8TVXfZbrgtjFQ47m/GXfE5MLLTwhtfBGGbS7/GZyG/Bl+yqfNBU4vJ8+h5Sq6P8D3npTdf
	2efQoyvNTxN/ATf8RErhbZhJAyDVZKEF1MDWaAQAJSPI7AeWCwemUferpEtztpr23lIm1xFzRtSyb
	4bvO2Lk7G6+7mty1NMj2cxgoL8SZ0z4voAPevCn1T79gqhfrr8aWwPBjEaal6VSajGWzn4qsYSou/
	Qbwr/uoQ==;
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XCn-00000007cwi-3vnQ;
	Fri, 20 Mar 2026 10:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tmhqVAw1SequYpgo9JNsSALFszo5CegfJjcyU0KkUec=; b=RpGwKmMkFnNRolhTVnMlRyUg92
	Dp3YSVuY15IcItW/tFRB0tDXwbM5Q2PcqkMmj0WZUaZnJnojGZfY1qsvHoVpHiJ2wnVwlvSmDoIXy
	cuDKNL/cyTec+TDTQpI0TQyUantcqoKllthAThRu2BlpLvHIyGkaoO8wi3ym0uFVppFaF3rAnIq/l
	vZXrfK8rboxyus9orcLR+Nr7AtCftBQl2HEQvvFPT1l2XnPSPK56qVzyHIhBNZ9T8HrkUiTSpfaOr
	UUNBr5NRSl8PJJeonqjq2Dma1GjZ1NAu3VvH202TxbeUTO5gf4LdgEQWhK8v+JdXnkw9mnIxEzrPV
	Y6VAuLrg==;
Received: from [2a0d:52c0:500f:0:89f2:a47:418d:affd] (port=53820 helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <hello@superkali.me>)
	id 1w3XBO-00000005JXw-0yui;
	Fri, 20 Mar 2026 11:34:19 +0100
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH v3 0/4] clk: rockchip: rk3588: add I2S MCLK output gate
 clocks
Date: Fri, 20 Mar 2026 11:34:12 +0100
Message-Id: <20260320-rk3588-mclk-gate-grf-v3-0-980338eacd2c@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNywrCMBCF4VcpWTuSm2l05XuIizSdtqFXkhqU0
 nc37UoEcfkfmG8WEtA7DOSSLcRjdMGNQwpxyIhtzFAjuDI14ZQrKpgC34qT1tDbroXazAi1r8D
 Kgmkqha4sJel08li5587e7qkbF+bRv/YvkW3rHzAyoKBUVZwNlypn+hoeE/rWdO7YI9nMyD+d8
 w+HJ8dKq0tjCpor/uWs6/oGNEi1dwMBAAA=
X-Change-ID: 20260316-rk3588-mclk-gate-grf-c4b180438fc0
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniele Briguglio <hello@superkali.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774002854; l=2850;
 i=hello@superkali.me; s=20260316; h=from:subject:message-id;
 bh=5JMQi3Lx1keozzyCzZeW3fPQ3kU7jxXfjXJ4iYsKOI0=;
 b=uw0YNLgWoLe9+6+ItxFlyyHTRg7XBq+a9yDKChJct3OW/9z/rrSVHb4cOCfab0HuJGXFcNqdm
 Ftdw9P9IeoiDl6cnavwxNhOckTRjarf+VNUy+zaWKXam9Sxe6j1Obrl
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
X-CRM114-CacheID: sfid-20260320_103550_028526_398B2084 
X-CRM114-Status: UNSURE (   7.71  )
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
Patch 3 adds the RK3588_SYSGRF_SOC_CON6 register define.
Patch 4 registers the SYS_GRF as an auxiliary GRF and adds the four
        GATE_GRF clock entries, each placed after its parent MCLKOUT.

Tested on a Youyeetoo YY3588 (RK3588) board with an ES8388 audio
codec connected to I2S0, and independently on a Mekotronics R58X-Pro
(ES8388) by Ricardo Pardini.

[1] https://lore.kernel.org/r/20250305-rk3576-sai-v1-2-64e6cf863e9a@collabora.com/

Changes in v3:
- Added separate patch for RK3588_SYSGRF_SOC_CON6 register define
  in rk3588_grf.h, replacing magic 0x0318 (Nicolas)
- Dropped Reported-by/Closes tags from patch 4 (Nicolas)
- Added Tested-by from Ricardo Pardini (Mekotronics R58X-Pro)

Changes in v2:
- Patch 1: shortened commit message (Krzysztof)
- Patch 4: added missing #include <linux/slab.h> for kzalloc_obj
  (kernel test robot)

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (4):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register offset
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

 drivers/clk/rockchip/clk-rk3588.c               | 24 ++++++++++++++++++++++++
 drivers/clk/rockchip/clk.c                      |  7 +++----
 include/dt-bindings/clock/rockchip,rk3588-cru.h |  4 ++++
 include/soc/rockchip/rk3588_grf.h               |  2 ++
 4 files changed, 33 insertions(+), 4 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-rk3588-mclk-gate-grf-c4b180438fc0

Best regards,
-- 
Daniele Briguglio <hello@superkali.me>


