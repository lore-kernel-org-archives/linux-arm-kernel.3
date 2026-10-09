Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297EECA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=; b=GSzCVwtR6IOmxz4ssZKcvEHqUm
	s57kkdCQseDuxPzV3f/u/PUYYaH9hOB0Y8oiNzNkA4itkxYvBEatsogKybPej01WrNmHhhmlkKGn3
	01/bmtNrSxgfehwYWJpWvcDPfG8ECWJoA1oblYn5wLAfa9M7qarP07PzGBWESyUbaZXfjnfNPkb2N
	yBrq5GgA1PeAf4nwrqDrLGCe/gWLJbj7p73+Hx8QUrhf82PbyKnEaL3QNuEhO/ZXjdqcyKyA0cXuI
	zUXTWy3DAcYAN6BASq3IoIqCyVZErAE+q0MIcnUtNazhDzDjf8gyY7XlrMZyN3NgTguLOUo4IJ9I0
	3eO8av3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF90x-00000006CPE-3ayv;
	Fri, 09 Oct 2026 11:43:51 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF90u-00000006CMr-0Qgu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:43:50 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261009114339epoutp03d7c17a250f8594621bbeb3151946afc3~c2ct9uIYx2402624026epoutp03Z
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:43:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261009114339epoutp03d7c17a250f8594621bbeb3151946afc3~c2ct9uIYx2402624026epoutp03Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546219;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eXcJOqVqi+aX+wNZBlkXdwZ1hJsf22Ga1DY7dwFz6jTZVdsdWr4Ul48WTllzvWMHD
	 ZH7NrSSOlbWyV/v8UT8TlVdLYBqM/rXbPbcBvlyqGziCiefjwksUTsa/Y/RYiup5fZ
	 QVuBp4jUVb0abgwQBo1hdiwXVB57NgUBjLDDlMm0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261009114337epcas5p1f1c96db9c3e1d67f8b3fe825658c9a0e~c2csFu2oD2444624446epcas5p1A;
	Fri,  9 Oct 2026 11:43:37 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j1Q3q3P1Nz2SSKX; Fri,  9 Oct
	2026 11:43:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951~c2co-l5Vg2878528785epcas5p45;
	Fri,  9 Oct 2026 11:43:34 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114331epsmtip2fd9b09b6b9e56e8d5dff51252faebe79~c2cmjw1YK0638806388epsmtip2O;
	Fri,  9 Oct 2026 11:43:31 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 01/14] dt-bindings: soc: samsung: Exynos8855 SYSREG
 compatibles
Date: Fri,  9 Oct 2026 17:31:24 +0530
Message-Id: <20261009120137.2801911-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114334epcas5p4723a40fefde5ce330b995e94c77dd951@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044348_458797_0680DFAC 
X-CRM114-Status: GOOD (  10.18  )
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

From: Alim Akhtar <alim.akhtar@samsung.com>

Add exynos8855 sysreg compatibles in bindings

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..845e0caba15a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -31,6 +31,10 @@ properties:
               - samsung,exynos5-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
@@ -103,6 +107,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
-- 
2.34.1


