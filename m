Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6979ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=; b=Tk00gxlhr79xMUhqLOEAZMNoQf
	zNH43xgR4JEY7Whi3Gs5AOHaPW5FW8SMWCfYctg6HJgsOflGhVgkbbcwRYlEeGXnhcCWY+XzZJxuE
	ClwS+nhDZTUzp4492gFNRVQMJl3hk9D1NTM34UN8q4ODSLui1jqnSQAlmjsOpS3oxOmBpJzbJ+vKS
	Tt6D1VzQPikpTS99V5oOsYdzzXJeqQKf+4RvFldGun+E2TKFyiLbG+JWFujtelhFYz65qORvGV7ZJ
	wHchB2S2zrWER0SWCHYRgjfclfwLaupE8rWaK0Vd8U+UNbBn9v/RVe78d2pSkJnmG7T7Jw4+i+HHu
	oP7hlWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6w-0000000DgLc-3yMJ;
	Sun, 17 May 2026 23:41:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl6s-0000000DgJa-1M14
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:41:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43fe62837baso801047f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061284; x=1779666084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=;
        b=AphVKjoGJx69WcwOjiZ3VEZLSnP4ltGzdXTnxpUwF8P9vS8NxoN72rtNIHDlQsLbNn
         9XZ1b/ASRVcdGzPYVTs9V9EjJPLyryqf0q6xYpWFqY3STxs/Lx9qjPV+FMaqdWzKPuqT
         jyufM4Cf2KKK6ulRKvMrvFZ4zJWRe7EXPgt+rhPKiOvJ5zf3Kq4cTN8J0z2/hIFR4wuL
         7ZFeMz33l+2e76IMwXXOW5Lozori7ZlPIegM5oSarUg6zvtoaQAujk5FdaGP9Y/97O00
         U0/jVyVcDB0eTDXYSx9h02iiPUJ+3icHN9/Y40unA54PfxxibK7dQu9K2bwiAuNvA0oj
         PHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061284; x=1779666084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=;
        b=qfMga/C8MfPbjSxtfPQ2/aopa7dCjA6umffIdbHsekeAgVLPrWQzhYoOFWawPuOQL6
         C/6/4oJMq7OeL/nFjNivjLQ9O7jz4rHSrlAaFHXMlxnw95aAHTmqw4Vm8QtHTgT1RLJf
         +qOklxwhJGBg0EAJRlj31Kpx3K2e634spnlzV+2yqMZ/VFq4pJLJ8peB1J8vD5O7x3AM
         +EGnu9G34UuzdIhj0LJ6NkpHjiRLvsC/HnDoBp2guAudHgUWcPZcNhJEpsELvJcg+DfP
         UrnLdLDpzQHq3Tn750lIT64p4YIa5bIunA/WBKyFNpXH9TeVJhjG//I9fI7Bs9tSS81p
         6LOg==
X-Forwarded-Encrypted: i=1; AFNElJ8DlrM28L/dHk3VJ1bIfVdkfusO/64SwdtrQ197JwdJZGxY9tPH742eXdPSdC77/pVxFVhmgTRC2iOCYXOLi0Y2@lists.infradead.org
X-Gm-Message-State: AOJu0YygQhjpCRLPWLqYfRVoJHVlftd3afYCnnXnUCJJ4JDQkfj6XNO6
	1sXiY1aXrHdY7umLia5pewwKzrUATPn1pZEIUxGpunkVRP2xhyGCDkuK
X-Gm-Gg: Acq92OGhZ8cCYfTZ+Pzce2atMpRgL4IXmJu6ZN2NhNWluXnPt+EfM0o22GU9ljF5g7H
	MiL60prtSckau1hagzuuOaW1lmvYqL5rzmIBtsjgzoXWZktPwA554UCnA94opy8milFeQmqdNfl
	quy8fmltLtnvVJHwtnxqBIKvjzpBX6xpstyvTE/87MfrU3rH33eJx69647q4XZQHKsh5nlaik/N
	BR4MsC5+c6rF6lxzY4gdrT/lhYHF+sJFeMfw5KU6t7sAMQp09rNRk3s4cNkXT03w5UBCGFx5D+d
	F9FX/oJYYweSEIdPP/J3EcJrHVXwEyCzOkEOQXGS2TU/5lvm0rsyEAfpH2GYwk+bFPBNAzu5FsS
	lK2Azl3FFKKD0t8gnB0jFz4M/Pk4KqpGs2ySdjSfPUzzLMzT7Galoi6AyNTgBtrnyQc2i4yLatT
	jDqzpbj/ZzKz3HJ3hta056LFnbEMmebD5gqS3wGKY72wEY4MBxEHLpq0TpOOpLizVkaeTYWzSyF
	nU8kXahdp4=
X-Received: by 2002:a05:6000:230d:b0:446:96b1:f5f with SMTP id ffacd0b85a97d-45e5c35da70mr17323837f8f.8.1779061284317;
        Sun, 17 May 2026 16:41:24 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:23 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/5] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Mon, 18 May 2026 01:41:28 +0200
Message-ID: <20260517234134.2737320-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164126_375959_8DA83727 
X-CRM114-Status: UNSURE (   9.98  )
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

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..f65bf1a549d4 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0


