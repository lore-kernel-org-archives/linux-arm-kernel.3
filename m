Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3756BF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVdEa2O3W6ItySO9N9hc66bFzy465rh1UCfSVdZChiM=; b=ESI055SH3Eb+Q0PuRlgi7hrf07
	2VB+6BwppP2gbCO2Rupz7B67nfHRwsjYaHd9qKF/4FgUyox4cJmb2jhSkg20f25cKQmsffCurgIH3
	jWg79FAiU6eBqybR7Fo2FP3VlzAT/DGCZ+UqB7Qg4a9LFfF5DvaI/QsrSjZePyiythOWH2+38S7Rb
	tRvR0Rb4JgPWQaIK2Xb84PwRlgeTbKq+i12ovX9IdZRbtOrQwHkKRcMdGOUNLoyD+S2MHpibeIvIC
	e2ryYZ+R5PBg1/997KvQSDXJtGWIxoLIaBJS9aWY5DPoJSwjYh26PhiSCWDxrKRghahQVKg6/KigA
	RnVN2yog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t66-0000000A828-0B0j;
	Sun, 29 Mar 2026 16:34:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t5u-0000000A7vI-2Bo5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:34:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DC403627;
	Sun, 29 Mar 2026 09:34:27 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD4C43F915;
	Sun, 29 Mar 2026 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802073; bh=EakhYDLwrbVeeuChZm85Sn7ds6ALCpPX+l9htovldF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n8X6EKHq4XQo/QrZWa89FFZyTyffgKDG99X+HsABeYMg/BXyXPIbtaxJwj3ss0pCi
	 KOCwMlz5tirOUZHmiUOJRYQnIpzqos/xg5AyzqAliybC5SHNMVR0hggK7WCMz3b+hn
	 CambCBIZ845nlNgIyyRDL2gYngaJ4iEyU5FJdl9s=
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
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 06/24] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Sun, 29 Mar 2026 17:33:17 +0100
Message-ID: <20260329163337.637393-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093434_646618_7E72D7B7 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34..e936ae7c0fb9 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -298,6 +298,14 @@ properties:
       reg:
         const: 0x19
 
+  protocol@1B:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x1B
+
     patternProperties:
       '-pins$':
         type: object
-- 
2.53.0


