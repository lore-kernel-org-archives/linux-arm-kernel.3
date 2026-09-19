Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492FDC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=; b=oxmWMfNyvsS5Bdq4+IGgkuZcg1
	35I40FYwm9zqgF13TBCCr44trKwX9mdg7zLPuN7SASKfwDF43fdyZg+z3P2MJs2fB5t/1hODLLA/V
	vFoBmNdDhS4CD/N4kNvra6q/Svnw6zcrVZVOBR9ELhNxCFhG4OyeR4p/ECxpVg8AE4wLHpq+WLdvO
	CBqTDSMHq1ZigMQoui51xgyenZuXCOshIOonyl6tW0KPjHIPF/TPYi6fZQ/4YvTbZDBdtNkfhLAn3
	PWY5GlgkuaLCziPQGLdRdmllM/lve1XiLzRqkscvQdzQ8Wt0POF5yfNdjj3Sq5/RZCVSHFRZ3Gn8F
	EYHrTW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCf-0000000GF39-490a;
	Sat, 19 Sep 2026 12:30:02 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uCV-0000000GExk-1QD4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:29:52 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ec6185so10179425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820991; x=1790425791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=Kb4wGBrPdoUtiZHzFyynEzq0bQnL/OvtWOP/jBIiklAjqnot6ZU9D4erjuUWWCdpm1
         bX0DuPWkUP7QoInt7Wz6uGKau19kJygVTygbITk4ORCUan7fhQ25CT2J40JpuZjByjg6
         p46LWrtUEFZlpm+5K4aAf9tBC+oceLPIMeh/yt/UhHvX+vmcruemSWYpuXsMl/beKvvd
         XSfdkhzVnKh0lDnb9BjCvXsPz+2Xc8uc6vgnw5//nLh1l0VKkxl8CF+7e2aH8P+CJ2v6
         C4uaKJzIBTR++fvyTDEhnWW6mewCSAKviGMjhlO9FBcXWczDyEp6rtUWJ4wc2S5dx+zd
         ScUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820991; x=1790425791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=fmbAI8px7QiTxspyRR4T1JqyDZWwVKtFAAneqDVRRVLLqA7uiyaaAq9t3PfPn7bgQh
         XY23bGRLj8Uvykdnh4DyCiXfXzndHPhkAFo3unTVpNTjw9bfKVxnklEkpiH7Mtlxm7K9
         cwcWYb8LaImULUsLRzzmYo6eFPyA3v9fX0CuxViog1L5z62bCQxYZ6c+fcr6qie/X4/p
         22kj89oKs5v4kwGfKnu70aIbdRABiqmuYoCSXBiViITnIP0KMlR5xe+IVvzWBV7Lyf7E
         f21UKLBqpGeIYbC5NC2esW0GIq1gKoMSJ4KIh6UGIBJGFqzpswdq1qKHrYV0O7lqD1Kx
         Ek6g==
X-Forwarded-Encrypted: i=1; AKwUvBx5MlKioMXmcbEbl4ITRX8a3VDpAYbUN0qNgUw92S3gwgHUc9jXbes1bhO/BcXeg2lq5dEf5D4H4KCDKpin55S+@lists.infradead.org
X-Gm-Message-State: AFuF++kxeBJ+R0ehMITy05j0K73AkQyYVdgZavIcIT5mbCt+twY6kXCH
	XhkbtecQtefe2pyO57s+vTDhHYG+HkbDqL/jzWx6qXtOWcOkAqSnEFkQ
X-Gm-Gg: AYBFou1OLoJV8bnZ9R/aY6+pghjSGhKPfflGqIxq/0L3QHKMv1iOzLxGecMmPXb7kWE
	T6lIV3kwNhk3ir56LNKDg8Ma7+jFb/8xObfOLup6V5rKTDo/qs+rDeCy6EQn98U4lWXY8pKpyfU
	l6JspEKJlvA6JPYOT/1qj3gvkl1WS0rdYmRQhx/lkFSea6WObzZzJ56a6obSA7XNFE72CfzCi7W
	0nl392SADEvC3ktEZVkMkZGJov2fJv2XwHdHNoeBFU3PW8OHgXwL+Jc2MQccihTgGGZvoKPx8CZ
	s0x2R7r9r/GkQta4zd/51yfDeWjgPYVU4RUi/6rp6PC9TeLBywz9RzdVURDYgq9iGTeLQQZkmp7
	QZ+d/paS3lJdfDkhYTtQImrQBKsUDQmfzrHqUPJC/nWYzY3K5lCbPzqFkfdKOxfZ2hc3kK7ZyxY
	Z3zrDYzAqjt0qMgBJQ1wCetxjim6RILKrIyLExiYA3hznlnrPakwIryX0/ED/LPeiAnN23MklEQ
	xrF2C8Pnno=
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr96579045ad.23.1789820990640;
        Sat, 19 Sep 2026 05:29:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:49 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Sat, 19 Sep 2026 20:29:28 +0800
Message-ID: <20260919122930.1418-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_052951_373098_EE133203 
X-CRM114-Status: GOOD (  12.42  )
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

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written; with any
of them left asserted the rails drop and then come back up.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d59f6ba 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,24 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written; with any of them left asserted the rails
+      drop and then come back up. A line left asserted by another consumer
+      therefore defeats the sequence, so every line involved must be listed
+      here. Only meaningful together with system-power-controller, as the
+      lines are released as part of the PMIC's power-off path.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +131,9 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3


