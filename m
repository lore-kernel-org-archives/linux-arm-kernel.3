Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23440CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9k3v7Ymx6xX117lxAtKN+N5IMOhg/8YdNdWaM7hZ5Y=; b=IKbfNsUd4JeohDeKy5AboCI0iL
	Ja0IfRjCiA/+muREYKPmb+9boSLF/HueoL7gv+teeB2QuGbNrHp4kzXsQg6n6ji2w6o1144/4EjyD
	Cv7UZzwC7gQh85AW1167f67KRC0JpD5ulcArYHGAbcN8snYjaspo+6SI0DIn+vDdP8NAyz9vLT2h/
	Lb99tZdrbtARYCHfhuu0ko1denn4oPug+v3yJ4DJZTAE+yVbexMZE2yV1FQQeU6MwrS+m7tmCrx6Q
	KEqoy8ATcsSknT1rdUINXMOhmLVCtG/rpn+F6p2ds/DPRzU8xIkvrAMz2NzBlR/7Q2f4FummunwZN
	F7Fn5F1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9pw-00000004a4W-136l;
	Mon, 15 Sep 2025 14:05:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9pt-00000004a2u-3XvM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BA87405E4;
	Mon, 15 Sep 2025 14:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D39CC4CEF1;
	Mon, 15 Sep 2025 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757945141;
	bh=d29ukCE4QThVN5wqs6kQsMhVNWS9bKwxuOT+pfkPa/E=;
	h=From:To:Cc:Subject:Date:From;
	b=emR704H7wiOC0i4kJa0Gl4umVfevA+UpDjb8NJ0bWQS9DNwqfTXOyDtNWb9tmnDEM
	 uWXV2iUUE/cYYX6ozNavUkD76SYFrhxr5XNDR7hQMAdiuScUZuY69WwtkaE6pw27o8
	 ENfy4oZBR6HRxEXs4N/o5mZZbm1N6BqJtHJL+7eBt/eoNqtm2XHqK/IosH+yxZ3YMK
	 tTO8ddycoQyZehJ8luBirqR+vm/sp0CEZHKZ/EA0c4jhntuHpILMMSvF3BNvXtSy1t
	 i4XchAOiXJw4W8CtY1QkkZmkPXBgLDsDiJjyJGiitTU41g82sW4GOLh0ExCWwdT4q/
	 I+reakSJiouVQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: Add Arm C1 cores and PMUs
Date: Mon, 15 Sep 2025 09:05:07 -0500
Message-ID: <20250915140508.2806590-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_070541_907446_089796CB 
X-CRM114-Status: UNSURE (   9.01  )
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

Add the newly introduced Arm C1-Nano/Pro/Premium/Ultra core and PMU
compatible strings. These cores are part of the Lumex CSS. The new names
are replacing the long lived Cortex-A/X branding going forward.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 4 ++++
 Documentation/devicetree/bindings/arm/pmu.yaml  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 41ad4ed0e74c..c1036dcfc912 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -123,6 +123,10 @@ properties:
       - arm,arm1176jzf-s
       - arm,arm11mpcore
       - arm,armv8 # Only for s/w models
+      - arm,c1-nano
+      - arm,c1-premium
+      - arm,c1-pro
+      - arm,c1-ultra
       - arm,cortex-a5
       - arm,cortex-a7
       - arm,cortex-a8
diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 9bb109e947dd..f47baaefcdac 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -28,6 +28,10 @@ properties:
           - arm,arm1136-pmu
           - arm,arm1176-pmu
           - arm,arm11mpcore-pmu
+          - arm,c1-nano-pmu
+          - arm,c1-premium-pmu
+          - arm,c1-pro-pmu
+          - arm,c1-ultra-pmu
           - arm,cortex-a5-pmu
           - arm,cortex-a7-pmu
           - arm,cortex-a8-pmu
-- 
2.51.0


