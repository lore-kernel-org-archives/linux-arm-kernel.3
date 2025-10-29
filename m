Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFADCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=mhdCUOJguwRxW0Me6zDM1dADDQ0Txm6u4urbm0RY+sY=; b=nXci5w01b7OEFq
	8JatGLmpBiKz0dWaPWd2q7hero35p/p82e1fKjVEuKRfBwNn2Uupu4bxdGDfJ7gAFbBZjbBeehffM
	gNeyNa7+rifsDBlPCv7rZ0itveY4WZwoKTQdzWt6QsBj4gXZhyERU6wVE1uIbULbBcTVOTs3E5iYO
	QkfbhlJqOPVU4SkkdvV0KbtPpRunA0kMlsz3E3KONzVrPHw1fB0gwtYUEXlsn+BLDM6ucBUWVe5wR
	J6ukeAbGRCaLLeOUwyzgA2PZl3Jowm5ckyy3uYAAAwgqmkeTuNOEQlTUQcqqC+K6C8QVvxIBUMGrS
	XdUDiYPAQyJ99txUQSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5nm-00000001Ggo-3LX0;
	Wed, 29 Oct 2025 13:01:22 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5nj-00000001Ge5-2a3W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:01:21 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251029130113epoutp044ceb0030a40c6e90168d64f0145f4ea5~y988atJYs0700407004epoutp04h
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 13:01:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251029130113epoutp044ceb0030a40c6e90168d64f0145f4ea5~y988atJYs0700407004epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761742873;
	bh=mhdCUOJguwRxW0Me6zDM1dADDQ0Txm6u4urbm0RY+sY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=U1YiPXJ0Mvk/SQhYUXIekTxhFpOPW3XHKJY9iDWCJ99NuahwfRvQ5dH38KN9foMF1
	 sHiIPtW3jhXHrk9rji9fSxmC9hp5S1uUlUltkUsSA33INpjqDz+Xp6kPigzxcBM20F
	 EYss5SPUWfbrjIqEk32m1jwkSYslVWeBSw+dK800=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251029130112epcas5p196a19b1861a9fb5ad13d06e4e0c79662~y987osXKe2737327373epcas5p18;
	Wed, 29 Oct 2025 13:01:12 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cxS6b2JrSz6B9m6; Wed, 29 Oct
	2025 13:01:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029130110epcas5p2aaf9d262f327286bbc7b550c09589897~y985uqZvX0109501095epcas5p2n;
	Wed, 29 Oct 2025 13:01:10 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251029130057epsmtip131d105497324d9ff01d56fa0a3a647df~y98tmANYd0989609896epsmtip1A;
	Wed, 29 Oct 2025 13:00:57 +0000 (GMT)
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
Subject: [PATCH v2 4/4] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 29 Oct 2025 18:30:47 +0530
Message-Id: <20251029130047.42499-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20251029130110epcas5p2aaf9d262f327286bbc7b550c09589897
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251029130110epcas5p2aaf9d262f327286bbc7b550c09589897
References: <CGME20251029130110epcas5p2aaf9d262f327286bbc7b550c09589897@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_060119_979098_B92D66D0 
X-CRM114-Status: GOOD (  10.76  )
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

From: SungMin Park <smn1196@coasia.com>

Add Axis ARTPEC-9 pmu compatible to the bindings documentation.
It reuses the older samsung,exynos7-pmu design.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193fee..9d3e8e9817fb 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - axis,artpec9-pmu
               - samsung,exynos2200-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
-- 
2.17.1


