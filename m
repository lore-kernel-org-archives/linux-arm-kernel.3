Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B01FD33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DduQ5a5iEKGftFFpS2C6ZNV4q2UCgGo/WE7bIsCA74=; b=Fk1Tn+/ROwq0DqpSQnr2qnfA2m
	/nf+LRye76IKPFI+X1PACbKhGOFCCVKuTNG/lx6kstPjbAoEQGwyEqGIhzC5zYR0mLWRJUzbGMoeG
	UAXm1+AoPQ/5cvfPGrjGHs1Er62Rgo919FFT7wuH3xgc+sHRbW5xrwjv0iHvYtFG4DEl8LwRE6zjD
	UFPD9rt1Y3YxfHirLNVq4trOFz0p1+qIk3pSUloS9OoShljmsMdA5I6YNH9mktRxJ1emlb55WSkCP
	BJp+lRoVSw8kQhsJs7WitZrcTZgP207WqRpzEXlXoRfpsOVguYjFRj7S6d7IOKGlE36UJFaO5NHz7
	9seYAvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RBE-0000000BDHG-3N9f;
	Mon, 28 Oct 2024 14:57:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QeF-0000000B6Vu-0UQ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:23:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80644A425CA;
	Mon, 28 Oct 2024 14:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4680C4CECD;
	Mon, 28 Oct 2024 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125388;
	bh=70JpgkYvN9YM24Jz+FtvScOfqAM/jZI33kSB5+f8jrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uWoduNTdbhD9TXD1VwGSVhid/JfbNZDhhSTtQ+Zs3ioRGg6tvVfDDsO7n6Ybo/UJl
	 NsxIokqQOYhAL4WSF2svmo6fDJ32xwI3BhJ4nntHQH/9m04sMJzuX8t4AytmOrUT6S
	 IxWlHolrSrED7yOnX/7n39zdEROIZr2p1dIlWx7wY+W7sUA86CfxB2bGLD+pOaaf6A
	 banm0ijjslbav+xsnj1utuXglFa/F/XmiZcKG1MexyAYqAZyvIQH0RfdF7NOp1l8JX
	 pN++CrTWodTvybBb9bEtYQ6Taw6kleIsLkJw3qOrLTxSI2wILjGwQQQgLV2ktbpqE8
	 GOTAT3N1G8tKw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 28 Oct 2024 15:22:57 +0100
Subject: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730125380; l=1434;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qowdcUV0IcXfH3TE+fGW1N5ucMJrGFxOqfTc+GjqJNE=;
 b=PkrsrLQrYHBH3Z0pNaW3PK242z+Gnl0VhBs6CQJrIOlHjhysAG9+Zc9b2RC7ghkCCjFg5lCTT
 bin1KT4oKNJA+UZHJeDOPleGn5YYe0DX/fXojY3JnSxnRIA+8yqJTag
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072311_363117_6D0BBF9D 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Certain firmware implementations (such as the ones found on Qualcomm
SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
optional PSCI_SYSTEM_SUSPEND.

This really doesn't work well with the model where we associate all
calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
CPU_SUSPEND suspend parameter value that is to be treated just like
SYSTEM_SUSPEND from the OS's point of view.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,12 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  arm,psci-s2ram-param:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      power_state parameter denoting the S2RAM/S3-like system suspend state
+    maxItems: 1
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.47.0


