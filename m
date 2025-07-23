Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B91C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QS4I3+me3Jqc+8KXuQkWvNUcvS5LmPT5tRhG2NxNXzU=; b=NxitG9cNVhB3FrFrODFE6M7gZI
	Y5htxa0AFiD34hNdDnba4Fcsg/Mxk1xDG8Dx9GIBMFfR1V4/qvVkj8FCLQUVzctJIammws5vtCERj
	6+0y0KWTCqRbdIRvB18cotfIqVFn062/+hPnHCun1mYgGY3fBbVNV5AqrvILqhmX201Pd2QnWckqt
	ZcZHfyZ6jocKWVDBD+46OnjUtnOUI6Ggk75WdF/MUjUf1r9igIYNHN3P/5KWRdqbottlhmkUyj2kz
	RVD9CKAKKSEvvKTvFDY15m+AFVcT645uA5+46AiMBZpRnjfBabLV5o22ooEfiXpZlRre4SutIqPK+
	KgduWOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVfp-00000004UVH-2HqK;
	Wed, 23 Jul 2025 09:22:05 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVHl-00000004Qmm-3iTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1753261033;
 bh=QS4I3+me3Jqc+8KXuQkWvNUcvS5LmPT5tRhG2NxNXzU=;
 b=oJXug5GGxIcUv4qEvnf4TpqpguytoKycTk/RCZ5EWrcMiPqJDho54gOcqL2ad62IdNjJAcCYh
 6/1LZN8Odr5nuAutFpz3lot2XfQg/u1Gp8QErGH6d2JOG26QBKbtc9bxcmKWDlKBpHwJWQFLb/K
 WwrFepbFtWcRnrW3BgIIhx8IOudPnZF+EhrLHIRZtLlFClyhLKQTnA+e2Iev9zYOHpkeDtdrvSk
 7ZRTsdJ289Q/GajatMqw4wq+hSXAiuoHkSxKqw/tdhvg3U7Otl4xB1sBK7GBJbhn5UsJPXWVbyc
 TTx4++8FuwwILIqTZwStyqKfabEjGfJeA2wQW5pr07Cg==
X-Forward-Email-ID: 6880a3dc144dc4a5e5baedef
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/5] rockchip: Add power controller support for RK3528
Date: Wed, 23 Jul 2025 08:56:42 +0000
Message-ID: <20250723085654.2273324-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_015713_955109_3C7A3B06 
X-CRM114-Status: GOOD (  10.53  )
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

The Rockchip RK3528 support multiple power domains, one PD_GPU that can
fully be powered down, and other that can be idle requested.

Vendor kernel flag all power domains on RK3528 as always-on, this takes
a different route and instead tries to describe all devices power-domain
in the device tree, even for controllers with unsupported runtime status.

The PD_RKVDEC is used by RKVDEC and DDRPHY CRU, and is kept disabled to
prevent a full system reset when trying to read current rate of the
SCMI_CLK_DDR clock.

pm_genpd_summary on a Radxa E20C after this:

  domain                          status          children        performance
      /device                         runtime status                  managed by
  ------------------------------------------------------------------------------
  vpu                             on                              0
      ffaf0000.gpio                   unsupported                 0           SW
      ffb10000.gpio                   unsupported                 0           SW
      ffbe0000.ethernet               active                      0           SW
      ffae0000.adc                    unsupported                 0           SW
      ffbf0000.mmc                    suspended                   0           SW
  vo                              on                              0
      ffb00000.gpio                   unsupported                 0           SW
      ffc30000.mmc                    suspended                   0           SW
  venc                            on                              0
      ffb20000.gpio                   unsupported                 0           SW
      ffa58000.i2c                    unsupported                 0           SW
  gpu                             off-0                           0
      ff700000.gpu                    suspended                   0           SW

Changes in v2:
- Drop already applied patches
- Add snps-dw-apb-uart dt-bindings patch
- Update commit messages

This series depend on the patch "arm64: dts: rockchip: convert rk3528
power-domains to dt-binding constants" [1] for a clean apply.

[1] https://lore.kernel.org/r/20250620201715.1572609-1-heiko@sntech.de

Jonas Karlman (5):
  dt-bindings: gpio: rockchip: Allow use of a power-domain
  dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain
  dt-bindings: iio: adc: rockchip-saradc: Allow use of a power-domain
  dt-bindings: serial: snps-dw-apb-uart: Allow use of a power-domain
  arm64: dts: rockchip: Enable more power domains for RK3528

 .../bindings/gpio/rockchip,gpio-bank.yaml     |  3 ++
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |  3 ++
 .../bindings/iio/adc/rockchip-saradc.yaml     |  3 ++
 .../bindings/serial/snps-dw-apb-uart.yaml     |  3 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 30 +++++++++++++++++--
 5 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.50.1


