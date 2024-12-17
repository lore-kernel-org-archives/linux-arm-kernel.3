Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C4BE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 06:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PTHJDPcDpPl/b/u84+C0bmCrPy6/IfhaBvYT/oexWi8=; b=TycI+AnTaMb4/QRv8gE78voaSp
	EvekFRhusDaFnUx2ewUVx1WSQ1WW5VNoc8yEjAYSFjERGIpMoXS7mwKU/AC79JqhOzp8kJd2iOgRq
	29JUkh9bbu9Hn24ikDxAtFyqLyMjVLud5bhB+Qn+WJjIt8z4KyZqq5EeWW+ve9gcPdgSyurCuNGNh
	gSAse7YIcTULwbyMioxiRxGCrORX2Ene72MBY4v8M5mq5/bASYAy0xbvTMlFaKeqAV0WRnPuqSS4C
	6wWXWm6YyG6pVr6Nj/5OBnrhn47vYOpXpAGIpBYV8mGyYqaoVzEPZpw0odx6xRayUYJJuoP+XLxdS
	jN614/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQpu-0000000CNk6-3p7m;
	Tue, 17 Dec 2024 06:13:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQop-0000000CNX2-3nSY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:12:33 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862c78536bso208191f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 22:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734415950; x=1735020750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTHJDPcDpPl/b/u84+C0bmCrPy6/IfhaBvYT/oexWi8=;
        b=o5SDO+WxMjgLDU6WtVSXzsa0xyxZdwvJdf8fK5hSZa2q+7c4pzW5OK42izJD8tiRMc
         DjeJ8u7Liy3tY/wKdqKO+eXvGF0WXjOkyI2upR7zYIK0ggMRUXqkMpBLDrJaapAs1u80
         3zD9M3irmQU072wBDdyNLJ5mOUQ6qReOG4Ogb0vaH3Hb1S5dVNL5y24bZjE86cgeO82t
         KRCRDbRDCyQDlgAQhIpsIp488kN2C1aOSY8Y7oMFbLtsTMc6HFQJnYEfi1vFVg5LKSG0
         kBH5ZMtfsPPv6c4BULbnuhB4QZlsETXwOsTYa7cKMaPFdx8bVZDtRT6ELh2YHiXCxpf1
         R31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734415950; x=1735020750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTHJDPcDpPl/b/u84+C0bmCrPy6/IfhaBvYT/oexWi8=;
        b=uqJJBXJjhDjVwIiGBSTkk178fyB1SoQDn+KxyWL/JjTsyDxagaN0Pp4uPLSVFXBaSs
         AGpmGJXMAppCTtQYL2qU72gm2PJwsQLvjEskS4rdGepp3eub+r2PejJHMWniYlA6IOrD
         vyq0qUfbIn9GmQhNAGWmPuLJz/N/VbK/cw5IVyIKgNKSJsOBpnmTBn0TQ0BMttYdrwpq
         jHtsp4KwkyODpeS5y7dnlG7PZcLe0nGltUf5NYQff0/NGz3SPlJjOo6AbCAISL/1zcTQ
         kFCea89nyKHmPIc7YwZEy6vKrzDbHt/hoT8/XPsJku7npcLjZwvW4gqNw+9sVH3hYqaB
         hH8A==
X-Forwarded-Encrypted: i=1; AJvYcCWnZkmn9mdJeXBmcYpgDWwFQQEWy12tMDx222DthdfM+qMrVxJdIl1agizd5D94n0mzY81wy+lmIPvIqPNB3j3c@lists.infradead.org
X-Gm-Message-State: AOJu0YzuJBPnVkQ3blpVouF7gsgjR7vZFbjDw9Z4mUrFGO8M6BzyI+N9
	V7X3ZVke8OYEUwUK0WpRSPx2MJFgvLwt+bTmRxUWO+uxU3MBzTfztwOMGNJjV10=
X-Gm-Gg: ASbGnctU5kURtTrvLEsILKIa4ktaKAqBnu2RGX2TnoWB0JIJxXSR0JN4ovWOEtvEX+U
	Ouggx70by3apGMBEverH5c8+T79iRloEZUJ/D4F4ZASqvXgm3f+Yk5VUE534bL4PmMZ8PFPgkna
	9F3xXacEEVIVdb79uh5OyigerTehglhHcD4rEphRMaSPbGIKVUMc+FRJvMQAUKXt17Lgf07Dj3u
	zgdJatxne0Dp6mlpCLgWGWzP5BZ+hM695ITXLCu2WaXVdop0t9tktl7iVaLtAZoCmRDN0E=
X-Google-Smtp-Source: AGHT+IFI+p0M1btx225eSEUt1sd3VfrnBfaQ6XC/nOx5Rt+MMlZSNPlHzmh9nMcVTJ+lBXANYx6cnQ==
X-Received: by 2002:a05:6000:4607:b0:385:ea11:dd8f with SMTP id ffacd0b85a97d-38880ad88e7mr4026927f8f.7.1734415950172;
        Mon, 16 Dec 2024 22:12:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80120bcsm10401852f8f.5.2024.12.16.22.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 22:12:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: interrupt-controller: arm,gic: Correct VGIC interrupt description
Date: Tue, 17 Dec 2024 07:12:26 +0100
Message-ID: <20241217061226.14139-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_221231_956747_5297C43C 
X-CRM114-Status: GOOD (  10.85  )
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

The description of VGIC interrupt referenced obsolete "see below" after
converting TXT to DT Schema in commit 66ed144f147a ("dt-bindings:
interrupt-controller: Convert ARM GIC to json-schema"), because there is
no dedicated "VGIC" chapter anymore below.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index a2846e493497..7173c4b5a228 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -110,8 +110,8 @@ properties:
 
   interrupts:
     description: Interrupt source of the parent interrupt controller on
-      secondary GICs, or VGIC maintenance interrupt on primary GIC (see
-      below).
+      secondary GICs, or VGIC maintenance interrupt on primary GIC (see "GICv2
+      with virtualization extensions" paragraph in the "reg" property).
     maxItems: 1
 
   cpu-offset:
-- 
2.43.0


