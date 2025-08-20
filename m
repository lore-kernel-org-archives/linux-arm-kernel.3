Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAAFCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlW6/IddUFlCMIBGkLf/azvMT0LzeJjDvY/ob0lXncs=; b=4nobRuMw3edE72r0XGgAsEkgHC
	gW67HMCdjwXVEC4T57LnNslfJIP5pLvw6lFybvjmdyAlu6eW1NQ8wUaK7m1ijDCd57JlGtAZskrUd
	CMeb6WfMJ+bMi0Poop1IgrWyjw6k0E2czdAHtXjrnzSY74DStkOOy9cdVL4nrPt5HzbCUijOadoZg
	KOjC+dgh0eXZ0BeRF5Ww75S5197oABxRcMt+uh9E5ITJf0WbqIHWrzyxbQsibi2NwuS3axWqxQ/Qh
	gVo6kS6Bopef7EhbKuApXyVQz1YQ4qlIvmUEh8MQqHTecXlOqi4uGpweEhwCAGRuHt0yXrN4sgJhP
	oa1JO3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uor2N-0000000F3z4-22qu;
	Wed, 20 Aug 2025 22:12:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomnz-0000000EZzA-0qrg;
	Wed, 20 Aug 2025 17:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755711657;
	bh=Au5yTrQB84jFwkCOgmGw2+Tw7pL8gxb6s+o7q0BYyIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nvSufX4vy+v80iEyytN0KD/6uKu97HIsWogtYGGwHTcXUEBDb7y/4YpJkDMEXUQaB
	 d+NIzo1Z6WEExpx9Njm/DVw4hGAte7HrHYCe51U+2t7wH7aJoe4qvqFFmI0OoVzVRy
	 PizVGSW0dSTqyvC1DbSar2vTAdfvCCFIzueiT1Lu4OoIfCUVdk7nNK/OaEdbsnGaiq
	 4BSoMK2GwUhkvhfMyTcqrQppXn6NAVpsG7LkjOiCIepynPkfHJVYBYyLJ6ILQSq7Nw
	 iDFxcNcPVNTj+B2b9baokTDYK45vrs/cFLGsFrO+b0s4OGVyQWgDv0DcZCE+fb7d23
	 s8LjyCmFftbdw==
Received: from jupiter.universe (dyndsl-091-248-213-114.ewe-ip-backbone.de [91.248.213.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E632817E086B;
	Wed, 20 Aug 2025 19:40:56 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A68AE48004E; Wed, 20 Aug 2025 19:40:56 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 20 Aug 2025 19:40:49 +0200
Subject: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, 
 Diederik de Haas <didi.debian@cknow.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=sre@kernel.org;
 h=from:subject:message-id; bh=Au5yTrQB84jFwkCOgmGw2+Tw7pL8gxb6s+o7q0BYyIc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGimCKhlGYYCe/U2tChbQRkiLHhxGSQ6BpBxa
 WOuv5ACEVPMEokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJopgioAAoJENju1/PI
 O/qaM+sP/2Nn0diaMf83Q0cmf1E57OtX4JtDr8KsLopYMbzIygSUE/y+C2k2HaGN/oHpW8+feyD
 lUZoaaLnjUrf00HmIWJZwgvWRzwuOjkm0M+e+N0MWJfZVjDoYQ1ROkqQ76yKOGk8XyNxO/THwze
 T3xoZZHZrmeTzdopWbt5UGoqoy0tyD5S96w3R0eSIGEaXrAxPoTMH+9Q7wx60YNrVHQbsHO3S26
 UMDo1NUOqpFNBeX6SARmZey2cak/yWjt0jNER6eCXZJJPmocwXhpBSO2JX+9ouGmIt9N/qEQSh0
 l7f44DzCaRNOjYsfJx2E4e7EkQ35VQY9jdvybQ7Yu9dc8SFiNDJyT4YZ3zQbeXcENVpgxj8LdlN
 vKgfAnvWNjzFEnbf+MiFOOJH1C6oO2VlxRWVtoiIf+qOfA1exal5+ImohIBEtK+WHlDyE2wg8Kz
 HycDZwMDTm6GPMI65Cgcvn/JgBVPDQWVOX9B0eDErChUxwI6Ls4bDJeyv/YrnWKZqNmz4iroEtD
 qI5Ghzp44gJdFi4W+x3Z6mlDq0vprB06MDgRMEa58+L1eIbq+LTcOLkI3s+JdqPQd+NZ1iHSWrR
 +c0vP416yo52o09HMPJD6AAXeZhpzIl5WFP5E9zKNGwqvVfqfTjQ88Dt/+P1L4+gJOHEpb3R8E9
 D/tf6TQDQez0tL2uz1t4qkg==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_104059_399044_A9EB135C 
X-CRM114-Status: UNSURE (   8.94  )
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

Instead of having an optional rockchip,grf property, forbid using it on
platforms without registers in a GRF being needed for thermal monitoring
and make it mandatory on the platforms actually needing it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/thermal/rockchip-thermal.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index 573f447cc26ed7100638277598b0e745d436fd01..9fa5c4c49d76e3a689f31797875124e7fb30d3df 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -119,6 +119,21 @@ required:
   - resets
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,px30-tsadc
+              - rockchip,rk3366-tsadc
+              - rockchip,rk3399-tsadc
+              - rockchip,rk3568-tsadc
+    then:
+      required:
+        - rockchip,grf
+    else:
+      properties:
+        rockchip,grf: false
   - if:
       not:
         properties:

-- 
2.50.1


