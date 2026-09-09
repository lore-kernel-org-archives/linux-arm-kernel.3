Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCECC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=; b=VOAWRc8JSZEdvEBIRaRa9th/J9
	uiWNp+XAdIYOxHjPII2Rylydb0/c70PxwyZSwfgB4Uywr+95HfbiadVifqP5AzTLpU+HSo54ZgSKl
	uEI3d9kvXTK7dkOCIe5GQT9aKvjAL4COKH/o325b0bgnQaV11N/eyZ0Q/k2XpHsgV0bdu1NwboQHm
	Bs2Iy0/EweVe3Ky8IRZYXIwgzUjMhxIvdHVjcU18G7jzlRec1wb1N5+twVBhrXWIiPpDyNGBRcsOJ
	PLITtir+X1wDlpjvhenawYk+Kf99jsp9dqM5nhPuI/xOMnoIcKShX3uDT+WR5TBH/AuHWyfSP4geO
	SJeyQE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eb8-0000000BHlW-2z48;
	Wed, 09 Sep 2026 09:28:06 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eb4-0000000BHiz-1NJU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:04 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so4400a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946081; x=1789550881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=;
        b=dCtEu0a6+5lz0tsu0tW3eO7FbY2LEc3/bDS0PDePrrOvsRYhTmN0Vl/zI6+L7LXk0s
         /HgSA1rMyLkO4y7DGsXyad54SvQGPcmh9wExMvvZizzm7UK4Jzq4h/DKgg6zYi4gWwDg
         eHSKGiR0CilOTLsG7RKpXnmtgDhYFZlhUC8xF9KhCNaMbzF8HlRBohmiqbs8M1a1YAxh
         BgUENDrBpNk8QMqZ6chN/hp+Wgi4U+xcLc25M5SLD/le69Za8Q8U0Cyl6x/uDQNCT/05
         IszAwKxNnN5jqs8WDtlsxchqabfg4DcnumWD/FRot3SHHx7JJU4norg9gJnF1D79p6D2
         AIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946081; x=1789550881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=;
        b=EKneUpq/JhjK5Au2C/KLWVHKgD6wyh1P0MMkJD5+mbxkXAVR9qYKbklpacqmrETZTd
         AlG89dLW+hR8h14wnQU5qUjh2I21mFndeoLPis6RPw5YrYVoa16C07UuF7bCq+TyXCDS
         zsGGsoFUlxfUALE00DA7z1qLLEv59arH1CABlgEVNo1zKKdMJqt1nV5pGLK2TfXVuSVb
         uw05wTQY8ypmN+BFbuHWy0pXnn6N/AE7BdFiW7GJ3oSmO7cYeCFByXc5E6hQYnNv0Jte
         b2KKIdacrkCmweX/zk15W4iXyNZ5GWQu6DsRfc8DPw0qYgvrK0RVUmSZe+HeDbYxhho8
         jS0g==
X-Forwarded-Encrypted: i=1; AKwUvByYxPoaqnY0+bB/E9ONULqiulD3wGY+YKyKjNqvLTjDoIPD5O+chfSQTFtGTHbvmmekFQ8mbqYLllLRJ5Fa7qyG@lists.infradead.org
X-Gm-Message-State: AFuF++m3LAjlYdnt8VfqsTPWwgVoqiPREu57TpwwKjvGSZNXDTodxUyz
	UySj4MsQ4/eF5DXVveY/5oIa3zXceTN9rYLgDuUfK45EidMvqQMULnOJ
X-Gm-Gg: AYBFou0M75Va6IaBfPCFdeqopRKLrxaMl0SmdWX9/1UfCIsOMeCddSawd5EQ+57SGy8
	1kS7ud6JG+0NUwT1XZaXaGHtB4w4yV1n0iACH0Zn+mxCJnLWBLeEacFP55Pg0FbijKrxQtTBflw
	1pycHXcjrKR8jY7eu6H9ifVgvH8P/FiQzgcwj0/mM01umQPvp6bEHvZ2MaB/kDvSWt87GE9Fic7
	0ixfaMNc6VJIWLvq/2Sdnhw027PXUEk4gcA0VVOJ3q3uIfp+fw42UGoZcDA3572f73c2IZp9Wo1
	WnCG6VoyCIk38lByyi9yg2fbSgFgoYnw/hq+qjmd8VgwhF2yWFLQSYq9PYZoE5zj/uk89ZXXbLO
	S6wWXAPP9g23g3kLjTqyOzZtF9+WUqoiEm3CIGy3R8+2B96gT/re9Mc9Xoe/s0wkG9YmTCvespz
	TUjt80wTXmUGRxb+Z2WA5E7PGlMKyBYxFWmFq+YrAZaW1GHWBfB5WiVSkP2KAlRuDNdoYLo9bsQ
	rliA7wKAdAw
X-Received: by 2002:a05:6a00:b82:b0:857:4dea:e20e with SMTP id d2e1a72fcca58-86942f3f103mr305995b3a.0.1788946081268;
        Wed, 09 Sep 2026 02:28:01 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:00 -0700 (PDT)
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
Subject: [RFC PATCH 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Wed,  9 Sep 2026 17:27:26 +0800
Message-ID: <20260909092728.1859-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_022802_689384_8322CA8D 
X-CRM114-Status: GOOD (  12.05  )
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
 .../bindings/mfd/rockchip,rk808.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..00cbb27 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,23 @@ properties:
 
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
+      here.
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
@@ -113,6 +130,9 @@ properties:
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


