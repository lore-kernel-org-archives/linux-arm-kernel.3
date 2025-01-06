Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932D4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=; b=lEDHyMU3GsTqv4G7BY0abAnsp5
	nwCelh3ysyDT4Q2E5BVyA/4rthXiQv6gTX0hzY8VoL/RuF7rKhhYC20u8VRC4FQ5aL6BOXeukoqVf
	b5gFzPNqHjMtgOI9AunXmj3ntaDsb424Va4qT6UhpEFHdK5aY3U4v8h1AuoIdiEktabguDOl89HXk
	+9tKj5vWXYWJA3Exo7vVaKd6bZdIQit+MYghjakmYduHjkGAAQN1/VYh+dOxNyRlErDEtsdThsu8t
	sE0nUlVIEFAq1IDNDa5pC6bm9L5hl3CfWr/2DhP0O8ylDvvfNQDKGJnaLAwiJNpuX7pYpxq6xBxOf
	cIs9aM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmcq-00000001Iwn-2can;
	Mon, 06 Jan 2025 12:54:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmDd-00000001Dqc-2hpZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:28:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21634338cfdso4661195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 04:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166509; x=1736771309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=jRObjgfGfENJJl0GjIVpWYML00i8nktxTz3ZWKNPNoJtrdfGMTM2lMbZK0EmUZ3TDY
         5GYRH34mixaNpcnRsK+g8CmEi+mT43sJzOWDY8pdw95MvYFYIYMO5ywQfjy/8exI3c+B
         OXsNn59Kb7F7Llo/QMoL0Aa1mUZgBxMAkzKyf9MjurweBYthMePzZFzDcata7awxgwEU
         74zS5zW/7r3UDbkRTlJqzJio+msbFjCT6L1kxRuvgsb5kUc9rUtK11Nc6VVg9Jw6GTiZ
         gCPplUpPLdMaEC/HClBAAveqMQo+/NLsraIbS4NTWEX8T0p0HjtKXMfRpShZfUmvMzhg
         +3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166509; x=1736771309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=qB9WTjC7nFxY32tsxeAtbxs8u4N5k1VkRNfOUeZhkBFlnqa2PNHAvQA3dskWG1JIE2
         1JOHmue/KgW3FycfjwuG6k/cNN9PltZ/fvrnnwtKNHCwNp+Srq1Vg8+DeaQCSkaDXB+k
         x5jGVkkPA0oAwQrATWhWAynu8vd5boa+JNzQhv0QJUgEN3CICEgOqR6gCM9xsS1wOcdQ
         6xErlBKPkY4oN17Em7j7zwcFAfHGlw+4t0tOdeJ87nFEdBvbjRnG368EG1Ad6II00wFK
         dzkScZyQ1yDJRW2KdGL2kxdlMsmZC/HvLj+6oUHDe8BycnLBMkxLkIPOWDpp9NpB7urP
         NBPA==
X-Forwarded-Encrypted: i=1; AJvYcCWvK7kr9yAFcnFZztFzd5zvscrjegUnplmfvCHMF0kHwUn982oXIfQwZgnMrh61c9szN8qOQDj36ovS/47oN/Lg@lists.infradead.org
X-Gm-Message-State: AOJu0YyBErvGIP311Z+TfMMM9yZGTvY9ORceZ7Fqam937ciG1PNQp8/s
	GhvhPVLC6q4HmmMsbmvjOQ2+AhzPsEmjR+CMIs4kEkdhjyjP+fQk
X-Gm-Gg: ASbGncu7vNt7GicIRxZis4pJuxrRetLEwS/7AEFsjjjHW1GQ2pUJC+2Wg/bAsM1FI/5
	/AMVq3acJZIarwtT2kyYX2DuOqAVUNhBUmw/o5tiKps6qFom8vAMaUEgYbz1Pv/mYMgoF1lGCoG
	igIpXFuVHiMK7a0exxQWwXyebutvnmdh1TMx4DUmej7q2CGao8/ODRkqJCdBEs3SUs/X5fqw/mC
	W+en2rnYRbk2Y45uBuE3ybLqNE1D9drWlczjYxMfmUvfBtGk379Xz7vOA==
X-Google-Smtp-Source: AGHT+IGK/a2otNoJBSUFPmEsal05bTWWTM0YgOYKrBNNi4sCLMU+2e6MoH9+e2N2Iz9mR02EfXWhYw==
X-Received: by 2002:a17:902:da8e:b0:215:b058:28a5 with SMTP id d9443c01a7336-219e6ea2855mr779330195ad.18.1736166508697;
        Mon, 06 Jan 2025 04:28:28 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon,  6 Jan 2025 20:26:19 +0800
Message-ID: <20250106122805.31688-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106122805.31688-1-towinchenmi@gmail.com>
References: <20250106122805.31688-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042829_680122_EE7B1CA9 
X-CRM114-Status: UNSURE (   9.42  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1


