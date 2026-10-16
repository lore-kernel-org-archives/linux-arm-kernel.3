Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4401ACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7R2yoCiAeLQBhB6gJTWyBDgFqLo/L9FrePQ72IrN3c=; b=kXMhVvdCrDH0tx1pgLXQ5gz3Hk
	o7xma2kV7JfUb6MLOo5WAlM4WzBsr2yUPlevy40RgPgZprdqPcFWP6+WIAa+GyQ2RQaRtVnIwv0Rn
	DJGb9kRjn//wpxlwhjngCSMeQo2CSrhjI62fOjdD0118T16JhSUYOnEb6ps4/NFWy+9zuS6NJhZ4p
	C1sGCm7pmmZgZqMt01CzRHt7MlvuyUP4UJrh+kvN/tZ8jxzdMQjF/DB5YINZf3BU1H7C+QMCxyhq8
	UwYpRZXi4f2EmGxCTc9dj2rQvBlA6dudlJZXtBRW0INxetaFH0fUhVlmU3yqe1X7W+C+bVleHm2hV
	F2QfrdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn72-00000003k3a-0AvR;
	Fri, 16 Oct 2026 18:57:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn6z-00000003k1S-2tU5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t7R2yoCiAeLQBhB6gJTWyBDgFqLo/L9FrePQ72IrN3c=; b=jFf7nzG4dz/531R6SzWM2EtTPC
	DJCvBWC7H1RquqCdGzrs0o6bi3oow7QLrmgPvqX4F361kY8i0h0H4wav1a+jPg/rT/74jutjMa+mr
	SHHuLP+eT24My91ZrS1dOUcg04671Hz3UGGP8cq7wO3sHUXkKtAFwcmsb3T6m2m4GR/lJApdaPkfO
	IpVgtUfQmvbhy2++sRWK9/IOQrZ4eePk+AZNR/meOhFnX0gyKp+ADARmKoBWohgRCFhIxPhib4hOk
	lpQyjK3MBFRtDoeM4ImOwjapEeE6kw2cIo+I5/BfWzbeoda5ttAGZ79gGbTjgZgvxvXwLtGanIE05
	7ithx4zw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHn6w-00000001rif-3hNf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:57:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3172E16A3;
	Fri, 16 Oct 2026 11:56:52 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E1D13F7B4;
	Fri, 16 Oct 2026 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792177015; bh=hfA0ap4Xo70CAlarCd2qZoILhqj61SvsIL72n1hY+fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Du6PDgcC0MUT4aRpmUmXlg34efz6bUpx7lLfJ3NZ3uHhYlkK+RDO3T5OkrWvxslnv
	 epblL3SqXGmX88wUNwsKEIk1n9k4HzPVYS1IwJeSROC4TCwq8YqBBO1iP+JIrb+9Kq
	 0K9f8mGnMI7/AkYYf8o0S9S5ocSjQ7rK1lyeBMkI=
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
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
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
Subject: [PATCH v14 05/32] dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
Date: Fri, 16 Oct 2026 19:55:26 +0100
Message-ID: <20261016185553.2794459-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016185553.2794459-1-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_195659_126121_681515E1 
X-CRM114-Status: UNSURE (   8.32  )
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
index 6fc44105f1c3..b63543390fd9 100644
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


