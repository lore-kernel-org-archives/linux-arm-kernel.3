Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3B9C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=omb28bPFnepOCl9nKwsWgB/GlXCLrfSFWc7L3eCs/XI=; b=M1qyCaIv8RSdLuHyr+Vg5C4dg1
	XEgVKddiBoHFJ2XhSt5n80v6+Vf85aeJY5UYZAwUYj2kOczqGUhcfjtHTp6o2VQug9x744fLO9b/F
	3np3+oYQLfXB+TbjPj8JBbzy29IJPeWnSrYgRbumi/n/bQ5VTQ2PGvIfV7VxQstqttZhe9Gx7fZB4
	o9fMKrG00Xl8zDaveWFbqncxsdGwgrwoHyRGC7bt217bhR4WgiaiqBF0QXGDKK4UwyGuGUlnC1wgu
	rjAEho05n3T9SvV2pn5ilcuQar6cfXgrdzvEi5nGoKQ/auHcgYUflf4DLI/EDI+oU9A6jXT2N6NnI
	Eyz/25nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Eo-0000000CmSz-0WXu;
	Wed, 30 Apr 2025 12:08:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Cq-0000000Cm9W-21yb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746014788; x=1777550788;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=omb28bPFnepOCl9nKwsWgB/GlXCLrfSFWc7L3eCs/XI=;
  b=YIP9tzzpjCvznbzFZPysWjWDeS2qT6dKjdDdKE8FJOr1a6BLUYQLPIeA
   Iev6fkg0PAQxBu+AZuogN5pHz+115nbEfdIZohP9mgKFZKKPAD+tV0y4/
   oyyAVa+5qL8mfxDJZ7RFYyx6Fbjf5LVaP6ciPq/N6BAdKtuY8b9iEE2cE
   l+gSO/KWt/zISXN08XJAVte+3pafR18KBKOcdIcpfYQsbp1p2WRMWtFYB
   k//LtJvruZ719f4FJE1A5n5OUCw9EvrmsLUgFRi+o79EJpwzq+Etnkhg9
   u5MODjvfuCMEwGEEbe0H7OnFwvJDQwg7JxsiGYvPLuX/+woqlp2R1qp5l
   g==;
X-CSE-ConnectionGUID: v8x2pFd2Q+e4LtiWMKjCjg==
X-CSE-MsgGUID: xFRknDV/Qp27JbnCNXdQEA==
X-IronPort-AV: E=Sophos;i="6.15,251,1739833200"; 
   d="scan'208";a="43809741"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Apr 2025 14:06:23 +0200
X-CheckPoint: {6812123F-3B-C7E25413-F4312D34}
X-MAIL-CPID: 26F950DBBDC6ACB49334F34AB69B5E04_4
X-Control-Analysis: str=0001.0A00639C.6812124B.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D26EA167074;
	Wed, 30 Apr 2025 14:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746014779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omb28bPFnepOCl9nKwsWgB/GlXCLrfSFWc7L3eCs/XI=;
	b=hXGTCeHaQ8mm1Ph5J5FX4phYmH+hTjYb/aV7FLUIYQlHYpbswwdt37IBsiLmhm5D+uWhP1
	1HLKphb7S6FFE4asYZgRBK+C+SDw8Dv46L0mJt+6Nk0NgMK52X6Qu/qThgU3bE/j47WcAp
	mjgdvb4ywYbV0Avn4VGitVJq+NVz7jxzAWqobyamS6l7oxNJ+tgE5F3MGp9CZxeDHvUgrT
	IACo/edJ7bUMVVgbwh6oEQBCi2cSDNxu7Q6XQ3CLT5YcB+ghVTTOFAdMUhnxRTQ0I7kgM4
	eiRRHNVok8jbx/qd+ebhpzAmcK7SHygWQkkOcGgfV/jaiyE69PvedG31jjjhzQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Date: Wed, 30 Apr 2025 14:06:00 +0200
Message-ID: <20250430120605.2068102-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_050629_006512_E2E57FF6 
X-CRM114-Status: UNSURE (   6.62  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
* Collected Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5ff0bc6c92483..8b9d96c5edc65 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1538,6 +1538,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0


