Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D63CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 06:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZBj0vgRHJC6aX96xN8RIRtjeiDt3AOgOJls8yqVpTU=; b=pFsA/c/fmBL07+zCzOSecPNP0p
	OhMFHu3fYfDjHMjDRBw/giWCECteui/6RtRCa1kr5z7yhjYcZ43SVdYFQKHQugyDCdYuFAjqARHNj
	Fkcmyh2RRt7/a01TTfA+WFNdcrm55oYSVBPrjNplljZytU1hIy96iR+hxztFJejHEklcAaARt7BUw
	xc6z25lAXIehujJcqorBfIpoqxXTUJxcN2EBj0vUOSOkdR7LRXetb9vKFkJlo7nvX0L1+tL62ynbU
	pVkadP+vloCVlAP2m3gw05FB7E8I4zF3lmstQBu/SmpG5kSP/DjqTtEjh1B5yYhMBDAFXb6qNq9Rz
	1eAR6cjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCuHG-0000000C5Ln-2Fbl;
	Sun, 26 Oct 2025 06:30:56 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCuHE-0000000C5L3-19Cb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 06:30:53 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-290cd62acc3so41858605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761460251; x=1762065051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZBj0vgRHJC6aX96xN8RIRtjeiDt3AOgOJls8yqVpTU=;
        b=M2cMKpxxVQeJYa964VruQh1URU2X9gB8OqnA4jOxBB0XdV52kEG1TgVgYLeEjxpxN6
         938mRFKkxuZdcx+7Wbpbb8/hLrVkeaiTcVO9ek3USYxa0s/4NuRlmQD03KSLQ1ul1D3/
         fvsuji3O7ZArIx2sUBIOLUBe828O+Jt0wnR86NcswUm997YbUsE1Pp1Su7oC7vgQNFrn
         2uFx9BDZXx3YgMfxXGApeYoXrkuftmT1TesVr71/gh5LzdUw1KCBvQ/0MpLkFC0Ub5mm
         SyuvaPRMn/SRh4bZQ4lg+Cn1Z17NUIRVjkWE4S5WVfFdF4eauHxxDp3mOjbNHch4GIIL
         c7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761460251; x=1762065051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZBj0vgRHJC6aX96xN8RIRtjeiDt3AOgOJls8yqVpTU=;
        b=R6GgTDvqTL5O4465z1HfkOfopTlLG37GAvjf3EhWSILDdUPPcJD9R9FWBTnFIIJvkk
         czMkLOtTHDBUBRdTDMf3bJQzAXgY9N2uZd7ZVRx40pIs7RYYhk2ihNVH5rh3uDCeXbfB
         QS+Cz9Hfbd4yFO33LIP+AULl65t+coriDnixQ4ZlrO3T9hqIUjdHc1eq6f4UYxDoVpK8
         iltUyyTQihro+tPSo6zAcYegllk/ev6WH/BjbPV9piSbAzq7lsNUeMFCC0mjzIaXtIWl
         M/qx0BcAyp8tf1toDMFqt0KXd0jJnz2F2D4dRJWUfMgW5C1DkxQAIVgPdFXSm52cjJlj
         RYHA==
X-Forwarded-Encrypted: i=1; AJvYcCW8O90F0d2bkfeDN9oqn+Ks5E7iCxwQgoj6Qdde1BsUtz72oStC9SjIQ87sWqzqPb532qfDW9ZXPfrIgYlBSMrY@lists.infradead.org
X-Gm-Message-State: AOJu0YycsU1TwqJjWThX7e72AOpOlTEZv6POJf1SPKRbV43UGHVxsiyr
	hvuB5AqCn83vRMc4X+JGkeuqlA3xmZELmQWJo3Q8fzx+8qT9r/ngM2+j
X-Gm-Gg: ASbGnctwn+w1HUIecKQcTpiRI8oxvuQ+sFewMBV+T57ZYb0CJA8bySM8U2clQSj9XDk
	PyxkMRdpstJwv0GkBBzDoO6lHrQYc0hIhPM1A/2EvXeLdovf+7QeZXV9vSbs0EFlYH81uB60pz8
	YCCwCwPf6oRjS1Vn9o1SqYKqu7uEAHRd4DWGGM/GIwW0D3+eF9x1TEwwkBwFQvsVY16Fkz+OU/i
	FHb3PySTEWC54DHaJOXaLyGVJVV1Xq5sVkKmycGJR9duBV1MV1U8QHQHi8PMW7lXX+mLGDn3jx9
	vk6lrSXCY8TyqbQ+/OqT/z9dvncklQs0paGdkUNpB1W+upYB9tXSVs16nv6dKrw3s9GT4KnAGwS
	jsH0rGS1uAwl/5sFR2vm0E11q/N/oUSrX/+6Lq/MhahtlHN4u6RkO+HDVcLdTRhRYCdDj+LpTqo
	X1eDZHm0Qpkg==
X-Google-Smtp-Source: AGHT+IE1eXwoc08oMm0xal+/gwZlEgSxffRo65GMqV2tDlYe8mdGyu57eUdYIjlh9cI3ppLNUpa66g==
X-Received: by 2002:a17:903:388d:b0:267:e097:7a9c with SMTP id d9443c01a7336-2948ba7a6bcmr78804325ad.53.1761460251468;
        Sat, 25 Oct 2025 23:30:51 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a60fsm41583865ad.39.2025.10.25.23.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 23:30:51 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add NineTripod X3568 series
Date: Sun, 26 Oct 2025 14:28:33 +0800
Message-ID: <20251026062831.4045083-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251026062831.4045083-3-coiaprant@gmail.com>
References: <20251026062831.4045083-3-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_233052_318475_48436EFF 
X-CRM114-Status: UNSURE (   9.11  )
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

This documents NineTripod X3568 v4 which is a SBC based on RK3568 SoC.

Link: http://www.9tripod.com/showpro.php?id=117
Link: https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Cc: stable@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8ac..417100209 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -777,6 +777,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: NineTripod X3568 series board
+        items:
+          - enum:
+              - ninetripod,x3568-v4
+          - const: rockchip,rk3568
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.47.3


