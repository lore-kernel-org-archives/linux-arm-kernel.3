Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB49CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B+w/JGAQL38w6AJd9IpzadwmAsxuQxaTLnqy3En65s=; b=OGHG84YdFpM3lGCe7ocJZixrIt
	4Ua+akQ4nfsIp/gt8gdCpL4ywMlshqGT6AjOj/sejsBYYnpVz45mA2Gp1mdraA5Zks+gcXO/FpOhs
	HEu71LA13nyShSuMe+y8H1tsjcosGI6fO6bMyTTOtUpbNzfIl59GVSP4nQU0iNeFuDebFKWXcqX8R
	Cuu7XSoruFmJfoSz2qxRLJLG1KiJbtXbysUT1ZEGgY9fYVYMeqoq8zI6cSz7+EF1+DJRBfUcMRk3m
	CpwbJ3Lg3cwVgJi5H7NgT/zPtbZT9sGsEAHMwItU+jgAgPtL4sgBAKHZUVQhi6EKmP+7G9v7bPslV
	xM4oZmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca0h-00000008ZmC-2igP;
	Thu, 25 Jun 2026 02:40:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wca0f-00000008Zkw-2lHV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 02:40:10 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37df416c45cso304692a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 19:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782355209; x=1782960009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B+w/JGAQL38w6AJd9IpzadwmAsxuQxaTLnqy3En65s=;
        b=grbnh65jObXDGKNqs9f6Rh98F6HSfE4mVQuh9T55P+26RhwAxqF5Mk66E1DGNyIx9M
         zMndYB24F2mKDQgTy919tMlibjj1Z2O8p0nloFdaKwv6HyallQbyVS/pUxMCQoAIwzJ4
         aPQ7yurTIKMz/Hb9lSq1F718yQ0WRhYhWtU7Sno891ZFsGx52F6iwG5DgVfB3jrvin4+
         npJLDdCkTd3zLiVoY0M3I14KNeQUXi9AdZg0jy9UBINtLnkw4SfABVWqH7gRY6ypg1pR
         LkXoWo8tTYCHfS7jbDusAofeP4itA5O2Ep59kEAehRtMS0JAs+htpljxdWwd8fAtn7xB
         4RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782355209; x=1782960009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6B+w/JGAQL38w6AJd9IpzadwmAsxuQxaTLnqy3En65s=;
        b=VYHt26qKWRboLW/TOqOccz2RrfbdM9JvVsVv6PfiK+1bmSYJzhYojUvx0nVtnbFIku
         6nByxUpI5wH8NPLf7CeO+/yweUaMsj92YDCHQKqJ7bGxkGmQsPf+GQ/xnvvBFpp4QGl/
         agelcW2byQTDF+xzlJlqPC80lpjpHYrVCHmdNR3nYWP4ePzaekfJbqpMHOy+xCqzYJ7+
         tC6EbeqHc6MYK9j9PgcK4JJCuQUWL42UV7RkrxTiuih8iFVnfaSJXzZqBqjyiReIPj33
         Yx5s42VsennW5V32UqUpNkades2rNm5zkwK85vNFLoG1zSCxfHTPUE0aztAItEte2XE0
         JgWA==
X-Forwarded-Encrypted: i=1; AHgh+RoSTkf8yajZDngdBrOb7tC7MUYi6Xxyp8dEU8Z2OqjoVlGEm5JI3FHt7+MaL+ynbbDgUxOpqKc3zLOtnD8di9hn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Si8FXjhinvVRowgwpF/T6KK2P2idvgohi6LipqcDay06T1bb
	SB1S+zXvgTcPpOjIoHWCzSEjgboTp98H2D2STUQZy1l5brhPrdTRAT/s
X-Gm-Gg: AfdE7ckqiheDDgcUakWHuB0jhB9DOygUpKb3NNZYhtxyjUgBN2bRT+zbpFjDx88XSTp
	V9JQsX2/2YrBOgOPOQfexv5WtNrWfCb9oi0eZgswI4inUir76EAP+G+vIejiSqqkBnkIoRuJeUM
	HCSOYQVsUNwhanJQCAiXT0HgcDMYTEaa66cNWG4iH9fcH6X9XcWagk5f1zchf2p9LzeL9hEcF5G
	VduWAfIDvFlwZ7HWjj2aVqt31fbBOkJj6bnA66ZC+47zsGYIqdPca6of4R2mexymNdgSF+Cdmr0
	i/Ia2QXll8dMVUhPvLtn05pWDdiDaFeWPIBcdZAZ1QvQiKT6r27HW2KiA+zCH8cgav5jZqnd1kI
	tmHVswYDZVnkpjKWCI1wgjjlZyGw/S+NEdWrbBVJVRNTqOlP0a/Ub/NOaAhiwd3DRLI6Z5ACzXZ
	J+ngoasg5J36pK59pvn9QMxVVyi5751NEQ95kSs8L6NFJ1PL9kt4TXIPJ1AFV2Cl3HbJtAr2eKO
	r21t4Ud6r0M
X-Received: by 2002:a17:903:1a68:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c7fc658488mr8256905ad.1.1782355208638;
        Wed, 24 Jun 2026 19:40:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc839sm8538545ad.68.2026.06.24.19.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:40:08 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: add simple-mfd and child node support
Date: Thu, 25 Jun 2026 10:39:55 +0800
Message-ID: <20260625023958.569299-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625023958.569299-1-a0987203069@gmail.com>
References: <20260625023958.569299-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_194009_697830_4050F45E 
X-CRM114-Status: GOOD (  11.74  )
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

The MA35D1 system-management syscon node hosts the USB PHY register
block at offset 0x60.  To model usb-phy@60 as a DT child of the syscon
node the binding must allow:

  - simple-mfd as an optional third compatible so the MFD core can
    instantiate child platform devices.

  - #address-cells and #size-cells (each const: 1) so child nodes can
    carry a reg property.

  - An open child-node pattern (patternProperties "^.*@[0-9a-f]+$")
    to pass dt-schema validation.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
index 3ce7dcecd87a..1fda7e8f4b5d 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,ma35d1-reset.yaml
@@ -19,6 +19,8 @@ properties:
     items:
       - const: nuvoton,ma35d1-reset
       - const: syscon
+      - const: simple-mfd
+    minItems: 2
 
   reg:
     maxItems: 1
@@ -26,6 +28,16 @@ properties:
   '#reset-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+
 required:
   - compatible
   - reg
@@ -43,4 +55,3 @@ examples:
         #reset-cells = <1>;
     };
 ...
-
-- 
2.43.0


