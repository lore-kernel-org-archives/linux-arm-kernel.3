Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCBBC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGhABSDncyCkqMF1m9WG+uwjNnjeaT93SjRTLfv5Zno=; b=3/yFn3hsRqggRcIR1GnkjbXUcj
	pwLPdP1bKnWveUJBQcHZrkegnwJF9UDcLTRj8WBJql9tc1pBL4mrGk6TBgFwNLOQqMHykWrYzzHLu
	BF+2bG1yfXxT4OjFoY21DQGitkHRZvaP078o+C1zdqGMMVGiKVrqeRy+BzSiXSHa9LnS1od1RSkPj
	t7BOIxvSJRjvJN7FsKoZjM5wiKDQ4zNzZtI9knbnKWkQd4bvo+BBx6Ciqzhr8x12nPSa/wsOfSExa
	qTIGM2/N1sX7SxOu8SH0duUK9pQrEN1kkRhbvVdnzrkynmShf0vf4jBjmpHFFUH/FedJFB7Q9wA/6
	cMJf6z8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8N50-00000000Qrx-336m;
	Fri, 25 Apr 2025 17:43:14 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KpE-00000000147-3SaP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:18:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac7bd86f637so678580666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1745594327; x=1746199127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGhABSDncyCkqMF1m9WG+uwjNnjeaT93SjRTLfv5Zno=;
        b=JpgYq5Jqq+rqhNyo4YNNRsuCU0kc/71ug705O+ClNtyA01OAtGoZb/2w4ZPrZZu00D
         +IykjqTC0ofkxA8RbDDDlOdES+LcJ6r3iEISTKDF22XyE8ammS+6WA+zdXuBGn+XqA3L
         0kDzpDVtquhehFqKXQVAADYKtJZKUWKw433aX/xNvbCXuuf2WPKDCRar9whqAh3kr/XW
         iZBvYjql5LIoEOqtC5vJuin5gcybi3wMXIcyJNGBgj30HBUss6Cq7jxglwMYcxLSenbr
         pouOOu+f6FMzkmLtt8haxOevyW/yBv40MYNhFYF3eBlzDGOLrjU/lQRh8G5CfxwTWHqU
         LbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594327; x=1746199127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGhABSDncyCkqMF1m9WG+uwjNnjeaT93SjRTLfv5Zno=;
        b=iXEN49tv1wsG/dl0DbcY5/8QkRUgSRJo5YXiX9E/MXQqQ6LvwNRU13XzMjnsTKJ+t/
         Z0AW3qTOYz2xhlgHifoZtKRwUJxKw2fyKsNGgTOEpEDT9Wbjrev4ZVUQDgQDkXRV49Ed
         uxgj5i89QC1f9FfOMF5ASbDgr9s0LgrjbcdGi5VxrxIX1FKN4neQthYvEDt81fT8Dh9W
         DwrCLMDkRBf0IYHb50ImN+qY0WzxxZckYJ+fTyEiaG6+F6kQ5p6wLTrJPwAHH0ukPMfq
         PORFEnTHuT3Pwegfy/eNWQOhDrINc4KXJi/n37A/5J0lWEWc+f8pcDOS20wXR11dYP7V
         0dFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+XR/CGUV/GQUe+qUXlobbtewFee8ndqcYgn9G+I9eAUWurDo7UzD6cTscJst6D8QwtvkmIGgDKWhHcL7F74LP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7NwFTA2S/Uh2g7RtBNLUwnHiNno7VwlMcgVn0kIjqXpe1peVw
	L6nh4/7N5UY3gW7312nU0uUVYSkbRjGj4hvJ7KtuCtAJVziB5ZNowKl4xmVfUfIh+lCogZMhnRg
	HTvo=
X-Gm-Gg: ASbGncsJo9O60XP0b4mIOGz2hOG2QtIDT7yZ8SgjQFrtDDDP4XLoqJlB1Ced7KRPAbw
	QsyY45uhblPNHJz+dr2h5tDHLyTqCD2CYFRh69KrQT31PGMAwhlJl309PqFSLklh1SaDymJTdfu
	lvYyIxyxMMP1FryjJYILS26A70v+P5yie5fx+tHRhmMO0/67cULmWe461w8i52fIHx2ZIXwulKs
	J8U0TSLcfzl8/NKDD6+Y82KtOSyU/P26pkPgANGVN7+m4C8TTj7isISVXA9cA8mfLsJ9Y0MQff7
	LWtCR828L/miWYkYXeER6ZmGKull5gFHbpuAJW/RyhccuR/BO3cnzG1ZoNUKju2Y3yRS
X-Google-Smtp-Source: AGHT+IHtzafs1U3OlDFbdl1EHKhqDpSLv5FVfv0SchkozUHNmBnUPWs9GEdrQlZ8/5oMkLAgq6/HDw==
X-Received: by 2002:a17:907:72d0:b0:ac7:e4b5:4827 with SMTP id a640c23a62f3a-ace5a484e6dmr564732266b.28.1745594327250;
        Fri, 25 Apr 2025 08:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([185.164.142.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e59649fsm151099766b.85.2025.04.25.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:18:46 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Date: Fri, 25 Apr 2025 17:18:07 +0200
Subject: [PATCH v2 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-onboard_usb_dev-v2-2-4a76a474a010@thaumatec.com>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
In-Reply-To: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_081848_869400_F11D5DA1 
X-CRM114-Status: GOOD (  12.50  )
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

The Cypress HX3 hubs use different default PID value depending
on the variant. Update compatibles list.
Becasuse all hub variants use the same driver data, allow the
dt node to have two compatibles: leftmost which matches the HW
exactly, and the second one as fallback.

Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
Cc: stable@vger.kernel.org # 6.6
Cc: stable@vger.kernel.org # Backport of the patch ("dt-bindings: usb: usb-device: relax compatible pattern to a contains") from list: https://lore.kernel.org/linux-usb/20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de/
Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table in drivers/usb/misc/onboard_usb_dev.c driver
Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 .../devicetree/bindings/usb/cypress,hx3.yaml          | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index 1033b7a4b8f953424cc3d31d561992c17f3594b2..d6eac1213228d2acb50ebc959d1ff15134c5a91c 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -14,9 +14,22 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - usb4b4,6504
-      - usb4b4,6506
+    oneOf:
+      - enum:
+          - usb4b4,6504
+          - usb4b4,6506
+      - items:
+          - enum:
+              - usb4b4,6500
+              - usb4b4,6508
+          - const: usb4b4,6504
+      - items:
+          - enum:
+              - usb4b4,6502
+              - usb4b4,6503
+              - usb4b4,6507
+              - usb4b4,650a
+          - const: usb4b4,6506
 
   reg: true
 

-- 
2.43.0


