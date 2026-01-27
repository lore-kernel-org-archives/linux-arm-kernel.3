Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799C2D25955
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 07:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGC1e7GTJ+gs5YLdBWssdAfqY7NGH0UJX4m8BTmPg/I=; b=tm/f528+KfwTOXuVUhcAH9K4Jk
	CAojstFugqcPoBduKPjVswzlahybRs31OihpgFsJ10tOjNhiwpXQ21Hxs5urMavaiXkhNXeyV3VJa
	iHqyoPMsau5mEBfCeordKaA+F7pw7LYdP/WFF+1NB2wVUMm6kclu+XPqo+Mt3f9qL/9IUVxwcu6Si
	7jyFHN2OjiOMhXD1No3eR/G/Vth8ICHMjQzcEO2kCQMdbPaCIvfod7qfrgI7ypSpuJrEbQduzE9N6
	ASLXZjbB2nHDopJJFv0AEaAcFNnP4fm6t01i8fYzUaPrrHp+VNvh8+kEx9oa0UfEu28QcbxllsPJG
	OkwsA+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdJI-0000000Dl98-1vUk;
	Tue, 27 Jan 2026 07:16:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdJD-0000000Dl7j-2KQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 07:16:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0c09bb78cso37525385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 23:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498178; x=1770102978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGC1e7GTJ+gs5YLdBWssdAfqY7NGH0UJX4m8BTmPg/I=;
        b=CKWLE6ludm7F9SHcSnca+NOBC0ADZ+tRQ9Pzg9U/TQQcPHe/mgxacBTaKhsdNZXGWC
         6DN+d9EhdO5+DWRKBZ+o6LxyPR1LGxEVsXXxOqPlbE+MittfHs4jcj4iZcmLyeBY0FTB
         HKWnGQ6d4ZxgKWms0y7sCbmbzqAK5NZYGb4rDUQ1+wJHgu3FKFtmFSrnGibZqAIkXpNl
         NZhiGpkzMAm9cH8ReoAxpOmoZZDaMfrA4UjMuTnz428TSWx0of7QvjRrmxSH9IyJDSUs
         xb2whu1HAx6aGmvHF1sWTu+MZQNmrW7rHE8AVb/3nmcqFb1CA+A6IEZ5Yk5MrDGY0SY4
         03mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498178; x=1770102978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EGC1e7GTJ+gs5YLdBWssdAfqY7NGH0UJX4m8BTmPg/I=;
        b=XZpqYDMmVXTCyDra9DicOiuGsWn/AVf7a5FlMWJRTj7xHzrijQWM0Ywm/HhIqcw7jm
         x+7Im+wi+YGuJIZ7k8iVFyQrH8GHm/kCfzVKRNXgnp1UIfbzNIYryWRIMHs/3s+ae1OK
         Zj4oNy6Zm+ZDxdz5k2yZyg/FeU0uN1yypLwNKGeDLHJBDzUAmk+pHlnUeSJfOSwuhORd
         BVH9aMvjGlorPkzoLFyGi7UjcRpjMsmpV6wOxfMF9IVBjTy3bP0qiww3eNBp9sNV3apD
         EvEekdh7oisVGY6c1H65NgMJoYtqIw9bIWdgB17rv/ZvRFE8PfVtDWAEBm6d+UkHr5ZD
         qoHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHcdiEQYJCxRRdLmlyPT313ck4VfckmRt0PJktWhKFs32+UkpwFPrMMzFzgiieLJtASPRXDN95lDKWyYofhb+R@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJSfn0rws5lyKndRotcGm4tePYmf9eTwJo60uLSSvExA/N0oj
	G/UkorYS43mkYBEzv1OXAbPZWK9tzJ7NJ7wcQCusowY4eGuJme05y+Bm
X-Gm-Gg: AZuq6aJZbhGrQFJ6aTr8mYgNxdR9nwJt48D8DmIEe0d/IYPBIY/Dl4aCFqE6jGXVX0R
	BtPzC4wGhBnqHdL437m5pGPK6ZaglhJNeP/7fm7TJ88a+QKHKphzidWEq1CQLZY4gU5asvWxFY+
	/UpvzzFrx/zU76wdeiC9gqvBsDyCegEhLwWFBjW/CNmA2ACZrZM+rKCKoImUa98YbhRsn2JZkI/
	neZ8DQt4c5Pa/WPXM5+p4tPUV9JhK2SD0cuQggxOD4pnEb2bHSukPcltSuGiTDPNWEFJOJnUoKu
	AE3VUBJIGubQHXE2So4jIdPSoygIGp2Falc2GiCTqiHX1yiPeHcgTbzLRRScPEzRBFtoKDMHtaM
	1L3h9Vu6TIszlOnkLydYXi0gu33zBomsWttbr+s2XBtGx5Nzo2vUkqUXsQ8ot3kj+27z3HnK6A7
	1+CS9t7UuhI7voi8UTRf86TMOzEr7x/MSE+TeouzCZ+MLBj6/dcCEm85wu4Y4=
X-Received: by 2002:a17:903:189:b0:29e:fc06:b8a5 with SMTP id d9443c01a7336-2a87130b27bmr8439315ad.18.1769498178413;
        Mon, 26 Jan 2026 23:16:18 -0800 (PST)
Received: from cn1dhc-k02 (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm106160505ad.85.2026.01.26.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:16:18 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	james.tai@realtek.com,
	soc@lists.linux.dev
Cc: afaerber@suse.de,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cy.huang@realtek.com,
	stanley_chang@realtek.com,
	eleanor.lin@realtek.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v3 1/2] dt-bindings: arm: realtek: Add Kent Soc family compatibles
Date: Tue, 27 Jan 2026 15:14:00 +0800
Message-ID: <20260127071530.25426-2-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127071530.25426-1-eleanor15x@gmail.com>
References: <20260127071530.25426-1-eleanor15x@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_231619_601519_2B8C9BEA 
X-CRM114-Status: UNSURE (   9.06  )
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

From: Yu-Chun Lin <eleanor.lin@realtek.com>

Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.

Additionally, convert legacy DTS-style comments to YAML description
properties, following the pattern from the ARM bindings conversion series
[1].

[1] https://lore.kernel.org/lkml/20200622125527.24207-2-afaerber@suse.de/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/arm/realtek.yaml      | 42 +++++++++++++------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
index ddd9a85099e9..be529490640c 100644
--- a/Documentation/devicetree/bindings/arm/realtek.yaml
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -14,21 +14,21 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      # RTD1195 SoC based boards
-      - items:
+      - description: RTD1195 SoC based boards
+        items:
           - enum:
               - mele,x1000 # MeLE X1000
               - realtek,horseradish # Realtek Horseradish EVB
           - const: realtek,rtd1195
 
-      # RTD1293 SoC based boards
-      - items:
+      - description: RTD1293 SoC based boards
+        items:
           - enum:
               - synology,ds418j # Synology DiskStation DS418j
           - const: realtek,rtd1293
 
-      # RTD1295 SoC based boards
-      - items:
+      - description: RTD1295 SoC based boards
+        items:
           - enum:
               - mele,v9 # MeLE V9
               - probox2,ava # ProBox2 AVA
@@ -36,25 +36,43 @@ properties:
               - zidoo,x9s # Zidoo X9S
           - const: realtek,rtd1295
 
-      # RTD1296 SoC based boards
-      - items:
+      - description: RTD1296 SoC based boards
+        items:
           - enum:
               - synology,ds418 # Synology DiskStation DS418
           - const: realtek,rtd1296
 
-      # RTD1395 SoC based boards
-      - items:
+      - description: RTD1395 SoC based boards
+        items:
           - enum:
               - bananapi,bpi-m4 # Banana Pi BPI-M4
               - realtek,lion-skin # Realtek Lion Skin EVB
           - const: realtek,rtd1395
 
-      # RTD1619 SoC based boards
-      - items:
+      - description: RTD1501s SoC based boards
+        items:
+          - enum:
+              - realtek,phantom # Realtek Phantom EVB (8GB)
+          - const: realtek,rtd1501s
+
+      - description: RTD1619 SoC based boards
+        items:
           - enum:
               - realtek,mjolnir # Realtek Mjolnir EVB
           - const: realtek,rtd1619
 
+      - description: RTD1861b SoC based boards
+        items:
+          - enum:
+              - realtek,krypton # Realtek Krypton EVB (8GB)
+          - const: realtek,rtd1861b
+
+      - description: RTD1920s SoC based boards
+        items:
+          - enum:
+              - realtek,smallville # Realtek Smallville EVB (4GB)
+          - const: realtek,rtd1920s
+
 additionalProperties: true
 
 ...
-- 
2.34.1


