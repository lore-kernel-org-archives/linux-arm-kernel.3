Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mS7Fsq/iJChdO1hpwr/l2Vg7F3ujEn9sQyPNvayGzFE=; b=HiL4v8zXVzuwyf6bKY9ELvpZuW
	3MWlPEthQaTgX+qqSXCIw9DOPQ4sgMuEgJyLBQ1xso8lsMifwL/ApbFr+vBMhEljzseVhac9WxU8s
	JCVRyCIBGHLikKDTRwltN7D7bolr6sxZs9m3RoG729kHR0JxfCe7xFHUg++xW07a5ea0swj5lE9U3
	qjIOSU1psIzAiRJWvHbReFI7DifUcMbVNZY+h/+mxVuamOsur9gwzeEBsj00Jw35e6dUuWZ13ItAi
	WskqvXSnOxl+R4gdAtmh3TuKRtaeVZJBnPy5iTG8zG1CsIxaic6osUtJctENUAkQ+lhe4LiUENSXp
	sdQjwXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd8p-00000006xI7-3zdC;
	Fri, 03 Jul 2026 12:37:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd8o-00000006xHV-1okp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jul 2026 12:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mS7Fsq/iJChdO1hpwr/l2Vg7F3ujEn9sQyPNvayGzFE=; b=el5akIhKNB/33egNSNeus4u32b
	qm80F2gjF8It+8aIN1z2fEE+O9KcAlNjyZVce9vzrMiWA8IoQXuo8AkkPt/3JjGto3txZcEOnSvqJ
	7Ix2zpFbuDMhNFLm/MTHQm5YNbkU6ZYLZTiredKgn0uT3Affp0l9fwbyUKXCGYBaA+Db0gaME1Qxy
	FJDrPF1C8fKYh9igvc3W2KpElp34EJkUBtBi3f81VTJFbFcW56RSRTNzun+T2QEHrudBXIDlCfi5G
	uz0eUhzVqQQJHlYMHW0WxxHU6lYBEFxLGr8ksIIURN8buhqCF/ZozjQCPtmP3YO4Z2UOt0183kxVj
	cGOFWAZA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfd8l-00000004ot1-1on8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:37:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BE7F464B;
	Fri,  3 Jul 2026 05:36:44 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B00493F905;
	Fri,  3 Jul 2026 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082208; bh=9vZoBgzFE2THNFE8s+a0rg1bPJg4MV54NAwQFcIi1xY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vmLr0bc8rixPDm3Bhskx0gu1HYDr9nHMWteRfb195hI+99jFudJIj5q8nDU1l/qqu
	 dOMD23rIRgtBlgIHctGwU/c/aLhdyFuMkuCIrYJ1nmmuUK8RGqqkbHReIDlULcDJCd
	 61Q+PDpJFnR80HDpKHr3XF0DpdIAuMtDZnh9py+Q=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
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
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 05/23] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Fri,  3 Jul 2026 13:35:43 +0100
Message-ID: <20260703123601.381275-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133707_696663_99160035 
X-CRM114-Status: UNSURE (   7.64  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


