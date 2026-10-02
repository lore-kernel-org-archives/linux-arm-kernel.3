Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE3CCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+45WUTypGMom8vwh6DhBr+7yO50N2bj955P9lNPKew=; b=RH5FAkBq/Z1GxK2g7jGb+qfTvK
	NshBPRnnKaaxAE1vR8mQDPjLaX51VyqPV6PBddQO1vXyVmdknJLRSCpcqBtJR6jOXORlXB0jfcvjV
	2zNS1wx7ThNCczCbTUaeRM7LN2m0UZY2myK9EGL3Z+Ql9O6or7neZjGTqmdaLSYGeoeV7m8z8+kCM
	14i5nMa/dgmI8djA33GyP2pOyRkvFDa2KVsPknkpmrlnV0NPfDUosWHaz5rSE7JBMDDTFqlhG+6ez
	RIX30bdAHg4dJHOGEG3ChgchZzgVGdMg6OvHRInrRwgmGQC3fJlX1uxYOBBpUdRA6a3mU4bFkH8Gb
	R27rtCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerL-0000000BrOq-0ieG;
	Fri, 02 Oct 2026 15:07:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCerH-0000000BrMe-0Sqi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:07:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0665169C;
	Fri,  2 Oct 2026 08:07:29 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 695183F85F;
	Fri,  2 Oct 2026 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953653; bh=qPXndyy+kCfqWJ1DYoikXvZ2oalM7quMrTOswRv6HKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GhFfG2f9Y0IRkOmbzbQG0O3xg2WbRMQytQS77OaA0ftVa8l/8TKH7NyMyJ1uqvl1+
	 G72UqhdaJSXmhgSWoN12fh3Sq8vaJInDoJBTpBpejbxJ1N/vpEVgmPjLJxzRY+sW+j
	 zEVe5MMWtE5bM2/wAZUVfIj11AwJ+YzwmiMCIk1M=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:21 +0100
Subject: [PATCH 2/5] dt-bindings: arm: coresight: Allow atclk for static
 funnel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-2-c3edca1c480b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1077;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qPXndyy+kCfqWJ1DYoikXvZ2oalM7quMrTOswRv6HKs=;
 b=3U/T4ZX39pINBBA4zZJbihfCnZaXVZF3laNIkkxBej1iFUWHL6REmRyxIwzgBHIvqByz493Ax
 17lxpH6tagaCvaJ6sdGuEjIDsBln15n40lB2smZc4UOCY1/b6JQjqw/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080735_235128_43FA03CC 
X-CRM114-Status: UNSURE (   8.77  )
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

Static funnels have no programmable registers and need no APB
programming clock. They can still require a trace clock for the ATB
datapath.

Document an optional atclk input. The CoreSight funnel driver already
enables it when present.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index 9598a3d0a95b20e6272d4d72329a081101cca524..f502dc1a462d85e9cb6dfafc603a40360fa0fb41 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: atclk
+
   label:
     description:
       Description of a coresight device.

-- 
2.34.1


