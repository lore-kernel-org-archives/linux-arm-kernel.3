Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B8AD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kjaoDHO/Cxmm9XfSkRfXuiq2XlHBj2nIJAqnJTFngw=; b=Wiree5Z/ia3NfFuNLtwFERzPSS
	wwWVX9bmKSKQexjCi9N6iTjCRZDgomzHpvR6/MwW+QMjetkK5fg1AYSUWXwlP5t9Af+TFrelezXKa
	oq5R3PuhHPGKoSgSx005lrYqfWeZILpZ5fjFYzVFUMqkyMwejPDf0y3KLW1KPauTG+8dZO8iacrtc
	dqEwhCC60qnOCzifu/YVlTfmeOhusL2TsbjpedJAnLh+lMgFaxX3AvvsD/qRjHBX2HVvS5EyBLXAE
	MIsXR5cvwmy9GP3elxvJijpDVBm7L+pdt+TZEBpqwAGveIBjPHcKE3RdzeAjL5J1sp7LTzQzuSE4f
	pSNbsoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N3H-0000000APZ7-246F;
	Mon, 28 Oct 2024 10:32:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mwy-0000000AOOR-1iN7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:26:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9a0f198d38so597889566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111174; x=1730715974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kjaoDHO/Cxmm9XfSkRfXuiq2XlHBj2nIJAqnJTFngw=;
        b=UjYbjhDMOdEQ40DjNx6h9IYH87G87KIie/uM2dJOT8bzeDkG2Wm1Jw5nuyKFBZomq0
         9BL4d52pruaar5Pf+K3v3c6wy0PQzfe4WM8G2Oy5g8zZXXJ64JUxWxfMlpVNuAuXzOKf
         NwsJHldCUwmexxhpQ9THjAP5PDb+4jsAzCg9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111174; x=1730715974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kjaoDHO/Cxmm9XfSkRfXuiq2XlHBj2nIJAqnJTFngw=;
        b=Z9aTXnPv0/rnV4KibOMeH9QPyrsF2YUU34IaeXr8Oj8QLscb5+5anCdAi9xT8L0n5x
         wXHi0H+OqGVmPYWmmVv8dHMkAxmKKNZJVmq20cpT9f0EucspN1eCOnT2E0WSFKt0EkGa
         U8s2zsBsgcETcR3pXyEGK2gr33xJ7NcYmLwVM85EEix90AJ0BH5tZhkUCZ5Bb+NyckuD
         iJxSj5bWV1xv+u/ao6TGSHXxWq4ii6ArRnCRi2VECyz2RXqUtwfRjv63GlUiCQbk5BDh
         7U3eCG+HEbNKoPpuuMLRv3SflK4J5EPSyP28JKhzVIdFMk10SLkqNWXuWcNIilvM4QHn
         KMgw==
X-Forwarded-Encrypted: i=1; AJvYcCUCSjKyp4VxhfuWWBr9Qy/LGH3pO0c3wmBdFsfmSpjF+davKM2uk9F8Lw5qhpdNNfaJvd69m27rtRNy3kOqIHFT@lists.infradead.org
X-Gm-Message-State: AOJu0YwfZXDPxFaMi0K5Gr2/WHt0v61JXQklGaAs3UWqfbo1735y6vS7
	I3p7M9i+4xeyP856PwzBsUaWYYaoCBG7z0q8Koph8tRnqEULnQ4DvijYB9Yfw/s=
X-Google-Smtp-Source: AGHT+IEYNCvHyI4Ub76KdqemIzRCqERBXA/yyqTx2llDK0lvcsPc5x2y/hbBEKlGhDYQLy/s0WjfIA==
X-Received: by 2002:a17:907:9721:b0:a99:89bd:d84a with SMTP id a640c23a62f3a-a9de5ee107dmr668398566b.25.1730111174240;
        Mon, 28 Oct 2024 03:26:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 03/10] dt-bindings: power: gpcv2: add 'fsl,boot-on' property
Date: Mon, 28 Oct 2024 11:25:26 +0100
Message-ID: <20241028102559.1451383-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032616_468675_6EAEFDA0 
X-CRM114-Status: GOOD (  10.21  )
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

The property states that the power-domain has been initialized and left
on by the bootloader/firmware. This information becomes relevant, for
example, in the case of supporting the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
index dfdb8dfb6b65..718196f516ad 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml
@@ -94,6 +94,12 @@ properties:
             minItems: 1
             maxItems: 4
 
+          fsl,boot-on:
+            description: |
+              The power-domain has been initialized and left on  by the
+              bootloader/firmware.
+            type: boolean
+
         required:
           - '#power-domain-cells'
           - reg
-- 
2.43.0


