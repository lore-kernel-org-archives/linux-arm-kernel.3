Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E04CCA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4NQud7kzIX4mvEgbN+hbTm7eEVfN8oU/JAIvlN8D/g=; b=0a+OUBP0IeLBws0o6UNp/0mc45
	Cka0RCGuL6JqEyZT8uM5TCaDT3fuzrfekkDsvAZIn8plz09gqk6Z0KvnLeA+1lREmQNx7EOthiesd
	u8reF6Yk6gWJEnW8soE0wlkzxG24UVjuoTTxfiJWkYJls69047x4l+wD0dKYtHfGSPNsjhiHFY/Xw
	D+0tSE3oKkydnAvc+ihj82yneMtC0ROcGh9oucCYB8diI07jjBrgq0WfPtizect1SXSO6+prAofAE
	kiFBUn8h0WlrCnunaDWibPnMsXiKxCawizENvMGBTlV4smd3LSxU1O/vuPV6f2KF6WEEbOikeXVBH
	MKWLOsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerK-0000000BrOb-46vm;
	Fri, 02 Oct 2026 15:07:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerE-0000000BrM5-0kWs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:07:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B87E91476;
	Fri,  2 Oct 2026 08:07:27 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D8273F85F;
	Fri,  2 Oct 2026 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953651; bh=13bZStv85FpFIHW8gZI+hpyHoxi0U5R4QF46QFdkxX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VGxsK7sDBXO/7gDm2H1ChGRW3Zan9sw1aBRtaHF5b6LYde2WCw//s/aDx6sxt+B7L
	 px4qa0iVH/GfWasQfbU++Di/++AFaQdvw278Le0z+os9LEY3NuPqywMFFlFPM0Yxhv
	 5XXHxombWP1yQp7Do+JdNG3L56/GOpP9h666uT6g=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:20 +0100
Subject: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1552;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=13bZStv85FpFIHW8gZI+hpyHoxi0U5R4QF46QFdkxX4=;
 b=0dQSJnuLIp03OHtIUMZBxxZ0BaxAH2a7Ya+4Hp9GIIc1X5leO1J8wP6e0JmLBHw3lenYJU3FS
 0yui3j7SDcuAX+gOjTDsazD4q/LJw0JqOovMjQ7LTmlt6lDjIE9m6ZY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080732_526992_00CECF5D 
X-CRM114-Status: UNSURE (   9.74  )
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

Static replicators have no programmable registers and need no APB
programming clock.

The Zynq clock controller registers dbg_trc and dbg_apb and calls
clk_prepare_enable() for each gate the bootloader left on. This does not
depend on the CoreSight nodes' clock references, so removing the unused
consumer entries leaves this protection intact.

Keep atclk optional for SoCs that need to control the trace datapath.
The unchanged driver still accepts legacy firmware that supplies
apb_pclk, atclk, or both by name.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml         | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index b81851b26c7495047333b0ee0b5e690c0b153a61..e5596f6d0ce0f28429630f7344507ce49db59e68 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -31,17 +31,10 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
-    maxItems: 3
+    maxItems: 1
 
   clock-names:
-    oneOf:
-      - items:
-          - enum: [apb_pclk, atclk]
-      - items: # Zynq-700
-          - const: apb_pclk
-          - const: dbg_trc
-          - const: dbg_apb
+    const: atclk
 
   label:
     description:

-- 
2.34.1


