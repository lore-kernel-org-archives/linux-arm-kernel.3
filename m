Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848BACA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQSI2Z6Vaf3GExSLoiurGcbk31x6P0OBsed/AHWLWVI=; b=CVyRktMdSja6JJ/+YXNM1yRbN5
	KYKX4FIeul/LXo4LVSOeEevdoi7RRMj1W1DElPwQe6VWqmerLh2+TQUfMvEKMOjvCm3CW5xhBKVlB
	Dx9m7+dLKIcWlymBRW4VMYxOofOeaoCgC05+6iTrnPID8jjNgQiXhxKw0QBAUHyf3y58wBE6NzaVD
	rlHU1YqfShfIfDx0M0zq2zq1UzEHi+8kcrehEuhInInrWholVH4UbSZ2QYybgkUIjL8O1tUw9dzAR
	hovqKC5TO9STvviMaw2g3aIn1q2euGkFAny7pDmkjU7Q2uNsBfD2WVk9kY7T0aqbCmNBYzvsF2FEU
	gHtfwmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynsK-0000000AhJ3-2nt3;
	Wed, 17 Sep 2025 08:50:52 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynsI-0000000AhGf-1ozs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:50:51 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250917085048epoutp02f4d4136cd77565bbb031625d7776946f~mBcUQ2rN81667816678epoutp021
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:50:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250917085048epoutp02f4d4136cd77565bbb031625d7776946f~mBcUQ2rN81667816678epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099048;
	bh=gQSI2Z6Vaf3GExSLoiurGcbk31x6P0OBsed/AHWLWVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1QP+/ytx2y8HBCcCiCibm4+/s+FabthX9/sQL0Kc+3vz/9MRvLaRpwpngswBgy8u
	 DLU/ITJNU2DVNqTvn0AUjrtfGrpNpVVRKEuY2AzuTBrUDfp22pVOA2Q8+0B6gyAZM5
	 5SjjZoe/Fe9nij7ylw068arLsqMqSZkAA7nAFjQk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250917085047epcas5p2e115ee7f90ed7893acbbb81969d42a0a~mBcTlOlw60263602636epcas5p25;
	Wed, 17 Sep 2025 08:50:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRXY25GGjz3hhTJ; Wed, 17 Sep
	2025 08:50:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa~mBcR1cAXW0743007430epcas5p2T;
	Wed, 17 Sep 2025 08:50:45 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085041epsmtip2143cbf9e7da6b24bf6725269cffea700~mBcNd2pqB2767927679epsmtip2c;
	Wed, 17 Sep 2025 08:50:41 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com,
	sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com
Cc: ravi.patel@samsung.com, ksk4725@coasia.com, smn1196@coasia.com,
	linux-arm-kernel@axis.com, krzk@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com,
	jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com,
	hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com,
	swathi.ks@samsung.com, kenkim@coasia.com
Subject: [PATCH 5/7] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
Date: Wed, 17 Sep 2025 14:20:02 +0530
Message-ID: <20250917085005.89819-6-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa
References: <20250917085005.89819-1-ravi.patel@samsung.com>
	<CGME20250917085045epcas5p2905ed7f307ca892997e14c33ad68f9fa@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_015050_634583_C1BCD579 
X-CRM114-Status: UNSURE (   9.93  )
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

Document the Axis ARTPEC-9 SoC binding and the alfred board
which uses ARTPEC-9 SoC.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index 63e9aca85db7..3062901196a6 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -31,6 +31,12 @@ properties:
               - axis,artpec8-grizzly
           - const: axis,artpec8
 
+      - description: Axis ARTPEC-9 SoC board
+        items:
+          - enum:
+              - axis,artpec9-alfred
+          - const: axis,artpec9
+
 additionalProperties: true
 
 ...
-- 
2.17.1


