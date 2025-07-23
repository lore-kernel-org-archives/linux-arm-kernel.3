Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73601C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pA5ShgQgZcidUsbKYIv6FiytemMQ/qpkIyWSNUV9Dg=; b=bEdEXW0usS6pMUPkSl1sZ1OVkv
	i8PdCC8vlc2nTPImZkHwrTpdSaYvxsI7YZ/f+xzS15vPWS4CgYtpWmWQ3uIFIuRHR8XtJnYuefViO
	G7+1tcn0awRbd52nkFHgHFjuHNbGOnMf6oWwDYcykMC2KYJ2wrJoCXu/gq0RFUuacVr0nJKnQeHZp
	VWW0RpbQkBOLRZk8rw5dpHbN0OJ8nOnoJ2R3WgrkuwlRkznv8cjEWuBpJ0RUCwdpa1rZWxLzgmhda
	gMtNtgyde/n+2Gn6Vg2irfIL8Pq1QZd35vigOinP+t6qEzRHj4GJtDcafeyi/njGhk5wM0u7qtwNc
	j+WCxHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVki-00000004VWX-0PnW;
	Wed, 23 Jul 2025 09:27:08 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVHu-00000004Qpt-3lR1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753261042; bh=5pA5ShgQgZcidUsbKYIv6FiytemMQ/qpkIyWSNUV9Dg=;
 b=lUGYrxqbZ/VtJFyA8OwAZ0a1J8MrPmFHinjxCD+yVpLQyk4MNj0QrdaqP31jLYzKeqcv4HoHh
 Bw4+gOko/fdaF3WJKCvHqcpdWktbCPk+gJePV/jaCBnNUE2VQpRdWrvMWnTVJYpiBF+HugeWfLX
 x9W4kk+gMdOrfhJ787uHE1JqdviXdwSEslYXneGX4I6XEtboaNxueZ5+UpcuT6r3ZMpMavSqumj
 LDoY7VRLGqaMi2oRB6RbI/DAVWK9sszderZhxZp4GLHBgThXCia3bNv9p9ksRs78TOWu3ap+GMY
 hHiZ1Nm6/AXbDjL0qmApzg6CG4acDjtuwxCNRtsZbwWQ==
X-Forward-Email-ID: 6880a3e9144dc4a5e5baee32
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
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 3/5] dt-bindings: iio: adc: rockchip-saradc: Allow use of a power-domain
Date: Wed, 23 Jul 2025 08:56:45 +0000
Message-ID: <20250723085654.2273324-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723085654.2273324-1-jonas@kwiboo.se>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_015723_265522_C8D2B7E8 
X-CRM114-Status: GOOD (  11.13  )
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

The SARADC controller in most Rockchip SoCs are part of power domains
that are always powered on, i.e. PD_BUS or PD_PERI. These always powered
on power domains have typically not been described in the device tree.

Because these power domains have been left out of the device tree there
has not been any real need to properly describe the power domain of the
SARADC controller.

On RK3528 the SARADC controller is part of the PD_VPU power domain.

Add support to describe an optional power-domains for the SARADC
controller in Rockchip SoCs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: Update commit message
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
2.50.1


