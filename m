Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5D8C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=; b=DtEObDYhbhGkuAe7fTq1hLQ5QN
	oLPjUgec2SR3mAUXtyDRO/O1Uq1IZDMJgoab5CO/hnnAflN6zn8FFN+vb34BAb2fmsF+a/RC4bhbJ
	pMjeaftqkfkTIaGZBPDXlQQmM0HT2TSL4VaxHdM+IcIqgRe5rZUjBTRC+5mf5OHmNHFZrZiaCF9Em
	0/WqEUsbctvYgPnZzaYk49vvNukyMnN8Ue9ovbpMHjKuvXUYKXN+KyCPpDNGazW2r9v39C51iU8lf
	FqVVw4xzBhupO1wcJVXGg0SM/PzIqL6baJnw4XnTUBqpT7qqwGXIf0glWuzZ/etcbr/IF5M8FwiCQ
	dq1O/uMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6FM-00000004Pus-3EEH;
	Fri, 10 Jul 2026 08:06:08 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6FK-00000004PuC-1vPJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:06:07 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxPXp4PsKzMlD6;
	Fri, 10 Jul 2026 10:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783670762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=;
	b=MfN7BqOdvkXRAwHYVggjudjUT83XMF6Aac5V8ZO2AG+jOSxw5Am5MJ1BM3ivw0FW1z+2QV
	qIqdbiRJnAlBQoTUwU8SZ0hcNUwXo9ZVb+mEAtWQ4KKsSx3hyVcQfcceq/vIjnvyAMGxVW
	bClU4ryzfrWDKlyeyaqbu2z64yZ7jsXuHF5r9EUmROV8eDT4ev6cTaAf5FW85DlNaV0R4T
	DcO3+EMtx55LwZw3RfyTVLr32ZQdfRAD9pYWxjaF8awuDgJ4z5TqJ9BYQzvA7Ivl/ZQZ8X
	MnoMbn011YaZAu1begaKhH9tNkdtkYGznwjD4VKYH68WEneO8crKTQrUoqhL4w==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783670761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=;
	b=K1WwsP5dJcKOSlOvbW/CsZ6nITchfBE7LQ7V6HlMcjTcZs0Xi0LDDM2ld9uESXPmtbGF7m
	g4IQoPhp72mBHFvHVdaMKbrTcUNWNKZFobtBAbfViH1Wdh5arzzRPYz1FV/8GivnsnrZGj
	MatGw9ZS2xKqGGYaimoIj99UtZih9SwQTi4GGpqouKni4kw07TTfFS9p8ca2QcxOmxf0/a
	X1IYEaYDiPhFc+tmXawWFmFFZQKjBv9yQpg2Ew3YoARXOkZHVN5x+pg9EFW7pc/qckVSLl
	a4iqNRQOtzZv4CdwSvvOfoJ2DYsFLZ9yp8X2YPFjvY7JQM2Rb3ivMdYzu6SOOQ==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
Date: Fri, 10 Jul 2026 10:05:23 +0200
Message-ID: <20260710080523.428548-2-manuelebner@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e08c77fdbb62919aa1a
X-MBO-RS-META: uswnj341qs38uwohh85538f4dgj84hr5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_010606_644132_A9205B60 
X-CRM114-Status: UNSURE (   9.18  )
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

Remove needless '('.

Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 152403f548c3..c7301f1b28c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
 
 description: |
   The TPDM or Monitor serves as data collection component for various dataset
-  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
+  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
   Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
   Single Bit (DSB). It performs data collection in the data producing clock
   domain and transfers it to the data collection time domain, generally ATB
-- 
2.54.0


