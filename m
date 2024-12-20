Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563DEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2r054HjWrz6SG4prpVPiiYe71n6RO8+qtINI2M8+4Y=; b=FfzxhY/4BJlTKgB6cYIq2pyjWs
	Qfjo2GQ6yvKv6c7b+RiS15ZfjB1hQ+ORr1JhuLNDHrDOMPm6G56bPya40PVhYwJRB9toAHqXZpeYF
	SemdoKwP4qR9oQ6yENI1TxyLPl46lzXYlxYme4P0w0dHPf/e6wwIuiI85POOnv4xgChWUjt1XWfYe
	Mgsg51zSoGoxWsh+vCn6Fk1D2w5w8sNQfIVhY1tQzyIgF4dDzlJ4yeM3Es9VRkrIblx7oJdnvS6JO
	uvZFjd7t15iSdVB4iZbPhytKFN2/G24jmJU8L867kpye0WI7YEsV04l0yxPXfAS6Wyof5s/Y8/SI1
	lY8uXrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe4y-000000059cM-1QUB;
	Fri, 20 Dec 2024 14:34:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe3n-000000059RU-31f0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:33:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1156810f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705178; x=1735309978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2r054HjWrz6SG4prpVPiiYe71n6RO8+qtINI2M8+4Y=;
        b=NM4YUnmVMZ0evi44yVw+HgD2og2d2bK1KVUuJhfQ+gYr+9icPphVIilZxGmZ2GUhtj
         JMudHz8HoS2vY3TQxSuaVJ0ATttEDf4J84lTS7Hz85iTj7qO7a9k/gsMlwmC6+hIuFqf
         UoOUdzl97q59uUFKL577hp+5yonOUj2eAvZYobC594YZftMEmWrO+r+YR2ifONWd3Etq
         OLbMag9TCRRSdMy5yX8ax9Oycx76Mir8RYOTOsc9Va2yLHH1NqV1yfXH+2bw3EZbxIrj
         OIXRqf6eCaqpLJ3dmcvWl0O9f/8Eg+0rLuDUHGVsZNWEUengg5CU1TG+Qpw837AbSA2V
         OLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705178; x=1735309978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2r054HjWrz6SG4prpVPiiYe71n6RO8+qtINI2M8+4Y=;
        b=onsB1GW//GS5tpzQWxA+q5tSGF+gn03GNe/c/vQOb5Aik1eN5bBth4xXHrPdGIkbq3
         clfmPmBGXbbpS+rj0CfsHTWAwFqknSp/4d1VBU5dpHIlJvT+/9nziMW0PWH3DsvGR9Ci
         BTwVm6LBM8uIBHpoednTmPzH9XXWyzCbwHtUdCIffk5P0ZTyDqsUyEA/wT4XfT4zzlib
         iAq9kIh3SyCoynz4tc4OxyCDuxNTUYGBpv7D8AK5ICYMZ7X03J3VS2524qvdPddw7ucj
         iAPyAEiDydWd2ZSm/NMCNyXWjWnZGYJuDPv10xhKOtpP6ZxUM0vJYoQORMtHtLTWlamy
         z7ng==
X-Forwarded-Encrypted: i=1; AJvYcCUiaZJzVGaRnIRBLv7m+7T+Q8IxMajY1CEoTENjKu7kvjShtNJc2T4WPU/rw11eHkfffI60SStAK2vxIepz1S1O@lists.infradead.org
X-Gm-Message-State: AOJu0YwntUtPT8jiR6vDbPwD2YTs6beL+2oQKC81R1f8p3kVjyQdrqn9
	Rgqc59V0U+ciR8T9w/dEHB/yKkOdBSb9kVmsGptuHJuM0pGzlf5EftvTKQZpVP8=
X-Gm-Gg: ASbGncsnJ2xDMn5puYLuZdZuBH3f20gNgb/1hr0I5CL6siuZYDpxKiik9E6C6O+fN1O
	QaH1CIrewnY9lboQLAlhtK4IyAXhAFd8ZwCEvob8YQmK5nOKxTmQ/urLBu81vvIh4N5NLN6Q3EK
	ugD4stpktkumjjsh+nLTPmst3nvdXKEp/dDu/mv/H9h8c9fOmYv6WTX5gWCx6TXKDJY/iIwAg44
	1pwKstDTs4KQIhipksCEhGd2c7EkxV4tJCbcVwVwTZ28OTq5ubaDXU4sWXiNqhUuLwcuyO5Y7vq
	zaoYgIIvEznl9pAZ3yP9XYFAwQGk0k+pAz5W
X-Google-Smtp-Source: AGHT+IFWUL89s9MPTN9RXW3xpCsH1N6q7qhnMGREc6l90xzRqvJXMu91tZEs3D1ocnJ+h0j+U7pNvA==
X-Received: by 2002:a5d:64e5:0:b0:385:fb56:fb73 with SMTP id ffacd0b85a97d-38a221f9bfcmr3230824f8f.15.1734705178353;
        Fri, 20 Dec 2024 06:32:58 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm4140321f8f.15.2024.12.20.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:32:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:32:51 +0000
Subject: [PATCH v5 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-v5-1-4f26b7fb3f5f@linaro.org>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
In-Reply-To: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705176; l=2055;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qcWsBmv/JznSww/eNk8qMIS4BDY5s6ZxLb3tuX2AP68=;
 b=k6t57kS4DnX5YnkmyuPdrCI2QT0B4i9671oVZXLt08rpfaAoStKPubIknxG27HXNIJcuocPwW
 r5wzeZ3Vv2kCHbe66cWirfqLNqM9gGXrPXXr5KLwnP4ewEGFR4M+tUN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063259_767502_F6E2C6AA 
X-CRM114-Status: GOOD (  13.07  )
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

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
new file mode 100644
index 000000000000..982cb8d62011
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM mailbox protocol
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  ACPM (Alive Clock and Power Manager) is a firmware that operates on the
+  APM (Active Power Management) module that handles overall power management
+  activities. ACPM and masters regard each other as independent hardware
+  component and communicate with each other using mailbox messages and
+  shared memory.
+
+  This binding is intended to define the interface the firmware implementing
+  ACPM provides for OSPM in the device tree.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+
+additionalProperties: false
+
+examples:
+  - |
+    power-management {
+        compatible = "google,gs101-acpm-ipc";
+        mboxes = <&ap2apm_mailbox>;
+        shmem = <&apm_sram>;
+    };

-- 
2.47.1.613.gc27f4b7a9f-goog


