Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96078C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=; b=wGDj5dZcAko50/KA1F0ZIYwuK5
	rc1Mw4IX7OI1XE4NqXnQqgvfuT25x8FJyQD/ZpJj5wOrFJS32qcY0x+W+ueNE93C+FbxaK4PAvtRE
	lSKlaaC7G6Qqtx4VIcMR3rxxSwugdZNNzBDXvHzDibF4OZ8sw3X1n1870VVT7JvNgFUJu30rde1uy
	7vWHocWuY0J53zxNesnWE4V6F9hqj1rnxeq65NKfaHh8TYhqAp+Wue+WLsdNAssb/NhDxk7S15huM
	VGMFEADaMMQzLO/MBOoiq/IzNs9KDzbyxp4giutX0SWoQ2dpNG1wvnIpppVhu9VGlAkkmUvEklvmu
	6jEGNHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey5W-00000002ZlS-3Tgh;
	Wed, 01 Jul 2026 16:47:02 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey5U-00000002ZkW-1Ucb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:47:02 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2c9f52ad059so3178895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924419; x=1783529219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=BBHwlnOsBJ8GRSD9ApKXVXqEA4jDTLXg5iDlxwEtDqUAbk50mfhFN1/d0Qrvef9SjB
         bFr3lQMJ8LzQHHBaBNW2U/e7JEamZOuQPD547Ufp1znLLTx9VAnwiATy5Pqhloo+FzDN
         U9egmm/t5kYQ9bVFOQUb6B7qsxr/M4h1yJ+ubob7B8dEboQaYmIwTwt8yuWMLtPLlojp
         VwC/bdmA1tli752oD3twKEil2Fueqv5kogzOkYqR8qS2a3mGz/czVAEowQSoXkm5c3lW
         gv09Vt2vOZlCxTPR9pwPnId4i0fGGCLLR0Yd44e97vEJJJYg0WWat2DM7NGhekX9A/kO
         ooXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924419; x=1783529219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=omxFDnVoxd1KdBN3QPcndK9lMT5uz+JK9TsB191BLrm20+x7OkwHpeZXXLrukuEDhG
         VSTZDBPSbDNuUZ1/HyBoeIOZQ5OAsiJudJ6mqqafCNEcEdbuXL9ODy3lklkmTFYS5quy
         V3aNG2Od3WKIXSkpa36PZ8lriUKqdZphed9vddcCO/ShH597o2/atElC0GZSPqImkvT0
         eAyIffphGukYSMPO2Jf3UeXJndxbIN7qxlVYbr2zZqzG1e/8HNIpeQ+av5cFe4shHUdl
         LVxT3DtP0tAkUAsCpyAZMpT7vh6b7APqCoNgRjJ8+oG48ZcfDyidLqLegri3CKV0Otb5
         E4LQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7dTs4BAEFo4LV3I1WEfycplYtgnvNVmsq4Emyc2oCV2lkc5X6sVKjZCn4bJuvnNUwDFS0gC1vgNMuLvBQ18KL@lists.infradead.org
X-Gm-Message-State: AOJu0YyJcwTxbNo6+GWeFbe6jQHPPuKWoW6rEnhVBrDDltzpXrsNm2Jf
	3gdywHCrLuNHnxlXleY0Qcmvse7gplA2dXKIS//TXjOVZcsxDYt6JGCV
X-Gm-Gg: AfdE7clvmGQQqfMWiJEZtENrOdX+vLTgGYHbnWTufzy1rlyE2Hgd9paWNmDAtCW5Uwr
	2hzu3DcGYdC7FOsSenKHhEsgbxXOh52xsIlZCDBlkLJzaBIEqFyK1QXmouPcCIMljF7SY9MrR9s
	IGpd3IIVbBsN5K9acgiQ7igWKRlh6kFdYpA1z69Lzv2XodDtD971jKT4D1eWJtom+tt9hA409OW
	HjPA1Soxt/UxL+QxRBvdv/c9g0pqPG8a4cUqY7SCoVJEaYQHquFlRf3DKfmqZOftpt5te5W6Ju5
	yRjcNYcXloENUBTA+lO16oui0f/5RqAAIrgiDt5Qk5AX5h8Sn2ZDuxTJ2ggalYpVjiYJhFEqBCQ
	Q38iGdfi1LBODV/h0IXMtZVyQLBBpNX+xoTmUv9ydqA3avO2tH0I7IG3sESf15qk3lti4dU5yT9
	sbzFw1reTMLTA=
X-Received: by 2002:a17:903:1a2b:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ca7e6a6731mr28150095ad.18.1782924419477;
        Wed, 01 Jul 2026 09:46:59 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a911f4csm985015ad.29.2026.07.01.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:46:58 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Thu,  2 Jul 2026 00:45:43 +0800
Message-ID: <20260701164543.3967388-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701164543.3967388-3-coiaprant@gmail.com>
References: <20260701164543.3967388-3-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094700_394693_45A255C9 
X-CRM114-Status: UNSURE (   9.73  )
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

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3


