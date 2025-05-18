Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB73BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMpzWrkVyV6vMCT5CK0scK0XhgFMcmSqXuqMq+/6SaA=; b=yWhFuqguJCREuQcvAx3pWKf4lS
	yNwpxHSrGbrGxvBTcJ0NOsX/EmUB5y6f9sc5ZxZ9gDgvF43xTWnwzSYCS4HjXxmeEmg35Lg6lulG7
	2gHbHoLPG/lcaODYTAkPC14A1eTPF/8brXRqIFZabgo9xK0gaA0uxe/JBCf2s75YXcqblXF3sPy/u
	0UNlkxmsVY5HeZMD62DxmHaL9iL29tW87MFZ5KiK9z5ptwejCM279ABy5goS4sUoV34Jmpr+TOwDy
	pOLkYbgc1Ce9Y6A6/eofE9thBBv0RNen6IxKwi/uMgpajVNo/geHDpaeBgUs42FAiOCMDPX0T3IpW
	KM0wy2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmff-00000007drX-11tv;
	Sun, 18 May 2025 22:39:51 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmAk-00000007ans-0p50
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 22:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606073; bh=EMpzWrkVyV6vMCT5CK0scK0XhgFMcmSqXuqMq+/6SaA=;
 b=W2jolnD5rIpgwgtD47QNZgKNSJgFRyOSsXfbXjQXHbDo7V9Y4R5W0gCZV2ZkOjtxiu/O68BeI
 fdhmq/aHGiksNmIjPuc3jAePsmFQjQ+BBJoZ5gK4LCf1AVYoRAriqOox6P5wU63zy9hH5wRNpxe
 HzXTTlhvq4z7FD3SAWkI77P+4O5666uXz7BuDfdXTkcVuSnR4S/AmCy+rUhmOosemWW8F/oys9r
 qxv0JCa3kybfiF39YZ9siZFI2eKc49hiwJ5FO7ln7v4XjfbgS9OCmElpKlcOi6SmvdYk5DHNMWF
 9BfipI3QuFa7yKFMmaQlP8I0s5x/H9YKRUwIxfjuw5kA==
X-Forward-Email-ID: 682a5a3378cae75fbd8d4719
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] dt-bindings: iio: adc: rockchip-saradc: Allow use of a power-domain
Date: Sun, 18 May 2025 22:06:55 +0000
Message-ID: <20250518220707.669515-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150754_265218_669AAE3C 
X-CRM114-Status: UNSURE (   8.62  )
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

The SARADC controller in most Rockchip SoCs are part or power domains
that are always powered on, i.e. PD_BUS or PD_PERI.

On RK3528 the SARADC controller is part of the PD_VPU power domain.

Add support to describe power-domains for the SARADC controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index 41e0c56ef8e3..f776041fd08f 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -47,6 +47,9 @@ properties:
       - const: saradc
       - const: apb_pclk
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
-- 
2.49.0


