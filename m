Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F30CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=; b=Aa/x4Mv06P7/hCaHw2krTicT3R
	/lA67g9owalg3ILjQ/z8Sm6atlq1Gtp8eucbEgY3xG0k/DKpCn/QbEki4o13xWoE0MACmOrKNGD0i
	F6kyQD4iK8h+7nhwYhvAaqPu5+BYHm1zZ8RKyAVRRZB8th6YcWzD+x7BUOF73Sbjlnu8D89vNtFZU
	u914XvED0v+aLOXqcbKKPWChsiRICnQRN0WzckHnkUf6NMsdjlPmtxgIp6kLhyaAEVRYbe39TUk89
	+fbz7q0dVDT0CKEIWmrrAkx1w9ClZpBL3ugTwEouBbfbJhEyBqE8Ds8W1elITti4VgiK8cIVo5cuv
	zUMG+t1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXk2-0000000F0LV-1gS4;
	Tue, 28 Oct 2025 00:39:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXjz-0000000F0Kg-3YFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:39:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29488933a91so50123235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611951; x=1762216751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=;
        b=apjKgdjm7P5RBA4OcIHecK9nWHaDHPgWDha4HgwQltz2pmyeBeLk1Ha0xviGEGKUTK
         KvSPWAk9DKggjLQYtStD8vmf9jluplZi4pA7jEa1FGAKEzOHrp+bqsOFUODq18R3qMvm
         EJagb0KJq/kdm9QvB+MmZV7cUWW64y6OWxinu5bPn80ux0n/aXZpbgQ1UK0JK+etN/0f
         oSEyDSH9Dvzk4JqxRoQbJLGCMGylqZw7Nt/oXNuon3Bq4+CSGFcJrWPw67na/iALBea7
         o8DljHaMMheQmpEr0XKlK3GvLXCJyjFcPAvkjhsJkPj3d4dLnsGFszm0dhroPKhw6QAS
         Dsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611951; x=1762216751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=;
        b=IIcdLzRyxoBs67DSU9ge5+Zp7g+XPPXNXvIMfbxrEGCgg5o8lKzcjYXM5LIJtGRmh9
         jMFEYiPyzFRAz5EeLIknsDrfYLUtg4Zn2ABNzVTmwy2QInenFJtCT6uM1qC46cszN+QS
         GNhjl+FgkK3BgVHT5TksLCf/E7xkWgncJbhMhNIfsWjJWE4nXJiKcKl5VuerRmbp3jy1
         8ijS7TS8DamJXG6vKUib3rpfrIvAM/0P5dEVUBiSu0VebLtXMOdP1c1hr7+8D6pugvsp
         xf/6GPn+zm12RJ8FKUxrU94Qy95jA1i6JrnUyWEGk2AETCXCdP13V3puHtJ+O/HYlu3x
         2dBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXouMUjhcWvPqQfeMjY9zzpC6CW+uwe+Va7j+TKsqaMi+1Mvbvv4BOuiYmMlxcEHOWkhCaWkZ9IgyrhVMSzH1bW@lists.infradead.org
X-Gm-Message-State: AOJu0YyTQeya3463ZPJ9IQk1cLGHWP4F5KAr3BB5vAfaKbOrOn36YU/m
	mB2IoPJma7kgq6MZoOOfYzI1U8mOwYiuYMXtBomXEryhBaUxgdh+Obrg
X-Gm-Gg: ASbGncumuvCgO496kOo2Euf+CDdsxFM7xBKvz8ciGzkhIYDg0o6NJF5evFkUGDGyu5m
	16wW1bGq1zceeqvVJtfnZCD07rGLPkXDDdedZP6eFf6sRQJMHztw5gUrrxiSi2XOsF3mjB0h7oH
	NJU28vyNvY17lmURULEycZnh3gN9FEyeM2bbbfQDYVOWDfMmK3IzNpPDVwvFLj1CNRjmtR0bS0W
	K/92qB5ERVmtP7/Q3RQpfh3OxO/2pmZYE85NNbfjo/X+PpVM/eCN2hUM2hoNI9yxl+U3hbcymoI
	uQdE5S9job77BvCV9KK73lDuOkjDrkCRvz0qj3lrNGFtdL6kCS0X5gJxHQFNJ5DQbwmV9DOmqtt
	hkDbqFJCpiEAm5fcOlP1yCx7rwmNOrbW++Oc34fRriakKWgW/t3fuSGOvdYm+ww341GJpVQH1SA
	c=
X-Google-Smtp-Source: AGHT+IGDgRzXqJUJJkrtAaCEFJyXOr4mEl+07Z2j/3J+/i5aKBpQqqv/TIGwi4eyT7fk5HkXcUBq3g==
X-Received: by 2002:a17:903:244d:b0:24c:b39f:baaa with SMTP id d9443c01a7336-294cb65f7f9mr16976795ad.49.1761611950502;
        Mon, 27 Oct 2025 17:39:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7e7039sm10005885a91.12.2025.10.27.17.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:10 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Tue, 28 Oct 2025 08:38:56 +0800
Message-ID: <20251028003858.267040-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028003858.267040-1-inochiama@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_173911_887387_5E0D12C2 
X-CRM114-Status: GOOD (  10.26  )
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

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..916ef8f4838a 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,26 @@ required:
 
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
+
 
 unevaluatedProperties: false
 
-- 
2.51.1


