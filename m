Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=; b=aKdprDgJM58qWz9l5wEOaWB0gK
	XOjgSgX0Qgg0tM/weHxSm7Vhedz+np08/uERAFWvW0L4kT4Hj1uip2uWDO2RBdVPlTl3dB1sJWtbx
	GUj1xs095+t69mUKhtHKP/m4BHXsCkCVvFmZ+JAOVZfyahGIpsb3IJ4pbcNgCGuyyRCdkpqb4S7yP
	EC6hY1N4V1rKCu2uZlEalfiu6g6G2XvgCXz2lPbL/dLZjXEWmalHfTiIAPoZABlehBNs35wYkf64J
	rmCfG0rXT8T4VhnCJK69D9whtqjsVAQ7ESplCnqtx86Gg11cQ/E53f4uPI+PHtP05ibWXDoc7UCR7
	dLmk3r7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAQ-000000051fu-1wpJ;
	Thu, 14 May 2026 09:15:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAN-000000051d5-0K1w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:15:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c796163fac5so5696498a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750138; x=1779354938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=;
        b=kaSmagabwIpii4XO/kRKqVZAeeZRZgiJyKLzPMoJAjpASPgh1wLXfdQvDo/gud4CyO
         K+C4U2GNstg4bMzLTFhZ2u9o1JmgMpyQ/nUE9uPoc/IfWpX3VZY6ZhK7q8XCzBm4HwMS
         i1/f2FdL/slb53Q1c8b47zCR1VneS6J/UvP3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750138; x=1779354938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBS4pHrWZh5zW1dpIqvZt6J/ekuV9I8As0i9cfGXl7s=;
        b=A07FSU4MVSrOrZqG9FzHy/3uj2gL9W1YMBVkeJk3Z6zTiRK8bOx7Gux+90N16PZzu3
         +wrA2TrnMV1gH5+xMAgoyXDwrQ8alrZ4WY4kDFUOKk4B8y9T8NZfYN4+M12HTTCIe+LU
         8yPAHonjBz64iYdhpFeXSv/I8wmbq7KQddH39N4PVWsPUZoBNHEnhWbzPX0sKIc4P4sh
         7kS1L3AWo91nzbeKLcaCeHyXobrQJugWBQuzlvEolN7wWfkaRpAamzQhWnfK4RXmw/Yk
         S6taxq04Z2rIZDyrWvXHcGNvJ9X88r3axmNC9px5B4m2sCA+0mDUcm+mlyWCmHkg4Eph
         93XA==
X-Forwarded-Encrypted: i=1; AFNElJ+c6FFVxbCuyrJTLTGPWgZwCfkpaRom/xXQKaImz+BJmrNM9Y4rZvAdUjzwzuXFdONuQPBRz8ZDftxWBmi76HOY@lists.infradead.org
X-Gm-Message-State: AOJu0YxgUdJNXgjBTPJ3aP+XIX7gj+o0p33VDgTGDb3zpliPdU1vrQla
	alNlXTfISzPmOaZPfdd/TzEfcWsH8YsgXJe9NQ29D3ry/U2ZgvsNeCZHsgz338Oy0Q==
X-Gm-Gg: Acq92OHwXgoIG2iyHrTqtgTt5+bjba/mlnWmp0z0cj2advOcAqvoDZ049BrKff1NgKt
	XXYW5gYYKz1kEOKy7EQ7MQB040uQ/EMOc2z+eQmJ9etYWrx7XH1jsT4bpoxoZlwA3GkTHNoXvyP
	NooDB+YZarwNsX9L1Nf2LcJsYEDWIqdzQ+4u/qWOFl7Nh0EwPDv3ddp7KXA+iYvBG15WzATbIvQ
	kuJq6XLMSKgKSA010XgwbuXYMy2uc1WBTBKL9gzGTI+8uTukyG/f0ES/av+IcYn95jPTEcIdS9w
	FZW5WwNaDvggtQu/6YbUU0ZnXlg6w8dq1utATqSLJ7ugBb696kO4AJkxvcttAsCYCUqCmdBi1Cc
	k+8iUfxpX0377PtqJSkLTNeeO/TDw+lQQCTbKt8APK2lWLAD4JyB+8+bIOmB+xvAuQCocpGG3Xt
	UAlsdaY0iciKSQU6rMRZw7gEsyy7Ds3Md3vd/ITLtLQGVl7vJ3uH2PPdvWjAnfoQOwhJx6lI7O0
	bYLPO2sqQm7FluBP2k=
X-Received: by 2002:a05:6a20:728a:b0:3a2:ccb5:abc7 with SMTP id adf61e73a8af0-3af809790b7mr7760536637.13.1778750138225;
        Thu, 14 May 2026 02:15:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:37 -0700 (PDT)
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
Subject: [PATCH v4 1/6] mfd: dt-bindings: mt6397: Add regulator supplies
Date: Thu, 14 May 2026 17:15:14 +0800
Message-ID: <20260514091520.2718987-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021539_110771_088F5FA5 
X-CRM114-Status: GOOD (  13.39  )
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

Changes since v3:
- Dropped duplicate 'va09' from 'vsys-ldo2-supply' (Sashiko)

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
index 05c121b0cb3d..ecdc77fafaf4 100644
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
+          description: Supply for LDOs vaux18, vbif28, vxo22, vrfck, vrfck_1,
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


