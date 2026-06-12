Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01069CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29YHbnVIINleFAXxl0FZsraRkhyjeKDM4aHsLVhZjAI=; b=1JwLzv2/2WkaouRjBrKSKmjMvI
	2u7zV69hKrSgjga/ZeSEDxK9dIkgd0xgLhdnQGgKIdN5ew7081BotCQDxlIcoDiOer+cAfXtM0ne+
	yYVNWNt8Dv3HP5SVR56CS+RMrkuOXFroLflhjjgnhY8ZA/uJT+HkL7uTnfeP5tR56PSmSECmCrH4H
	OpawK2AcXxZ/JSoBUVb/Vm0HKILTaqQTKibjtQ+aH4stBsYt2JhX8NyZWVlI0/OndpyKwx55bxada
	kC8kECqyShGvjSngYPKgSxTe43bisZGtlWMWfNeygj2u5vMMsidD0xt44iN4+xEKYNQjXNnXj63Va
	ezaSQeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAWo-0000000Bfpk-0NKM;
	Fri, 12 Jun 2026 22:39:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAWj-0000000Bfle-2lZq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:39:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E20BD4A0B;
	Fri, 12 Jun 2026 15:38:55 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52F3F3FB7F;
	Fri, 12 Jun 2026 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781303940; bh=cVc2hy2A9f/wwW+jo28hnzjxf9i6e0XD+OrMlXPpgB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XoBBA4gb22woOFFqLugh1xWe71wO756b3n6XJsSeVBj5nr9j2yAQhxQ+fkXToDYEf
	 rJ6rloMQgVvX28cWGXYylpznfDzmpCMquNoCNR2UjMo3m2MLHkFgJAIAG3LzqhZHUN
	 knUudm2Wwa2c9flcD4XLVizl45ex+CrwVbr5+be0=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 06/31] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Fri, 12 Jun 2026 23:37:36 +0100
Message-ID: <20260612223802.1337232-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_153901_742215_5C117133 
X-CRM114-Status: UNSURE (   7.51  )
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

Add new SCMI v4.0 Telemetry protocol bindings definitions.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - changed protocol number to lowercase 1b
 - fixed misplaced block for protocol 0x1b

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index d06cca9273c4..be733f8d60a0 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -324,6 +324,14 @@ properties:
     required:
       - reg
 
+  protocol@1b:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x1b
+
 unevaluatedProperties: false
 
 $defs:
-- 
2.54.0


