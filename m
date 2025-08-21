Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849ADCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=; b=pEjWzh1wpN6HLAhRmJtvtokO6M
	GR52pvWp2tz1H1HNLJXBLFTd1GhI9DS15nPz4M5S41gVLO0ITh2XrIJYIhyyoGs6rbSlpuEUIsgPy
	7FHyAuscVX3vwY4YzzFwrsd61W//8X5GkiSCK/2JKtuzXQynk1+mPnoX8JMXEtoWSEH+0lgVGzJ9E
	Qo4ln6z6suFbRnKo+zPKHtuZMA7ZoT1IOmHMPz+2HJDYaMPd/8tVpRnpyHQkf7+jM8T6VTPxnbR/V
	u3Ra6c5t9E2znFg6XojuwpgUO1i9h9ND1CCb/4zVx/XaCiNDjSgWpd5L4Q15VbAWHySLoTDKKs6kV
	ah7pi3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Xd-0000000Gc4A-1Ak3;
	Thu, 21 Aug 2025 10:29:09 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0hP-0000000GG6E-005V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:31:08 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7322aa0so7841566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765065; x=1756369865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=;
        b=NrQMSgV9RFHD63NO+zej8sxgNHmWvN335ZqNPSXpNONoq0NTBHaX2Qb2jXZvPgv31l
         NqIrG12XIoNureLIdqI2Vob70BGFWAPXwszN01D01huXlRVeYWEba1PjEs0RG9iY2Rvp
         99Zw2JZXGUR2GAhsx0pts/yaDFPgJIeRj+8LwOTMXypBiREwzl/rOj2g8rMLv8iyqOir
         3tsezEsxeK1gnxRhJd6m21Qng8y6qFYn2KZRUHgA0AKaDdg/cF7S6GYkvkwzFksfGN+w
         l6uzFi01HLX0kwahQmTLWdK3P6aKRSdG81vv/i6/tbxSFz09pXu1JM/D4abvvZO+Dicn
         n52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765065; x=1756369865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=;
        b=FK5B+z38NZQ4bA4fL7bM90fAbbu0H4ZT+94TyUCXkxcRKyze7vqLjLyjNSbqZvOtie
         hlxGT1x9oIrDBiJvzPyQR8kiRFhAF761c+hN3klX5aPiN/Js8XplM2B/aqqJZuMscmJC
         LASPHkYFvlPr3ps5917jGD9F600rTXIV+9zMCQHq0fI+lgDlGxNcOht8FsTZV02+ofGz
         pRG7NRUzX42yQMBOM67bLiJW+zU6ISGBQVLAIb+n/dfV/eCEkLsYcyNjH7DCdjabKN1A
         CefaJZuGL+cJGSluZrqvavQ3opAaqjvLb5opw6AxhIlEjXxiRT/cEtF4dDSPwodMBEA1
         MaIA==
X-Forwarded-Encrypted: i=1; AJvYcCVzdVfgEmeJ/9JNBCjyZko56ZPp/ghHp/3VqMXvhudt71Q9UYMPI8oxcLpwxCJfVMnCo1faFD0Gts+xi0ls7Kj5@lists.infradead.org
X-Gm-Message-State: AOJu0YxpmvHxug8bBvPA79JOcaVfDOf7h5N44n0RPjP6A63TjDNsHu2N
	o647wz+hYTNaG6lmiyeYS2NnaOylR+8U2ZdVSxVWS/VAzIONZVccjEECX4xPNIRzbrQ=
X-Gm-Gg: ASbGncvkpaBHisiAxHnZ9HZN4SRql8EYhGWtuAzBlWiRKCQC+l0EzS7R6j3wOiYk7b6
	5w3xrGlR7JaOK/iFzV9vrha3G42jSXL6ESZ5Jb5mkMR6vXxoGxg2ygzDTtUhxmQlWfc5aOgO/VR
	vsylxTEDvy0cJb1ljMhFm0FZSqbdKPvj1830iyq8QAssNDvtDNvYb59rujvqQcv7TWIvy4Mbw+Z
	d0/6VMI32HJkA10qpTC1T9+SgHsTmmS/ewEtQF2W50M7m1BPOqB32CcDvJ7+vs4QzczPmlk3h5Y
	KQAW/qzgw/SjSDxv5DCBatvwr4NqjE/l+sBuh6EdZcZVc95MsGf1GKXDPGhJHqMW4sozTfmfiiy
	Mraf9sviq4l9deGAy3HJV4CPvSgIfpd9jLg==
X-Google-Smtp-Source: AGHT+IFNk/pJFnDs4lRHPJnbj+R0+UoDvHoNWBUQnniqvKfqWInUDOjeDP+OKC+piYhF74oUFSgD6Q==
X-Received: by 2002:a17:907:972a:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-afe079e2116mr74283566b.3.1755765065406;
        Thu, 21 Aug 2025 01:31:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2fc568sm346436166b.38.2025.08.21.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:31:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:31:01 +0200
Message-ID: <20250821083100.46340-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=iqqc9H3kVGDEO4owcMh77Y6V/4jzKjChKYZ4/hBrnt4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptlEzToO3Ku+DKnz2vaPiN1ssj2RVk8DjRQKc
 Qtcz+MExfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZRAAKCRDBN2bmhouD
 1/4tEACNYir9uMarV45GanTEgmnE4LFISWmgKJwbLjhiKVj51LWYivtWPj6mF04MOvmQ/0uO4oC
 eZoanmeV9/UPVaCWfsvGdXfIwkF8G3ezVQSCFHL8s/VzedE9HUpJUqTU50rc9jZtZKhZ4ACtsr9
 Ci2yCUbRSaoDyloZXA5YI0ImHjPi8QXHCa4TJQnoQPrIiTUw8QupgbCttoCDPzrcZWBpsjb7EIq
 aKun5PQRfFRYgBN1V6bl6v+1XG8GLHEfxnvFMEF9Hd5ve561qriEMBuzC3tYaSmfaAr0KTMgJOc
 YKJr6lmLHAPCZcbiIpVDFAx8/dtmHvuayFfFjuFmf321cHCUYfdAvLR66Fe8hfBpeI/xEOEBDCj
 7bB6b4sPJLZRCH9KSRHud0IaFOZGC6bukzBRVc95w0EqFIYgpcIDzA9mq/GIfUSnKSj4XWFqlBm
 DRmXsOAnThbF2L5ZDfaux9b2woTITUBSKUwcSCEYiQqNJlyBkja4nfOJ1rQfvIC8WqEu69gV8Ku
 +hCx1Dx6/lkn0FJwJs2hDLlRczw//7mZonnGXjdaEWslBwqK0bAGEspxUG9wwEDfMtYjJHRQzWy
 ovcuxx5q9cnEdPmVYf89/0u7owD8QmBimSmPtg+UCWVkkDMeYcatGhMRTur/sdy4OZU/I9uri1D Q1A603HnLHhssWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013107_037383_1183B384 
X-CRM114-Status: GOOD (  11.87  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/fsl,easrc.yaml    | 2 +-
 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index 8f1108e7e14e..d5727f8bfb0b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -104,6 +104,6 @@ examples:
                     "ctx2_rx", "ctx2_tx",
                     "ctx3_rx", "ctx3_tx";
         firmware-name = "imx/easrc/easrc-imx8mn.bin";
-        fsl,asrc-rate  = <8000>;
+        fsl,asrc-rate = <8000>;
         fsl,asrc-format = <2>;
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index 85799f83e65f..c9152bac7421 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -176,7 +176,7 @@ examples:
                <&sdma 20 23 1>, <&sdma 21 23 1>, <&sdma 22 23 1>;
         dma-names = "rxa", "rxb", "rxc",
                     "txa", "txb", "txc";
-        fsl,asrc-rate  = <48000>;
+        fsl,asrc-rate = <48000>;
         fsl,asrc-width = <16>;
 
         port {
-- 
2.48.1


