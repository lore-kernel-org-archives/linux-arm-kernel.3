Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A4ACA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=XIDY5zJ3pMt83TWBBmEEmGxMtm/5CHCj2NnIva/BZ98=; b=DqTaNz05EyVKXhPFJuFX4j8eRM
	96yLkJju46kfa/2IhH0pj02AVcvf8CklgVuHCHu/1e+52w1spvvGgLe6X8/DdzuZB7exK7cvVlFGJ
	iPnXfiuCynig5B14FZ6tbbSe9BqnnFAi97WCkxvjz5TBGRlUz+mUE6LB0YiyICe0zs0R/twtN+PmM
	fF9LB2Xb+49Gds5Ty6slm70S77ghqnYqp9XnFKZMtzXkKP9VyRXKWc0zgDZAUA9pPu88GBYRLrFVS
	a0yFpKKDUVFyeTQ/epr0rlgYv5P1xrirwZs1k61sg1mScwQemT7s57zfsSlll6ExI2uE1oYSIXYxk
	ju0v6A3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4S6-00000009smX-2DL3;
	Thu, 04 Sep 2025 07:32:14 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4G5-00000009oVg-1JI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:19:51 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250904071943epoutp04cc47e0075eeafc1a2d9ef95eb57425c5~iA0E5Xr6d1093310933epoutp04M
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 07:19:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250904071943epoutp04cc47e0075eeafc1a2d9ef95eb57425c5~iA0E5Xr6d1093310933epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756970383;
	bh=XIDY5zJ3pMt83TWBBmEEmGxMtm/5CHCj2NnIva/BZ98=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ak5tC+BFukzrUTWfIQGVKoVs3fE3A1pMBMpvIbCCnxwXVljg8dReeZVJljr5b5tuj
	 pvjMRqzqUEwrCTFeY9BdCBIAjRUw9KsLIPoexT2J8J+mQ1iFL+8mJAkRQZuL2hc7K4
	 +NlnWziASrp6fpu9SlQ5thFrSPByo3MeHuUumzng=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250904071942epcas5p1c7fd121345ed8fc30e6c449b18f1e023~iA0ES--qd0357003570epcas5p17;
	Thu,  4 Sep 2025 07:19:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cHW7x4cL9z2SSKX; Thu,  4 Sep
	2025 07:19:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1~iA0C3ZhEO0357003570epcas5p10;
	Thu,  4 Sep 2025 07:19:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250904071939epsmtip1658d4b2730e1a080e4041b37c376d7cb~iA0BI2m9F0339503395epsmtip1d;
	Thu,  4 Sep 2025 07:19:39 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rosa.pila@samsung.com,
	pritam.sutar@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com
Subject: [PATCH] dt-bindings: i2c: exynos5: add exynosautov920-hsi2c
 compatible
Date: Thu,  4 Sep 2025 12:58:44 +0530
Message-Id: <20250904072844.358759-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1
References: <CGME20250904071941epcas5p1ffa00f3f1cb69f7a10d08c1e96174cf1@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_001950_644199_CA9B01FF 
X-CRM114-Status: UNSURE (   9.86  )
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

Add "samsung,exynosautov920-hsi2c" dedicated compatible for
HSI2C found in ExynosAutov920 SoC.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 7ae8c7b1d006..207b95e392e5 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -38,6 +38,7 @@ properties:
               - google,gs101-hsi2c
               - samsung,exynos2200-hsi2c
               - samsung,exynos850-hsi2c
+              - samsung,exynosautov920-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
         deprecated: true
-- 
2.34.1


