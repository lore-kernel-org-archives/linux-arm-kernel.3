Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB31CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=LYRqGdvxiwapa1NYZ4/yM5n99gloT6iDw1ifAfDC6iM=; b=rpE9FTN+KQlxMlbtZvrguwgR2P
	xf1SI5XsXLQfrAviP92G4PJ1NqmpqTMxfq/CCq+SKwaAxU/ZjzN7yAvFlvPsRi+Fn1nVvInA57WQY
	o9DCqXv8bejaTrTJpNt2pEOTG7K5xEbyQ+2Nl9FeWmpu48FmLwZbcUcfcTeoTLYsoWNT8X+7HJQyR
	GOPg58Xi3tEORHaCRNKXnpjlG+szJt9vK0QF4kMn2M/CZo01D7nIKPiCJD314daDHWiofhyd9HG9u
	XKN84Id2MY7EZBCHlm1OuAyp2M855/zQrkQ5ORT6RaFIEmFd5VRB21qyFnmRUs4839hgK0EOsz7ii
	6HiUbj3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nbX-00000005kWs-41IT;
	Thu, 09 Oct 2025 10:10:35 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nbU-00000005kW4-3Nom
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:10:34 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251009101025epoutp0488fc1aae72ebcd6b33c193612935d792~syuHXoAXU1857418574epoutp04C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Oct 2025 10:10:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251009101025epoutp0488fc1aae72ebcd6b33c193612935d792~syuHXoAXU1857418574epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760004625;
	bh=LYRqGdvxiwapa1NYZ4/yM5n99gloT6iDw1ifAfDC6iM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IRExiOoj/82P5yCCyHuMK2vD5lqbY6/DhHd2Dn7Z0a3W+m5acH6MuonQHbus7Qh68
	 AQiABc+jGFahP4BHhcMjKkJwsdG7tNpXgn+JxnK574WhW8ujBCPUiPLfsp36gYgFjL
	 FIZlWpDCFGYCOxWFAAcoUkv7n+zUYj1nL8/C5nKc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251009101025epcas5p382998bb4e3000dbcb11fd0fffcfc96df~syuG_Nxt42585325853epcas5p3r;
	Thu,  9 Oct 2025 10:10:25 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cj5Gm2Nf1z2SSKf; Thu,  9 Oct
	2025 10:10:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336~syuFnsVE83028830288epcas5p2o;
	Thu,  9 Oct 2025 10:10:23 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251009101022epsmtip2431e3890048aa90c77dd88ce92149148~syuD6nTNK0514705147epsmtip2a;
	Thu,  9 Oct 2025 10:10:21 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com,
	Faraz Ata <faraz.ata@samsung.com>
Subject: [RESEND PATCH 1/2] dt-bindings: i2c: exynos5: add
 exynosautov920-hsi2c compatible
Date: Thu,  9 Oct 2025 15:49:10 +0530
Message-Id: <20251009101911.2802433-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336
References: <CGME20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_031033_026114_1E1B42DF 
X-CRM114-Status: GOOD (  10.43  )
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

Add "samsung,exynosautov920-hsi2c" dedicated compatible for
HSI2C found in ExynosAutov920 SoC.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
Note: This patch was previously sent separately. Resending now as part of a
two-patch series to avoid dt-binding check error. No functional changes from the earlier submission[1]

- Reference: [1] https://lore.kernel.org/all/5643d3e6-a034-4e2a-babd-d82fb3d58e9d@kernel.org/

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 32269239bae4..28be44f2f5a7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -43,6 +43,7 @@ properties:
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
               - samsung,exynos990-hsi2c
+              - samsung,exynosautov920-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.34.1


