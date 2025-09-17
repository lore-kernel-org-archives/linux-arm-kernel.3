Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E742CCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPdbfHLstu1wPrB2mB8d1zMqEAd1MofjdrEMAsiJOLc=; b=NtBPunbw+R+jnY5Qb0Vjykongl
	23DEnl94uk1lYSVpSntsC8kbjAfgmmH7Yntn6X0n62ORY+lQmhEw81nYjmnEF+e+DRtsFPH5Vkt5U
	SGmTL4j/L1mZ89DuRKOtCsg91aqZTcy69Mx7Olsqcx0ZhXr74AJ1Xo/cmtqdzKlm443r0tg+qdsEA
	hmipdukrElck1lKw0q/tUQ3s5qiKUSKz/sEga0kL+PGKPscUKTSy5EfMzvoU5ltYQmWp5tssmP9eC
	r3MN83S8S5JujKoZy5ELt0ufFdzCgj8Xjb6kOTkFjIw0ISv4pKInScHpcl6QADu4bKETfrVeVh0LB
	I6KAqKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynsK-0000000AhIQ-1ToR;
	Wed, 17 Sep 2025 08:50:52 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynsF-0000000AhE5-17Sf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:50:48 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250917085044epoutp031ee618ddb2813d9a4393805ffa7324a2~mBcQ4vud20518605186epoutp037
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:50:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250917085044epoutp031ee618ddb2813d9a4393805ffa7324a2~mBcQ4vud20518605186epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758099044;
	bh=HPdbfHLstu1wPrB2mB8d1zMqEAd1MofjdrEMAsiJOLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cl5MtlS/HMXB1n3Vmk7psVwfm4S1+dxaa70KoWv/hLSNBvJeg+4/Rg5CtTI5/RgG1
	 RBudsSJ0s00zZC92lnZ6smONX+RTIXI9ox4Mb1Bk3p/Js43QQ8nMg1bqkQOdN1t0Do
	 AZOLTYJAA2qK+KVpCMdZUND5W2ZF4Sil/uV+4r80=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917085042epcas5p3e2c46b53121fba38a4f1ca75dda7746a~mBcOv4_sq1728417284epcas5p3r;
	Wed, 17 Sep 2025 08:50:42 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cRXXx3g06z2SSKg; Wed, 17 Sep
	2025 08:50:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6~mBcNKkhMD0803108031epcas5p1D;
	Wed, 17 Sep 2025 08:50:40 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250917085036epsmtip2d6ff89267ee087a89fc1d5cf2e5b184c~mBcJCANie2767927679epsmtip2a;
	Wed, 17 Sep 2025 08:50:36 +0000 (GMT)
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
Subject: [PATCH 4/7] dt-bindings: samsung: exynos-pmu: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 14:20:01 +0530
Message-ID: <20250917085005.89819-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6
References: <20250917085005.89819-1-ravi.patel@samsung.com>
	<CGME20250917085040epcas5p1fa7cba6f9425f534c9eca976c4bcd4c6@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_015047_617352_CF3CD827 
X-CRM114-Status: GOOD (  10.69  )
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
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156da9..0d24a7ffa001 100644
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


