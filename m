Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAB0D33992
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wjZ1pTHZq/+k3MCnSbbzmSo0hoqjpDUYVU+ZZfLBNM=; b=mxTwd/+VUki5NfwX62D2Ed5JQ1
	E1VCfDI7dgbGbIOuop6BSuTDrbL85tK73VjyWA7Js/jCfPKqTH4Y/cMhM2DCtHS1b0r8U2oD4jPws
	WnruEC6qiMKtzCRFGbj1VXaRleQmhDwCp4TkspQcPPerI7tSwabezvC/Ja2nN0ab82c3iM+SVW5CN
	Hgv41MoSAjeqcKCpe7wHjtPsugrMFbPqj+BLu00tZOH/E7xIcWMVp6f8OVF0fIMwT2Yen3xgygBHj
	Uc37L6KDa4ZUiNOPHHl/SdM+eAn0JlQla4zJnoKsUNtbGQ0qbEYPPocITR9tFxaMqbXN+tPamjAKh
	G/8HzMmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qyd-0000000BBJq-2nOK;
	Mon, 28 Oct 2024 14:44:15 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qcx-0000000B69O-0dv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:21:52 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 588034C736;
	Mon, 28 Oct 2024 14:21:48 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ondrej Jirman <megi@xff.cz>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: iio: light: stk33xx: add vdd and leda regulators
Date: Mon, 28 Oct 2024 10:19:55 -0400
Message-ID: <20241028142000.1058149-2-aren@peacevolution.org>
In-Reply-To: <20241028142000.1058149-1-aren@peacevolution.org>
References: <20241028142000.1058149-1-aren@peacevolution.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spamd-Bar: ++++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730125309;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
	bh=6wjZ1pTHZq/+k3MCnSbbzmSo0hoqjpDUYVU+ZZfLBNM=;
	b=lIbTPM/AeaMflAcdwUJTLIqKg+0qzjN+F7YnXFOaviiL719lrG2kCKUyGQWu4NKN79l5qL
	5mqVD0tWkcaaCIf3a1sRdridQwMCanS1iTHnmY5GoM4GLEIMQpq+ZcPYw6LsTkZLoS7yEw
	yQBC8DXXeh9XO+ZV2jk9kFdDP9rki/Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072151_277252_430AF67D 
X-CRM114-Status: UNSURE (   8.02  )
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

stk3310 and stk3311 are typically connected to power supplies for the
chip (vdd) and the infrared LED (leda). Add properties so we can power
these up / down appropriately.

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v2:
     - add leda-supply
     - add supplies to examples

 Documentation/devicetree/bindings/iio/light/stk33xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/stk33xx.yaml b/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
index e4341fdced98..96ee8ec16463 100644
--- a/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
+++ b/Documentation/devicetree/bindings/iio/light/stk33xx.yaml
@@ -34,6 +34,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply: true
+  leda-supply: true
   proximity-near-level: true
 
 required:
@@ -57,6 +59,8 @@ examples:
                 proximity-near-level = <25>;
                 interrupt-parent = <&gpio1>;
                 interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+                vdd-supply = <&vdd_regulator>;
+                leda-supply = <&led_regulator>;
         };
     };
 ...
-- 
2.47.0


