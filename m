Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D571CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=; b=aNTjxyZx2XNIRfjVJ9pK4u1zfL
	P3Hnts4wfQf1dzYWLv6h0zeW8byb1HFeKQzXmDXP/su6+vRZA9KAClYLcZReoz5hBJNgIEFxusfNb
	mCVrbZXUqTaX0j9IQrrwd4+GNPmc6F10ofVPlVUAukr/ocfgw9+hHk9Xkvx0iRYVCBfLad/mMCjPu
	x3KKcJtC+GH2mkp9FKkS4Q1Zt2Dadj9+k6vsz04PaBaznQY4J3SNkj4oE3gVvZpueh0hFRtIQCVa/
	eXt6h3hmTNZuGJoEBugASFNbUykCfxRBdYHwt410zOMXxjqY+RvDTZQwYFNNnMOZ1yvprCFjpsMiu
	ZrQNupSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTQ-0000000HBb6-1Fgo;
	Fri, 07 Nov 2025 11:17:44 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTN-0000000HBa9-0tJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:17:43 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso385743a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514260; x=1763119060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=dyttUFERpPcbo96ET4gSfCMBbutrCq2Iv6o5nFJIjIRfMIPIKkMVbQGY7UMndjuBt5
         qbSH8eowKsgGDUPGFvUAfxdU3C2YJMiaS3onH5GBMU256dRxsmE3n8Cu9tOyeT49ATnh
         hbHyZ32c7kSQtLyn1V+GRWB/Hn2qzDmTUsJ2uWYYY3D6XIUs3xIai6bIgFt/mP9hpm+m
         maBSgXgGlZ3XSmYj4mUmxK07sjWRS9wWbWqLKWV9Y5yg+8gK5tPWTu4uiTrUo78Hm+B7
         FEU2Klx2+CTtT4wpPdDIFlfqW53amahtUsTLHmJ2i+/Gr1w5o+HhGfIWAjGJY2DazM6l
         DOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514260; x=1763119060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
        b=bBv1zindKcSEiJSWCrgExYqfa+K18ZAVh59vl9mgvNbc1GLXnqq+B6xGmW63hA3Yjv
         X+mwvL7rmITaXJuVajk9/85MX50TRtOmH+KOFwMquSz8LJCaLABmRTo2k7R0yP0WZz5N
         t4IYlAhUwsctcQnpgPJT2a+eh/aAHPp3H2EsKgxgxC7ViqWg9CoyyRxM/tPL7zze+kC7
         nH7ggldS4hb/X222lQ7vQxjcfBfgATIDnSJvM+eX8rCrOZdi/T/BcNf9QD0zh7KdeKVN
         hgeZ81QJDocRHtYo1g7e2R4L1RNE6w3rYRUVcCEY2oKfyAbAHypyThA4LQA/Hu73RpxT
         9dCg==
X-Forwarded-Encrypted: i=1; AJvYcCVbRNk9KIrlIki1bRF0fSkiE1zVfGxuL87Gb13xmJDdhuCJ7skOhOqeBc1HZtxfraVGLh4D1K146i7pZ+ZWD3Ok@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk5TN9P9XCwkVSNz2Fy8NlilIxxzh0LRGzRjL9eSwzYZAsTalE
	VuAqGv+eBaF+gqO9djvJRFk8TCrA3syaHCo70aY0M2wM8W7RI8yvRlEl
X-Gm-Gg: ASbGncvxcnL8oGJOFknTsDb5Gg2vC6avNZym043Ia64jdqObpe73nHavQ/vDivhD/GG
	3xjuH1OTVrlRvtLq1pzQYlNz54OYnj1jortQ0wwh62yYSEh2ZVccuUnsHjdUeFUk6JQ2HbNkQcS
	+82eAs+2kRB7Tv5hQJZ5V/FSHkgG9zsMQKoxkuAhrU4wZIV+0C5nNlEO9IobGac4o9xR1x6vF8t
	BZsKbiEQ/ooQWWbo3HhJ6KT67vugHuW0LEY2n7gCWYZth8VP1yzxBgclQyZpd7pn0kjY6sFdAWS
	CafswU/CHyJzxcOdcwFXEjqofKW5UaZYMmV/ScrkjU+wzsMAC9lq4ZUQcq8mIeaF1gwj8cId7+j
	YQqZnTHQysSr2IQdlSAxUDjr/Qg4d34PAhFw0y+KzAHauTTyzbgTsdeSlj7UgtHpSPajZNSiJ6c
	A=
X-Google-Smtp-Source: AGHT+IHjf5f+YuLvxkmcrd3cJvkmjsyY1yheeW5iHSKdbzLJ/p2M1xTgPY5ean6VA+ewJk0yolgl8w==
X-Received: by 2002:a17:902:ec90:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-297c03b66b9mr44655785ad.11.1762514260220;
        Fri, 07 Nov 2025 03:17:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffe3616fsm5131381a12.19.2025.11.07.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:39 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri,  7 Nov 2025 19:17:13 +0800
Message-ID: <20251107111715.3196746-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_031741_274038_0BF1AAAB 
X-CRM114-Status: GOOD (  10.14  )
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..ce6fc458be61 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,25 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-txid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.2


