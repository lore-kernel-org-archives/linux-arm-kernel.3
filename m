Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5481DCD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=; b=seZt0+VKplXSGpLsqyEB92y0Zt
	LlXE7R0Alp0gfmN0NuH49kkPVDzicScGE07Q9PTqGVPD8HovJUiVxi7Ci7ZPzoQhqTDV4Uum0KPS1
	m40isUqtnkhvTr+HfI/in0n+Og9GDSt+1/Rd/Bw3KcjxFbPbeXWHsmIuP+yjFZhBDWS2+w18fxj4I
	Gh5TDRVY5NB5hiUZrGX9MnjEJWFdm01eNsKiakUdqSBeYNFpK/IZIaoUM4Iujogsw9jKeKqnflvdq
	M5xm/HSTMLUZrEnwMi83/JFwAHO26jvjw+ar/ublaiEMLQf6dIw6jc3CLHCC7Y5ojRJSlfj5gWFYa
	8UKWw2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMish-0000000G9A2-03gj;
	Tue, 12 May 2026 08:54:23 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMise-0000000G98Z-3lKZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-366375c4076so2406813a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576060; x=1779180860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=;
        b=g0hDeIWrIYlxxPVa7PWwjjhLGkdHf6iaX6IEPAoYm4WA5N9aZmNgwFH46sQfTosu4e
         58ahpLSpirl9fN4viMxqFoE+E8cXuM/SlvwVF/m0qU1mKrP1gX73im/HaWuAgF+NElrg
         hVEODs8EvClut1e44A9RKCCGq/V/5qL6IUud4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576060; x=1779180860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qDqjvcGmQbuNfs6rFsmhxLHPhhLZAKSd8EQw3TfrwU=;
        b=tGMKhe5kvLetzbx63PI+SiwuP8yobZkAiggejHoh4DHf3dNm2R3C+/EpV+z/tCkPQ1
         qA/leQbVMAVRD/b/LhN8q9vsbHQeoAvR9CS3c4YfgcCtzNTWU9Fv6yzzmoy5w4s/ALKE
         wtdHzccHpQohXQIH4JX/fximgGJzw1ot7XF8z44LWxt8CfVhJwzjGT7UAlgocnfVF+xq
         xboKF2MruE8ZSuw21URVOMQnprgCmgYr202KSn7BXbgvxxvPSS2NdBAjF/otuEqZEhTB
         7ft3865n9JKjKrPHmqhakcJwldRnj9SzNQkvX0HBS8PlXEJNr6zbruBt+KC6eDvWYvFi
         +ssg==
X-Forwarded-Encrypted: i=1; AFNElJ8gvqKj4Jp8fXDvp7yKsdm2Ty0+r1l02txKSqFf01lvxJ5Pwv3JOm0s8jFA3/qEelHJsS6FAzQXSf8nZNKi/I4S@lists.infradead.org
X-Gm-Message-State: AOJu0YyWaxKfxXvyZYMtew+Rw30EeROJbvgPMW4WeYNpaBG2N28t7C8W
	B01nGqIe80mZNcgeyAZlWlHu+kAq1GIMCkPZJoAydTu/kgQccRqrNe5x7XKMjYNfiQ==
X-Gm-Gg: Acq92OEjfYUC/xGHnP0wnbaMtIiqcDtBrnZlvXBbkn3jhBYyPJTo74ouam3M4V8G2Xq
	Z4NMWSUFvyYGtptxP8PKbrbcQOe6sijhW+yFrD9MuQNNUjrNhXh7Md3GHgLBJelCaTdTJgcyevS
	CLvnvq/Zx5EtSl1W41Ph0epqDzNzHTOUn4TRl9Ycmr87S4VSxu/47S7y+g3tK5jR0MMqMTrABYS
	gWPAn0H+fmxR2qGMb9Zhy2WZNWBLWp4A6Zgm8WmfFCCNJ3tGproKirk+ZIy14fD32pNssqH4oY9
	SqHbgGBmfmzo6md9PQm/zbCGmTISs0H/riP3EZaxEWDbGUSz803+96XPPBxfWePUk05BqniTZHt
	MvKYh91+oqVCBqZkE4ujEkFqN9//Z7RtccB6cc5SgTKbQbkU8XbqWypA7FSlSh9K1mpWEn3nRU0
	ST1GkRztWR0xomjnjDOJOkFHXvGiHWSPsosL8ErRmHF5KKHrwKJUH86A8Jn9ri7IpN3nUfmaSrt
	f72HJwWqTMNwsxTIow=
X-Received: by 2002:a17:90b:3fc3:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-367d49bc472mr13305606a91.20.1778576060010;
        Tue, 12 May 2026 01:54:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Tue, 12 May 2026 16:53:49 +0800
Message-ID: <20260512085358.1693208-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015420_959266_9B85E41E 
X-CRM114-Status: GOOD (  13.80  )
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

On the MT6397 family each buck regulator has a separate supply. LDOs are
split into various groups with independent supplies. There is also a
supply for the regulator control logic.

Add descriptions for all of the supplies for the MT6359.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Lee, request from Mark:

Lee, this seems like mostly a regulator series - OK for me to apply this
patch and send you a tag for it?

Changes since v2:
- Fix vsys-vsmps-supply property name

Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..9e6053677981 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsys-smps-supply:
+    description: Supply for regulator control logic
+
+patternProperties:
+  "^vsys-v[a-z]+[0-9]*-supply$":
+    description: Supplies for PMIC buck regulators
+  "^vs(ys|[12])-ldo[1-9]-supply$":
+    description: Supplies for PMIC LDO regulators
+
 required:
   - compatible
   - regulators
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        "compatible":
+          contains:
+            const: mediatek,mt6359
+    then:
+      properties:
+        vsys-ldo1-supply:
+          description: Supply for LDOs vcn33_[12], vio28, vfe28, vibr
+        vsys-ldo2-supply:
+          description: Supply for LDOs va09, vaux18, vbif28, vxo22, vrfck, vrfck_1,
+            vemc, vsim1, vsim2, vusb
+        vsys-vcore-supply:
+          description: Supply for buck regulator vcore
+        vsys-vgpu11-supply:
+          description: Supply for buck regulator vgpu11
+        vsys-vmodem-supply:
+          description: Supply for buck regulator vmodem
+        vsys-vpa-supply:
+          description: Supply for buck regulator vpa
+        vsys-vproc1-supply:
+          description: Supply for buck regulator vproc1
+        vsys-vproc2-supply:
+          description: Supply for buck regulator vproc2
+        vsys-vpu-supply:
+          description: Supply for buck regulator vpu
+        vsys-vs1-supply:
+          description: Supply for buck regulator vs1
+        vsys-vs2-supply:
+          description: Supply for buck regulator vs2
+        vs1-ldo1-supply:
+          description: Supply for LDOs vaud18, vcamio, vm18, vufs
+        vs1-ldo2-supply:
+          description: Supply for LDOs vcn18, vefuse, vio18, vrf18
+        vs2-ldo1-supply:
+          description:
+            Supply for LDOs vsram_proc1, vsram_proc2, vsram_others, vsram_md
+        vs2-ldo2-supply:
+          description: Supply for LDOs va09, va12, vcn13, vrf12
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.54.0.563.g4f69b47b94-goog


