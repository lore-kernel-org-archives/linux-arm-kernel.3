Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2144AC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0mAGXLrJyheCU14v4jnS6X+vXD7nWsPLwYJFNKEwyU=; b=SzjDbx1VtOhu3wjLdX/YChDtMI
	8kyRoOSGlWnaT5aO914SZtXxEu0I22C3h/DCt342fENOddc64RkmqmzKa1M0DdnKivU8emAcPtK1N
	GRhIYL06XOYq2iGxuWZeyEnAg0GcHa4vuu8hqToJymRdyJdMYxY6AiL25fJFKwn9wh8Fh4W4Y4LIw
	3VNU9pr+AG629jxhX1PoEaO4kYMtIleAEbbY3PLnMEViwx57ve1hpe7Z22Fudakclo4dp4hmZ9ZOK
	1EBiJTQUfCRbGAogfHezcriWs1C2HGhQ6FIwWN0GhQgxyiYVckj6PVZ9tizUAPYS8gKH7AQ97c3pi
	yjPYTADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp08H-00000007IBd-2iEG;
	Wed, 29 Jul 2026 08:59:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp08D-00000007I9i-3W2p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:59:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ceae1ed204so9411595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315557; x=1785920357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0mAGXLrJyheCU14v4jnS6X+vXD7nWsPLwYJFNKEwyU=;
        b=tGmS4Erp2RMj0G2F9M1jRq+XdFVhh6sLpclbVqHSaoTE++0cd4+Vszv7dbf33Ti8oA
         VkepAKcOJEI0uhY2kz9qfTd9qofh7fjz1BzdpwTCladAnaHAMHLkuSG4eP2zMFRYG2AC
         YBa5XaI7YhGD1AUlXbASVlr+AVq2HUMkoTeSj8eo/HMnnuvJXvVUBXF220f/PizHWqX2
         /meJL5yFhfazAegDsoEv8S1CFHjMbfGQNei6dK6N/vEBQmLobDRC+9oMURHOQj0tHHJG
         /+GiHOmJwVYFVO7ntETfE62f3bztskduFgZhQxLt5/d3+XRLiARIPsagqLh6/H2yLFpe
         +63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315557; x=1785920357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0mAGXLrJyheCU14v4jnS6X+vXD7nWsPLwYJFNKEwyU=;
        b=PJuVqdjFvah3IpErjw3UuC+RT2y3Mi31sZuoU2l7aD2kS6EJviNbwvs41Tj+Vvw44s
         +7PUz6e8dJyuqdf99vUovY2nIs5sFebP2Epjftb6k5kBKkpjgJlKqkhHNBQz2xAvrjNE
         OyfQQP/sUOWt2tdBomR3B+CtNj++XESJRA1foVx2xTH8TSC0s2nePXtgr1OO2YXZyOWS
         V6OFgPrT6U0p1GJFoaA+U2W8eVaP7Xk2iKuOqlyOHixnpGWOPbwVa91sMdUcPd/Q2K05
         5MDEf8dEncNoMQ6fipYTH9+PmNVyNdBPLxc9wupuRMfWOzPAJiSxJMHtB+Ccbq40ZEQ7
         cUjw==
X-Forwarded-Encrypted: i=1; AHgh+RpzhBv+JyXEbElUCqdxDbsWHFGLWaPOS0g9/NlepNp8taH+j+BNlWhW3YxN5Ru2tBEGiNp3yUtm1pbEEcr9qmLK@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHbhLlOQHZ/wrMmgpfdnj+K1wPmejdq0vYxs1V5mltjMmc0P3
	EiW0RFSIikzuO1UuepAN4o7Syj9Aw25zTaJfTTa2g1O1A2vwAX6jI9/c195yb0xzcaU=
X-Gm-Gg: AR+sD12Ldcqhl6hN2kn4NtEz2HW7CXMaRbpedEy4vivmRyFLnahf1gYWyTYidTjDivN
	k2E45ulUx+JqIL4iGdebc4aPG2DlUjgLpTlQOKlfS4ye4TeQz/5j6tu64vIoRDwjzSd/Q4n6qX1
	9p6L0K3nmEknthvXcClN8OC0Hrx2EmmL9FcaKJ9tYxb0Y4SmnjPoCJAuhvzhiqvLiZiYo2zBESH
	V0P6aD9Cs84E32wJm2amy5pxWgslcXRTTi3IqXqP+tmv1S2zbMHG3JQJ6tOmvU9nlUyhyEiUPWP
	jJAseDJdC6hbO0j2LH1/VLMoxkD5oRXge2GOzdwOdSovq9VCtIL8Ha4K8rAWqQItKE0gGxoCdZ/
	T9fby+Fqi6pFe/la9Zl6X+uZzD9IjW5TOtsgfc2fQZQzm0AcGIlo1CUoLRCkf8QJC2OmMwcBcql
	wuuyL68hMfOkVPd5cl5Y96xhTCK46LLeUzIr4z2ZEC6ujqrE0zoRIh7Af4AnkCuvPdB7bXnq9I9
	qOFWA==
X-Received: by 2002:a17:903:3d07:b0:2cc:ed57:c7c with SMTP id d9443c01a7336-2d015cbb228mr64909415ad.32.1785315556870;
        Wed, 29 Jul 2026 01:59:16 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm8179352eec.14.2026.07.29.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:59:16 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: nvmem: rockchip-efuse: add optional vqps supply
Date: Wed, 29 Jul 2026 14:28:55 +0530
Message-ID: <20260729085856.226001-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729085856.226001-1-hrushirajg23@gmail.com>
References: <20260729085856.226001-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_015917_893252_60767FF4 
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

Add an optional vqps-supply property for the eFuse programming supply
voltage (VQPS).

Per RK3399 TRM section 21.6.1, table 21-3, VQPS must be 0V during reads
and 1.8V to 1.98V during A_PGM mode writes. The presence of this supply
declares that the board hardware supports software-initiated eFuse
programming and provides the requisite programming supply.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index b80fd8d1ae5b..25f209fd881e 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -27,6 +27,11 @@ properties:
       # Deprecated: old compatible value for rk3066a, rk3188 and rk3288
       - rockchip,rockchip-efuse
 
+  vqps-supply:
+    description:
+      Supply for the eFuse programming voltage (VQPS), required only
+      on boards where software-initiated OTP programming is intended.
+
   reg:
     description:
       Registers location and eFuse size.
-- 
2.47.3


