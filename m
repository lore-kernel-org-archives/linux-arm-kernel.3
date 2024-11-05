Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8394D2B934
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r0pX1FHgLqkdgm4Z0bWZbmzE7jup2PMJjNG85lq5xOw=; b=M4K1RipIUYgp7fCvokJPxVUr7D
	N/7MRgAie/y3mG6mej0RYuZ01knTheZIeEwPmvOuKA9dXk16mhoF31+BLQWDpd85e/mmZDH/8TpfK
	DN/VG858DAL32+XsISQfFki6Znm9dj6VnhEUVZsmOuWthcIGFWyZU9G/oMzwzd4GLjSfTpc6D4W1n
	VnRMiBozJxKN/obZP6miXz0zFNQEq+XviofPJlHzTtPJg666Mp5swGafE0m819E+pYDX4izpCW51i
	oXHOG3VLCN2VmYm2HuA8dNBYkjr8UNhm0fgsEKx0o2EoVGTuByhlOjVyT4rm3FmX5HnAA9mr5vt2g
	WA/9au8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KbL-0000000HH8w-1ItJ;
	Tue, 05 Nov 2024 14:32:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K94-0000000HCZY-2t2a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 14:03:00 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DY4vk006828;
	Tue, 5 Nov 2024 15:02:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=r0pX1FHgLqkdgm4Z0bWZbm
	zE7jup2PMJjNG85lq5xOw=; b=LBb2SK2rgGAzRdzHeWVMVj5wUrFOVcCj4SebnD
	0YjsgEzAP5ZgAP/n0I8FIcSrOD2h1muBRAcXkAgqBlkauf7r8q+SEviZGTuV2ftI
	uLKulkkQoi74lrGQwYTCObro85lYQTeR3scvvrsNrzNk/prb3uPDRpnWNvuGpYd6
	Bu31CkevEqmAXPAjeQiMzJGWDihzgew4S1BshrCAXr46cAm15N6ZBVdVBmsQYcc2
	pgUIhp9EGsLHVZibfJnPX1dfHLVT6GOyWA1JdL8JenhyZLagv/e3sNe2lCN0fRzp
	FhflMwuRzWUIY0aSrcyPRMgMKJu2LahlJJgasPs2ieP/gJ+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbvpm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 15:02:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8680940064;
	Tue,  5 Nov 2024 15:01:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19ECB2676C6;
	Tue,  5 Nov 2024 15:00:15 +0100 (CET)
Received: from localhost (10.252.16.126) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 15:00:14 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: dt-bindings: stm32: add missing port property
Date: Tue, 5 Nov 2024 14:59:41 +0100
Message-ID: <20241105135942.526624-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.16.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_060259_163926_F0942976 
X-CRM114-Status: UNSURE (   9.51  )
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

Add missing port property in STM32 SPDIFRX binding.
This will prevent potential warning:
Unevaluated properties are not allowed ('port' was unexpected)

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
index 3dedc81ec12f..56c5738ea4c5 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -50,6 +50,10 @@ properties:
   resets:
     maxItems: 1
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
   access-controllers:
     minItems: 1
     maxItems: 2
-- 
2.25.1


