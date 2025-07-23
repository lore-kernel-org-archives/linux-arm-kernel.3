Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53B6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojRNLV8OGHzHzDmR9JJH6f4y0n4OGFprTOnH0ezBpQs=; b=d7jYD08+iG7LS5rmghpj/W/ccH
	qqNtVUO27G/kuSXJ1ghtW9Uzp8DlWKW8KXr0ZC1X3liQ/0ofH1ZassBEm6QVuwV24BYtXx7r26c6x
	auR6zgBaVfSCmRjgL+/JiHNOcSWrKlSZB+eqrDxicu4Pujwa/1puz8JV8u7V4Mvqp57TWCUZ1qz0X
	/9hTFRxXJNmrDUuDnPoVrH1L7AmHIVrNk/Mm0md6UYNeSAl4nCAnanHw9tydeD1yzgsyADKaJlWzc
	WdlXN0H/CHfyUVZPqRR3/ZYirIYnx2zpaq2Yz+p8Fj9+XboNeOba9VcCOAXxJ6ElRiu39cakJcJRF
	UdHiGfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVdO-00000004UCn-34KW;
	Wed, 23 Jul 2025 09:19:34 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVHj-00000004Qle-3lgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753261031; bh=ojRNLV8OGHzHzDmR9JJH6f4y0n4OGFprTOnH0ezBpQs=;
 b=sZOxCwyZiPgBYbdaRSQLz1kLBGsE5TFQxGCt2ilp3mNUmIwYGzcOIGG/BBXFTW7BdEHXKf2cJ
 KdxmHjjRVQn6lPqDS8K6ihxr4biKcmg01oH4YcLqhLhxOh0xePu2gsE8HUbbYt8uSY+DrUwQDYa
 LQQBF7UDxPGZBpOYgXhrjMtaPWyXD65AZma/O9rJcobjWbeAo91ypebw+lNR2d8XV8lRbg/KHDs
 uRWRWUeaSazCsEvA0gzxZ74P9cjjWT0qVVYpWtYVj0a25tc9YE2gNO0ffSbouQUGmrmefgP0DuR
 9yUmUg8J1/LZ8uUJwi3oC5TRVOjyFhYUp8Zs9HPHWkew==
X-Forward-Email-ID: 6880a3e4144dc4a5e5baee1b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
	Andi Shyti <andi.shyti@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain
Date: Wed, 23 Jul 2025 08:56:44 +0000
Message-ID: <20250723085654.2273324-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723085654.2273324-1-jonas@kwiboo.se>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_015712_286079_2F6A946A 
X-CRM114-Status: GOOD (  10.50  )
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

The I2C controllers in most Rockchip SoCs are part of power domains that
are always powered on, i.e. PD_BUS or PD_PMU. These always powered
on power domains have typically not been described in the device tree.

Because these power domains have been left out of the device tree there
has not been any real need to properly describe the I2C controllers
power domain.

On RK3528 the I2C controllers are spread out among the described
PD_RKVENC, PD_VO and PD_VPU power domains. However, one I2C controller
belong to an undescribed always powered on power domain.

Add support to describe an optional power-domains for the I2C
controllers in Rockchip SoCs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: Update commit message
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 2f1e97969c3f..4ac5a40a3886 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -105,6 +105,9 @@ properties:
       (t(f) in the I2C specification). If not specified we will use the SCL
       value since they are the same in nearly all cases.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.50.1


