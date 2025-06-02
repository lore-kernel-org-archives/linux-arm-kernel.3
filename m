Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63F4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqhb0zTAPAAI3BV03PHDJVXV8qr8Hq9NvZb0bcbTck0=; b=UidYMw3ISL0R8sH2YSXKsQG+gs
	EctCoU/tYQNXO0VfcN0oh47d9ixNgBQCmk+xVQnNwCmdUnhhfExU/vAZwxxV92NqCLxBSKkVf3P7p
	tyy81q5/ozTFBs6Q56ruweGyj9tyClGYBebsqoX9cUtQThDJs+PICHELpqMTM39XUHr5SjC0eA71e
	L4vqN9pt/PWJCpQ/QICP4OoGkKwW3UlKAyIAXFymzXZh7oD+7YVrfVugzVRcgnczGprEQct2KoYpX
	iIsZuieiFvetjjESAxwvshRAQBxoKX6uHzLMKo8cq9iGRbdw55KJiobvbgvbdKqsLTmrcFQLhk5cc
	jlPB4u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7yS-00000007tNb-2smn;
	Mon, 02 Jun 2025 16:25:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7tG-00000007sUc-12U5;
	Mon, 02 Jun 2025 16:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1748881184; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VMZ55qsQsQBzmLOFgLk6MfuXnL9mRZQxGWseKvh+XxASlmU1BeKNLMljTlmlC+TtJ3XDfZsYuyJODIKI8uk6auU4W2O/BzLk56STXgbMRLnODhiZYH9sXTUrp8wVhNZ9OJJfA5IUN2AFrypH9RBw9YaG/RZPItuxpQUNLyMN9Zg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748881184; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Oqhb0zTAPAAI3BV03PHDJVXV8qr8Hq9NvZb0bcbTck0=; 
	b=HgzBJ94HMpYkMyImJ9+AHMnFhxEqrEQdswPomW6tTo8TSD/bbESMGWKdyssrsYHH7goKnaEqvESAyKmaXi4vWk3O1ZVfaSjYY4eQhAneW5BwGsgV4JN5lYCqWXYmGYG+DJqqmbTTZWvF1taj29PGf4Sh0mucoA7WbtHNPZOtW+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748881184;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Oqhb0zTAPAAI3BV03PHDJVXV8qr8Hq9NvZb0bcbTck0=;
	b=fbcyVaJSMsDX2AAZ2HspovdYhpUv4Pn4rGAqTOGvRZgK+lX54OK51HtB3MNzQK27
	MBRfqehWJ/B3hjgYdfC+m6d41ivIC0GHNp31irI7afkbTTK3aMUxF1i+AapJduYnu7E
	KjkyYsTtQAFUbEtfqvz0ENqW2O2qITMq1RbBMncI=
Received: by mx.zohomail.com with SMTPS id 1748881183139995.513413165423;
	Mon, 2 Jun 2025 09:19:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 02 Jun 2025 18:19:12 +0200
Subject: [PATCH v2 1/7] dt-bindings: pinctrl: rockchip: increase max amount
 of device functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
In-Reply-To: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 William Breathitt Gray <wbg@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-iio@vger.kernel.org, kernel@collabora.com, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_091958_351520_C3B138A1 
X-CRM114-Status: GOOD (  12.46  )
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

With the introduction of the RK3576, the maximum device function ID used
increased to 14, as anyone can easily verify for themselves with:

  rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
  -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq

Unfortunately, this wasn't caught by dt-validate as those pins are
omit-if-no-ref and we had no reference to them in any tree so far.

Once again kick the can down the road by increasing the limit to 14.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 960758dc417f7405010fab067bfbf6f5c4704179..125af766b99297dc229db158846daea974dda28e 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -135,7 +135,7 @@ additionalProperties:
               description:
                 Pin bank index.
             - minimum: 0
-              maximum: 13
+              maximum: 14
               description:
                 Mux 0 means GPIO and mux 1 to N means
                 the specific device function.

-- 
2.49.0


