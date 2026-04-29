Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D3BFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=; b=n0DsbdOZNNyi5XqKmlLR/KMmec
	Sx8whBSMbsmiKx/zMdH8c45okrh2CzzqO7JoSOtfi7taH3WAhQT1+iflqvsn4iaPm++Gri8n4FnZi
	oUaLDdeYvZKjZ9QSGzbQt97b2ZGsB6pfWQb88peVsEqnntgNKvzFsJK4bnyagaduBzsbq2m6LZf8e
	QEU5JfrQP3spXfFcovgmkSCN94MQu+luAYUsj+hYoxn7sK2dNFXNpFcauHjEhxbE6zRrna6hEUdOz
	evQEx34qKk8DHLcIHnweoXkTEP2vgHEjMxAPM2EonPZm7ZVV4odt28ImSO47x44p7yGkEUb7U4P2V
	6V9Ir4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzYA-00000003Alz-3RgR;
	Wed, 29 Apr 2026 07:41:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzY5-00000003Aih-102h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:34 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so10525841a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448492; x=1778053292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=;
        b=ejEuvAAHChUyQwIN7uAkapbhxzbGfKaX+4xRAUU1zM8lsQLoXv+vslL07qD7YWvpqx
         Ioe+b3s81g24nzDvnBE90tSwFpBhrfxBo4I0F3VhUTGYYBA2xws44cYu+ABsg1mYyRUT
         Rrl7QzltCnfFdyCU4xVLfe/1//FCOR2wmkwOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448492; x=1778053292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FXLYavQvSo8+AMt81moN1578QhYfNvjrMqBZJuTbjC8=;
        b=iSIV2Q0gA5yus/VewYKpFFkhcKxzmC/tXIYW0DJ2qG+GSDB3AF2oPENMf0ABzyJdlG
         hP4GWjE+33NLoY1/TcFFgFNc8KwfbL8+ZUDBY30tupXRYLtDU5urmkhIEyqBAw0wUYN4
         Yf/7ldtYHDVGLiXEK0IpCqA81S4GzDyCrYogpYD4VE09xvFDe/rMd1iTp50dUmAsq2oh
         HsZHYNq6nCWeJmMpiyA9Nf8sB6qPo/ckmAMtk3H6j5KOjCf/nBtvGVP44LowCMnOblpH
         8XZlDNleNP5rZpA2dvSiPIUHXv20E4rXivj34WXjvIoz+zSusu/LZdmr4wnCnjXTzMqb
         Y35A==
X-Forwarded-Encrypted: i=1; AFNElJ+LYzyOMsPBdjrkPALbOvLfhCbpDdMIODsAy1zrfVyXkZ23BwxtmGH8N5+V+JgGJqmFPFoCTFOC6vXKe+7qs2G7@lists.infradead.org
X-Gm-Message-State: AOJu0YymCu0jzcT5F+XkGT6coMZ5XsBFfyZ4tDSvhssuIZj2rykTDc6U
	DiGwAJJY2uR3g0mvJfkhuvt7k59tVT2ePPbZZPg35Ak40JWxYSc43VypqHxY2CJmpg==
X-Gm-Gg: AeBDies7HP0I8E3Axr7mK/uvscbGwGlZeuHc6mX8DEUo4DvCLqMs0Rbh90Zqri88Muw
	jOx6VLb6wiRMSamSjueOVTSDwFWfc3gMJI7d3mu0BXRWCnoo/8nSbfVXRc2oPZHyw+5xKdiYK3Z
	q5Z50yBZW2TuYSF7iult5WAsu9NgXx8K8QKQZfNTbPRcbfyqHm5CN7NsujXneLZnKAZnEsaQrqQ
	rkv/0DNM4brHJzX4lBxobccSUEUsBDLBhhXWOr1f9Pw79+4vuuTEHrCC8YDjWM4z1KtU6usvVSO
	+//KAWUMJS2bV5YnFCHMUly+t/UWGugg7cxm5Aigb1773SxCJOB6tOOhIuDNTI347dnXr1puuII
	gGT24bkN/aOU4Mj3gaJ8wup0eSsbeWypsqrurho+qkZU7nyu1vgzRmg+2+0uYxIj+EuOgPRAFzo
	N1XxWk9vJt352+rG8q8LtHnr4/gx/QPY0Cpg2jm/opcNL/wIrtAKXlPiw13YezaKIHK2uLGQ6H8
	GkFtamqTjcMael/Hh0=
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7208188a91.13.1777448492355;
        Wed, 29 Apr 2026 00:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
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
Subject: [PATCH v2 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Wed, 29 Apr 2026 15:41:07 +0800
Message-ID: <20260429074113.3720271-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260429074113.3720271-1-wenst@chromium.org>
References: <20260429074113.3720271-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004133_281429_1DAFFF3C 
X-CRM114-Status: GOOD (  12.12  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use regular expression to describe vcn33_* names
- Moved regulator supplies to top level PMIC node
- Moved changes to mfd binding
- Dropped ack from Krzysztof
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..7fbf07208d0f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -225,12 +225,62 @@ properties:
     description:
       Pin controller
 
+  vsmps-supply:
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
2.54.0.545.g6539524ca2-goog


