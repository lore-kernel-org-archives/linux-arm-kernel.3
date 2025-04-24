Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874B7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UEu5ZzgQoIbj2nEACS31q52k6ad3AHbKAZTQ1reR+A=; b=aUaR6dIDCayTyEdPBGtvTIrtEG
	rm+KRpdpb98y6bC+uqKMKvkTlwp/iXvKFTT/PpZaN4NC4nHT3Hy7x4L6gZonE33zRqcxkMH8JTk18
	O70PBlMKX/C/vQ/ygwGM16qxL0zZjY0l4gNz9O0srAG0GbE46uebks7m/GJMtkHQ9z0lptfkk1P0e
	Hy7QpsaYZTSkJ/TS0YnEwiCL+833Blw+kWhYWn52BlbNEWkMh1zmmR+w1DVrwNPSwQayUJX2zRhpZ
	AyvtcwGjNE89c64HyBVNZ9g9MAkjY0lwkCqaEEcKR9VUBFi+CmtBYctYOZRHFzhwQXrEnIpSifN9d
	Ca3l/0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5B-0000000Ed6e-3N39;
	Thu, 24 Apr 2025 16:05:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xKw-0000000EKgC-47LC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:00 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1647981f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504037; x=1746108837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UEu5ZzgQoIbj2nEACS31q52k6ad3AHbKAZTQ1reR+A=;
        b=C67Q5Z7HyWa7tFgJlbag5soH2BycnSHWjPzslFmBL8dpVOR3c+/7Zcu3qGW3o/8+o/
         Bl4jrrgVeCBc4pPFl16MCMtS0qhGdVXAIvZVt12Jq+6XncAm7wInQQWvA51INX4uVKHG
         62BRGuXZI5cw2EDFFMCrAqRCmhX28+GkJrXoIFLuPkr5XPu3KdQds3NM1ATkcLGrTDf9
         5g8KlKOEX68+uvY4iTkLGbqZAxds5Eot8faALJzmEPEK5Jo3IsMxHC7kxSHmouBJslcD
         4VmhXSCSOpe6Re2HbKJGHk71y1NhQjYpp2wG+P0Cm79key+3fht/1sWG222dVzhedKyz
         KOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504037; x=1746108837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UEu5ZzgQoIbj2nEACS31q52k6ad3AHbKAZTQ1reR+A=;
        b=VQFgHMzdI4VKUGTx2IO63NxX8cBXGfxtprS2ecX36UruwTdDm4icIe7jPWgzx6P3r9
         Q87fvzLsds7/4HN52FJGn6YQvESUbjwuvvNQYAI/v6igS3Zl+qA47KDYry7Q9GWAOh0C
         zMCfCjaI7fNCtQTzkmzwhsnnc4Zvannt/2sb9E7xOyMKvwcRuLYJ226hKEQ5r/zctJEw
         8guu8tkFZcSw6aZSqvYYhEhl6AecD32UnxbAgySRtyTzMEO8uQBa4GZbRELPrXxTdChn
         1W4hMnHEdnAFxu8y1KYF8TcudWGyC6p2lJ/XipCfm3JazG+5ZNJpB67xHWXPwOqxbuEq
         tJhw==
X-Forwarded-Encrypted: i=1; AJvYcCVqf0DxNUy1glX7of6CU2yXDutWKuqCkjJRjDXlLNmhpJgpgwNhmUetD3mKAS0ds28w3CEgl3yM3mvLSR20sJFm@lists.infradead.org
X-Gm-Message-State: AOJu0YzMOkR8Ovsx0b7wuQt+q/PKXpwzgzMSeW0yFi/Byrj3WGSUa8yz
	34V2Qe00Fyo0GrW/1VZ66fo/46jtWptmVCmrZcu4u86UmdpPplu7ZoKJ8Gh95r0=
X-Gm-Gg: ASbGncuvD3m4x1QdIb1gaaa+vzV2VYY6hCJ8/zhRbaB8NIsSbyA9n7/8y5t1jrtOMOh
	mZBimFonshGt7F6QdrjNZn8MSS2tQBS8J0zi5eUHevw92zx9hRSSAFFeIXbJNXCUVYwwVf13oXw
	S/M57uHda3f2vtrx+mptZJjK6deScGXuQsZ7CQYeT6qbbSFWISiO5kbbsF0efaGYa5A6JisErwZ
	eKANIaiVbK8eKHWyH4WWpYBtC6Zmn1k/gX2px79KWNFjWmGm0Hy8cipx6uQCIOFyQyWNce7Jkpk
	yolJFr9pHSDouGHZBywwQZ3afgq28HebNcjcqHrD7BKLtgDDsG2zL+YN0RB5U/qdJoeEvy5XlLI
	zpmCmIYqezhb3ZaxC
X-Google-Smtp-Source: AGHT+IGbR1o2FMJriTxMh0pqGyENTmZYeFEOhlcuDYlWi636WYjhDM2clZgLdfLT+7JHm7l12d/JYg==
X-Received: by 2002:a05:6000:22c4:b0:3a0:3d18:285 with SMTP id ffacd0b85a97d-3a06d6dd54emr2218203f8f.25.1745504036794;
        Thu, 24 Apr 2025 07:13:56 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:56 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 09/34] dt-bindings: Add binding for gunyah hypervisor
Date: Thu, 24 Apr 2025 15:13:16 +0100
Message-Id: <20250424141341.841734-10-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071359_018953_E08A8052 
X-CRM114-Status: GOOD (  17.08  )
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

From: Elliot Berman <quic_eberman@quicinc.com>

The Gunyah Resource Manager applies a devicetree overlay describing the
virtual platform configuration of the guest VM, such as the message
queue capability IDs for communicating with the Resource Manager. This
information is not otherwise discoverable by a VM: the Gunyah hypervisor
core does not provide a direct interface to discover capability IDs nor
a way to communicate with RM without having already known the
corresponding message queue capability ID. Add the DT bindings that
Gunyah adheres for the hypervisor node and message queues.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 .../bindings/firmware/gunyah-hypervisor.yaml  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml

diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
new file mode 100644
index 000000000000..cdeb4885a807
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gunyah Hypervisor
+
+maintainers:
+  - Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
+  - Elliot Berman <quic_eberman@quicinc.com>
+
+description: |+
+  Gunyah virtual machines use this information to determine the capability IDs
+  of the message queues used to communicate with the Gunyah Resource Manager.
+  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
+
+properties:
+  compatible:
+    const: gunyah-hypervisor
+
+  "#address-cells":
+    description: Number of cells needed to represent 64-bit capability IDs.
+    const: 2
+
+  "#size-cells":
+    description: must be 0, because capability IDs are not memory address
+                  ranges and do not have a size.
+    const: 0
+
+patternProperties:
+  "^gunyah-resource-mgr(@.*)?":
+    type: object
+    description:
+      Resource Manager node which is required to communicate to Resource
+      Manager VM using Gunyah Message Queues.
+
+    properties:
+      compatible:
+        const: gunyah-resource-manager
+
+      reg:
+        items:
+          - description: Gunyah capability ID of the TX message queue
+          - description: Gunyah capability ID of the RX message queue
+
+      interrupts:
+        items:
+          - description: Interrupt for the TX message queue
+          - description: Interrupt for the RX message queue
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    hypervisor {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "gunyah-hypervisor";
+
+        gunyah-resource-mgr@0 {
+            compatible = "gunyah-resource-manager";
+            interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>, /* TX allowed IRQ */
+                         <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>; /* RX requested IRQ */
+            reg = <0x00000000 0x00000000>, /* TX capability ID */
+                  <0x00000000 0x00000001>; /* RX capability ID */
+        };
+    };
-- 
2.39.5


