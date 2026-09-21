Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EABC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6dICvcKm3BIGHLqArm5a68sfhcX4BHfmX+37PnEVNIU=; b=fsV9PtWubILAdY+rGwRJ3uLq41
	iYx7ArL92lz4t3I0/qAbpwq/Dz6NunBvxWyTszZmHvfSh9iXlLC66N7+AvItuR6M1SaJHIMUr+zwj
	4CmLkIb+9mQzofqFxfF82VkEbmfc75jNFe9EJRkGXSNP+N8DEPXANpixG1XTFrca54cKg31/Wwrsu
	rk5U4kul5vc62pUelKCUU70xXerTgaflB4axD5VKADjnCvc4lq++/n3l1EuHkrY2uz47ctcUmRfCb
	ONYZOeyK/s8aMMTI1jI60S13WtMwq4i+ZYQSHRyU/pgZpYdDUMTwFRfeg5azI/6blRbCF4SCotPvC
	6RInq3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nRA-00000003fxS-3OWG;
	Mon, 21 Sep 2026 23:28:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nR8-00000003fwp-34Q1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 23:28:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CDAE42004;
	Mon, 21 Sep 2026 23:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EADF1F000FF;
	Mon, 21 Sep 2026 23:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033318;
	bh=6dICvcKm3BIGHLqArm5a68sfhcX4BHfmX+37PnEVNIU=;
	h=From:To:Cc:Subject:Date;
	b=G6AW76Pw+tuclNLlmPboPUnIfHQGSTZEibH7WL1m/ALP5AoJDpuQx5Gx9WxDS9gnD
	 5RmJF3TKIfhME64en1Y9uszNmBlYyJ9wcDRoXchXbcmU5+FxAlKDeVAP+GoSt/LpPF
	 8LHQptJjbfvQDufL2/2ytujbOq1oECVJ13KybRG3bvzyMM85G72Do7lReNfVFAdhLa
	 3TU9+L2q8UbXM5cZBqYsiCVKZRvdk4Fz+47u+UyYObxJBpKKaEruOVST7wzT6BrSiV
	 Xgr/PuKcIGfbw5t0JDnnPNFe9omz6RpZgn2WGtxEhcNKVp9KrSp3g8Nd3AUUuRc0Q7
	 U5//tIn3pmjBQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Leo Yan <leo.yan@linux.dev>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Date: Mon, 21 Sep 2026 18:28:33 -0500
Message-ID: <20260921232834.3138571-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Some static funnel nodes have APB and AT clocks. Allow one or two
clocks and the apb_pclk and atclk clock-names entries.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index 9598a3d0a95b..4a3d08f9568c 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,16 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: apb_pclk
+      - const: atclk
+
   label:
     description:
       Description of a coresight device.
-- 
2.53.0


