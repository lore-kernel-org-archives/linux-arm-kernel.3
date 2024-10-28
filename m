Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AADD1359D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PekauWYBrOqDyFveGaulB0FPkdkw+8aISjFwzGvH7MY=; b=NvoXX/htmr+ZVKVXsmFIEptzf/
	K+KXhHPaym1frJYCmZp37cb9OQd/jsicKL9MSp7S+x7MlBYMmvwpXVHPavyyXMQildoQp2gtw2uPN
	SaoPQ63LE/8QOYG9FDFBo8n74H8/K6dA4tYdSfQShFsfAloo7ZbCTCj+l3n5smJgS6TD3W+4nE6Dp
	C4F22nPx/TTtaQPB/FIH7yyNCJ3uiv3w4pGxUtmAZS7SrtzwKYUY5vVuONKJVN2fgbybqGCPlg493
	H8LBKpA4NLpHlDC/OOTDHSuQlgklCV1E3ooDMwvuooExjrWGSEN+a9dAbqvDivZNB85BorEHWYn/G
	St6mpqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OYG-0000000Agji-1H92;
	Mon, 28 Oct 2024 12:08:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ORp-0000000Af10-3TaR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 12:02:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 137ED497;
	Mon, 28 Oct 2024 05:02:43 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 499FA3F73B;
	Mon, 28 Oct 2024 05:02:11 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	dan.carpenter@linaro.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/7] dt-bindings: firmware: arm,scmi: Introduce more transport properties
Date: Mon, 28 Oct 2024 12:01:47 +0000
Message-ID: <20241028120151.1301177-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028120151.1301177-1-cristian.marussi@arm.com>
References: <20241028120151.1301177-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_050213_930746_004E74CF 
X-CRM114-Status: UNSURE (   9.50  )
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

Depending on specific hardware and firmware design choices, it may be
possible for different platforms to end up having different requirements
regarding the same transport characteristics.

Introduce max-msg-size and max-msg properties to describe such platform
specific transport constraints, since they cannot be discovered otherwise.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Cc: devicetree@vger.kernel.org
---
v1 --> v2
- added vendor prefix
- dropped warnings about resonable minimum max-msg-size
- clarified the intended usage of max-msg
- fixed Cc to include all maintainers and using correct e-mails
---
 .../devicetree/bindings/firmware/arm,scmi.yaml    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 54d7d11bfed4..9d6e1147f9e9 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -131,6 +131,21 @@ properties:
       be a non-zero value if set.
     minimum: 1
 
+  arm,max-msg-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      An optional value, expressed in bytes, representing the maximum size
+      allowed for the payload of messages transmitted on this transport.
+
+  arm,max-msg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      An optional value representing the maximum number of concurrent in-flight
+      messages allowed by this transport; this number represents the maximum
+      number of concurrently outstanding messages that the server can handle on
+      this platform. If set, the value should be non-zero.
+    minimum: 1
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.47.0


